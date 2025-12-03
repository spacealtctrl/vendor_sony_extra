java -jar ../../../../../tools/ManifestEditor-2.0.jar daxService.apk -o daxService-new.apk -up android.permission.BLUETOOTH_CONNECT
rm daxService.apk
mv daxService-new.apk daxService.apk