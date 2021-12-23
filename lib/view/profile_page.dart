import 'package:flutter/material.dart';
import 'package:login_task/controller/login_controller.dart';
import 'package:login_task/widget/drawer_widget.dart';
import 'package:provider/provider.dart';

class ProflePage extends StatelessWidget {
  const ProflePage(LoginController model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
      builder: (context, model, child) {
        return Scaffold(
          //drawerScrimColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text(
              'Profile Info',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          drawer: DrawerWidget(model),
          body: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage:
                        Image.network(model.userInfo!.photoUrl ?? "").image,
                    radius: 50.0,
                  ),
                ),
                Text(
                  model.userInfo!.displayName ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(model.userInfo!.email ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.grey.shade600,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
