#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#22262e/g' \
         -e 's/rgb(100%,100%,100%)/#dee1e6/g' \
    -e 's/rgb(50%,0%,0%)/#171a1f/g' \
     -e 's/rgb(0%,50%,0%)/#70a5eb/g' \
 -e 's/rgb(0%,50.196078%,0%)/#70a5eb/g' \
     -e 's/rgb(50%,0%,50%)/#171a1f/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#171a1f/g' \
     -e 's/rgb(0%,0%,50%)/#dee1e6/g' \
	"$@"