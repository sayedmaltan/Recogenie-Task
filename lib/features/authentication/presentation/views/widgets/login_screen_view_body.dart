import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reco_genie/core/widgets/custom_loading_button.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/asstes.dart';
import '../../../../../core/utils/functions/custom_awesome_dialog.dart';
import '../../../../../core/utils/functions/email_check.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_full_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../data/repos/auth_service_impl.dart';
import '../../manger/login_cubit/login_cubit.dart';
import '../../manger/login_cubit/login_state.dart';
import 'custom_field_column.dart';
import 'custom_password_row.dart';

class LoginScreenViewBody extends StatefulWidget {
  const LoginScreenViewBody({super.key});

  @override
  State<LoginScreenViewBody> createState() => _LoginScreenViewBodyState();
}

class _LoginScreenViewBodyState extends State<LoginScreenViewBody> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordShown = false;
  IconData suffixIcon = Icons.remove_red_eye_sharp;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthServiceImpl()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            debugPrint(state.errMessage);
            customAwesomeDialog(context, message: state.errMessage);
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsImages.loginScreen),
                    Text(
                      'Login',
                      style: GoogleFonts.acme(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomFieldColumn(
                      controller: emailController,
                      hintText: 'hello@example.com',
                      aboveHintText: 'Email Address',
                      validator: (value) {
                        if (!isValidEmail(value)) {
                          return validateEmail(value);
                        }
                        return null;
                      },
                    ),
                    CustomPasswordRow(isRegister: false),
                    SizedBox(height: 5),
                    CustomTextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'password',
                      isPasswordShown: isPasswordShown,
                      isPassword: true,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Password can't be empty";
                        }
                        return null;
                      },
                      suffixIcon: suffixIcon,
                      suffixIconResponse: () {
                        isPasswordShown
                            ? suffixIcon = Icons.remove_red_eye_sharp
                            : suffixIcon = Icons.visibility_off_sharp;
                        isPasswordShown = !isPasswordShown;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20),
                    state is LoginLoading
                        ? CustomLoadingButton()
                        : CustomFullButton(
                            text: 'Login',
                            height: 50,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginCubit.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          ),
                    SizedBox(height: 10),
                    // CustomDividerWithText(text: 'or sign in with'),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // CustomSignWithGoogle(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            context.pushReplacement(AppRouter.registerScreen);
                          },
                          child: Text('sign up', style: Styles.textStyle15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
