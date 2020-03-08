#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:8c42a5002af3bac6b2cb4e4e907c793d9f564990; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:625c1e4127582b91768959f10e8e8af8bb218d2f \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:8c42a5002af3bac6b2cb4e4e907c793d9f564990 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
