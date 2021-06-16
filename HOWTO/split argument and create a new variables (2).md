#! /bin/zsh -
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