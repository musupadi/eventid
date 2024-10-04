import 'package:eventid/Model/Ascendant.dart';
import 'package:eventid/UI/Home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

// import 'package:permission_handler/permission_handler.dart';

import 'Constant/Colors.dart';
import 'Constant/InfiniteListPage.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [PrimaryColors(), Colors.red, Colors.green, Colors.blue, Colors.pink];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        changePage(tabController.index);
      }
    });
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5 ? Colors.black : Colors.white;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // LogoutMessage("Logout", "Are You Sure you want to logout ?", context);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BottomBar(
            child: TabBar(
              indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
              controller: tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: currentPage == 0
                      ? colors[0]
                      : currentPage == 1
                      ? colors[1]
                      : currentPage == 2
                      ? colors[2]
                      : unselectedColor,
                  width: 3,
                ),
                insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
              ),
              tabs: [
                _buildTabIcon(Icons.home, 0),
                _buildTabIcon(Icons.search, 1),
                _buildTabIcon(Icons.person, 4),
              ],
            ),
            fit: StackFit.expand,
            icon: (width, height) => Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: unselectedColor,
                  size: width,
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(500),
            duration: Duration(seconds: 1),
            curve: Curves.decelerate,
            showIcon: true,
            width: MediaQuery.of(context).size.width * 0.8,
            barColor: colors[currentPage].computeLuminance() > 0.5 ? Colors.black : Colors.white,
            start: 2,
            end: 0,
            offset: 10,
            barAlignment: Alignment.bottomCenter,
            iconHeight: 35,
            iconWidth: 35,
            reverse: false,
            hideOnScroll: true,
            scrollOpposite: false,
            onBottomBarHidden: () {},
            onBottomBarShown: () {},
            body: (context, controller) => _buildTabBarView(controller),
          ),
        ),
      ),
    );
  }

  Widget _buildTabIcon(IconData icon, int index) {
    return SizedBox(
      height: 55,
      width: 40,
      child: Center(
        child: Icon(
          icon,
          color: currentPage == index ? colors[index] : colors[currentPage].computeLuminance() < 0.5 ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  Widget _buildTabBarView(dynamic controller) {
    return TabBarView(
      controller: tabController,
      physics: NeverScrollableScrollPhysics(), // Disable swipe gestures
      children: [
        Home(controller: controller), // Pass the controller to Home
        LoadingContainer(600, 600,"Search Under Development"),
        LoadingContainer(600, 600,"Profile Under Development"),
        Text("Favorite"),
        Text("Setting"),
      ],
    );
  }
}
