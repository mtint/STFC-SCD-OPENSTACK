# Install and Set Up kubectl on macOS

## Before you begin

You must use a kubectl version that is within one minor version difference of your cluster. For example, a v1.21 client can communicate with v1.20, v1.21, and v1.22 control planes. Using the latest version of kubectl helps avoid unforeseen issues.

The following methods exist for installing kubectl on macOS:

* Install kubectl binary with curl on macOS
* Install with Homebrew on macOS
* Install with Macports on macOS
* Install on macOS as part of the Google Cloud SDK

### Install kubectl binary with curl on macOS

1. Download the latest release:

  * Intel
  * Apple Silicon

```
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
```

  > **Note:**
> 
>   To download a specific version, replace the `$(curl -L -s https://dl.k8s.io/release/stable.txt)` portion of the command with the specific version.
> 
>   For example, to download version v1.21.0 on Intel macOS, type:
> 
> ```
> curl -LO "https://dl.k8s.io/release/v1.21.0/bin/darwin/amd64/kubectl"
> ```
> 
>   And for macOS on Apple Silicon, type:
> 
> ```
> curl -LO "https://dl.k8s.io/release/v1.21.0/bin/darwin/arm64/kubectl"
> ```
2. Validate the binary (optional)

  Download the kubectl checksum file:

  * Intel
  * Apple Silicon

```
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl.sha256"
```

  Validate the kubectl binary against the checksum file:

```
echo "$(<kubectl.sha256) kubectl" | shasum -a 256 --check
```

  If valid, the output is:

```
kubectl: OK
```

  If the check fails, `shasum` exits with nonzero status and prints output similar to:

```
kubectl: FAILED
shasum: WARNING: 1 computed checksum did NOT match
```

  > **Note:** Download the same version of the binary and checksum.
3. Make the kubectl binary executable.
4. Move the kubectl binary to a file location on your system `PATH`.

```
sudo mv ./kubectl /usr/local/bin/kubectl
sudo chown root: /usr/local/bin/kubectl
```
5. Test to ensure the version you installed is up-to-date:

```
kubectl version --client
```

### Install with Homebrew on macOS

If you are on macOS and using [Homebrew](https://brew.sh/) package manager, you can install kubectl with Homebrew.

1. Run the installation command:

  or

```
brew install kubernetes-cli

```
2. Test to ensure the version you installed is up-to-date:

```
kubectl version --client

```

### Install with Macports on macOS

If you are on macOS and using [Macports](https://macports.org/) package manager, you can install kubectl with Macports.

1. Run the installation command:

```
sudo port selfupdate
sudo port install kubectl
```
2. Test to ensure the version you installed is up-to-date:

```
kubectl version --client
```

### Install on macOS as part of the Google Cloud SDK

You can install kubectl as part of the Google Cloud SDK.

1. Install the [Google Cloud SDK](https://cloud.google.com/sdk/).
2. Run the `kubectl` installation command:

```
gcloud components install kubectl
```
3. Test to ensure the version you installed is up-to-date:

```
kubectl version --client
```

## Verify kubectl configuration

In order for kubectl to find and access a Kubernetes cluster, it needs a[kubeconfig file](safari-reader://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/), which is created automatically when you create a cluster using[kube-up.sh](https://github.com/kubernetes/kubernetes/blob/master/cluster/kube-up.sh) or successfully deploy a Minikube cluster. By default, kubectl configuration is located at `~/.kube/config`.

Check that kubectl is properly configured by getting the cluster state:

If you see a URL response, kubectl is correctly configured to access your cluster.

If you see a message similar to the following, kubectl is not configured correctly or is not able to connect to a Kubernetes cluster.

```
The connection to the server <server-name:port> was refused - did you specify the right host or port?
```

For example, if you are intending to run a Kubernetes cluster on your laptop (locally), you will need a tool like Minikube to be installed first and then re-run the commands stated above.

If kubectl cluster-info returns the url response but you can't access your cluster, to check whether it is configured properly, use:

```
kubectl cluster-info dump
```

## Optional kubectl configurations

### Enable shell autocompletion

kubectl provides autocompletion support for Bash and Zsh, which can save you a lot of typing.

Below are the procedures to set up autocompletion for Bash and Zsh.

* Bash
* Zsh

### Introduction

The kubectl completion script for Bash can be generated with `kubectl completion bash`. Sourcing this script in your shell enables kubectl completion.

However, the kubectl completion script depends on [**bash-completion**](https://github.com/scop/bash-completion) which you thus have to previously install.

> **Warning:** There are two versions of bash-completion, v1 and v2\. V1 is for Bash 3.2 (which is the default on macOS), and v2 is for Bash 4.1+. The kubectl completion script **doesn't work** correctly with bash-completion v1 and Bash 3.2\. It requires **bash-completion v2** and **Bash 4.1+**. Thus, to be able to correctly use kubectl completion on macOS, you have to install and use Bash 4.1+ ([*instructions*](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba)). The following instructions assume that you use Bash 4.1+ (that is, any Bash version of 4.1 or newer).

### Upgrade Bash

The instructions here assume you use Bash 4.1+. You can check your Bash's version by running:

If it is too old, you can install/upgrade it using Homebrew:

Reload your shell and verify that the desired version is being used:

```
echo $BASH\_VERSION $SHELL
```

Homebrew usually installs it at `/usr/local/bin/bash`.

### Install bash-completion

> **Note:** As mentioned, these instructions assume you use Bash 4.1+, which means you will install bash-completion v2 (in contrast to Bash 3.2 and bash-completion v1, in which case kubectl completion won't work).

You can test if you have bash-completion v2 already installed with `type _init_completion`. If not, you can install it with Homebrew:

```
brew install bash-completion@2
```

As stated in the output of this command, add the following to your `~/.bash_profile` file:

```
export BASH\_COMPLETION\_COMPAT\_DIR="/usr/local/etc/bash\_completion.d"
[[ -r "/usr/local/etc/profile.d/bash\_completion.sh" ]] && . "/usr/local/etc/profile.d/bash\_completion.sh"
```

Reload your shell and verify that bash-completion v2 is correctly installed with `type _init_completion`.

### Enable kubectl autocompletion

You now have to ensure that the kubectl completion script gets sourced in all your shell sessions. There are multiple ways to achieve this:

* Source the completion script in your `~/.bash_profile` file:

```
echo 'source \<(kubectl completion bash)' >>~/.bash_profile
```
* Add the completion script to the `/usr/local/etc/bash_completion.d` directory:

```
kubectl completion bash >/usr/local/etc/bash_completion.d/kubectl
```
* If you have an alias for kubectl, you can extend shell completion to work with that alias:

```
echo 'alias k=kubectl' >>~/.bash_profile
echo 'complete -F \_\_start\_kubectl k' >>~/.bash_profile
```
* If you installed kubectl with Homebrew (as explained [here](safari-reader://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#install-with-homebrew-on-macos)), then the kubectl completion script should already be in `/usr/local/etc/bash_completion.d/kubectl`. In that case, you don't need to do anything.

  > **Note:** The Homebrew installation of bash-completion v2 sources all the files in the `BASH_COMPLETION_COMPAT_DIR` directory, that's why the latter two methods work.

In any case, after reloading your shell, kubectl completion should be working.

## What's next

* [Install Minikube](https://minikube.sigs.k8s.io/docs/start/)
* See the [getting started guides](safari-reader://kubernetes.io/docs/setup/) for more about creating clusters.
* [Learn how to launch and expose your application.](safari-reader://kubernetes.io/docs/tasks/access-application-cluster/service-access-application-cluster/)
* If you need access to a cluster you didn't create, see the [Sharing Cluster Access document](safari-reader://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/).
* Read the [kubectl reference docs](safari-reader://kubernetes.io/docs/reference/kubectl/kubectl/)

Last modified April 06, 2021 at 1:48 PM PST: [Improvement in Docs (59b166ed8)](https://github.com/kubernetes/website/commit/59b166ed89a38082e6bcbe7859dac43180f0716f)