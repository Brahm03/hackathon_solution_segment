import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon/common/assets.dart';
import 'package:hackathon/common/utils/colors.dart';
import 'package:hackathon/common/utils/font_style.dart';
import 'package:hackathon/common/utils/navigator.dart';
import 'package:hackathon/common/utils/utilities.dart';
import 'package:hackathon/di/di/di_init.dart';
import 'package:hackathon/presentation/common/widgets/button.dart';
import 'package:hackathon/presentation/common/widgets/margin_text.dart';
import 'package:hackathon/presentation/common/widgets/text_input.dart';
import 'package:hackathon/presentation/screens/auth/bloc/auth/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        Utilities.unFocus();
      },
      child: BlocProvider(
        create: (_) => injector.get<LoginBloc>(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            // leading: GestureDetector(
            //   onTap: () {
            //     context.goBack();
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: SvgPicture.asset(
            //       Assets.backButtonSvg,
            //     ),
            //   ),
            // ),
          ),
          body: MultiBlocListener(
            listeners: [
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) async {
                  // if (state.loginStatus == LoginStatus.success) {
                  //   context.navigateTo(const MainScreen(), removeStack: true);
                  // }
                  // if (state.loginStatus == LoginStatus.fail) {
                  //   context.showSnackBar(state.loginMessage);
                  // }
                },
              ),
            ],
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final bloc = context.read<LoginBloc>();
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Authorization with password',
                              style: getTextStyle(
                                  weight: FontWeight.bold, size: 26),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4),
                            ),
                            Text(
                              'Input your login and password',
                              style: getTextStyle(
                                weight: FontWeight.w400,
                                size: 16,
                                color: AppColors.greyHint,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(24),
                            ),
                            TextInput(
                              controller: bloc.loginController,
                              prefixIcon: Assets.personSvg,
                              autofocus: true,
                              hint: 'Username',
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8),
                            ),
                            TextInput(
                              controller: bloc.passwordController,
                              passwordInput: true,
                              obscureText: true,
                              prefixIcon: Assets.lockSvg,
                              hint: 'Password',
                            ),
                            const Padding(
                              padding: EdgeInsets.all(24),
                            ),
                            Button(
                              loading: state.loginStatus == LoginStatus.loading,
                              title: 'Login',
                              onClick: () async {
                                bloc.add(Login());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
