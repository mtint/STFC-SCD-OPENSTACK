How to Exclude in Grep
======================

[Linuxize](safari-reader://linuxize.com/)May 18, 2021

`grep` is a powerful command-line tool that is used to search one or more input files for lines that match a regular expression and writes each matching line to standard output.

In this article, we’re going to show you how to exclude one or multiple words, patterns, or directories when searching with `grep`.

Exclude Words and Patterns 
---------------------------

To display only the lines that do not match a search pattern, use the `-v` ( or `--invert-match`) option.

For example, to print the lines that do not contain the string `nologin` you would use:

```
grep -wv nologin /etc/passwd
```

```
root:x:0:0:root:/root:/bin/bash
git:x:994:994:git daemon user:/:/usr/bin/git-shell
linuxize:x:1000:1000:linuxize:/home/linuxize:/bin/bash

```

The `-w` option tells `grep` to return only those lines where the specified string is a whole word (enclosed by non-word characters).

By default, `grep` is case-sensitive. This means that the uppercase and lowercase characters are treated as distinct. To ignore the case when searching, invoke `grep` with the `-i` option.

If the search string includes spaces, you need to enclose it in single or double quotation marks.

To specify two or more search patterns, use the `-e` option:

```
grep -wv -e nologin -e bash /etc/passwd
```

You can use the `-e` option as many times as you need.

Another option to exclude multiple search patterns is to join the patterns using the OR operator `|`.

The following example prints the lines that do not contain the strings `nologin`or `bash`:

```
grep -wv 'nologin\|bash' /etc/passwd
```

GNU `grep` supports three regular expression syntaxes, Basic, Extended, and Perl-compatible. By default, `grep` interprets the pattern as a basic regular expression where the meta-characters such as `|` lose their special meaning, and you must use their backslashed versions.

If you use the extended regular expression option `-E`, then the operator `|`should not be escaped, as shown below:

```
grep -Ewv 'nologin|bash' /etc/passwd
```

You can specify different possible matches that can be literal strings or expression sets. In the following example, the lines where the string `games`occur at the very beginning of a line are excluded:

```
grep -v "^games" file.txt
```

A command’s output can be filtered with `grep` through piping, and only the lines matching a given pattern will be printed on the terminal.

For example, to print out all running processes on your system except those running as user “root” you can filter the output of the [`ps`](https://linuxize.com/post/ps-command-in-linux/) command:

```
ps -ef | grep -wv root
```

Exclude Directories and Files 
------------------------------

Sometimes when performing a recursive search with the `-r` or `-R` options, you may want to exclude specific directories from the search result.

The main difference between `-r` or `-R` options is that when grep is invoked with uppercase `R` it will follow all [symbolic links](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/)

To exclude a directory from the search, use the `--exclude-dir` option. The path to the excluded directory is relative to the search directory.

Here is an example showing how to search for the string `linuxize` in all files inside the `/etc`, excluding the `/etc/pki` directory:

```
grep -R --exclude-dir=pki linuxize /etc
```

To exclude multiple directories, enclose the excluded directories in curly brackets and separate them with commas with no spaces.

For example, to find files that contain the string ‘gnu’ in your Linux system excluding the `proc`, `boot`, and `sys` directories you would run:

```
grep -r --exclude-dir={proc,boot,sys} gnu /
```

When using wildcard matching, you can exclude files whose base name matches to the GLOB specified in the `--exclude` option.

In the example below, we are searching all files in the current working directory for the string `linuxize`, excluding the files ending in `.png` and `.jpg` directory:

```
grep -rl --exclude=*.{png,jpg} linuxize *
```

Conclusion 
-----------

The `grep` command allows you to exclude patterns and directories when searching files.

If you have any questions or feedback, feel free to leave a comment.