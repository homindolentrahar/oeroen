import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/common/constant/local_constants.dart';

class SecureStorageHelper {
  late FlutterSecureStorage _storage;

  static SecureStorageHelper get instance => SecureStorageHelper._internal();

  SecureStorageHelper._internal() {
    _storage = const FlutterSecureStorage();
  }

  Future<void> clearAllCredentials() async {
    await _storage.deleteAll();
  }

  Future<void> saveUserCredential(String? userId) async {
    await _storage.write(key: LocalConstants.userId, value: userId);
    Logger().w("Saving credential: $userId");
  }

  Future<String> getUserCredential() async {
    final credential = await _storage.read(key: LocalConstants.userId);
    Logger().w("Getting credential: $credential");
    return credential ?? "";
  }

  Future<void> clearUserCredential() async {
    await _storage.delete(key: LocalConstants.userId);
    Logger().w("Clearing credential");
  }

  Future<void> saveDesaCredential(Map<String, dynamic> json) async {
    await _storage.write(key: LocalConstants.desaData, value: jsonEncode(json));
    Logger().w("Saving desa: ${json['id']}");
  }

  Future<Map<String, dynamic>> getDesaCredential() async {
    final credential = await _storage.read(key: LocalConstants.desaData);
    final jsonData = jsonDecode(credential ?? "{}");
    Logger().w("Getting desa: $jsonData");
    return jsonData ?? {};
  }

  Future<void> clearDesaCredential() async {
    await _storage.delete(key: LocalConstants.desaData);
    Logger().w("Clearing desa");
  }
}
