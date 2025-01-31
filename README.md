# seq-db-docs

This repository contains [docusaurus](https://docusaurus.io/) configuration files
for [seq-db](https://github.com/ozontech/seq-db).

## Production deploy

To deploy seq-db documentation use `make build`. 
It will produce `build` folder with static generated seq-db documentation.

## Local development

To use live-reload feature for seq-db or seq-ui docs use following command in seq-db/seq-ui repository:

```sh
# Do not forget to set LOCALE variable to 'en' or 'ru'
docker run -e LOCALE=en --rm -it -p 3000:3000 -v ./docs/en:/website/docs/seq-db -v ./docs/ru:/website/i18n/ru/docusaurus-plugin-content-docs/current/seq-db sha256:6757c2b99a546b0a16de67d48e5e2a5988aa1bcb901d427976e50b1801a117d5
```

This command runs docusaurus server with live-reload support.
