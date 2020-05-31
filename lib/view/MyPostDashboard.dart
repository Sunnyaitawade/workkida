import 'package:flutter/material.dart';
import 'package:workkida/model/constants/UiConstants.dart';
import 'package:workkida/view/CategoryDashboard.dart';
class MyPostScreen extends StatefulWidget {
  @override
  _MyPostScreenState createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: bodyTabs(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CategoryDashScreen())),
        child: Icon(Icons.add),
        backgroundColor:  Colors.purple,
      ),
    );
  }

  Widget bodyTabs() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.assignment)),
              Tab(icon: Icon(Icons.favorite)),

            ],
          ),
          title: Text(UIData.myPostHome),
        ),
        body: TabBarView(
          children: [
            //CategoryDashScreen(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}