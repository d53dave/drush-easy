# drush-easy
This script will pull drush and set it up for quick deploys.

### Dependencies
Just ```wget``` for the moment. All other php dependencies are contained within .phar that the script pulls and sets up.

### Running it
```. drush-easy.sh``` or 
```source drush-easy.sh``` should do it.
Note that in order to put drush on your $PATH, the script has to be sourced. Otherwise, it will be run in a subshell and not affect your current $PATH.
