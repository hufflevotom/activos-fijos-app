import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService extends ChangeNotifier {
  final String _baseUrl = 'http://192.168.1.100:8000/api/';

  Future<String?> login(String user, String password) async {
    final Map<String, dynamic> bodyData = {
      'usuario': user,
      'clave': md5.convert(utf8.encode(password)).toString()
    };
    final url = Uri.parse(_baseUrl + 'login');
    final resp = await http.post(
      url,
      body: json.encode(bodyData),
      headers: <String, String>{"Content-Type": "application/json"},
    );
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    // print(decodeResp);
    if (decodeResp['message'] == 'Usuario existe') {
      return null;
    } else {
      return decodeResp['message'];
    }
  }
}
