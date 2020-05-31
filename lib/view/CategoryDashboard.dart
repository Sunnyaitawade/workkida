import 'package:flutter/material.dart';
import 'package:workkida/common/widgets/category_grid.dart';
import 'package:workkida/model/constants/UiConstants.dart';
import 'package:google_fonts/google_fonts.dart';
class CategoryDashScreen extends StatelessWidget {
  final CategoryGridView mycatGridView = CategoryGridView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(UIData.categoryHome,style: GoogleFonts.lato(),),
      ),
      body: mycatGridView.build(),
    );
  }
}