```
find . -type f | xargs grep -H -c 'shared.php' | grep 0$ | cut -d':' -f1    

```

OR

```
find . -type f -exec grep -H -c 'shared.php' {} \; | grep 0$ | cut -d':' -f1
```