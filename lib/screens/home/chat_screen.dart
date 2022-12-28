import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/models/message_model.dart';
import 'package:tokosepatu/providers/auth_provider.dart';
import 'package:tokosepatu/providers/page_provider.dart';
import 'package:tokosepatu/services/message_service.dart';
import 'package:tokosepatu/theme.dart';
import 'package:tokosepatu/widgets/chat_tile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget empty() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/headset_icon.png',
                width: 80,
              ),
              SizedBox(height: 20),
              Text(
                'No messages at this time',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "You've never ordered such an extraordinary item in Rubik Store.",
                  style: secondaryTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Rubik Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return empty();
              }
              return Expanded(
                child: Container(
                  color: backgroundColor3,
                  width: double.infinity,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    physics: BouncingScrollPhysics(),
                    children: [
                      ChatTile(snapshot.data![snapshot.data!.length - 1]),
                    ],
                  ),
                ),
              );
            } else {
              return empty();
            }
          });
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
