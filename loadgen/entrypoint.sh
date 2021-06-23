#!/bin/sh
if [ "$URL" ] ;
then
while [ true ]; do curl ${CURLOPTS} ${URL}; sleep ${SLEEP:-0} ; done ;
fi
