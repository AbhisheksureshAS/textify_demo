import 'package:flutter/material.dart';
import 'package:textify_demo/pages/chatpage.dart';
import 'package:textify_demo/pages/userTile.dart';
import 'package:textify_demo/services/auth/AuthService.dart';
import 'package:textify_demo/component/my_drawer.dart';
import 'package:textify_demo/services/auth/chat/chat_services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatServices _chatService = ChatServices();
  final Authservice _authservice = Authservice();

  void logout() async {
    await _authservice.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "TEXTIFY",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,fontSize: 30,fontWeight: FontWeight.bold
          ),
        ),
        
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      drawer: MyDrawer(logout: logout),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading users"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading..."));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No users found"));
        }

        final users = snapshot.data!;

        return ListView(
          children: users.map((userData) {
            return _buildUserListItem(userData, context);
          }).toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if(userData["email"] !=_authservice.getCurrentUser()!.email){
      return UserTile(
      text: userData['email'],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverEmail: userData["email"],
              receiverID: userData["uid"],
            ),
          ),
        );
      },
    );
    }
    else{
      return Container();
    }
  }
}
