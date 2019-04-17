#!/usr/bin/env bash
HOMEDIR=$HOME
USERNAME=$(whoami)

USE_SUDO=''
if [ $USERNAME != "root" ];
then
  USE_SUDO="sudo "
fi

# Do we need to install SaltStack?
command -v salt-call > /dev/null 2>&1
if [ $? -ne 0 ];
then
	echo "SaltStack not found. Pleese install it" 
	exit 1
fi

# Set the user, home-directory, and state root
$USE_SUDO salt-call --local --config=./ --state-output=changes grains.setvals "{ \"user\": \"$USERNAME\", \"homedir\": \"$HOMEDIR\" }"

# Apply the high state
if [[ ! $1 ]];
then
	$USE_SUDO salt-call --local --config=./ --state-output=mixed --retcode-passthrough state.highstate
else
	$USE_SUDO salt-call --local --config=./ --state-output=mixed --retcode-passthrough state.sls $1
fi
