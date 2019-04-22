import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/constant.dart';
import 'flight_card.dart';
import '../modal/flight_details.dart';


class FlightListingBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Best Deals for Next 6 Months",
              style: dropDownMenuStyle,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          StreamBuilder(
            stream: Firestore.instance.collection('deals').snapshots(),
            builder: ( BuildContext context, snapshot) {
             
              return !snapshot.hasData
                  ? Center(child: CircularProgressIndicator(),)
                  : _buildDealslist(context, snapshot.data.documents);
            },
          )
        
        ],
      ),
    );
  }
}

Widget _buildDealslist(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView.builder(
   
    itemCount: snapshot.length,
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: ClampingScrollPhysics(),
     itemBuilder: (BuildContext context,index){
       return FlightCard(flightDetails: FlightDetails.fromSnapshot(snapshot[index]),);
     },
  );
}
