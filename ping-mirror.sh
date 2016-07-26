#! /bin/sh

# ping-mirror.sh
# Taken from http://www.linuxquestions.org/questions/slackware-14/how-to-select-best-mirror-for-slackpkg-4175562376/

SLKVER=${SLKVER:-current}
TMP=${TMP:-/tmp}
FILE=$TMP/mirrorlist
SED=$TMP/$SLKVER-mirrors
SLKMIR=/etc/slackpkg/mirrors

if [ $SLKVER = "current" ]; then
    sed -ne '/current/,$p' $SLKMIR > $SED
else
    sed -e '/current/,$d' $SLKMIR > $SED
fi

trap 'rm -f $FILE $SED' EXIT 

for i in $(cat $SED | grep '\<[a-z]*://[^/]*' | sed 's/# //;/cdrom/d;/Project/d;/file/d'); do
    echo "$i"
    wget -T 5 --tries=1 -O/dev/null "$i" 2>&1 | grep -o "[0-9.]\+ [KM]*B/s"
    done > $FILE

cat $FILE