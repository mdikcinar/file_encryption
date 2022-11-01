import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:file_encryption/file_encryption.dart' as file_encryption;

const inputFolderPath = 'input';
const outputFolderPath = 'output';
const secureKey = 'yA7exe4ZFq5g2St1VDDexMJ5yr+8w+0RWivkfIrUVmc=';

void main(List<String> arguments) async {
  final key = Key.fromBase64(secureKey);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));
  //Read files inside input folder and encrypt each of it
  final directory = Directory(inputFolderPath);
  List<FileSystemEntity> fileSystemEntities = directory.listSync();
  for (final fileSystemEntity in fileSystemEntities) {
    File file = File(fileSystemEntity.path);
    file_encryption.encrypt(
      encrypter: encrypter,
      iv: iv,
      file: file,
      outputFolderPath: outputFolderPath,
    );
  }
}
