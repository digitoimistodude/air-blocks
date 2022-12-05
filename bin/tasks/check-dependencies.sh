#!/bin/bash
if grep -Fxq "ACF_PRO_KEY" ${ENV_FILE_PROJECT}
then
  echo "${GREEN}ACF_PRO_KEY found, let's continue.${TXTRESET}" 1>&2
else
  echo "${RED}ACF_PRO_KEY not found. Is Advanced Custom Field installed? The newtheme script will now quit...${TXTRESET}" 1>&2
fi
