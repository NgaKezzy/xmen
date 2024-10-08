import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/models/user.dart';
import 'package:test_app/features/pages/authent/cubit/auth_state.dart';
import 'package:test_app/routers/router.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void register(User user, BuildContext context) {
    if (state.listUsers.isEmpty) {
      _dialogBuilder(
        context: context,
        content: 'Đăng ký thành công',
        callBack: () {
          Navigator.pushNamed(context, Routers.loginPage);
        },
      );
      emit(state.copyWith(listUsers: [user]));
    } else {
      for (var element in state.listUsers) {
        if (element.userName == user.userName) {
          _dialogBuilder(context: context, content: 'Tài khoản đã tồn tại !');
          return;
        }
      }
      _dialogBuilder(
        context: context,
        content: 'Đăng ký thành công',
        callBack: () {
          Navigator.pushNamed(context, Routers.loginPage);
        },
      );
      emit(state.copyWith(listUsers: [...state.listUsers, user]));
    }
  }

  void login(
      {required String username,
      required String pass,
      required BuildContext context}) {
    for (var element in state.listUsers) {
      if (element.userName == username && element.password == pass) {
        emit(state.copyWith(user: element));
        Navigator.pushNamed(context, Routers.homePage);
        return;
      }
    }
    _dialogBuilder(
        context: context, content: 'Tài khoản hoặc mật khẩu không chính xác !');
  }

  Future<void> _dialogBuilder(
      {required BuildContext context,
      required String content,
      VoidCallback? callBack}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo'),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Đồng ý'),
              onPressed: () {
                Navigator.of(context).pop();
                callBack?.call();
              },
            ),
          ],
        );
      },
    );
  }
}
