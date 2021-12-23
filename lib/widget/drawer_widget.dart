import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_task/controller/login_controller.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget(
    LoginController model, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
      builder: (context, model, child) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        Image.network(model.userInfo!.photoUrl ?? "").image,
                    radius: 50.0,
                  ),
                  Text(
                    model.userInfo!.displayName ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    model.userInfo!.email ?? "",
                    style: const TextStyle(
                      color: Colors.white,

                      //fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              trailing: const Icon(Icons.logout_outlined),
              iconColor: Colors.grey.shade600,
              title: Center(
                child: Text(
                  "Log out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              onTap: () {
                Provider.of<LoginController>(context, listen: false)
                    .googleLogOut();
              },
            ),
            ListTile(
              trailing: const Icon(Icons.closed_caption_off),
              iconColor: Colors.grey.shade600,
              title: Center(
                child: Text(
                  "Exit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
