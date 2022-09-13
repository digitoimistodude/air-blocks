#!/bin/bash
echo "${YELLOW}Checking block updates...${TXTRESET}"
cd $HOME
git clone https://github.com/digitoimistodude/air-blocks $BLOCKS_PATH_TEMP
cd $BLOCKS_PATH_TEMP
git stash
git clean -fxd
if ! git pull
then
  echo "${RED}Error: git pull failed! Cannot get updates. Make sure you don't have modifications in $BLOCKS_PATH_TEMP.${TXTRESET}"
  exit
fi
git pull
