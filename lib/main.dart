import 'package:flutter/material.dart';
import 'package:login_task/controller/login_controller.dart';
import 'package:provider/provider.dart';

import 'view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: const LogInPage(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => FacebookSignInController(),
        //   child: const LogInFacePage(),
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KGE Social Login Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LogInPage(),
      ),
    );
  }
}
