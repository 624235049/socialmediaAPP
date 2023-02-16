import 'package:flutter/material.dart';
import 'package:mfecinternship/feature/auth/presentation/widget/custom_textformfield.dart';
import 'package:mfecinternship/utils/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      child: ElevatedButton(
        onPressed: () {
          // Perform registration action here
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
                color: AppTheme.buttonBackgroundColor, width: 2),
          ),
          minimumSize: const Size(180, 45),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'ลงทะเบียน',
              style: AppTheme.h5Style,
            ),
          ),
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
          child: const Text(
            "ยังไม่ได้เข้าสู่ระบบใช่ไหม?",
            style: TextStyle(color: Colors.white),
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
        onPressed: () {
          // Perform login action here
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
              'เข้าสู่ระบบ',
              style: AppTheme.h5Style,
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return CustomTextFormField(
      labelText: "Password",
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget emailForm() {
    return CustomTextFormField(
      labelText: "Email",
      keyboardType: TextInputType.emailAddress,
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
