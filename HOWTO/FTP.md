```
HOST='remote.server.com'
USER='domainname/usrid'   
PASSWD='p@@ssw0rd'
cd /path/to/local/directory/containing/the/file/to/be/transferred
`ftp -n $HOST <<END\_SCRIPT quote USER $USER quote PASS $PASSWD cd /diretory/on/remote/server put file2transfer.dat bye quit END\_SCRIPT`
```