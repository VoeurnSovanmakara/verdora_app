import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const bodyPadding = EdgeInsets.all(16);
const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16);
const paddingVertical = EdgeInsets.symmetric(vertical: 16);
const double kPaddingBoxSize = 16;
const phnomPenhLat = '11.5564';
const phnomPenhLng = '104.9282';
const morePlusLat = 11.602240540336158;
const morePlusLng = 104.86173273577036;
const connectionIssue = 'connection_issue';

/// The standard body padding for the app.
const kBodyPadding = EdgeInsets.symmetric(horizontal: 20);
const kPadding = EdgeInsets.all(20);

/// The standard button padding for the app.
const kButtonPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 16);

/// The standard app bar button size.
const double kAppBarButtonSize = 56;

/// The standard date format for the app.
final DateFormat kDateFormatter = DateFormat('dd MMM yyyy');

final ShapeBorder kCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

final BorderRadius kBorderRadius = BorderRadius.circular(10);

/// The standard shadow for containers
const kCardShadow = [
  BoxShadow(
    blurRadius: 0.1,
    color: Color.fromRGBO(216, 213, 213, 0.459),
    offset: Offset(0, 1),
    spreadRadius: 0.01,
  ),
];

/// The standard shadow for containers
const kAppBarShadow = [
  BoxShadow(
    blurRadius: 9,
    color: Color.fromRGBO(153, 153, 153, 0.3),
    offset: Offset(0, 1),
    spreadRadius: 3,
  ),
];

/// The secondary shadow for containers with primaryColor
const kCardShadowPrimary = [
  BoxShadow(
    blurRadius: 32.2,
    color: Color.fromRGBO(55, 1, 120, 0.59),
    offset: Offset(0, 5),
    spreadRadius: 2.8,
  ),
];

/// The secondary shadow for buttons
const kButtonShadow = [
  BoxShadow(
    blurRadius: 9.2,
    color: Color.fromRGBO(153, 153, 153, 0.5),
    offset: Offset(0, 4),
  ),
];

const kSnowyMapStyle = '''
[
  {
    "featureType": "all",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#667d8d"},
      {"saturation": "0"}
    ]
  },
  {
    "featureType": "landscape",
    "elementType": "all",
    "stylers": [
      {"color": "#ffffff"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#e8edf0"}
    ]
  },
  {
    "featureType": "poi.attraction",
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": "-100"}
    ]
  },
  {
    "featureType": "poi.business",
    "elementType": "all",
    "stylers": [
      {"visibility": "off"}
    ]
  },
  {
    "featureType": "poi.government",
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": "-100"}
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#bae8aa"},
      {"saturation": "0"}
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": "-100"}
    ]
  },
  {
    "featureType": "poi.school",
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": "-100"}
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "elementType": "labels.icon",
    "stylers": [
      {"saturation": "-100"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#e2e8ea"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#c2d1d6"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {"color": "#a9b4b8"},
      {"visibility": "on"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#3c5566"}
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry",
    "stylers": [
      {"color": "#f0f0f2"}
    ]
  },
  {
    "featureType": "transit.station.airport",
    "elementType": "geometry.fill",
    "stylers": [
      {"color": "#e8edf0"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {"color": "#88d5f4"}
    ]
  }
]''';
