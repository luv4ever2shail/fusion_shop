import 'package:fusion_shop/src/pages/HomeScreen.dart';
import 'package:fusion_shop/src/pages/shopping_cart_page.dart';
import 'package:fusion_shop/src/themes/light_color.dart';
import 'package:fusion_shop/src/themes/theme.dart';
import 'package:fusion_shop/src/widgets/customtitle.dart';
import 'package:flutter/material.dart';
import '../../pages/profile.dart';

class BottomTabScreen extends StatefulWidget {
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Widget indexView;
  BottomBarType bottomBarType = BottomBarType.Explore;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    indexView = HomeScreen(
      animationController: animationController,
    );
    animationController..forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: getAppBarUI(context),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: const Text('Shail Patel'),
            accountEmail: const Text('shail@gmail.com'),
            currentAccountPicture: const CircleAvatar(
                backgroundImage: const AssetImage('assets/user.png')),
            onDetailsPressed: () {},
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('assets/user.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.person),
            title: new Text('Shail Patel'),
            onTap: () {},
          ),
          new Divider(),
          new ListTile(
            leading: const Icon(Icons.account_circle),
            title: new Text('About'),
            onTap: () {},
          ),
          new ListTile(
            leading: const Icon(Icons.settings_power),
            title: new Text('exit'),
            onTap: () {},
          ),
        ],
      )),
      backgroundColor: AppTheme.getTheme().backgroundColor,
      bottomNavigationBar: Container(
          height: 59 + MediaQuery.of(context).padding.bottom,
          child: getBottomBarUI(bottomBarType)),
      body: indexView,
    );
  }

  Widget getAppBarUI(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.getTheme().backgroundColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 8.0),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      //Scaffold.of(context).openEndDrawer();
                      _drawerKey.currentState.openDrawer();
                      // _scaffoldKey.currentState.openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RotatedBox(
                        quarterTurns: 4,
                        child: _icon(Icons.sort, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: CustomTitleText(
                    text: 'Fusion Shop',
                    fontSize: 27,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.getTheme().primaryColor,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color(0xfff8f8f8),
                            blurRadius: 10,
                            spreadRadius: 10),
                      ],
                    ),
                    child: Image.asset(
                      "assets/user.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _icon(IconData icon, {Color color = AppColors.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: AppTheme.getTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  void tabClick(BottomBarType tabType) {
    if (tabType != bottomBarType) {
      bottomBarType = tabType;
      animationController.reverse().then((f) {
        if (tabType == BottomBarType.Explore) {
          setState(() {
            indexView = HomeScreen(
              animationController: animationController,
            );
          });
        } else if (tabType == BottomBarType.Cart) {
          setState(() {
            indexView = ShoppingCartPage();
          });
        } else if (tabType == BottomBarType.Profile) {
          setState(() {
            indexView = ProfilePage();
          });
        }
      });
    }
  }

  Widget getBottomBarUI(BottomBarType tabType) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.getTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor:
                        AppTheme.getTheme().backgroundColor.withOpacity(0.2),
                    onTap: () {
                      tabClick(BottomBarType.Explore);
                    },
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 40,
                          height: 32,
                          child: Icon(
                            Icons.search,
                            size: 26,
                            color: tabType == BottomBarType.Explore
                                ? AppTheme.getTheme().primaryColor
                                : AppTheme.getTheme().disabledColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Explore",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: tabType == BottomBarType.Explore
                                    ? AppTheme.getTheme().primaryColor
                                    : AppTheme.getTheme().disabledColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor:
                        AppTheme.getTheme().primaryColor.withOpacity(0.2),
                    onTap: () {
                      tabClick(BottomBarType.Cart);
                    },
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 40,
                          height: 32,
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: tabType == BottomBarType.Cart
                                ? AppTheme.getTheme().primaryColor
                                : AppTheme.getTheme().disabledColor,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            "My Cart",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: tabType == BottomBarType.Cart
                                    ? AppTheme.getTheme().primaryColor
                                    : AppTheme.getTheme().disabledColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor:
                        AppTheme.getTheme().primaryColor.withOpacity(0.2),
                    onTap: () {
                      tabClick(BottomBarType.Profile);
                    },
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 40,
                          height: 32,
                          child: Icon(
                            Icons.person,
                            color: tabType == BottomBarType.Profile
                                ? AppTheme.getTheme().primaryColor
                                : AppTheme.getTheme().disabledColor,
                            size: 22,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: tabType == BottomBarType.Profile
                                    ? AppTheme.getTheme().primaryColor
                                    : AppTheme.getTheme().disabledColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}

enum BottomBarType { Explore, Cart, Profile }
