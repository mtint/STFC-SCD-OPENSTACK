You can use the mkpasswd tool to do this. There's a good primer on how to use it over on cyberciti.biz, titled: [Linux / UNIX: Generating random password with mkpasswd](http://www.cyberciti.biz/faq/generating-random-password/).

### Example

```
mkpasswd --char=10 --crypt-md5
```

The package is usually called `makepasswd`, but the tool is typically called `mkpasswd`.

See the [man page](http://linux.die.net/man/1/mkpasswd) for more details.

### Generating contents of `/etc/shadow` directly

The following python command will generate the portion that goes into the `/etc/shadow`file:

**Python**

```
$ python -c "import crypt, getpass, pwd; \
         print crypt.crypt('password', '\$6\$SALTsalt\$')"
```

**Perl**

```
$ perl -e 'print crypt("password","\$6\$saltsalt\$") . "\n"'
```

Which generates the following output:

```
$6$SALTsalt$UiZikbV3VeeBPsg8./Q5DAfq9aj7CVZMDU6ffBiBLgUEpxv7LMXKbcZ9JSZnYDrZQftdG319XkbLVMvWcF/Vr/
```

### Changing the /etc/shadow

Here's a command that will change the existing entry with the newly generated password field from the command above.

```
perl -pe 's|(root):(\$.*?:)|\1:\$6\$SALTsalt\$UiZikbV3VeeBPsg8./Q5DAfq9aj7CVZMDU6ffBiBLgUEpxv7LMXKbcZ9JSZnYDrZQftdG319XkbLVMvWcF/Vr/:|' /etc/shadow > /etc/shadow.new
```

**NOTE:** This is a rough example but works. You'll need to take the results from the command that generated the hashed password, and escape the dollar signs ($) with slashes (\\$).

The results are stored in a new file /etc/shadow.new. Once you've confirmed the results you can replace `/etc/shadow` with the new file, `/etc/shadow.new`.