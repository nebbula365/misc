#!/bin/bash

#step_1 - pulls the production CNAME
step_1=$(dig $1 | grep CNAME | awk ' {print $5} ' | head -n 1 | sed 's/\<edgekey\>/&-staging/')
dig $step_1
