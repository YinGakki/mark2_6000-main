VERSION=`cat module.prop | head -n 4 | tail -n 1 | sed 's/.\{12\}//'`
sed -i "3s/[0-9]\+/$VERSION/" ./module.prop

rm -f ./mark2_6000_v${VERSION}.zip
dtc -@ -I dts -O dtb -o ./dtbo/origin_pdx203.dtbo ./dts/origin_pdx203.dts &> /dev/null
dtc -@ -I dts -O dtb -o ./dtbo/overlay_pdx203.dtbo ./dts/overlay_pdx203.dts &> /dev/null
zip -qr mark2_6000_v${VERSION}.zip ./ -i "bin/*" -i "dtbo/*.dtbo" -i "META-INF/*" -i "system/*" -i "customize.sh" -i "module.prop" -i "uninstall.sh"
