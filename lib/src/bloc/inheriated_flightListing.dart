import 'package:flutter/material.dart';

class InheriatedFlightListing extends InheritedWidget {
  final String fromLocation, toLocation;

  InheriatedFlightListing(
      {Key key, Widget child, this.fromLocation, this.toLocation})
      : super(key: key, child: child);

  static InheriatedFlightListing of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheriatedFlightListing)
        as InheriatedFlightListing);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
