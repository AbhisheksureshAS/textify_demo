import 'package:flutter/material.dart';
import 'package:textify_demo/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  void Function()? logout;
   MyDrawer({super.key,required this.logout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.message,color: Theme.of(context).colorScheme.primary,size: 40,),
              SizedBox(height: 20,),
              Text("T E X T I F Y")
            ],
          ))),
          Column(
            children: [
              Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text("H O M E"),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text("S E T T I N G"),
              leading: Icon(Icons.settings),
              onTap: (){
                 Navigator.pop(context);
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>Settings()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.login),
              onTap: logout,
            ),
          )
            ],
          )
        ],
      ),
    );
}
}