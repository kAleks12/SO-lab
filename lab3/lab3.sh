## grep

# get 10 unique ip addresses
cat access_log | grep  -o "^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | sort -u |  head -10

# get requests with /denied in links
cat access_log | grep "^.*/denied.*"

# get unique delete requests (everything after delete method must be unique)
cat access_log | grep -o "DELETE.*" | sort -u

# get all requests from 64.242.88.10
cat access_log | grep "^64\.242\.88\.10"


## cut + grep

# get all people with uneven ids
cat yolo.csv | cut -f 1,2,3 -d "," | grep "^[0-9]*[13579]," >&2

# get ips that have exactly one number in the first and second octet
cat yolo.csv | cut -f 6 -d "," | grep "^[0-9]\.[0-9]\..*" >&2


## sed

# replace $HEADER$ with /temat/ in all files in groovies directory
find groovies -type f -exec sed -i 's/\$HEADER\$/\/temat\//g' {} \;

# remove lines with Help docs in it
find groovies/ -type f -exec sed -i "/Help docs/g" {} \;