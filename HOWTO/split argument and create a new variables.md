My argument look like: `My_Submit.sh May5_2014` and I want to create a new variable inspired from the argument, this variable should look like `May14_5`.

    [\#! /bin/zsh -
    ](https://unix.stackexchange.com/questions/tagged/bash "show questions tagged 'bash'")

    set -o extendedglob
    zmodload zsh/langinfo
    date=${1?date not specified}

    if
      [[ $date = (#b)(${(vj[|])~langinfo[(I)ABMON_<1-12>]})(<1-31>)_20([0-9][0-9]) ]]
    then
      newdate=$match[1]$match[3]_$match[2]
    else
      print -ru2 -- $date is not in the right format
      exit 1
    fi

    print -r New date is $newdate.