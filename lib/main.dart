import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:report_system_admin/firebase_options.dart';
import 'package:report_system_admin/src/controllers/central_state.dart';
import 'package:report_system_admin/src/providers/all_provider.dart';
import 'package:report_system_admin/src/routes.dart';
import 'package:report_system_admin/src/views/desktop_view/home_page.dart';
import 'package:report_system_admin/src/views/desktop_view/login_screen.dart';

void main()async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final CentralState centralState =CentralState();

final botToastBuilder = BotToastInit();



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          navigatorKey: navigatorKey,
          navigatorObservers: [BotToastNavigatorObserver()],
          builder: BotToastInit(),
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,

        ),
        routes: routes,
        home:  NavigatorApp()

        //DesktopHomePage(),
      ),
    );
  }
}


class NavigatorApp extends ConsumerWidget {
  const NavigatorApp({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final centralProvider= ref.watch(centralStateController);
    if(centralProvider.isUserPresent){
      return DesktopHomePage();
    }
    return LoginScreen();
  }
}