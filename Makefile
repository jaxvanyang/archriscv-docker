.PHONY: download clean release_num docker_image tar

DOCKERHUB_USER ?= jaxvanyang
BASEURL ?= https://archriscv.felixc.at/images/
RELEASE_REGEX := ^.*href="archriscv-([0-9-]+).tar.zst".*$$

define get_release
	curl '$(BASEURL)' 2> /dev/null | \
		grep -E '$(RELEASE_REGEX)' | \
		tail -n 1 | \
		sed -E 's/$(RELEASE_REGEX)/\1/'
endef

RELEASE ?= $(shell $(get_release))
ARCHIVE := archriscv-$(RELEASE).tar.zst
TAR := archriscv-$(RELEASE).tar

docker_image: $(TAR) Dockerfile
	docker buildx build -t $(DOCKERHUB_USER)/archriscv:$(RELEASE) --load \
		--platform linux/riscv64 --build-arg RELEASE=$(RELEASE) .

tar: $(TAR)
$(TAR): $(ARCHIVE)
	zstd -d $^

download: $(ARCHIVE)
	@echo "RootFS archive $(ARCHIVE) succefully downloaded"

$(ARCHIVE):
	@curl --location --remote-name "$(BASEURL)/$(ARCHIVE)"

release_num:
	@echo $(RELEASE)

clean:
	-rm *.tar.zst *.tar
