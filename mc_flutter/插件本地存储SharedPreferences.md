### 应用场景

### 依赖导包

```
shared_preferences: ^0.5.6+1
import 'package:shared_preferences/shared_preferences.dart';
```

### 保存到本地

```
Future setBool(String key, bool value)
Future setInt(String key, int value)
Future setDouble(String key, double value)
Future setString(String key, String value)
Future setStringList(String key, List value)
```

### 获取从本地

```
bool getBool(String key)
int getInt(String key)
double getDouble(String key)
String getString(String key)
List getStringList(String key)
```

### 其他方法

移除 Future remove(String key)

移除所有 Future clear()

获取所有key,  Set getKeys()

是否包含此key,  bool containsKey(String key)

### 简例01

```
void saveData({String name,int age,bool sex}) async {     
    SharedPreferences prefs = 
        await SharedPreferences.getInstance();
     prefs.setString("name", name);
     prefs.setInt("age", age);
     prefs.setBool("sex", sex);
}
```

```
void getDataFromPrefs() async {
    SharedPreferences prefs = 
        await SharedPreferences.getInstance();   
      this.name = prefs.getString("name");    //类成员,尽量不要这种方式,耦合高
      this.age = prefs.getInt("age");		  //可以返回获取值,降低耦合
      this.sex = prefs.getBool("sex");
}  
```
