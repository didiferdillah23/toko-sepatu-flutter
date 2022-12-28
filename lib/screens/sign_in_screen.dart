import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/providers/auth_provider.dart';
import 'package:tokosepatu/theme.dart';
import 'package:tokosepatu/widgets/loading_button.dart';

class SignInScreen extends StatefulWidget {
  // const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoading = false;
  TextEditingController emailController =
      TextEditingController(text: 'updated@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'password');
  @override
  Widget build(BuildContext context) {
    AuthProvider? authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
            email: emailController.text,
            password: passwordController.text,
          ) ==
          true) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Login!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login Rubik Store',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Sign In to Continue',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/email_icon.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Email Address",
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/password_icon.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Password",
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signinButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: handleSignIn,
          child: Text(
            'Sign In',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Don\`t have an account? ",
            style: subtitleTextStyle.copyWith(fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              "Sign Up",
              style: purpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              (isLoading) ? LoadingButton() : signinButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
