import 'package:flutter/material.dart';

import 'widget/custome_appbar.dart';
import 'widget/homeScreenTopPart.dart';
import 'widget/homeScreenBottomPart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeScreenTopPart(),
            homeScreenBottomPart,
          ],
        ),
      ),
    );
  }
}
