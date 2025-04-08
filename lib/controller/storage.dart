import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class localstorage {
final  secureStorage = new  FlutterSecureStorage();

  setdata(String key, String val) async {
    return await secureStorage.write(key: key, value: val);
  }

  getdata(String key) async {
    return await secureStorage.read(key: key);
  }
}
