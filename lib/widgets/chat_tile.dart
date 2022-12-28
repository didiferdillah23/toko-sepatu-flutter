import 'package:flutter/material.dart';
import 'package:tokosepatu/models/message_model.dart';
import 'package:tokosepatu/models/product_model.dart';
import 'package:tokosepatu/screens/detail_chat_screen.dart';
import 'package:tokosepatu/theme.dart';

class ChatTile extends StatelessWidget {
  final MessageModel message;
  const ChatTile(this.message);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChatScreen(UninitializedProductModel()),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/splash_icon.png',
                  width: 54,
                  color: secondaryColor,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rubik Store',
                        style: primaryTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        message.message!,
                        style: secondaryTextStyle.copyWith(fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(fontSize: 10),
                ),
              ],
            ),
            SizedBox(height: 12),
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            ),
          ],
        ),
      ),
    );
  }
}
