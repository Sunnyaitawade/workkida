import 'package:flutter/material.dart';
import 'package:workkida/common/themes/light_color.dart';
import 'package:workkida/common/themes/text_styles.dart';
import 'package:workkida/common/themes/extention.dart';
import 'package:workkida/model/constants/UiConstants.dart';

import 'DashboardScreen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
     Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashboardPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(UIData.flashImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: .6,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [LightColor.purpleExtraLight, LightColor.purple],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                      stops: [.5, 6]),
                ),
              ),
            ),
          ),
         Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Image.asset(UIData.flashheartImage, color: Colors.white,height: 100,),
                Text(
                  "WorkKida",
                  style: TextStyles.h1Style.white,
                ),
                Text(
                  "All your needs at your doorstep..",
                  style: TextStyles.bodySm.bold,
                ),
                Expanded(
                  flex: 7,
                  child: SizedBox(),
                ),
              ],
            ).alignTopCenter,
        ],
      ),
    );
  }
}
