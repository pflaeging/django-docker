#! /bin/sh
# Rewrite all the files from TEMPLATEDIR with the files in REPLACEDIR
# Example:
# ./templates/dodo/testerle.ini is the template
# ./dodo/testerle.ini is the destination file where
# every ENV variable ($VAR) would be replaced

# where are my templates?
TEMPLATEDIR=/container/templates
# where are the files I'm trying to replace?
REPLACEDIR=/container

# encsubst command
ENVSUBST=envsubst

if [ -d $TEMPLATEDIR ]
then
  cd $TEMPLATEDIR
  for files in `find . -type f -print`
  do
    $ENVSUBST < $files > $REPLACEDIR/$files
  done
fi
