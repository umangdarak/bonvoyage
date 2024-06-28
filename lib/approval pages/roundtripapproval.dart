import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/screens/dashboard.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundTripApproval extends StatefulWidget {
  int id;
  int international;
  RoundTripApproval({super.key, required this.id, required this.international});

  @override
  State<RoundTripApproval> createState() => _RoundTripApprovalState();
}

class _RoundTripApprovalState extends State<RoundTripApproval> {
  List<bool> select = [true, false];
  Map<String, Object?> data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var dataa = getData(widget.international);
    var fetchedData = await dataa;

    setState(() {
      data = fetchedData[0];
    });
  }

  Future<List<Map<String, Object?>>> getData(int id) async {
    if (id == 0) {
      return await DataBaseHelper.readOneItem('roundtripdomestic', widget.id)
          .then(
              (futureResult) => futureResult.then((result) => result.toList()));
    } else {
      return await DataBaseHelper.readOneItem(
              'roundtripinternational', widget.id)
          .then(
              (futureResult) => futureResult.then((result) => result.toList()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leadingWidth: 20,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => DashBoard()));
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.amber)),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('RoundTrip', style: TextStyle(color: Colors.amber)),
                  Icon(
                    FontAwesomeIcons.personWalkingLuggage,
                    color: Colors.amber,
                  ),
                ])),
        body: Padding(
            padding: const EdgeInsets.only(left: 5, top: 20, right: 1),
            child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/Bon_Voyage_Login_BG.gif'),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(children: [
                  UsernameCard(),
                  Divider(),
                  SizedBox(height: 10),
                  Stack(children: [
                    select[0]
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 80),
                              Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30))),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          data['origin'].toString() +
                                              " - " +
                                              data['destination'].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(data['traveldate'].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  )),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Mode',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(data['travelmode'].toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Class',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(data['travelclass'].toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('TravelDate',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(data['traveldate'].toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('ETA',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(data['eta'].toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Seat Preference',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(data['seat'].toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Food Preference',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(data['food'].toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  data['region'] != null
                                      ? Container(
                                          width: 120,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Region',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(data['region'].toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16))
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  data['comments'].toString().isNotEmpty
                                      ? Container(
                                          width: 120,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Comments',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                    data['comments'].toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16))
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                              SizedBox(height: 10),
                              data['accomodation'].toString().isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                          Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  30))),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('Accomodation Details',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16)),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                ],
                                              )),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                width: 120,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Accomodation Type',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14)),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                          data['accomodation']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 120,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Occupancy Type',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14)),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                          data['occupancy']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Hotel Name',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14)),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                        data['hotel']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    1,
                                                                    75,
                                                                    148),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                width: 150,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('CheckIn',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14)),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                          data['checkin']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 150,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('CheckOut',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14)),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                          data['checkout']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ])
                                  : Container(),
                              SizedBox(height: 10),
                              data['bags'].toString().isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                          Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  30))),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('Extra Baggage Details',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16)),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              )),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                width: 150,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('No of Bags',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14)),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                          data['bags']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 150,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Total Weight(kgs)',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14)),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                          data['totalweight']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Remarks',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14)),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                        data['remarks']
                                                            .toString(),
                                                        style:
                                                            TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        1,
                                                                        75,
                                                                        148),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ])
                                  : Container()
                            ],
                          )
                        : Container(),
                    select[1]
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                SizedBox(height: 80),
                                Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 1, 75, 148),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30))),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            data['destination'].toString() +
                                                " - " +
                                                data['origin'].toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                            data['traveldatereturn'].toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    )),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Mode',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                                data['travelmodereturn']
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Class',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                                data['travelclassreturn']
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('TravelDate',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                                data['traveldatereturn']
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('ETA',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(data['etareturn'].toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Seat Preference',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(data['seatreturn'].toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Food Preference',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(data['foodreturn'].toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    data['region'] != null
                                        ? Container(
                                            width: 120,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Region',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                      data['regionreturn']
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16))
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    data['commentsreturn'] != null
                                        ? Container(
                                            width: 120,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Comments',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                      data['commentsreturn']
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16))
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                                data['bagreturn'].toString().isNotEmpty
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                            Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    30))),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                        'Extra Baggage Details',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                )),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('No of Bags',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14)),
                                                        SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                            data['bagreturn']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        1,
                                                                        75,
                                                                        148),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'Total Weight(kgs)',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14)),
                                                        SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                            data['totalweightreturn']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        1,
                                                                        75,
                                                                        148),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Remarks',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14)),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                          data['remarksreturn']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ])
                                    : Container(),
                              ])
                        : Container(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Container(
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: ToggleButtons(
                                  isSelected: select,
                                  renderBorder: false,
                                  children: [
                                    Container(
                                        width: 125,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: select[0]
                                              ? Colors.amber
                                              : Colors.white,
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Onwards',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: const Color.fromARGB(
                                                255, 1, 75, 148),
                                          ),
                                        ))),
                                    Container(
                                        width: 125,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: select[1]
                                              ? Colors.amber
                                              : Colors.white,
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Return',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: const Color.fromARGB(
                                                255, 1, 75, 148),
                                          ),
                                        )))
                                  ],
                                  onPressed: (index) {
                                    setState(() {
                                      for (int i = 0; i < select.length; i++)
                                        select[i] = i == index;
                                    });
                                  },
                                ),
                              )),
                        ],
                      ),
                    ),
                  ]),
                  Center(
                    child: TextButton(
                      child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green),
                          child: Center(
                            child: Text('Confirm',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          )),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => DashBoard()));
                      },
                    ),
                  ),
                ]))));
  }
}
