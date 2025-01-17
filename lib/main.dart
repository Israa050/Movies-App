// ignore_for_file: unrelated_type_equality_checks


import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_neon_design/core/configration/setup_hive.dart';
import 'package:movies_neon_design/core/routes/app_router.dart';
import 'package:movies_neon_design/features/trailer/presentation/widgets/web_view_player.dart';
import 'package:movies_neon_design/injection/injection.dart';

import 'core/routes/routes.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await setupHive();
  //  Hive.initFlutter();
  initGetIt();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  AppRouter appRouter = AppRouter();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      home: WebViewPlayerWidget(),
      //home: const MovieTrailersScreen(),
      //initialRoute: Routes.home,
     //onGenerateRoute: appRouter.generateRoute,
    );
  }
}

class TestWidget extends StatefulWidget {
  TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  String connection = 'non';
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
   checkInternetConnection();
}

@override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test Widget',
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Your connection status is $connection',
            ),
          ),
        ],
      ),
    );
  }
  
void checkInternetConnection(){
   _connectivitySubscription = Connectivity().onConnectivityChanged.listen((result){
    String status;
      if (result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi)) {
        print('Wifi, mobile');
        status = 'Internet Connected';
      } else if (result.contains(ConnectivityResult.none)) {
        print('no Internet');
        status = 'No Internet';
      } else {
        print('unknown');
        status = 'Unknown';
      }

    setState(() {
      connection = status;
    });

  });
}

}

