Beginner's Setup Guide for Git & Github on Mac OS X
===================================================

**There is an [updated version](http://burnedpixel.com/blog/beginners-setup-guide-for-ruby-node-git-github-on-your-mac/) of this post for OS X 10.9\. While the steps below should still work, I recommend checking out the new guide if you are running 10.9!**

There are already plenty of guides that explain the particular steps of getting Git and Github going on your mac in detail. However, I had difficulty finding one that explained every step required in order with simple enough instructions for Terminal novices to follow along with autonomously.

So I decided to write one myself.

Background
----------

I enjoy helping people become more efficient and productive, particularly when it comes to their computers and mobile devices. At a recent job, the staff design team was beginning a period of close collaboration with the front-end development team in the interest of achieving the best possible product in the shortest period of time.

However, there was a slight “problem.” The project’s codebase was exclusively managed via Git repositories on Github. Most of the designers had never worked with Git, let alone ever configured it on their workstations.

Most of the designers had some knowledge of the technologies that went into the codebase, particularly presentation layer tech like HTML and CSS. Some even knew programming languages like Javascript, PHP, and Ruby.

In an effort to unleash this previously untapped resource for a round of intense polishing and bug-fixing, I took it upon myself to write a step-by-step guide that anymember of our studio could follow and be up and running with developer tools, Git, connected to Github, and ready to work on the project codebase.

This then is a slightly abbreviated[1](http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#fn:1) version of the guide I distributed out to the team. Ultimately just a few days after releasing it, nearly everyone in the office — including design, production, management, and even a few devs setting up new machines — was able to at least view the latest code on their workstations.

Aside from the fact that my guide helped others quickly get through the arduous process of installation and configuration, I was happy to have it as a quick reference for myself when setting up new machines of my own. Enjoy!

Getting started
---------------

This tutorial assumes you’re using a Mac running at least OS X 10.7\. If you are unsure of what OS you have, go up to the top left of your screen, click the Apple menu, and select “About This Mac.”

You’ll also need to ensure that your user account on your computer has admin privileges and that you know your account’s password.

Install the Command Line Tools for OS X
---------------------------------------

[Xcode](https://developer.apple.com/xcode/) is a nearly 4GB developer suite Apple offers for free from the Mac App Store. However, for the purposes of getting Git and Github setup, you’ll only need a specific set of command line tools[2](http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#fn:2) which fortunately take up much less space.

If you don’t mind the 4GB, by all means go for Xcode. Otherwise, you’ll have to go to [connect.apple.com](http://connect.apple.com/) and register an Apple Developer account in order to download these tools.

Once you’ve registered, they can be found at [developer.apple.com/xcode](http://developer.apple.com/xcode) by clicking on “View downloads” and finding the appropriate command line tools for your version of OS X in the list.

1. If you are on OS X **10.7.x**, download The **10.7 Command Line Tools**. If you are on OS X **10.8.x**, download The **10.8 Command Line Tools**.
2. When your download finishes, go ahead and open the DMG.
3. Run the Command Line Tools installer.

#### A note about the Terminal

The [Terminal](http://en.wikipedia.org/wiki/Terminal_(OS_X)) application comes pre-installed with OS X, and can be found in the Applications -\> Utilities folder. You can also quickly access it using Spotlight.

The terminal has a variety of uses, but for the purposes of this tutorial we’ll be using a syntax/command set called [Bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)). Terminal is already configured to use this syntax.

When you enter a command and press return/enter, often times the terminal will execute it and complete the task immediately. 

Sometimes it will log information in the window while it’s working, but other times you might feel like it isn’t doing anything at all. 

Some of the commands later in this tutorial can take a few seconds (or minutes) to complete, so don’t type anything into the terminal window or close the terminal window until you see it present you with a fresh prompt ending in `yourusername$`.

For the purposes of this tutorial, commands that I intend for you to type will be preceded with `$`, but don’t include that symbol when you enter the commands. It’s purely meant as an indicator and reference to the `$` that appears in your terminal prompt.

Lines that contain comments/notes from me to will be preceded with `#` and will be dimmed. Don’t type these either.

Make sure to press return after typing a command before you enter the next one.

Installing Git
--------------

![](resources/974B498D48439910C1A3870B0ADDFD60.jpg)

“[Git](http://en.wikipedia.org/wiki/Git_(software)) is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.”

We need to install Git onto your computer. It won’t have an icon in your dock, but it can be used by the Terminal (and other applications, more on that later).

OS X comes with a fairly old version of Git pre-installed, so we’ll want to make sure that your terminal is using a more updated version.

One specific reason you’ll want to have a newer version of Git than the one that ships with OS X is to take advantage of a nice authentication feature that allows you to seamlessly interact with Github.

1. [Download the latest stable release of Git](http://git-scm.com/download/mac). It should start downloading a DMG which for some reason will include the words “Snow Leopard” in the file name…don’t worry, it works with Lion and Mountain Lion just fine.
2. When it’s done downloading, open the DMG and run the package installer. 

  Note: If you are using OS X 10.8 and haven’t already modified your security settings to allow the installation of third-party applications, you’ll need to make that adjustment[3](http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#fn:3) before OS X lets you install these tools.
3. Once the installer has finished, open the Terminal app and type `git --version`followed by the return key. Note that there are two dashes, not one.
4. The terminal should report back with your currently installed Git version.

  If it reports a Git version that matches the version number marked on the DMG you downloaded (as of writing, this would be 1.8.1.3) proceed to [Configuring Git identification](http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#gitidentification), otherwise you’ll need to execute the following:

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

```
\# We need to make sure the Terminal goes through the correct order of folders to discover your newer version of Git. $ echo "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/local/sbin:$PATH" \>\> ~/.bash\_profile  \# Tell the Terminal to look at your bash\_profile to get the updated order of folders (your "$PATH") $ source ~/.bash\_profile  \# Now let's check your Git version again $ git --version  \# You should now see the version number corresponding to the DMG you downloaded (e.g. 1.8.1.3) 
```

Configuring Git identification
------------------------------

Now let’s configure your Git installation so other folks who might be working on projects with you know who’s doing all of the great work coming from your computer.

    1
    2
    3
    4
    5

```
\# Set your username $ git config --global user.name "Your Name Here"  \# Set your email address $ git config --global user.email "your\_name@domain.com" 
```

Setup Github
------------

![](resources/B722BDC763C9ED754781DB35900C9581.jpg)

“[GitHub](http://en.wikipedia.org/wiki/GitHub) is a web-based hosting service for software development projects that use the Git revision control system.”

Go to [Github.com](http://www.github.com/) and create a free account if you haven’t already.

#### Github Keychain Helper

To save time in the future, we’ll install a utility that will allow your computer to authenticate with Github automatically instead of having to enter your username/password during each session.

First, check if the helper is installed by typing `git credential-osxkeychain` into the terminal.

If the helper is installed, the terminal will give you instructions on how to use it:

    1

```
Usage: git credential-osxkeychain \<get|store|erase\> 
```

If see the above message, you are now able to access Git repositories using the HTTPS method. There’s a very good chance that this is the only method you will need to access repositories and you can [move on to my final notes](http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#done).

If you don’t have the keychain helper already installed, you’ll see this instead:

    1

```
git: 'credential-osxkeychain' is not a git command. See 'git --help'. 
```

To install the keychain helper, execute the following commands:

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14

```
\# Download the keychain helper $ curl -s -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain  \# Modify permissions on the helper so it can operate $ chmod u+x git-credential-osxkeychain  \# Move the helper so Git can access it. This command will ask you for your (computer user) password. As you're typing your password, it won't show the characters, press return when done typing it. $ sudo mv git-credential-osxkeychain /usr/local/git/bin  \# Tells Git to use the helper $ git config --global credential.helper osxkeychain  \# Check again to see if the helper is successfully installed $ git credential-osxkeychain 
```

Once again, if the helper has been installed successfully, the terminal will give you instructions on how to use it:

    1

```
Usage: git credential-osxkeychain \<get|store|erase\> 
```

If see the above message, you are now able to access Git repositories using the HTTPS method. There’s a very good chance that this is the only method you will need to access repositories and you can [move on to my final notes](http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#done).

If you don’t see the above message, you hit a snag along the way. Try going through the [keychain helper install](http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#keychainhelper) steps again.

Otherwise, if you have a specific reason that you need to access Git repositories using SSH, proceed to [SSH Keys](http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#sshkeys). 

#### SSH Keys (optional step)

“[SSH](http://en.wikipedia.org/wiki/Secure_Shell#Definition) uses public-key cryptography to authenticate the remote computer and allow it to authenticate the user, if necessary. There are several ways to use SSH; one is to use automatically generated public-private key pairs to simply encrypt a network connection, and then use password authentication to log on.”

An SSH key basically lets your computer uniquely identify itself when it connects to servers. If Github is aware of the key your computer is using, you won’t have to enter your Github username/password every time you connect.

##### Check for pre-existing SSH keys on your computer

Let’s see if your computer has one or more keys already installed:

    1
    2

```
\# Point the terminal to the directory that would contain SSH keys for your user account. $ cd ~/.ssh 
```

If you get the response “No such file or directory”, skip to [Generate a new SSH Key](http://burnedpixel.com/blog/setting-up-git-and-github-on-your-mac/#generatenewkey).

Otherwise, you’ll need to backup and remove your existing SSH keys.

##### Backup and remove your existing SSH keys.

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11

```
\# Ensure that you are in your ~/.ssh folder $ cd ~/.ssh  \# Make a subdirectory called "key\_backup" in the current directory $ mkdir key\_backup  \# Copies the id\_rsa keypair into key\_backup $ cp id\_rsa\* key\_backup  \# Deletes the id\_rsa keypair in your ~/.ssh directory $ rm id\_rsa\* 
```

##### Generate a new SSH key

Now we’ll create a new SSH key to use with Github.

    1
    2
    3
    4
    5

```
\# Ensure that you are in your ~/.ssh folder $ cd ~/.ssh  \# Create a new ssh key using the provided email. The email you use in this step should match the one you entered when you created your Github account $ ssh-keygen -t rsa -C "your\_email@domain.com" 
```

When it asks you to enter a file name in which to save the key, just press return/enter (leave the prompt blank).

You will then be asked to enter a passphrase and confirm it. **Don’t** make this blank, and **don’t** make it an easily guessable. This prevents someone from easily acquiring and using your SSH key to impersonate you. Don’t worry, you won’t have to enter this key much (if at all) after initial setup.

Press return after each time you’ve entered your selected passphrase. You won’t see the characters or bullets, the cursor will stay in the same spot as if you aren’t typing. 

If you make an error entering your password one of the times, just press return and it will prompt you to try again.

Once you’ve successfully set your passphrase, the terminal will report that your key has been saved and will present you with some sweet ASCII art.

##### Add your SSH key to Github

In order for your computer to access Github without you having to enter your username/password all the time, Github needs to know the contents of the SSH key you just generated.

    1
    2

```
\# The below command will copy your newly generated key to your computer's clipboard. $ pbcopy \< ~/.ssh/id\_rsa.pub 
```

Now we’ll add your key to Github:

1. Visit your [account settings](https://github.com/settings/ssh).
2. Click **Add SSH key**.
3. Enter a descriptive title for the computer you’re currently on, e.g. “Work iMac” into the Title field.
4. Paste your key into the **Key** field (it has already been copied to your clipboard).
5. Click **Add Key**.
6. Enter your Github password.

Now let’s test that it all worked.

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16

```
 \# Attempts to connect to Github using your SSH key.  \# Don't change the address shown below  $ ssh -T git@github.com   \# You may see the following warning:  The authenticity of host 'github.com (207.97.227.239)'  cant be established.  RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48\.  Are you sure you want to continue connecting (yes/no)?   \# Type yes and press return  \# You may have to enter your recently selected passphrase.   \# You should then see:  Hi username! You've successfully authenticated,  but GitHub does not provide shell access. 
```