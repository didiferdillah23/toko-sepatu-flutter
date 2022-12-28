import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/models/message_model.dart';
import 'package:tokosepatu/models/product_model.dart';
import 'package:tokosepatu/providers/auth_provider.dart';
import 'package:tokosepatu/services/message_service.dart';
import 'package:tokosepatu/theme.dart';
import 'package:tokosepatu/widgets/chat_bubble.dart';

class DetailChatScreen extends StatefulWidget {
  ProductModel? product;
  DetailChatScreen(this.product);

  @override
  State<DetailChatScreen> createState() => _DetailChatScreenState();
}

class _DetailChatScreenState extends State<DetailChatScreen> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageService().addMessgae(
        user: authProvider.user,
        isFromUser: true,
        message: messageController.text,
        product: widget.product,
      );

      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: backgroundColor1,
          elevation: 0,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset('assets/splash_icon.png',
                  width: 50, color: secondaryColor),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rubik Store',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 26, 255, 38),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      Text(
                        'Online',
                        style: secondaryTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(widget.product!.galleries![0].url.toString(),
                  width: 54),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.product!.name}',
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  Text(
                    '\$${widget.product!.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Container(
                height: 23,
                width: 23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: primaryColor,
                ),
                child: Center(
                  child: Text(
                    'X',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        padding: MediaQuery.of(context).viewInsets,
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.product is UninitializedProductModel
                ? SizedBox()
                : productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type Message...',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/send_icon.png',
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                children: snapshot.data!
                    .map((MessageModel msg) => ChatBubble(
                          isSender: msg.isFromUser!,
                          text: msg.message!,
                          product: msg.product,
                        ))
                    .toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
