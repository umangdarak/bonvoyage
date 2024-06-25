import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class OneWayApproval extends StatefulWidget {
  int id;
  int international;
  OneWayApproval({super.key, required this.id, required this.international});
  @override
  State<OneWayApproval> createState() => _OneWayApprovalState();
}

class _OneWayApprovalState extends State<OneWayApproval> {
  bool tripdetails = false;
  Map<String, Object?> data = {};
  @override
  void initState() {
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
      return await DataBaseHelper.readOneItem('onewaydomestic', widget.id).then(
          (futureResult) => futureResult.then((result) => result.toList()));
    } else {
      return await DataBaseHelper.readOneItem('onewayinternational', widget.id)
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
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 1, 75, 148))),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('One Way',
                style: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
            Icon(
              FontAwesomeIcons.personWalkingLuggage,
              color: Color.fromARGB(255, 1, 75, 148),
            )
          ]),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 5, top: 5, right: 1),
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/Bon_Voyage_Login_BG.gif'),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(
                  children: [
                    UsernameCard(),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tripdetails = !tripdetails;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(Icons.location_on,
                                          size: 25,
                                          color:
                                              Color.fromARGB(255, 1, 75, 148)),
                                      SizedBox(width: 5),
                                      Text('Trip Details',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Color.fromARGB(
                                                  255, 1, 75, 148)))
                                    ]),
                                    Icon(
                                        tripdetails
                                            ? Icons.arrow_drop_down
                                            : Icons.arrow_drop_up,
                                        size: 25,
                                        color: Color.fromARGB(255, 1, 75, 148))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          tripdetails
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 1, 75, 148),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30))),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                data['origin']!.toString() +
                                                    " - " +
                                                    data['destination']!
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16)),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(data['traveldate']!.toString(),
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                    data['travelmode']!
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            1,
                                                            75,
                                                            148),
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                    data['travelclass']!
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  data['traveldate']!
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                )
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(data['eta']!.toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148),
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(data['seat']!.toString(),
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148),
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(data['food']!.toString(),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Region',
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
                                                          data['region']!
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
                                              )
                                            : Container(),
                                        data['comments']!.toString().isNotEmpty
                                            ? Container(
                                                width: 120,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Comments',
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
                                                          data['comments']!
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
                                              )
                                            : Container()
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    data['accomodation'].toString().isNotEmpty
                                        ? Column(children: [
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'Accomodation Type',
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
                                                            data['accomodation']!
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Occupancy Type',
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
                                                            data[
                                                                    'occupancy']!
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Hotel Name',
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
                                                          data['hotel']!
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('CheckIn',
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
                                                            data['checkin']!
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
                                                        Text('CheckOut',
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
                                                            data['checkout']!
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
                                          ])
                                        : Container(),
                                    SizedBox(height: 10),
                                    data['bags'].toString().isNotEmpty
                                        ? Column(children: [
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
                                                            data['bags']!
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
                                                            data['weight']!
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
                                                          data['remarks']!
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
                                        : Container()
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
