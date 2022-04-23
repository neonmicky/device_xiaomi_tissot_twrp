#!/bin/bash
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
repo sync --force-sync
git clone --depth=1 https://github.com/neonmicky/device_xiaomi_tissot_twrp device/xiaomi/tissot/ -b 9.0
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
lunch omni_tissot-userdebug
mka recoveryimage
  ZIP=$(ls out/target/product/tissot/*.zip)
curl https://bashupload.com/$ZIP --data-binary @$ZIP
