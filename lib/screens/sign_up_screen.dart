import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/providers/auth_provider.dart';
import 'package:tokosepatu/theme.dart';
import 'package:tokosepatu/widgets/loading_button.dart';

class SignUpScreen extends StatefulWidget {
  static TextEditingController nameController = TextEditingController(text: '');
  static TextEditingController usernameController =
      TextEditingController(text: '');
  static TextEditingController emailController =
      TextEditingController(text: '');
  static TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider? authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
            name: SignUpScreen.nameController.text,
            username: SignUpScreen.usernameController.text,
            email: SignUpScreen.emailController.text,
            password: SignUpScreen.passwordController.text,
          ) ==
          true) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Register!',
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
              'Sign Up Rubik Store',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Register and Happy Shopping',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name",
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
                      'assets/name_icon.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: SignUpScreen.nameController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Full Name",
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

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
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
                        controller: SignUpScreen.emailController,
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

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
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
                      'assets/username_icon.png',
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: SignUpScreen.usernameController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Username",
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
                        controller: SignUpScreen.passwordController,
                        style: primaryTextStyle,
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

    Widget signupButton() {
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
          onPressed: handleSignUp,
          child: Text(
            'Sign Up',
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
            "Already have an account? ",
            style: subtitleTextStyle.copyWith(fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text(
              "Sign In",
              style: purpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              nameInput(),
              emailInput(),
              usernameInput(),
              passwordInput(),
              (isLoading) ? LoadingButton() : signupButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
