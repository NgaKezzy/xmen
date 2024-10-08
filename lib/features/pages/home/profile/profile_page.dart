import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app/core/config/app_color.dart';
import 'package:test_app/di/dependency_injection.dart';
import 'package:test_app/features/pages/authent/cubit/auth_cubit.dart';
import 'package:test_app/routers/router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AuthCubit authCubit;
  @override
  void initState() {
    authCubit = getIt.get();

    _usernameController.text = authCubit.state.user?.userName ?? '';
    _nameController.text = authCubit.state.user?.name ?? '';
    _passwordController.text = authCubit.state.user?.password ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.clear();
    _nameController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  const Spacer(),
                  SingleChildScrollView(
                    child: Container(
                      height: size.height * 0.85,
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
                            obscureText: true,
                            controller: _passwordController,
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
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Text(
                                  'Cập nhật',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routers.splashPage);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: const Text(
                                    'Đăng xuất',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(30),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.05,
              left: size.width / 2 - 50,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/avatar.jpg'),
                        fit: BoxFit.cover),
                    border: Border.all(
                        color: Colors.green,
                        width: 4,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
