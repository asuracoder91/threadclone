import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread/repos/articles_repo.dart';

import '../../authentications/repos/authentication_repo.dart';
import '../../authentications/view_models/users_view_model.dart';
import '../model/image_model.dart';

class UploadImageViewModel extends AsyncNotifier<void> {
  late final ArticlesRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(articlesRepo);
  }

  Future<void> uploadImage(
      File image, String text, BuildContext context) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;
    if (userProfile == null) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final task = await _repository.uploadImage(
        image,
        user!.uid,
      );

      if (task.metadata != null) {
        await _repository.saveImage(ImageModel(
          avatar: "",
          name: "Anonymous",
          blueCheck: false,
          time: "1m",
          text: text,
          images: [await task.ref.getDownloadURL()],
          replies: 0,
          replyAvatars: [""],
          likes: 0,
          createdAt: DateTime.now().microsecondsSinceEpoch,
        ));
      }
    });

    context.pop();
  }
}

final uploadImageProvider = AsyncNotifierProvider<UploadImageViewModel, void>(
    () => UploadImageViewModel());
