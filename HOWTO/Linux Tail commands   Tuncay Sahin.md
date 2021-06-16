With a file name as argument, it displays last 10 lines for that file

> tail file1.txt

If you do not want to print the headers, you can use quiet mode with -q or –quiet or –silent option.

> tail -q file1.txt

Print last K number of lines

> tail -3 file1.txt

View a growing file to check some changes being made at the end of the file

> tail -n3 -f file2.txt

terminate after some process with Process ID PID dies with –pid=PID option.

> tail -f file2.txt –pid=4309

Filtering the tail output with grep

> tail -f file1.txt | grep ‘pattern’