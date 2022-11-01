import 'dart:io';
import 'dart:typed_data';
import 'dart:convert' as convert;

import 'package:encrypt/encrypt.dart';

Future<void> encrypt({
  required Encrypter encrypter,
  required IV iv,
  required File file,
  required String outputFolderPath,
}) async {
  Uint8List fileBytes = await file.readAsBytes();
  final decodedBytes = convert.latin1.decode(fileBytes);
  final encrypted = encrypter.encrypt(decodedBytes, iv: iv);
  final base64Decoded = convert.base64.decode(encrypted.base64);
  await File('$outputFolderPath/${file.path.split('/').last}').writeAsBytes(base64Decoded);
  print('${file.path.toString()} encrypted');
}
