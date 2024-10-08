import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app/core/config/app_color.dart';
import 'package:test_app/core/models/user.dart';
import 'package:test_app/di/dependency_injection.dart';
import 'package:test_app/features/pages/authent/cubit/auth_cubit.dart';
import 'package:test_app/routers/router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordTwoController = TextEditingController();

  final AuthCubit authCubit = getIt.get();

  @override
  void dispose() {
    _nameController.clear();
    _usernameController.clear();
    _passwordController.clear();
    _passwordTwoController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                    child: const Center(
                        child: Image(
                      image: AssetImage('assets/images/logo-xmen.png'),
                      height: 100,
                    )),
                  ),
                  const Spacer(),
                  Container(
                    height: size.height * 0.75,
                    width: size.width,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                    ),
                    child: Column(
                      children: [
                        const Gap(20),
                        TextField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Họ và tên',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const Gap(30),
                        TextField(
                          controller: _usernameController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const Gap(30),
                        TextField(
                          controller: _passwordController,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Mật khẩu',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const Gap(30),
                        TextField(
                          controller: _passwordTwoController,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Mật khẩu',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const Gap(30),
                        GestureDetector(
                          onTap: () {
                            if (_passwordController.text.trim() !=
                                _passwordTwoController.text.trim()) {
                              _dialogBuilder(
                                  context: context,
                                  title: 'Mật khẩu không trùng khớp');
                            } else {
                              final User userRegister = User(
                                  userName: _usernameController.text.trim(),
                                  name: _nameController.text.trim(),
                                  password: _passwordController.text.trim());

                              authCubit.register(userRegister, context);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Text(
                              'Đăng ký',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Bạn đã có tài khoản'),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routers.loginPage);
                                },
                                child: const Text('Đăng nhập ngay')),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.1,
              child: Transform.rotate(
                angle: pi / -8,
                child: Image.asset(
                  'assets/images/7.png',
                  width: 130,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(
      {required BuildContext context,
      required String title,
      VoidCallback? callBack}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo'),
          content: Text(title),
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
