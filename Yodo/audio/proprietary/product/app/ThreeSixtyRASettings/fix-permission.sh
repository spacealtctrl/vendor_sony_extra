java -jar ../../../../../tools/ManifestEditor-2.0.jar ThreeSixtyRASettings.apk -o ThreeSixtyRASettings-new.apk -up android.permission.MODIFY_PHONE_STATE -up android.permission.WRITE_SECURE_SETTINGS -up android.permission.MODIFY_AUDIO_ROUTING
rm ThreeSixtyRASettings.apk
mv ThreeSixtyRASettings-new.apk ThreeSixtyRASettings.apk
