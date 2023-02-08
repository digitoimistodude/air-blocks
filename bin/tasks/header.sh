#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:08:24
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2021-11-23 18:31:26
# Note about running directly as we can't prevent people running this via sh or bash pre-cmd
echo "----------------------------------------------------"
echo "newblock start script ${SCRIPT_LABEL}, v${SCRIPT_VERSION}"
echo "----------------------------------------------------"
echo ""
if [ ! -f /usr/local/bin/newblock ]; then
echo "${TXTRESET}${TXTBOLD}ACTION REQUIRED:${TXTRESET}${WHITE} Link this file to system level and start from there with this oneliner:${TXTRESET}"
echo ""
echo "${GREEN}sudo ln -s ${DIR_TO_FILE}${CURRENTFILE} /usr/local/bin/newblock && sudo chmod +x /usr/local/bin/newblock && newblock${TXTRESET}" 1>&2
echo ""
exit
fi
if [ $0 != '/usr/local/bin/newblock' ]; then
echo "${TXTRESET}${WHITE}Please do NOT run this script with ${RED}sh $CURRENTFILE${WHITE} or ${RED}bash $CURRENTFILE${WHITE} or ${RED}./$CURRENTFILE${WHITE}.
Run this script globally instead by simply typing: ${GREEN}newblock${TXTRESET}"
echo ""
exit
fi
