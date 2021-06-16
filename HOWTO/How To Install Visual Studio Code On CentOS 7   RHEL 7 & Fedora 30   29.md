This document is also available for

[Ubuntu 18.04](https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-visual-studio-code-on-ubuntu-18-04-linux-mint-19-debian-9.html) [Debian 9](https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-visual-studio-code-on-ubuntu-18-04-linux-mint-19-debian-9.html) [LinuxMINT 19](https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-visual-studio-code-on-ubuntu-18-04-linux-mint-19-debian-9.html)

[Visual Studio Code](https://code.visualstudio.com/) is a cross-platform source code editor developed by Microsoft. It has built-in debugging support, embedded Git control, syntax highlighting, code completion, code refactoring, and snippets.

[Visual Studio Marketplace](https://marketplace.visualstudio.com/vscode) offers lots of plugins and extensions to extend the functionality of VS code.

This tutorial guides you on how to install [Visual Studio Code](https://www.itzgeek.com/tag/vscode) editor on [CentOS 7 / RHEL 7](https://www.itzgeek.com/tag/centos-7) & [Fedora 30 / 29](https://www.itzgeek.com/category/how-tos/linux/fedora-how-tos) from the Microsoft’s VS Code repository.

Configure Visual Studio Code Repository
---------------------------------------

Microsoft provides the official repository for easy installation of Visual Studio Code for [CentOS / RHEL](https://www.itzgeek.com/category/how-tos/linux/centos-how-tos) & [Fedora](https://www.itzgeek.com/category/how-tos/linux/fedora-how-tos) operating systems. So, you can set up the Microsoft repository on your system receive the VS Code package.

Switch to the root user.

    sudo su -

**OR**

    su -

Download and import the Microsoft signing GPG key using the curl command.

    rpm --import https://packages.microsoft.com/keys/microsoft.asc

Now, add the Visual Studio Code repository to your system.

    cat << EOF > /etc/yum.repos.d/vscode.repo
    [code]
    name=Visual Studio Code
    baseurl=https://packages.microsoft.com/yumrepos/vscode
    enabled=1
    gpgcheck=1
    gpgkey=https://packages.microsoft.com/keys/microsoft.asc
    EOF

Install Visual Studio Code
--------------------------

Once you have added the repository to the system, do not forget to check for using available package upgrades the [yum](https://www.itzgeek.com/how-tos/linux/centos-how-tos/linux-basics-30-yum-command-examples-for-linux-package-manager.html) command on CentOS or [dnf](https://www.itzgeek.com/how-tos/linux/fedora-how-tos/how-to-use-dnf-nextgen-yum-new-package-manager-in-fedora-22.html) command on Fedora.

    ### CentOS / RHEL ###

    yum check-update

    ### Fedora ###

    dnf check-update

Use the [yum](https://www.itzgeek.com/how-tos/linux/centos-how-tos/linux-basics-30-yum-command-examples-for-linux-package-manager.html) command on CentOS or [dnf](https://www.itzgeek.com/how-tos/linux/fedora-how-tos/how-to-use-dnf-nextgen-yum-new-package-manager-in-fedora-22.html) command on Fedora to install Visual Studio Code.

    ### CentOS / RHEL ###

    yum install -y code

    ### Fedora ###

    dnf install -y code

Start Visual Studio Code
------------------------

Once the VS Code is installed on your system, you can launch it either from the command line or by clicking on the VS Code icon in graphical mode.

    code

**OR**

**CentOS**: **Menu** \>\> **Programming** \>\> **Visual Studio Code.**

[![Start Visual Studio Code on CentOS 7](https://www.itzgeek.com/wp-content/uploads/2019/05/Install-Visual-Studio-Code-On-CentOS-7-Start-Visual-Studio-Code-on-CentOS-7.jpg)](https://www.itzgeek.com/wp-content/uploads/2019/05/Install-Visual-Studio-Code-On-CentOS-7-Start-Visual-Studio-Code-on-CentOS-7.jpg)Start Visual Studio Code on CentOS 7

**Fedora**: **Activities** \>\> Search for **Visual Studio Code.**

[![Start Visual Studio Code on Fedora](https://www.itzgeek.com/wp-content/uploads/2019/05/Install-Visual-Studio-Code-On-Fedora-Start-Fedora.jpg)](https://www.itzgeek.com/wp-content/uploads/2019/05/Install-Visual-Studio-Code-On-Fedora-Start-Fedora.jpg)Start Visual Studio Code on Fedora

**Visual Studio Code running on CentOS 7:**

ADVERTISEMENT

 [![Install Visual Studio Code On CentOS 7 - Microsoft Visual Studio Code Running on CentOS 7](https://www.itzgeek.com/wp-content/uploads/2019/05/Install-Visual-Studio-Code-On-CentOS-7-Microsoft-Visual-Studio-Code-Running-on-CentOS-7.jpg)](https://www.itzgeek.com/wp-content/uploads/2019/05/Install-Visual-Studio-Code-On-CentOS-7-Microsoft-Visual-Studio-Code-Running-on-CentOS-7.jpg)Install Visual Studio Code On CentOS 7 – Microsoft Visual Studio Code Running on CentOS 7

**Visual Studio Code running on Fedora:**

[![Microsoft Visual Studio Code Running on Fedora](https://www.itzgeek.com/wp-content/uploads/2019/05/Install-Visual-Studio-Code-On-Fedora-Microsoft-Visual-Studio-Code-Running-on-Fedora.jpg)](https://www.itzgeek.com/wp-content/uploads/2019/05/Install-Visual-Studio-Code-On-Fedora-Microsoft-Visual-Studio-Code-Running-on-Fedora.jpg)Microsoft Visual Studio Code Running on Fedora

Update Visual Studio Code
-------------------------

Microsoft releases the update for Visual Studio Code monthly. You can update the version of Visual Studio Code similar to other packages, using the apt command.

    ### CentOS / RHEL ###

    yum update code

    ### Fedora ###

    dnf update code

Conclusion
----------

You have successfully installed Visual Studio Code on your [CentOS 7 / RHEL 7](https://www.itzgeek.com/tag/centos-7) & [Fedora 30 / 29](https://www.itzgeek.com/category/how-tos/linux/fedora-how-tos). You can now install [extensions](https://code.visualstudio.com/docs/setup/additional-components) and [configure](https://code.visualstudio.com/docs/getstarted/settings)[ V](https://code.visualstudio.com/docs/getstarted/settings)[S](https://code.visualstudio.com/docs/getstarted/settings)[ Code](https://code.visualstudio.com/docs/getstarted/settings) according to your preferences. Also, [learn about the User Interface](https://code.visualstudio.com/docs/getstarted/userinterface) of VS Code.