import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main/model/image_model.dart';

class ArticlesRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  UploadTask uploadImage(File image, String uid) {
    final fileRef = _storage.ref().child(
          "/images/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}",
        );
    return fileRef.putFile(image);
  }

  Future<void> saveImage(ImageModel data) async {
    await _db.collection("images").add(data.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchImages(
      {int? lastItemCreatedAt}) {
    final query = _db
        .collection("images")
        .orderBy("createdAt", descending: true)
        .limit(2);
    if (lastItemCreatedAt == null) {
      return query.get();
    } else {
      return query.startAfter([lastItemCreatedAt]).get();
    }
  }
}

final articlesRepo = Provider((ref) => ArticlesRepository());
