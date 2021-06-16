2

I have a dataset of 30 samples and for each sample, I have 2 fastq files named as follow: 

    bigSample_1.R1.fq
    bigSample_1.R2.fq

where R1 and R2 identify the reading direction of my nucleotide sequence (R1=forward, R2=reverse).

I stored all my fastq file in the same directory on my pc (`workDir=/media/sf_16S_analysis/Dermatite_fastq_concat/FastQ/fastq_Join`); however, I execute my bash shell script using a Virtual machine.

Now I should want to create a `manifest-file.csv` with the followed structure:

    sample-id,absolute-filepath,direction
    sample-1,$PWD/some/filepath/sample1_R1.fastq,forward
    sample-1,$PWD/some/filepath/sample1_R2.fastq,reverse

More in detail: the manifest file must be a comma-separated (i.e., .csv) text file. The first field on each line is the sample identifier, the second field is the absolute filepath, and the third field is the read direction. The first line in the file is not blank must be the header line:

    sample-id,absolute-filepath,direction.

Now my question is: there is a way to read the list of my files `.fq` in the workDir and create the `manifest-file.csv` using a script?

[shell-script](https://unix.stackexchange.com/questions/tagged/shell-script)

[Share](https://unix.stackexchange.com/q/506099)

[Improve this question](https://unix.stackexchange.com/posts/506099/edit)

[edited Mar 13 '19 at 15:08](https://unix.stackexchange.com/posts/506099/revisions)

[slm](https://unix.stackexchange.com/users/7453/slm)♦

326k9999 gold badges706706 silver badges815815 bronze badges

 asked Mar 13 '19 at 14:52

[RDG](https://unix.stackexchange.com/users/341582/rdg)

2311 silver badge33 bronze badges

 2 Answers 
-----------

[ Active](https://unix.stackexchange.com/questions/506099/how-to-create-a-script-to-write-a-csv-file?answertab=active#tab-top)[ Oldest](https://unix.stackexchange.com/questions/506099/how-to-create-a-script-to-write-a-csv-file?answertab=oldest#tab-top)[ Votes](https://unix.stackexchange.com/questions/506099/how-to-create-a-script-to-write-a-csv-file?answertab=votes#tab-top)

0

Is this anywhere near what you are looking for?

    echo "sample-id,absolute-filepath,direction" > manifest
    for f in *.fq; do
      dir="forward"
      g=$(echo $f | grep -Po "(?<=\.R)[0-9](?=\.fq)")
      if [ $g -eq 2 ]; then
        dir="reverse"
      fi
      echo ${f%%.*},$PWD/$f,$dir
    done >> manifest
    cat manifest

Assumes there is only R1 and R2 and that you execute from the containing directory

[Share](https://unix.stackexchange.com/a/506122)

[Improve this answer](https://unix.stackexchange.com/posts/506122/edit)

 answered Mar 13 '19 at 16:32

[bu5hman](https://unix.stackexchange.com/users/217629/bu5hman)

4,05322 gold badges1010 silver badges2525 bronze badges

1

With the same approach as [bu5hman](https://unix.stackexchange.com/a/506122/116858), i.e. assuming that the sample ID is the part of the filename up to the first dot:

    #!/bin/sh

    csv_print_row () {
        # Outputs a CSV-formatted row of an arbitrary number of fields.
        # Will quote fields containing commas. That's all.

        for field do
            case $field in
                *,*) set -- "$@" "\"$field\"" ;;
                *)   set -- "$@" "$field"
            esac
            shift
        done

        # The fields are now (possibly quoted) in the list of positional parameters.
        # Print this list as a comma-delimited string:
        ( IFS=,; printf "%s\n" "$*" )
    }

    # Output header
    csv_print_row "sample_id" "absolute-filepath" "direction"

    # Loop over the *.fq files in the current directory
    for fastq in *.fq; do
        # The sample ID is the filename up to the first dot.
        sample_id=${fastq%%.*}

        # Figure out the direction of the sample
        case $fastq in
            *.R1.*) dir=forward ;;
            *.R2.*) dir=reverse ;;
            *)      dir=unknown
        esac

        # Output row for this sample
        csv_print_row "$sample_id" "$PWD/$fastq" "$dir"
    done

Testing:

    $ ls -l
    total 4
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:01 sample-1.R1.fq
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:01 sample-1.R2.fq
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:01 sample-2.R1.fq
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:01 sample-2.R2.fq
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:01 sample-3.R1.fq
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:01 sample-3.R2.fq
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:01 sample-4.R1.fq
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:01 sample-4.R2.fq
    -rw-r--r--  1 kk  wheel  629 Mar 13 18:00 script.sh
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:02 strange, sample.R1.fq
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:02 strange, sample.R2.fq
    -rw-r--r--  1 kk  wheel    0 Mar 13 18:02 strange, sample.R3.fq

    $ sh script.sh
    sample_id,absolute-filepath,direction
    sample-1,/tmp/shell-yash.zm5cvzG6/sample-1.R1.fq,forward
    sample-1,/tmp/shell-yash.zm5cvzG6/sample-1.R2.fq,reverse
    sample-2,/tmp/shell-yash.zm5cvzG6/sample-2.R1.fq,forward
    sample-2,/tmp/shell-yash.zm5cvzG6/sample-2.R2.fq,reverse
    sample-3,/tmp/shell-yash.zm5cvzG6/sample-3.R1.fq,forward
    sample-3,/tmp/shell-yash.zm5cvzG6/sample-3.R2.fq,reverse
    sample-4,/tmp/shell-yash.zm5cvzG6/sample-4.R1.fq,forward
    sample-4,/tmp/shell-yash.zm5cvzG6/sample-4.R2.fq,reverse
    "strange, sample","/tmp/shell-yash.zm5cvzG6/strange, sample.R1.fq",forward
    "strange, sample","/tmp/shell-yash.zm5cvzG6/strange, sample.R2.fq",reverse
    "strange, sample","/tmp/shell-yash.zm5cvzG6/strange, sample.R3.fq",unknown

To create your manifest:

    sh script.sh >manifest-file.csv

Note that this would generate invalid CSV output if any filename contains double quotes.

To *properly* handle the quoted fields that contain double quotes, you would have to use something like

    csv_print_row () {
        # Outputs a CSV-formatted row of an arbitrary number of fields.

        # Quote fields that needs quoting
        for field do
            case $field in
                *[,\"]*) set -- "$@" "\"$field\"" ;;
                *)       set -- "$@" "$field"
            esac
            shift
        done

        # Double up internal double quotes in fields that have been quoted
        for field do
            case $field in
                '"'*'"'*'"')
                    field=$( printf '%s\n' "$field" | sed 's/"/""/g' )
                    # Now remove the extra quote at the start and end
                    field=${field%\"}
                    field=${field#\"}
            esac
            set -- "$@" "$field"
            shift
        done

        ( IFS=,; printf "%s\n" "$*" )
    }

This still does not do the right thing for fields that contain newlines, but to handle that would bring us outside the scope of this question.

See also:

* [RFC 4180](https://tools.ietf.org/html/rfc4180)

[Share](https://unix.stackexchange.com/a/506130)

[Improve this answer](https://unix.stackexchange.com/posts/506130/edit)

[edited Mar 13 '19 at 17:40](https://unix.stackexchange.com/posts/506130/revisions)

 answered Mar 13 '19 at 17:05

[Kusalananda](https://unix.stackexchange.com/users/116858/kusalananda)♦

241k3030 gold badges455455 silver badges730730 bronze badges

 Not the answer you're looking for? Browse other questions tagged [shell-script](https://unix.stackexchange.com/questions/tagged/shell-script) or [ask your own question](https://unix.stackexchange.com/questions/ask). 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------