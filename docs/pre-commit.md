# pre-commit hooks

This repository uses [pre-commit][pre-commit] as a Git hook management tool.

These hooks are general enough to be used in all projects. Depending on your
project's requirements, you will want to modify these hook configurations or add
your own.

The hooks provided as part of this repository are:

- [Check Yaml][hook-yaml]
- [Fix End of Files][hook-eof]
- [Trim Trailing Spaces][hook-spaces]
- [Check for case conflicts][hook-case]
- [Detect Private Key][hook-private]
- [Mixed line ending][hook-ending]
- [Prettier][hook-prettier]
- [commitlint][hook-commitlint], enforcing the [conventional
  commit][conventional-keywords] specification

The sections below show how the pre-commit hooks can help implement best
practices and avoid errors before your code is pushed to the repository.

## Check Yaml

This hook checks `.yaml` files for valid syntax, using the [ruamel.yaml][ruamel]
YAML loader/dumper for Python.

<script src="https://asciinema.org/a/304129.js" id="asciicast-304129" async></script>

## Fix End of Files

UNIX applications typically expect a new line at the end of every file (some
examples are the GNU diff and sort tools—[see this StackExchange question for a
detailed explanation][stackexchange-blank-lines]). This hook ensures that all
files pushed to the repository end with a new line.

<script src="https://asciinema.org/a/304097.js" id="asciicast-304097" async></script>

## Trim Trailing Spaces

This hook removes invisible blank characters at the end of a line.

<script src="https://asciinema.org/a/304086.js" id="asciicast-304086" async></script>

## Check for case conflicts

File names in Linux operating systems are case-sensitive—the files `FILE.txt`
and `file.txt` are considered as two distinct files. Windows files, however, are
case-insensitive.

To prevent conflicts between the two operating systems, this hook ensures that
no two files have the same name, regardless of the case used.

<script src="https://asciinema.org/a/304090.js" id="asciicast-304090" async></script>

## Detect Private Key

This hook detects private keys and other secrets that might have been
inadvertently staged, and blocks the commit.

!!! note

    This hook only checks files for [certain keywords][private-key-words]—if a
    private key is exported as binary (by omitting the `--armor` flag when
    exporting PGP keys, for example), this hook won't flag the file and allow
    potentially sensitive data to be committed.

<script src="https://asciinema.org/a/304082.js" id="asciicast-304082" async></script>

## Mixed line endings

This hook flags files that contain both Windows (CRLF) and Linux (LF) file
endings.

<script src="https://asciinema.org/a/304109.js" id="asciicast-304109" async></script>

## Prettier

This hook runs the [Prettier][prettier] code formatter on all files before
committing.

<script src="https://asciinema.org/a/304492.js" id="asciicast-304492" async></script>

## commitlint

This commit-msg hook verifies that commit messages follow the [Conventional
Commits][conventional-standard] specification. A full list of checks can be
found [here][conventional-keywords].

!!! note

    This commit hook needs to be installed separately from the others, using
    `pre-commit install --hook-type commit-msg`. This is done automatically
    when using the development container.

<script src="https://asciinema.org/a/304493.js" id="asciicast-304493" async></script>

[pre-commit]: https://pre-commit.com
[stackexchange-blank-lines]:
  https://unix.stackexchange.com/questions/18743/whats-the-point-in-adding-a-new-line-to-the-end-of-a-file
[prettier]: https://prettier.io

<!-- markdownlint-disable link-image-reference-definitions -->

[private-key-words]:
  https://github.com/pre-commit/pre-commit-hooks/blob/d9ccd95055e5e3e6057b41b124857c93280b6bdd/pre_commit_hooks/detect_private_key.py#L5-L14
[conventional-standard]: https://www.conventionalcommits.org/en/v1.0.0/

<!-- markdownlint-enable link-image-reference-definitions -->

[conventional-keywords]:
  https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional
[hook-yaml]:
  https://github.com/pre-commit/pre-commit-hooks/blob/d9ccd95055e5e3e6057b41b124857c93280b6bdd/pre_commit_hooks/check_yaml.py
[ruamel]: https://pypi.org/project/ruamel.yaml/
[hook-eof]:
  https://github.com/pre-commit/pre-commit-hooks/blob/d9ccd95055e5e3e6057b41b124857c93280b6bdd/pre_commit_hooks/end_of_file_fixer.py
[hook-spaces]:
  https://github.com/pre-commit/pre-commit-hooks/blob/d9ccd95055e5e3e6057b41b124857c93280b6bdd/pre_commit_hooks/trailing_whitespace_fixer.py
[hook-case]:
  https://github.com/pre-commit/pre-commit-hooks/blob/main/pre_commit_hooks/check_case_conflict.py
[hook-private]:
  https://github.com/pre-commit/pre-commit-hooks/blob/main/pre_commit_hooks/detect_private_key.py
[hook-ending]:
  https://github.com/pre-commit/pre-commit-hooks/blob/d9ccd95055e5e3e6057b41b124857c93280b6bdd/pre_commit_hooks/mixed_line_ending.py
[hook-prettier]:
  https://github.com/prettier/prettier/tree/d746cd73becfa91185f42a7cefb4ebe79145d771
[hook-commitlint]:
  https://github.com/alessandrojcm/commitlint-pre-commit-hook/tree/6bc8fdadc259830d59d9904dc22b7fe0d3ffb49a
