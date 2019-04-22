import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/app.dart';
import 'src/utils/constant.dart';

Future<void> main() async {
 await FirebaseApp.configure(
      name: 'flight',
      options: FirebaseOptions(
        googleAppID: '1:282886740557:android:e42b572f4abafea7',
        apiKey: 'AIzaSyCJz1DazOJSQ3GBO-6_CYPe48yq154E7qU',
        databaseURL: 'https://flight-86787.firebaseio.com/',
      ));
  runApp(MaterialApp(
    title: 'Flight List Mock Up',
    home: HomeScreen(),
    theme: appTheme,
  ));
}
