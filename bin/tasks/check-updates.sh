#!/bin/bash
echo "${YELLOW}Checking block updates and auto-updating...${TXTRESET}"
if [ -d "$BLOCKS_PATH_TEMP" ]; then
  cd $BLOCKS_PATH_TEMP
  git stash
  git clean -fxd
  if ! git pull
  then
    echo "${RED}Error: git pull failed! Cannot get updates. Make sure you don't have modifications in $BLOCKS_PATH_TEMP.${TXTRESET}"
    exit
  fi
  git pull
else
  echo "${YELLOW}Temp folder $BLOCKS_PATH_TEMP does not exist, cloning...${TXTRESET}"
  git clone https://github.com/digitoimistodude/air-blocks $BLOCKS_PATH_TEMP
fi

# Check if folder exists
if [ -d "$BLOCKS_PATH" ]; then
  echo "${YELLOW}Folder $BLOCKS_PATH exists, checking for updates...${TXTRESET}"
  cd $BLOCKS_PATH
  if ! git pull
  then
    echo "${RED}Error: git pull failed! Cannot get updates. Make sure you don't have modifications in $BLOCKS_PATH.${TXTRESET}"
    exit
  fi
  git pull
else
  echo "${YELLOW}Folder $BLOCKS_PATH does not exist, cloning...${TXTRESET}"
  git clone https://github.com/digitoimistodude/air-blocks $BLOCKS_PATH
fi
