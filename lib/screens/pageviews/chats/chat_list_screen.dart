import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:greenlight_messenger/models/contact.dart';
import 'package:greenlight_messenger/provider/user_provider.dart';
import 'package:greenlight_messenger/resources/chat_methods.dart';
import 'package:greenlight_messenger/screens/callscreens/pickup/pickup_layout.dart';
import 'package:greenlight_messenger/screens/pageviews/chats/widgets/contact_view.dart';
import 'package:greenlight_messenger/screens/pageviews/chats/widgets/quiet_box.dart';
import 'package:greenlight_messenger/screens/pageviews/chats/widgets/user_circle.dart';
import 'package:greenlight_messenger/widgets/greenlight_messenger_appbar.dart';

import 'widgets/new_chat_button.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color themeColor;
    Color revertThemeColor;
    var darkMode = MediaQuery.of(context).platformBrightness;
    darkMode == Brightness.dark
        ? themeColor = Color(0xff19191b)
        : themeColor = Colors.white;
    darkMode == Brightness.dark
        ? revertThemeColor = Colors.white
        : revertThemeColor = Color(0xff19191b);
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: themeColor,
        appBar: GreenLightAppBar(
          title: UserCircle(),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: revertThemeColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/search_screen");
              },
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: revertThemeColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
        floatingActionButton: NewChatButton(),
        body: ChatListContainer(),
      ),
    );
  }
}

class ChatListContainer extends StatelessWidget {
  final ChatMethods _chatMethods = ChatMethods();

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: _chatMethods.fetchContacts(
            userId: userProvider.getUser.uid,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var docList = snapshot.data.documents;

              if (docList.isEmpty) {
                return QuietBox(
                  heading: "This is where all the contacts are listed",
                  subtitle:
                      "Search for your friends and family to start calling or chatting with them",
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: docList.length,
                itemBuilder: (context, index) {
                  Contact contact = Contact.fromMap(docList[index].data);

                  return ContactView(contact);
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
