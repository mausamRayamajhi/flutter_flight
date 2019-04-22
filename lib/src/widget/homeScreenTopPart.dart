import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'custome_shape_clipper.dart';
import '../bloc/inheriated_flightListing.dart';
import '../pages/flight_listing.dart';
import '../modal/location.dart';
import 'choice_chips.dart';
import '../utils/constant.dart';


final _searchFieldController = TextEditingController();
List<String> locations = List();

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;
  var isFlightSelected = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            height: 400.0,
            child: Column(
              children: <Widget>[
             sizeBoxHeight(50.0),
                StreamBuilder(
                  stream:
                      Firestore.instance.collection('locations').snapshots(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      addLocation(context, snapshot.data.documents);
                    }
                    return !snapshot.hasData
                        ? Container()
                        : buildTopSection();
                  },
                ),
                sizeBoxHeight(50.0),
                Text(
                  'Where would\nyou want to go?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                sizeBoxHeight(30.0),
                buildSearchInput(context),
                sizeBoxHeight(20.0),
                buildFlightHotelSelection(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Padding buildTopSection() {
    return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              PopupMenuButton(
                                onSelected: (index) {
                                  debugPrint(index.toString());
                                  setState(() {
                                    selectedLocationIndex = index;
                                  });
                                },
                                itemBuilder: (BuildContext context) =>_buildPopupMenuItem(),
                                child: Row(
                                  children: <Widget>[
                                    Text(locations[selectedLocationIndex],
                                        style: dropDownLabelStyle),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.settings,
                                color: Colors.white,
                              )
                            ],
                          ),
                        );
  }

  Row buildFlightHotelSelection() {
    return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlightSelected = true;
                      });
                    },
                    child: CustomChoiceChip(
                      icon: Icons.flight_takeoff,
                      text: "Flight",
                      isSelected: isFlightSelected,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlightSelected = false;
                      });
                    },
                    child: CustomChoiceChip(
                        icon: Icons.hotel,
                        text: "Hotels",
                        isSelected: !isFlightSelected),
                  )
                ],
              );
  }

  Padding buildSearchInput(BuildContext context) {
    return Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: TextField(
                    controller: _searchFieldController,
                    
                    style: dropDownMenuStyle,
                    cursorColor: appTheme.primaryColor,
                    decoration: InputDecoration(
                        hintText: "Kathmandu (KTM)",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 14.0),
                        suffixIcon: Material(
                          elevation: 2.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return InheriatedFlightListing(
                                  child: FlightListingScreen(),
                                  fromLocation:
                                      locations[selectedLocationIndex],
                                  toLocation: _searchFieldController.text,
                                );
                              }));
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                        )),
                  ),
                ),
              );
  }

  List<PopupMenuItem<int>> _buildPopupMenuItem() {
    List<PopupMenuItem<int>> popupMenuItems = List();
    for (int i = 0; i < locations.length; i++) {
      popupMenuItems.add(PopupMenuItem(
        value: i,
        child: Text(locations[i], style: dropDownMenuStyle),
      ));
    }
    return popupMenuItems;
  }

  void addLocation(BuildContext context, List<DocumentSnapshot> snapshot) {
    for (int i = 0; i < snapshot.length; i++) {
      final Location location = Location.fromSnapshot(snapshot[i]);
      locations.add(location.name);
    }
  }
}