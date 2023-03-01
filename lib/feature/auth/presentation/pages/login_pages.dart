import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/feature/auth/auth.dart';

import 'package:mfecinternship/feature/auth/presentation/widget/widget_textformfield.dart';
import 'package:mfecinternship/utils/theme.dart';

import '../../../../common/config/app_route.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backGroundLogin(),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                logoApp(),
                const SizedBox(height: 25),
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
      ),
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
          try {
            String? email, password;
            email = emailController.text;
            password = passwordController.text;
            await Firebase.initializeApp();
            await Auth()
                .login(
                    email: emailController.text,
                    password: passwordController.text)
                .then((value) =>
                    Navigator.pushNamed(context, AppRoute.homeRoute));
            print("email ==${email},password ==${password}");
            print("Login Success");
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
            }
          }
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
        widthFactor: 0.6,
        // ความกว้างของโลโก้เท่ากับ 80% ของ `Container`
        child: Image.asset('asset/images/login/logo.png'),
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
}
