import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread/repos/articles_repo.dart';

class ImagePostViewModel extends FamilyAsyncNotifier<void, String> {
  late final ArticlesRepository _repository;
  late final _imageId;

  @override
  FutureOr<void> build(String imageId) {
    _imageId = imageId;
    _repository = ref.read(articlesRepo);
  }
}

final imagePostProvider =
    AsyncNotifierProvider.family<ImagePostViewModel, void, String>(
  () => ImagePostViewModel(),
);
