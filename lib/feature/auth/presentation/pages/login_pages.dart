import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_builder/language_builder.dart';

import 'package:mfecinternship/feature/auth/cubit/credential/credential_auth_cubit.dart';
import 'package:mfecinternship/feature/auth/presentation/widget/widget_textformfield.dart';
import 'package:mfecinternship/utils/theme.dart';
import '../../../../common/config/app_route.dart';
import '../../../../common/function/common.dart';
import '../../cubit/auth/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialAuthCubit, CredentialAuthState>(
        listener: (context, credentialAuthState) {
          if (credentialAuthState is CredentialAuthSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialAuthState is CredentialAuthFailure) {
            snackBarNetwork(
                msg: "wrong email please check", scaffoldState: _scaffoldState);
          }
        },
        builder: (context, credentialAuthState) {
          if (credentialAuthState is CredentialAuthLoading) {
            return Scaffold(
              body: loadingIndicatorProgressBar(),
            );
          }
          return _bodyWidget();
        },
      ),
    );
  }

  Widget _bodyWidget() {
    return Stack(
      children: [
        backGroundLogin(),
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              logoApp(),
              emailForm(),
              const SizedBox(height: 25),
              passwordForm(),
              const SizedBox(height: 20),
              loginButton(),
              const SizedBox(height: 20),
              forgotPassword(),
              const SizedBox(height: 20),
              regisButton(),
            ],
          ),
        )
      ],
    );
  }

  Widget regisButton() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.registerRoute);
        },
        child: Center(
          child: Text(
            LanguageBuilder.texts!['login']['register_button'],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          primary: AppTheme.buttonBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          minimumSize: const Size(180, 45),
          side: const BorderSide(
              color: AppTheme.buttonBackgroundColor, width: 2.2),
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 40),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.buttonBackgroundColor,
                  width: 4,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            LanguageBuilder.texts!['login']['title_not_registered'],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 40),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.buttonBackgroundColor,
                  width: 4,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget loginButton() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: ElevatedButton(
        onPressed: () async {
          _submitLogin();
        },
        style: ElevatedButton.styleFrom(
          primary: AppTheme.buttonBackgroundColor,
          // Set button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Set rounded corners
          ),
          minimumSize: const Size(180, 45),
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                LanguageBuilder.texts!['login']['login_button'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }

  Widget passwordForm() {
    return CustomTextFormField(
      labelText: LanguageBuilder.texts!['login']['password_field'],
      keyboardType: TextInputType.visiblePassword,
      controller: passwordController,
    );
  }

  Widget emailForm() {
    return CustomTextFormField(
      labelText: LanguageBuilder.texts!['login']['email_field'],
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
    );
  }

  //logo App Widget
  Widget logoApp() {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        // ความกว้างของโลโก้เท่ากับ 80% ของ `Container`
        child: Image.asset('asset/images/login/logo_bg.png'),
      ),
    );
  }

  // backgroundLogin app Widget
  Widget backGroundLogin() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/images/login/bg_login.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _submitLogin() {
    if (emailController.text.isEmpty) {
      toast('enter your email');
      return;
    }
    if (passwordController.text.isEmpty) {
      toast('enter your password');
      return;
    }
    BlocProvider.of<CredentialAuthCubit>(context).loginSubmit(
      email: emailController.text,
      password: passwordController.text,
    );
  }
}
