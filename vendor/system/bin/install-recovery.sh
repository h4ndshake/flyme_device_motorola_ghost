#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8159232 74ed232cf3d3b8d61225829b4f64bb5f81d9706e 5625856 1a8b83b5f7c0d7f5fbe6708d7ea33a2b0550c7b4
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8159232:74ed232cf3d3b8d61225829b4f64bb5f81d9706e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:5625856:1a8b83b5f7c0d7f5fbe6708d7ea33a2b0550c7b4 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 74ed232cf3d3b8d61225829b4f64bb5f81d9706e 8159232 1a8b83b5f7c0d7f5fbe6708d7ea33a2b0550c7b4:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
