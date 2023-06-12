import 'package:facebook_clone/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/feed_screen.dart';
import '../screens/settings_screen.dart';
import '../widgets/mobile_layout_appbar_icon.dart';

class MobileScreen extends StatefulWidget {
  final snapshot;
  const MobileScreen({
    super.key,
    required this.snapshot,
  });

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  bool isOnline = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: SvgPicture.asset(
            "assets/logos/facebook.svg",
            color: mainColor,
            width: 150,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  CustomAppbarIconButton(
                    icon: "assets/Icons/search.svg",
                    function: () {},
                  ),
                  const SizedBox(width: 10),
                  CustomAppbarIconButton(
                    icon: "assets/Icons/messeger.svg",
                    function: () {},
                  ),
                ],
              ),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home, color: mainColor)),
              Tab(icon: Icon(Icons.cast_rounded, color: mainColor)),
              Tab(icon: Icon(Icons.notifications, color: mainColor)),
              Tab(icon: Icon(Icons.settings, color: mainColor)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FeedScreen(snapshot: widget.snapshot),
            const Icon(Icons.cast),
            const Icon(Icons.notifications),
            const SettingScreen(),
          ],
        ),
      ),
    );
  }
}
