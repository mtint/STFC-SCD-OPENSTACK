```
\#!/usr/local/bin/expect

\#\#\# Factor these out
set user <username>
set pass <password>
set host <machineIP>

\#\#\# Get the file list into a file remotely
spawn ssh $user@$host sh -c {ls -1 >file.txt}
expect {
    "Password:" {
        send "$pass\\r"
        exp_continue
    }
    eof {
        close
    }
}
\#\#\# Copy the file to the local machine
spawn scp $user@${host}:file.txt .
expect {
    "Password:" {
        send "$pass\\r"
        exp_continue
    }
    eof {
        close
    }
}
```