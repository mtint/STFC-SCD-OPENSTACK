```c
#!/usr/bin/env bash
#
# Minimimal example:
#
#   cors_headers https://www.google.com
#
# Example with origin (-o):
#
#   cors_headers -o localhost https://www.google.com
#
# Example with HTTP method:
#
#   cors_headers -X OPTIONS -o localhost https://www.google.com
#
# See: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS

origin="localhost"
method="GET"

while getopts "o:X:" option; do
  case "${option}" in
    o)
      origin=${OPTARG}
      ;;
    X)
      method=${OPTARG}
      ;;
    *)
      echo "No flags"
      ;;
  esac
done
url=${@:$OPTIND:1}

echo "$method" "$url"
curl "$url" \
  -X "$method" \
  --header "Origin: $origin" \
  -o /dev/null \
  --verbose 2>&1 |
  grep -E "([Aa]ccess-[Cc]ontrol|Origin|HTTP)"
```