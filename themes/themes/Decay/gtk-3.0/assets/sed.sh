#!/bin/sh
sed -i \
         -e 's/#22262e/rgb(0%,0%,0%)/g' \
         -e 's/#dee1e6/rgb(100%,100%,100%)/g' \
    -e 's/#171a1f/rgb(50%,0%,0%)/g' \
     -e 's/#70a5eb/rgb(0%,50%,0%)/g' \
     -e 's/#171a1f/rgb(50%,0%,50%)/g' \
     -e 's/#dee1e6/rgb(0%,0%,50%)/g' \
	"$@"