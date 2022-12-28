import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/models/user_model.dart';
import 'package:tokosepatu/providers/auth_provider.dart';
import 'package:tokosepatu/theme.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    AppBar header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.check, color: primaryColor),
          ),
        ],
      );
    }

    Widget nameInnput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: user.name!,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInnput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '@${user.username}',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInnput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: user.email!,
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(user.profilePhotoUrl!),
                ),
              ),
            ),
            nameInnput(),
            usernameInnput(),
            emailInnput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
