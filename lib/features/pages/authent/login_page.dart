import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app/core/config/app_color.dart';
import 'package:test_app/di/dependency_injection.dart';
import 'package:test_app/features/pages/authent/cubit/auth_cubit.dart';
import 'package:test_app/routers/router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isRememberMe = false;

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthCubit authCubit = getIt.get();
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
                          obscureText: true,
                          textInputAction: TextInputAction.done,
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
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              activeColor: AppColors.red,
                              value: isRememberMe,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  setState(() {
                                    isRememberMe = value;
                                  });
                                }
                              },
                            ),
                            const Text('Ghi nhớ đăng nhập')
                          ],
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: () {
                            authCubit.login(
                                username: _usernameController.text.trim(),
                                pass: _passwordController.text.trim(),
                                context: context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Text(
                              'Đăng nhập',
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
                            const Text('Bạn chưa có tài khoản'),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routers.registerPage);
                                },
                                child: const Text('Đăng ký ngay')),
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
}
