import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../utils.dart';
import '../../main/view/list_page.dart';
import '../repos/authentication_repo.dart';
import 'users_view_model.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    final users = ref.read(usersProvider.notifier);

    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepo.emailSignUp(
        email,
        password,
      );

      await users.createProfile(userCredential);
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go("/");
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
