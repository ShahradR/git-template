# git-template

![GitHub workflow](https://img.shields.io/github/workflow/status/ShahradR/git-template/CI%20workflow?logo=github) [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) [![License: MIT-0](https://img.shields.io/badge/license-MIT--0-yellowgreen)](https://spdx.org/licenses/MIT-0.html)

Language-agnostic Git template repository to kickstart your projects!

## How to use this template

### Create a new repository from the template

To use this template for your new project, click **"Use this template"** near the top of the page, and select a name for your repository to create it in your own account or organization.

![](./docs/images/github-create-repo-from-template.gif)

### Clone your new repository locally

Once your new repository has been created, clone the repository to your local computer using the `git clone` command.

```
git clone https://github.com/<owner name>/<repository name>
```

### Configure pre-commit

This template is configured to run Git hooks using [pre-commit](https://pre-commit.com/), a "framework for managing and maintaining multi-language pre-commit hooks." Linters and common checks are ran against your commits, catching errors and making sure your code is up to snuff before sharing it with the world!

After pre-commit is installed (consider using a [Python virtual environment](https://docs.python.org/3/library/venv.html)), run the following command to configure the pre-commit hooks for your repository:

```
pre-commit install && pre-commit install --hook-type commit-msg
```

[The pre-commit hooks supplied with this project will cover most situations](https://github.com/ShahradR/git-template/pull/1), but you might wish to add more to the list depending on your requirements. Below are several examples of `.pre-commit-config.yaml` files used for different use cases—use this to tailor your hooks based on your project's needs!

<details>
<summary>AWS CloudFormation templates</summary>

This version of the file adds the following pre-commit checks:

- [CloudFormation Linter](https://github.com/aws-cloudformation/cfn-python-lint) to "validate CloudFormation yaml/json templates against the CloudFormation Resource Specification"
- [Stelligent cfn_nag](https://github.com/stelligent/cfn_nag) to "look for patterns in CloudFormation templates that may indicate insecure infrastructure"

#### CloudFormation Linter

[![asciicast](https://asciinema.org/a/308273.svg)](https://asciinema.org/a/308273)

#### Stelligent cfn_nag

[![asciicast](https://asciinema.org/a/308270.svg)](https://asciinema.org/a/308270)

This configuration expects the templates to reside under the `templates/` directory, at the root of the repository.

```diff
---
exclude: vale/styles/*
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
      - id: check-yaml
      - id: end-of-file-fixer
      - id: trailing-whitespace
      - id: check-case-conflict
      - id: detect-private-key
      - id: mixed-line-ending
        args: [--fix=no]

  - repo: https://github.com/alessandrojcm/commitlint-pre-commit-hook
    rev: v2.2.0
    hooks:
      - id: commitlint
        stages: [commit-msg]
        additional_dependencies: ["@commitlint/config-conventional"]

  - repo: https://github.com/prettier/prettier
    rev: 1.19.1
    hooks:
      - id: prettier
        name: Prettier

  - repo: local
    hooks:
      - id: dockerfile-provides-entrypoint
        name: Vale
        language: docker_image
        entry: jdkato/vale:latest

+ - repo: https://github.com/aws-cloudformation/cfn-python-lint
+   rev: v0.28.2
+   hooks:
+     - id: cfn-python-lint
+       files: templates/.*\.(json|yml|yaml)$
+
+ - repo: local
+   hooks:
+     - id: dockerfile-provides-entrypoint
+       name: cfn_nag
+       language: docker_image
+       entry: stelligent/cfn_nag:latest
+       files: templates/.*\.(json|yml|yaml)$
+       args: ["--fail-on-warnings"]
```

</details>

<details>
<summary>Docker containers</summary>

This version of the file adds the [Haskell Dockerfile Linter](https://github.com/hadolint/hadolint) "a smarter Dockerfile linter that helps you build best practice Docker images" as a pre-commit hook.

[![asciicast](https://asciinema.org/a/335409.svg)](https://asciinema.org/a/335409)

```diff
---
exclude: vale/styles/*
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
      - id: check-yaml
      - id: end-of-file-fixer
      - id: trailing-whitespace
      - id: check-case-conflict
      - id: detect-private-key
      - id: mixed-line-ending
        args: [--fix=no]

  - repo: https://github.com/alessandrojcm/commitlint-pre-commit-hook
    rev: v2.2.0
    hooks:
      - id: commitlint
        stages: [commit-msg]
        additional_dependencies: ["@commitlint/config-conventional"]

  - repo: https://github.com/prettier/prettier
    rev: 1.19.1
    hooks:
      - id: prettier
        name: Prettier

  - repo: local
    hooks:
      - id: dockerfile-provides-entrypoint
        name: Vale
        language: docker_image
        entry: jdkato/vale:latest

+ - repo: local
+   hooks:
+     - id: dockerfile-provides-entrypoint
+       name: hadolint
+       language: docker_image
+       entry: --entrypoint hadolint hadolint/hadolint:latest-debian
+       files: Dockerfile
```

</details>

<details>
<summary>OpenAPI/Swagger specifications</summary>

This version of the file adds [speccy](https://github.com/wework/speccy) as a pre-commit hook, to "enforce quality rules on your OpenAPI 3.0.x specifications."

[![asciicast](https://asciinema.org/a/308584.svg)](https://asciinema.org/a/308584)

This configuration expects the OpenAPI specification file to reside under the `specs/` directory, at the root of the repository.

```diff
---
exclude: vale/styles/*
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
      - id: check-yaml
      - id: end-of-file-fixer
      - id: trailing-whitespace
      - id: check-case-conflict
      - id: detect-private-key
      - id: mixed-line-ending
        args: [--fix=no]

  - repo: https://github.com/alessandrojcm/commitlint-pre-commit-hook
    rev: v2.2.0
    hooks:
      - id: commitlint
        stages: [commit-msg]
        additional_dependencies: ["@commitlint/config-conventional"]

  - repo: https://github.com/prettier/prettier
    rev: 1.19.1
    hooks:
      - id: prettier
        name: Prettier

  - repo: local
    hooks:
      - id: dockerfile-provides-entrypoint
        name: Vale
        language: docker_image
        entry: jdkato/vale:latest

+  - repo: local
+    hooks:
+      - id: dockerfile-provides-entrypoint
+        name: Speccy
+        language: docker_image
+        entry: wework/speccy:latest lint
+        files: 'specs/.*\.(yml|json|yaml)$'
```

</details>
</br>

### Configure your continuous integration pipeline

TODO: Configuration steps for GitHub Actions will change once workflow templates are implemented. See [ShahradR/git-template#15](https://github.com/ShahradR/git-template/issues/15) for more details.

### Update your LICENSE file

This repository is licensed under [MIT No Attribution (MIT-0)](https://spdx.org/licenses/MIT-0.html)—you are free to use this template for your project without the need to worry about attribution.

Update the LICENSE file with a license appropriate for your project! Visit https://choosealicense.com/ to see common open-source licenses.

### Update the README file

Once everything has been set up, delete this file and replace it with a README tailored to your project!
