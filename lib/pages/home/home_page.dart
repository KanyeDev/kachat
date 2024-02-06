import 'package:flutter/material.dart';
import 'package:kachat/services/chat/chat_service.dart';
import 'package:kachat/widgets/my_drawer.dart';
import 'package:kachat/widgets/userTile.dart';

import '../../services/auth/auth_services.dart';
import '../auth/login.dart';
import '../chat/chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      drawer: const MyDrawer(),
      body: StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return const Text("Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //return all user expect the current user
   if(userData["email"] != _authServices.getCurrentUser()!.email){
     return UserTile(
         text: userData["username"],
         onTap: () {
           Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) => ChatPage(
                     receiverEmail: userData["username"], receiverID: userData["uid"],
                   )));
         });
   }
   return const SizedBox();
  }
}
