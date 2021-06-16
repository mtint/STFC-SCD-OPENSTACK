Professor Pai H. Chou
=====================

Setting up SSH public/private keys
----------------------------------

SSH (Secure Shell) can be set up with public/private key pairs so that you don't have to type the password each time. Because SSH is the transport for other services such as SCP (secure copy), SFTP (secure file transfer), and other services (CVS, GIT, etc), this can be very convenient and save you a lot of typing.

### SSH Version 2

On the local machine, type the BOLD part. The non-bold part is what you might see as output or prompt.

* Step 1: 
% **ssh-keygen -t dsa** 
Generating public/private dsa key pair. 
Enter file in which to save the key (~/.ssh/id\_dsa):(just type return) 
Enter passphrase (empty for no passphrase): (just type return) 
Enter same passphrase again: (just type return) 
Your identification has been saved in ~/.ssh/id\_dsa 
Your public key has been saved in ~/.ssh/id\_dsa.pub 
The key fingerprint is: 
Some really long string 
%
* Step 2: 
Then, paste the content of the local ~/.ssh/id\_dsa.pub file into the file~/.ssh/authorized\_keys on the remote host.
* RSA instead of DSA
  * If you want something strong, you could try 
% **ssh-keygen** -t rsa -b 4096
  * Instead of the names id\_dsa and id\_dsa.pub, it will be id\_rsaand id\_rsa.pub , etc.
  * The rest of the steps are identical.

That's it!

FAQ:

* Q: I follow the exact steps, but ssh still ask me for my password!
* A: Check your remote .ssh directory. It should have only your own read/write/access permission (octal 700) 
% **chmod** 700 ~/.ssh

### SSH Version 1

* Step 1: 
% **cd ~/.ssh** 
% **ssh-keygen -t rsa1** 
Generating public/private rsa1 key pair. 
Enter file in which to save the key (~/.ssh/identity):(just type return) 
Enter passphrase (empty for no passphrase): (just type return) Enter same passphrase again: (just type return) 
Your identification has been saved in ~/.ssh/identity 
Your public key has been saved in ~/.ssh/identity.pub 
The key fingerprint is: 
Some really long string 
%
* Step 2: 
Then, paste content of the local ~/.ssh/identity.pub file into the file~/.ssh/authorized\_keys on the remote host.

---

* Q: on macOS Sierra, how do I get ssh to stop asking me to type in the keychain password?
* A: Edit your ~/.ssh/config file and add the line 
Host \* 
 UseKeychain yes