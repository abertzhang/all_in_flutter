#读取照片权限和xml设置
    <!--允许程序打开网络套接字-->
    <uses-permission android:name="android.permission.INTERNET" />
    <!--允许程序设置内置sd卡的写权限-->
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <!--粗略定位-->
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <!--精确定位-->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <!--申请调用A-GPS模块-->
    <uses-permission android:name="android.permission.ACCESS_LOCATION_EXTRA_COMMANDS" />
    <!--允许程序获取网络状态-->
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <!--允许程序访问WiFi网络信息-->
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <!--用于获取wifi的获取权限，wifi信息会用来进行网络定位-->
    <uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />
    <!--允许程序读写手机状态和身份-->
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <!--允许程序访问CellID或WiFi热点来获取粗略的位置-->
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

    <!--允许程序获取已安装应用的包名,插件device_apps需要-->
    <uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" />
    <uses-permission android:name="android.permission.VIBRATE"/>

    <!--相机相关权限-->
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.FLASHLIGHT"/>
    <uses-feature android:name="android.hardware.camera" />
    <uses-feature android:name="android.hardware.camera.front" />
    <uses-feature android:name="android.hardware.camera2" android:required="false" />
    <uses-feature android:name="android.hardware.camera.autofocus" android:required="false"/>
    <uses-feature android:name="android.hardware.camera.flash" android:required="false" />

#安卓12以上有分区存储
<application
    android:requestLegacyExternalStorage="true"
    ...>
