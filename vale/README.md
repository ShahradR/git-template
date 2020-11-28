# Updating the Microsoft Vale style

To keep this style up-to-date with the different style repositories, this project uses [Gilt] to overlay the source repo's style sub-directory into this repository's `vale/styles/` directory.

If a new version of the style is released, follow the steps below to update the git-template with the new version. In this example, the [errata-ai/Microsoft][errata-ai-microsoft] style is used, which implements the [Microsoft Writing Style Guide][microsoft-writing-style-guide].

## Clone the `git-template` repository

Unless they're project-specific, all changes to the `vale/` directory and sub-directories should be done in the `git-template` repository. Projects using the template repository can then pull those changes in, and new projects will automatically include the updated styles.

## Update `gilt.yml` to the latest release

Gilt uses releases to determine which tree to overlay in the repository. When a new tag is released, the `.gilt.yml` file needs to be updated to reflect the latest version.

### GitHub repository page

![Latest release version on GitHub is v0.7.0](../docs/images/vale-release.png)

### `.gilt.yml`

```yaml
- git: https://github.com/errata-ai/Microsoft
  version: v0.7.0
  files:
    - src: Microsoft/
      dst: vale/styles/Microsoft/
```

## Run `gilt overlay`

Once the `.gilt.yml` file has been updated, you can run `gilt overlay` to update the files in the `vale/styles` directory.

```shell
$ gilt overlay
errata-ai.Microsoft:
  - cloning errata-ai.Microsoft to /home/shahradr/.gilt/clone/github.com/errata-ai.Microsoft
  - copied (v0.7.0) /home/shahradr/.gilt/clone/github.com/errata-ai.Microsoft/Microsoft/ to /mnt/c/Users/LocalAdmin/workspace/git-template/vale/styles/Microsoft/
```

[vale]: https://github.com/errata-ai/vale
[errata-ai-microsoft]: https://github.com/errata-ai/Microsoft
[microsoft-writing-style-guide]: https://docs.microsoft.com/en-us/style-guide/welcome/
[gilt]: https://github.com/retr0h/gilt/
