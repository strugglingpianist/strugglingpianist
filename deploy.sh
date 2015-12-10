#!/bin/sh
set -e

# non-committable details in a separate .gitignored file
source secrets.sh
# local deployment directory
LOCALDIR=strugglingpianist.com

# generate
hugo -d $LOCALDIR

# deploy to remote host
rsync -avz -e "ssh -p $REMOTEPORT" $LOCALDIR $REMOTEUSER@$REMOTEHOST:$REMOTEDIR
