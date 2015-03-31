#!/bin/bash
#===============================================================================
#          FILE: install-cronjob
#         USAGE: ./install-cronjob
#   DESCRIPTION: post install configure AsyncMediaServerProcessClientApp
#       OPTIONS: ---
#       LICENSE: AGPLv3+
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yossi Papiashvili <yossi.papiashvili@kaltura.com>
#  ORGANIZATION: Kaltura, inc.
#       CREATED: 30/03/15 19:11:34 EST
#      REVISION:  ---
#===============================================================================

PROPERTIES_FILE_PATH = $1;

. $PROPERTIES_FILE_PATH

flock -n $UPLOAD_XML_DIR/uploadCron.lockfile -c "php $ASYNC_CLIENT_APP_DIR/src/asyncMediaServerProcessScript.php \
    $ASYNC_CLIENT_APP_DIR/configurations/config.ini >> $ASYNC_CLIENT_APP_DIR/uploadLog.log"