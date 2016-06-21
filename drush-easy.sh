#!/usr/bin/env sh

# Try to execute a `return` statement,
# but do it in a sub-shell and catch the results.
# If this script isn't sourced, that will raise an error.
$(return >/dev/null 2>&1)

# What exit code did that give?
if [ "$?" -eq "0" ] && [ "$BASH_SUBSHELL" -eq "0" ]
then
  rm drush.phar
  wget https://github.com/drush-ops/drush/releases/download/8.1.2/drush.phar
  rm -rf drush && mkdir drush # Caution, this will remove any file/folder called 'drush' that is in the current dir.
  mv drush.phar drush && cd drush
  phar extract -f drush.phar
  echo "#!/usr/bin/env php" | cat - drush > /tmp/out && mv /tmp/out drush
  chmod +x drush
  chmod +x drush.php
  curDir=`pwd`
  export PATH=$PATH:$curDir
  cd ..
else
  echo "Script should be sourced in order to put drush on \$PATH"
fi
