import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:no_smoking_app/utils/random_string_utils.dart';

class StorageRepository {
  Future<String?> saveImage(String path) async {
    File file = File(path);

    try {
      var imageName = RandomStringUtils.getRandomString(16);
      await firebase_storage.FirebaseStorage.instance
          .ref('images/$imageName')
          .putFile(file);
      return await getImageUrl(imageName);
    } on firebase_core.FirebaseException catch (e) {
      debugPrint('Error: StorageRepository.saveImage: ');
      debugPrint(e.toString());
      return null;
    }
  }

  Future<String> getImageUrl(String imageName) async {
    return await firebase_storage.FirebaseStorage.instance
        .ref('images/$imageName')
        .getDownloadURL();
  }
}