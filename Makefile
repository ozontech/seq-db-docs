EN_DIR=docs
RU_DIR=i18n/ru/docusaurus-plugin-content-docs/current

.PHONY: build
build: cleanup
	git clone --depth 1 -b main https://github.com/ozontech/seq-db.git tmp/seq-db
	git clone --depth 1 -b main https://github.com/ozontech/seq-ui.git tmp/seq-ui

	mkdir -p $(EN_DIR)/seq-db $(EN_DIR)/seq-ui
	mv -v tmp/seq-db/docs/en/* $(EN_DIR)/seq-db/
	mv -v tmp/seq-ui/docs/en/* $(EN_DIR)/seq-ui/

	mkdir -p $(RU_DIR)/seq-db $(RU_DIR)/seq-ui
	mv -v tmp/seq-db/docs/ru/* $(RU_DIR)/seq-db/
	mv -v tmp/seq-ui/docs/ru/* $(RU_DIR)/seq-ui/

	npm run build

.PHONY: serve
serve:
	npm run serve

.PHONY: cleanup
cleanup:
	rm -rf tmp build \
		$(EN_DIR)/seq-db/* $(EN_DIR)/seq-ui/*  \
		$(RU_DIR)/seq-db/* $(RU_DIR)/seq-ui/*

.PHONY: build-image
build-image:
	docker build .
