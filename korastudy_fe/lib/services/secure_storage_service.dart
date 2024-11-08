import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = FlutterSecureStorage();

  Future<void> saveCredentials(String email, String pass) async {
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'password', value: pass);
  }

  Future<Map<String, String?>> getCredentials() async {
    String? email = await _storage.read(key: 'email');
    String? pass = await _storage.read(key: 'password');
    return {'email': email, 'password': pass};
  }

  Future<void> clearCredentials() async {
    await _storage.deleteAll();
  }
}
