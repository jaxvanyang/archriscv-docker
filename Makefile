.PHONY: download clean

BASEURL ?= https://archriscv.felixc.at/images/
RELEASE ?= 20220727
ARCHIVE ?= archriscv-$(RELEASE).tar.zst

download: $(ARCHIVE)
	@echo "RootFS archive $(ARCHIVE) succefully downloaded"

$(ARCHIVE):
	@curl --location --remote-name "$(BASEURL)/$(ARCHIVE)"

clean:
	rm *.tar.zst
