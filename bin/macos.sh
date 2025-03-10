#!/bin/bash
# Project starting bash script for macOS native LEMP.
# More info: https://github.com/digitoimistodude/macos-lemp-setup

# Script specific vars
SCRIPT_LABEL='for macOS'
SCRIPT_VERSION='1.0.4'

# Vars needed for this file to function globally
CURRENTFILE=`basename $0`

# Determine scripts location to get imports right
if [ "$CURRENTFILE" = "macos.sh" ]; then
  SCRIPTS_LOCATION="$( pwd )"
  source ${SCRIPTS_LOCATION}/tasks/variables.sh
  source ${SCRIPTS_LOCATION}/tasks/header.sh
  exit
else
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
  ORIGINAL_FILE=$( readlink $DIR/$CURRENTFILE )
  SCRIPTS_LOCATION=$( dirname $ORIGINAL_FILE )
fi

# Final note about server requirements
echo ""
echo "${WHITE}Using this start script requires you have dev server installed and working:
https://github.com/digitoimistodude/macos-lemp-setup
${TXTRESET}"

# Import required tasks
source ${SCRIPTS_LOCATION}/tasks/imports.sh

# MacOS Specific restarts and reloads
echo "${BOLDGREEN}Local environment up and running.${TXTRESET}"
echo "${YELLOW}Updating hosts file...${TXTRESET}"
sudo -- sh -c "echo 127.0.0.1 ${PROJECTNAME}.test >> /etc/hosts"

echo "${YELLOW}Restarting nginx...${TXTRESET}"
sudo brew services stop nginx
sudo brew services start nginx

# macOS specific complete message
echo "${BOLDGREEN}All done!${TXTRESET}"

# The end
source ${SCRIPTS_LOCATION}/tasks/footer.sh
