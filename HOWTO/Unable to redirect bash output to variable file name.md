3

I am trying to redirect the bash output to a variable file name. Here is my script looks like

    #!/bin/bash
    for i in `cat servers`
    do
    if [ "$i" = "198.162.1.3" ];
    then
    var="apple"
    fi
    ssh test@$i "uname -n"
    done > /tempout/uname_${var}.txt

I am getting the filename as /tempout/uname\_.txt

Expected filename should be uname\_apple.txt

[bash](https://unix.stackexchange.com/questions/tagged/bash) [shell-script](https://unix.stackexchange.com/questions/tagged/shell-script) [variable](https://unix.stackexchange.com/questions/tagged/variable)

[Share](https://unix.stackexchange.com/q/467491/476716)

[Edit](https://unix.stackexchange.com/posts/467491/edit)

[edited Sep 7 '18 at 9:44](https://unix.stackexchange.com/posts/467491/revisions)

[Rui F Ribeiro](https://unix.stackexchange.com/users/138261/rui-f-ribeiro)

50.5k2222 gold badges120120 silver badges197197 bronze badges

 asked Sep 7 '18 at 9:28

[xrkr](https://unix.stackexchange.com/users/92391/xrkr)

14522 silver badges88 bronze badges

 1 Answer 
----------

[ Active](https://unix.stackexchange.com/questions/467491/unable-to-redirect-bash-output-to-variable-file-name?answertab=active#tab-top)[ Oldest](https://unix.stackexchange.com/questions/467491/unable-to-redirect-bash-output-to-variable-file-name?answertab=oldest#tab-top)[ Votes](https://unix.stackexchange.com/questions/467491/unable-to-redirect-bash-output-to-variable-file-name?answertab=votes#tab-top)

7

The `var` variable in your code is used before the loop starts to create the output file.

If you want to output the result of the `ssh` command to a file whose name you construct from `$var`, then do this:

    #!/bin/bash

    while read -r server; do
        if [ "$server" = "198.162.1.3" ]; then
            var='apple'
        else
            var='unknown'
        fi

        ssh -n "test@$server" 'uname -n' >"/tempout/uname_$var.txt"
    done <servers

Here, I've also changed the loop so that it reads the input file line by line (ignoring leading and trailing whitespace on each line), and I've made `var` get the value `unknown` if the `if` statement does not take the "true" branch.

Also, you need `-n` for `ssh`. Otherwise, `ssh` would consume all the available input (here redirected from the `servers` file).

Another change that could be made is to use `case ... esac` rather than an `if` statement, especially if the number of IP addresses that you test for is more than a couple:

    #!/bin/bash

    while read -r server; do
        case $server in
            198.162.1.3) var=apple ;;
            198.162.1.5) var=cottage ;;
            198.162.1.7) var=bumblebee ;;
            *) var=unknown
        esac

        ssh -n "test@$server" 'uname -n' >"/tempout/uname_$var.txt"
    done <servers

[Share](https://unix.stackexchange.com/a/467493/476716)

[Edit](https://unix.stackexchange.com/posts/467493/edit)

[edited Sep 19 '18 at 19:37](https://unix.stackexchange.com/posts/467493/revisions)

[G-Man Says 'Reinstate Monica'](https://unix.stackexchange.com/users/80216/g-man-says-reinstate-monica)

18.7k2424 gold badges5353 silver badges104104 bronze badges

 answered Sep 7 '18 at 9:35

[Kusalananda](https://unix.stackexchange.com/users/116858/kusalananda)♦

241k3030 gold badges455455 silver badges730730 bronze badges

 Not the answer you're looking for? Browse other questions tagged [bash](https://unix.stackexchange.com/questions/tagged/bash) [shell-script](https://unix.stackexchange.com/questions/tagged/shell-script) [variable](https://unix.stackexchange.com/questions/tagged/variable) or [ask your own question](https://unix.stackexchange.com/questions/ask). 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------