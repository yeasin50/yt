
# Makefile for Hugo

HUGO = hugo
HUGO_FLAGS =
PUBLIC_DIR = public

.PHONY: help serve build clean

help:
	@echo "Makefile for Hugo"
	@echo
	@echo "Usage:"
	@echo "  make serve     Start Hugo development server"
	@echo "  make build     Build the site into ./$(PUBLIC_DIR)"
	@echo "  make clean     Remove generated site"

serve:
	$(HUGO) server -D $(HUGO_FLAGS)

build:
	$(HUGO) $(HUGO_FLAGS)

clean:
	rm -rf $(PUBLIC_DIR)
