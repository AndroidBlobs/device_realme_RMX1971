#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:4a2d33157bb7893a612a819143b7a85ff2488332; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:d834235ac7feb7ebd12312dce77979e6bcd4fd6d \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:4a2d33157bb7893a612a819143b7a85ff2488332 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
