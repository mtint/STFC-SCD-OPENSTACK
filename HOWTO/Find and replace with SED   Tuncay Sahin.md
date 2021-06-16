Linux Sed command is a stream editor that can perform basic text transformation on input stream. It can be used for editing in shell scripts for non-interactive editing. Sed can be used to find and replace a pattern on the input.

Examples
--------

The syntax of the command is:

sed ‘s/ //’

> echo “Hello there” | sed -e ‘s/there/here/’

Output is: Hello here

Replaces just first instance of pattern in a line.

Here, 2 instances of ‘one’ exist in the file. But sed has replaced only the first one

> cat numbers.txt

one two three one

> sed -i ‘s/one/four/’ numbers.txt

four two three one

Replace all the instances of the pattern, with the ‘g’ command of sed:

> sed -i ‘s/one/four/g’ numbers.txt

four two three four

Replace all the instances of the pattern for multiple files within a folder

> find /home/private -type f -exec sed -i ‘s/one/four/g’ {} \\;

Example script

> \#!/bin/bash
>  for fl in \*.php; do
>  mv $fl $fl.old sed ‘s/FINDSTRING/REPLACESTRING/g’ $fl.old \> $fl rm -f $fl.old
>  done

Insert and Append
-----------------

A pattern can be inserted to the file with ‘i’ command and appended with ‘a’ command. This insert and append operation use a newline for inserting and appending.

Insert a new line above

> sed ‘i \\inserted line’ numbers.txt

Append a new line at the end

> sed ‘a \\Appended line’ numbers.txt

Suppress the output by running sed in quiet mode.

> sed -n ‘s/one/four/’ numbers.txt

Printing the output

> sed -n ‘s/one/four/p’ numbers.txt

Find the pattern (like grep) root in the file /etc/passwd.

> sed -n ‘/root/p’ /etc/passwd

root:x:0:0:root:/root:/bin/bash

Deleting lines 1 to 3 from the given file.

> sed ‘1,3d’ count.txt

Writing to a file

> sed -n ‘/root/w rootpwd.txt’ /etc/passwd