import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../modal/city.dart';
import 'city_card.dart';
import '../utils/constant.dart';


class HomeScreenBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homeScreenBottomPart;
  }
}


var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Currently Watched Items",
            style: dropDownMenuStyle,
          ),
          Spacer(),
          Text(
            "VIEW ALL(12)",
            style: viewAllStyle,
          )
        ],
      ),
    ),
    Container(
      //color: Colors.red,
      height: 230,
      child: StreamBuilder(
        stream: Firestore.instance.collection('cities').snapshots(),
        builder: (BuildContext context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _buildCitiesList(context, snapshot.data.documents);
        },
      ),
    ),
  ],
);

Widget _buildCitiesList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView.builder(
    itemCount: snapshot.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext cotext, index) {
      return CityCard(
        city: City.fromSnapshot(snapshot[index]),
      );
    },
  );
}

