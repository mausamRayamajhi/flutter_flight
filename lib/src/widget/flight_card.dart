import 'package:flutter/material.dart';
import '../utils/constant.dart';
import '../modal/flight_details.dart';
import 'flight_detail_chip.dart';

class FlightCard extends StatelessWidget {

  final FlightDetails flightDetails;
  FlightCard({this.flightDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(children: <Widget>[
        Wrap(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: flightBorderColor)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '${formatCurrency.format(flightDetails.newPrice)}',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        '(${formatCurrency.format(flightDetails.oldPrice)})',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      FlightDetailChip(
                          iconData: Icons.calendar_today, label: '${flightDetails.date}'),
                      FlightDetailChip(
                          iconData: Icons.flight_takeoff, label: '${flightDetails.airlines}'),
                      FlightDetailChip(iconData: Icons.star, label: '${flightDetails.rating}')
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
        Positioned(
          top: 10.0,
          right: 0.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
                color: discountBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Text('${flightDetails.discount}%',
                style: TextStyle(
                    color: appTheme.primaryColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ]),
    );
  }
}

