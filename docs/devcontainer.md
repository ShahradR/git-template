# Using a development container

## Running on the cloud with GitHub Codespaces

Because this repository already includes a `.devcontainer` directory with all
supporting files required to run your project. After having created a new
repository from this template, from the browser window, click on the
**:octicons-code-24: Code** button. In the context menu, select the
**Codespaces** tab and create a new codespace.

![Create GitHub Codespaces](./images/create-codespaces-light.png#only-light)
![Create GitHub Codespaces](./images/create-codespaces-dark.png#only-dark)

The Visual Studio Code IDE will open in the browser and the container will start
building. Once ready, you will be able to start development with all the tools
available to you!

!!! costs "Pricing for GitHub Codespaces"

    Depending on your GitHub plan and repository, using GitHub Codespaces might
    incur additional costs. See [_About billing for GitHub Codespaces_ in the
    GitHub Docs][codespaces-costs] for more details.

## Running locally with Docker and WSL 2

You can also run the development container on your local machine by using Visual
Studio Code and the Docker engine. You development environment will be deployed
as a Docker container, and Visual Studio Code can connect to it using the [Dev
Containers extension][vscode-devcontainer].

!!! costs "New Docker terms of service"

    New Docker terms of service might require that you upgrade to a paid Docker
    subscription when used in a professional setting. See the [Docker Pricing
    FAQ][docker-faq] for more details.

    Alternatively, consider using Podman to run your containers locally.

### Installing the Windows Subsystem for Linux 2

You first need to install the Windows Subsystem for Linux 2 on your Windows
machine. For detailed steps, see the [_Install Linux on Windows with WSL_ in the
Windows Subsystem for Linux documentation][wsl-install] for more details.

!!! tip "Improving performance when running on the WSL 2 platform"

    If you notice your computer running slower after setting up your devcontainer,
    you can limit the amount of resources available to the Windows Subsystem for
    Linux by including a `.wslconfig` or `wsl.conf` file.

    For example, by placing a `.wslconfig` file in your `%UserProfile%`
    directory in Windows, you can limit the amount of RAM available to the
    Windows Subsystem for Linux by including the following configuration:

    ```ini
    [wsl2]
    memory = 4GB
    ```

    See [_Advanced settings configuration in WSL_ in the Windows Subsystem for
    Linux documentation][wsl-config] for more details.

## Running locally with Podman

TODO

## Running using IntelliJ IDEA

Starting with [IntelliJ IDEA EAP 2023.2][intellij-2023.2-eap-notes], you can now
use your development containers in IntelliJ IDEA.

!!! note Limited support for devcontainer features

    Note that at the time of writing, IntelliJ IDEA only supports a subset of
    the devcontainer specification. Specifically:

      - [IntelliJ IDEA EAP 2023.2][intellij-2023.2-eap-notes] introduces
        development container support
      - [IntelliJ IDEA 2023.3 EAP 6][intellij-2023.3_6-eap-notes] adds support
        for features, Docker Compose, and automatic port forwarding

    For more details, see [Dev Container Prerequisites and Limitations]
    [intellij-container-prerequisites] in the IntelliJ IDEA documentation.

You can launch your Dev Container by opening the
`.devcontainer/devcontainer.json` file from the IntelliJ IDEA IDE, clicking on
the box icon in the gutter, and choosing **Create Dev Container and Mount
Sources...** from the context menu that appears.

![Launch Dev Container](./images/intellij-launch-devcontainer-light.png#only-light)
![Launch Dev Container](./images/intellij-launch-devcontainer-dark.png#only-dark)

## Add your personal dotfiles to the container

While the developer container repository contains project-specific tools and
utilities, you might want to also bring your personal tools and configuration to
the development environment. To do this, you can define a dotfile repository.

If you are using GitHub Codespaces, the bootstrap process will automatically
look for a **dotfiles** repository under your user account.

If no repository named **dotfiles** exists under your GitHub user, or you are
not using GitHub Codespaces, you can update your Visual Studio Code
configuration to point to a remote repository where that configuration can be
retrieved.

![dotfiles config for VSCode](./images/dotfiles-vscode-config-light.png#only-light)
![dotfiles config for VSCode](./images/dotfiles-vscode-config-dark.png#only-dark)

For more details on dotfiles in GitHub see the [_Personalizing GitHub Codespaces
for your account_ page in the GitHub Docs][dotfiles] for more details.

<!-- markdownlint-disable link-image-reference-definitions -->

[codespaces-costs]:
  https://docs.github.com/en/billing/managing-billing-for-github-codespaces/about-billing-for-github-codespaces
[docker-faq]: https://www.docker.com/pricing/faq/
[vscode-devcontainer]:
  https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
[wsl-config]: https://learn.microsoft.com/en-us/windows/wsl/wsl-config
[intellij-2023.2-eap-notes]:
  https://blog.jetbrains.com/idea/2023/06/intellij-idea-2023-2-eap-6/#support-for-dev-containers
[intellij-2023.3_6-eap-notes]:
  https://blog.jetbrains.com/idea/2023/06/intellij-idea-2023-2-eap-6/#support-for-dev-containers
[intellij-container-prerequisites]:
  https://www.jetbrains.com/help/idea/prerequisites-for-dev-containers.html

<!-- markdownlint-enable link-image-reference-definitions -->

[wsl-install]: https://learn.microsoft.com/en-us/windows/wsl/install
[dotfiles]:
  https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account
