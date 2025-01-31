.PHONY: build
build: cleanup
	git clone --depth 1 -b 107-docusaurus git@github.com:ozontech/seq-db.git tmp/seq-db

	mkdir -p docs/seq-db
	mv -v tmp/seq-db/docs/en/* ./docs/seq-db/

	mkdir -p i18n/ru/docusaurus-plugin-content-docs/current/seq-db
	mv -v tmp/seq-db/docs/ru/* i18n/ru/docusaurus-plugin-content-docs/current/seq-db/

	npm run build

.PHONY: cleanup
cleanup:
	rm -rf tmp build docs/seq-db/* i18n/ru/docusaurus-plugin-content-docs/current/seq-db/*

.PHONY: build-live-server
build-live-server:
	docker build .
