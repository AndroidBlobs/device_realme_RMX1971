#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:58c667b235d4658f3806fae0d91b1353dc0a1e8f; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:ef03d8d390b74bb3bdce5082fbe366e19e47da0f \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:58c667b235d4658f3806fae0d91b1353dc0a1e8f && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
