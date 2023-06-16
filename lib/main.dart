import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:material/helpers/loading.dart';
import 'package:material/screens/splash/splash.dart';

void main() async {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  update() {
    setState(() {});
  }

  @override
  void initState() {
    LoadingHelper.onChangeAbsorbClick = update;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: "Building Material",
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const SplashScreen(),
      },
    );
  }
}
