#!/bin/bash
# @Author: Roni Laukkarinen
# @Date:   2021-11-23 18:28:35
# @Last Modified by:   Roni Laukkarinen
# @Last Modified time: 2021-11-23 18:42:39

# Check if renamed block
if [[ $IS_RENAMED_BLOCK =~ "yes" ]]; then
  export BLOCK_SLUG=$BLOCK_SLUG_TO_RENAME_TO
fi

echo ""
echo "${BOLDGREEN}All done!${TXTRESET} Block created: ${BLOCK_SLUG}"
echo ""
echo "Front end: https://${PROJECT_NAME}.test"
echo "WP-admin:  https://${PROJECT_NAME}.test/wp/wp-login.php"
echo ""
echo "Block generated. Go to https://$PROJECT_NAME.test and start coding your block."
echo ""
echo "Thanks for using newblock start script ${SCRIPT_LABEL}, v${SCRIPT_VERSION}!"
echo ""
