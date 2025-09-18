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
	# Override baseURL for local dev
	$(HUGO) server D -b http://localhost:1313/ $(HUGO_FLAGS) --disableFastRender  --noHTTPCache

build:
	# Use production baseURL from config.yaml
	$(HUGO) $(HUGO_FLAGS)

clean:
	rm -rf $(PUBLIC_DIR)
