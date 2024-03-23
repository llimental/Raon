#!/bin/sh

#  ci_pre_xcodebuild.sh
#  Raon
#
#  Created by Lust3r on 3/22/24.
#

echo "Stage: PRE-Xcode Build Start"

cd ..

plutil -replace API_KEY -string $API_KEY ./Raon/RaonAPI.plist

plutil -p ./Raon/RaonAPI.plist

echo "Stage: PRE-Xcode Build End"

exit 0
