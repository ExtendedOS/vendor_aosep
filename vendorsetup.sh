for device in $(python vendor/aosep/tools/get_official_devices.py)
do
for var in eng user userdebug; do
add_lunch_combo aosep_$device-$var
done
done
