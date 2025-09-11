# seq-db-docs

This repository contains [docusaurus](https://docusaurus.io/) configuration files
for [seq-db](https://github.com/ozontech/seq-db) and [seq-ui](https://github.com/ozontech/seq-ui).

## Production deploy

To deploy seq-db documentation use `make build`. 
It will produce `build` folder with static generated seq-db documentation.
You can serve this folder using `make serve`.

## Local development

To use live-reload feature for seq-db or seq-ui docs use following command in seq-db/seq-ui repository:

```sh
# Do not forget to set LOCALE variable to 'en' or 'ru'
docker run -e LOCALE=en --rm -it -p 3000:3000 -v ./docs/en:/website/docs/seq-db -v ./docs/ru:/website/i18n/ru/docusaurus-plugin-content-docs/current/seq-db v0.0.2
```

This command runs docusaurus server with live-reload support.
