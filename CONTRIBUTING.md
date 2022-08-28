# Contributing guidelines

Thank you so much for taking the time to contribute to this project! 🥳

This document outlines our contribution guidelines, the steps required to set up
your machine and run the code contained in this repository, as well as the style
guide and coding conventions used in this project!

## Code of conduct

This project and all its participants are governed by our
[Code of Conduct](CODE_OF_CONDUCT.md), which has been adapted from version 2.1
of the [Contributor Covenant][contributor-covenant]. Contributors are expected
to uphold this code when participating in this project.

## Setting up your environment

This section outlines the setup needed to configure your workspace and start
running the code contained in this repository in your environment.

### Using a development container

If you use Visual Studio Code or GitHub Codespaces as your editor, this project
includes a [development container][devcontainer] with all the tools required to
start development on this project.

To get started on your local machine, you will need:

- [Docker][docker]
- [Visual Studio Code][vscode] with the [VS Code Remote - Containers
  extension][remote-containers-extension] installed

Follow the steps in the [Installation section of the _Developing inside a
Container_ guide in the Visual Studio Code documentation][install-devcontainer]
to get started.

> **Warning**</br> The Docker terms and conditions have recently changed. See
> [_Docker is Updating and Extending Our Product Subscriptions_ on the Docker
> Blog][codespaces-billing] for more details.

You can also use [GitHub Codespaces][codespaces] for an out-of-the-box
experience with no additional setup required.

> **Warning**</br> Using GitHub Codespaces might incur additional costs. See
> [_About billing for GitHub Codespaces_ on GitHub Docs][codespaces-billing] for
> more details.

### Installing the tools directly on your machine

TODO

## Writing commit messages

Commit messages are the main place where contributors can detail the intent
behind changes introduced to the project. By crafting commit messages with care,
documentation can be simplified and contributors can use the commit logs to
understand the context behind each change.

To understand how commit messages can be useful, it helps to see the different
ways they are used:

- `git log` shows a history of commit messages in e-mail format.

- Commit messages can be used to show the commit history for individual lines of
  code within your editor or by running tools `git blame`

- When written using the [Conventional Commits][conventional] standard, releases
  are automatically created using [semantic-release][semantic-release],
  according to the [Semantic Versioning][semver] scheme.

The section below highlights some general guidelines when authoring commits
messages for this project.

### ✔️ Follow the Conventional Commits standard

The [Conventional Commits][conventional] standard specifies how commit messages
should be written, in a way that's understood both by computers and humans. It's
composed of multiple parts, shown below:

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

The `type` field indicates the type of change being introduced by this commit.

The `scope` is optional, and is used to identify components within the project.
When Semantic Release generates release notes, it will group changes under the
scope.

The `body` field is optional, but highly recommended. Here, you can add
additional details around the change itself, the reasoning behind the commit, as
well as any other details that didn't fit in the description.

The `footer` field is optional, and typically used to add additional details.
Common elements include:

- Issues relating to the commit. Most trackers provide the ability to link
  commits and issues. Commits should use the `Associated issue:` footer when
  referencing issues.

- If multiple contributors have helped author an commit, their names can be
  added by using the `Co-authored-by:` footer. The GitHub user interface will
  show multiple avatars next to the commit. See [_Creating a commit with
  multiple authors_ in the GitHub Docs][co-authored-by] for more details.

- If the commit introduces a breaking change, the `BREAKING CHANGE:` footer can
  be used to detail the changes made by the code introduced in this commit. It
  also instructs Semantic Release to create a new major version.

Most editors automatically recognize this commit standard and will provide
syntax highlighting out of the box. For example, both Vim and Visual Studio Code
will highlight the subject line in red if it exceeds 50 characters, and will
also highlight the next line if it contains any text.

This repository is Commitizen-friendly. By running `git cz` or `cz`, the CLI
will prompt the contributor with a series of questions and help craft a commit
message based on the responses. The Commitizen CLI is automatically installed to
the devcontainer.

### ✔️ Reword your commit if the `commitlint` check fails

The [commitlint][commitlint] hook is run after the commit message is created to
ensure that it adheres to the Conventional Commits standard. However, it only
checks the previous commit—if another valid commit is pushed, all checks will
pass and the previous message will be ignored. This might cause issues down the
line when tools like semantic-release run to generate artifacts based on the
commit messages.

If you need to make changes to your previous commit message, run
`git commit --amend` to modify your commit message before pushing it to the
remote repository.

### ✔️ Write atomic commits and pull requests

Individual commits should represent a single, complete concept or change.
Keeping commits small and atomic helps keep focus on a single topic, simplify
communication, and help other contributors understand the changes being
introduced. Because atomic commits represent a single self-contained unit of
work, they can be rolled-back without greatly affecting the rest of the
application.

In the same vein, topic branches should also be focused on a single feature or
fix. If changes are being made to multiple unrelated systems, consider splitting
the change across multiple topic branches.

> **Note**</br> A good rule of thumb is to look at what the commit message will
> be. If you find that explaining the changes introduced in your commit is
> complicated, or fits into more than one type category, that might be an
> indication that the change needs to be split into multiple commits.

For an in-depth review of atomic commits and how they can help with your
development process, see [_Make Atomic Git Commits_ by Aleksandr
Hovhannisyan][atomic-commits].

### ✔️ Include tests and style changes in the same commit as the code

When introducing new code to the project, tests should be included in the same
commit as the feature or fix being added to the project. The `test` type should
only be used when adding missing tests or fixing tests for existing code.

Stylistic updates also fall in this category—unless the updates are for existing
code already merged into the main branch, avoid using the `style` type.

These kinds of splits can happen when trying to fix the code following a GitHub
workflow or pre-commit check failure. Avoid introducing commits whose sole
purpose is to pass the checks, and favor updating your existing commits instead.
This will lead to a more streamlined commit history, and will be better
understood by future contributors.

### ✔️ Edit and clean your commit history before opening a pull request

Your commit history should tell an idealized and "perfected" story of how
development has occurred. Commits and the code within them should contain
individual, atomic changes, and the history of commits in the branch should
narrate a story detailing the code development, without any of the
troubleshooting, erroneous commits, or mistakes that happened along the way.

Feel free to modify, squash, and split commits in your topic branch before
opening a pull request, and present your story in a way that helps future
contributors (or even your future self) understand how and why changes were
made, without all the extra noise.

For an in-depth view of how and why cleaning up history is beneficial, see
[_Post-Production Editing using Git_ by Seth Robertson][postproduction-git].

[contributor-covenant]: https://www.contributor-covenant.org
[devcontainer]: https://code.visualstudio.com/docs/remote/containers
[docker]: https://www.docker.com/
[vscode]: https://code.visualstudio.com/
[remote-containers-extension]:
  https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
[install-devcontainer]:
  https://code.visualstudio.com/docs/remote/containers#_installation
[codespaces]: https://github.com/features/codespaces
[codespaces-billing]:
  https://docs.github.com/en/billing/managing-billing-for-github-codespaces/about-billing-for-github-codespaces
[co-authored-by]:
  https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors
[semver]: https://semver.org/
[conventional]: https://www.conventionalcommits.org/
[semantic-release]: https://github.com/semantic-release/semantic-release
[postproduction-git]: https://sethrobertson.github.io/GitPostProduction/gpp.html
[commitlint]: https://commitlint.js.org/
[atomic-commits]: https://www.aleksandrhovhannisyan.com/blog/atomic-git-commits/
