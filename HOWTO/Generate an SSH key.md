1. Generate an SSH key:

```
$ ssh-keygen -t rsa -C <email1@example.com>
```

2. Generate another SSH key:

```
$ ssh-keygen -t rsa -f ~/.ssh/accountB -C <email2@example.com>
```

  Now, two public keys (**id\_rsa.pub**, **accountB.pub**) should be exists in the `~/.ssh/` directory.

```
$ ls -l ~/.ssh     # see the files of '~/.ssh/' directory
```
3. Create configuration file `~/.ssh/config` with the following contents:

```
$ nano ~/.ssh/config

Host bitbucket.org
    User git
    Hostname bitbucket.org
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa

Host bitbucket-accountB
    User git
    Hostname bitbucket.org
    PreferredAuthentications publickey
    IdentitiesOnly yes
    IdentityFile ~/.ssh/accountB
```
4. Clone from `default` account.

```
$ git clone git@bitbucket.org:username/project.git
```
5. Clone from the `accountB` account.

```
$ git clone git@bitbucket-accountB:username/project.git
```

I would agree with Tuomas about using ssh-agent. I also wanted to add a second private key for work and this tutorial worked like a charm for me.

Steps are as below:

$ ssh-agent bash
$ ssh-add /path.to/private/key e.g ssh-add ~/.ssh/id_rsa
Verify by $ ssh-add -l
Test it with $ssh -v <host url> e.g ssh -v git@assembla.com