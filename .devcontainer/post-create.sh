#! /bin/bash

pre-commit install --install-hooks
pre-commit install --install-hooks --hook-type commit-msg

pip install codespell mkdocs mkdocs-material

npm install -g commitizen
npm install -g cz-conventional-changelog
npm install -g markdown-link-check
npm install -g markdownlint-cli2
