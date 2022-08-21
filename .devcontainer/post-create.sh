#! /bin/bash

pre-commit install --install-hooks
pre-commit install --install-hooks --hook-type commit-msg

npm install -g commitizen
npm install -g cz-conventional-changelog
