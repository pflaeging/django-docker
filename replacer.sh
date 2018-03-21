#! /bin/sh
# Rewrite all the files with the extension .replacer and replace the ENV variables
# Example:
# ./dodo/testerle.ini.replacer is the template
# ./dodo/testerle.ini is the destination file where
# every ENV variable ($VAR) would be replaced


# envsubst command
ENVSUBST=envsubst
for files in `find . -type f -a -name "*.replacer" -print`
do
  $ENVSUBST < $files > `basename $files .replacer`
done
