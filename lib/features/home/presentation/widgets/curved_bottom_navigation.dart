import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/network/networking.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/home_widget.dart';
import 'package:movies_neon_design/features/media_list.dart/presentation/screens/list.dart';
import 'package:movies_neon_design/features/search/presentation/screens/search_screen.dart';

class CustomCurvedBottomNavigation extends StatefulWidget {
  const CustomCurvedBottomNavigation({super.key});

  @override
  State<CustomCurvedBottomNavigation> createState() =>
      _CustomCurvedBottomNavigationState();
}

class _CustomCurvedBottomNavigationState
    extends State<CustomCurvedBottomNavigation> {
  int index = 0;

  bool? isConnected;

  List<Widget> screens = [
    const HomeWidget(),
    const ListWigets(),
     SearchScreen()
  ];

  List<Widget> items = [
    const Icon(Icons.home),
    const Icon(Icons.movie),
    const Icon(Icons.search),
    // const Icon(Icons.favorite),
    // const Icon(Icons.settings),
  ];

  @override
  void initState() {
    super.initState();
    isInternetConned();
    isConnected = NetworkInfo.checkInternetConnection();
    print('check connection $isConnected');
  }

  void isInternetConned ()async{
    isConnected = await NetworkInfo.isConnected();
    print('init state connection $isConnected');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.myBackgroundColor,
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            index: index,
            backgroundColor: Colors.transparent,
            color: AppColors.myCyan.withOpacity(0.5),
            items: items,
            onTap: (value) {
              print('Connection State Flutter test $isConnected');
              setState(() {
                index = value;
              });
            }),
      );
  }
}
