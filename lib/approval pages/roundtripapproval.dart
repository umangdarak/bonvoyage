import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/screens/dashboard.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class RoundTripApproval extends StatefulWidget {
  int id;
  int international;
  RoundTripApproval({super.key, required this.id, required this.international});

  @override
  State<RoundTripApproval> createState() => _RoundTripApprovalState();
}

class _RoundTripApprovalState extends State<RoundTripApproval> {
  List<bool> select = [true, false];
  Map<String, String> data = {};
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    setState(() async {
      var dataa = getData(widget.international);
      data = dataa;
    });
  }

  getData(int id) async {
    if (id == 0) {
      return await DataBaseHelper.readOneItem('onewaydomestic', widget.id);
    } else {
      return await DataBaseHelper.readOneItem('onewayinternational', widget.id);
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
                              SizedBox(height: 10),
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
                                          data['origin']! +
                                              " - " +
                                              data['destination']!,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(data['travel-date']!,
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
                                          Text(data['travel-mode']!,
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
                                          Text(data['travel-class']!,
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
                                              DateFormat('yyyy-MM-dd').format(
                                                  DateFormat('yyyy-MM-dd HH-mm-ss')
                                                      .parse(
                                                          data[
                                                              'travel-date']!)),
                                              style:
                                                  TextStyle(
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
                                          Text(data['eta']!,
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
                                          Text(data['seat']!,
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
                                          Text(data['food']!,
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
                                                Text(data['region']!,
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
                                  Container(
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
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(data['comments']!,
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
                              data['accomodation'] != null
                                  ? Column(children: [
                                      Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 1, 75, 148),
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(30))),
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Accomodation Type',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(data['accomodation']!,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Occupancy Type',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(data['occupancy']!,
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
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                                Text('Taj Krishna',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148),
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('CheckIn',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(data['checkin']!,
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
                                            width: 150,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('CheckOut',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(data['checkout']!,
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
                                        ],
                                      )
                                    ])
                                  : Container(),
                              SizedBox(height: 10),
                              data['bags'] != null
                                  ? Column(children: [
                                      Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 1, 75, 148),
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(30))),
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('No of Bags',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(data['bags']!,
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
                                            width: 150,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Total Weight(kgs)',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(data['weight']!,
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
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                                Text(data['remarks']!,
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148),
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                SizedBox(height: 10),
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
                                            data['destination']! +
                                                " - " +
                                                data['origin']!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(data['traveldatereturn']!,
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
                                            Text(data['travelmodereturn']!,
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
                                            Text(data['travelclassreturn']!,
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
                                                DateFormat('yyyy-MM-dd').format(
                                                    DateFormat(
                                                            'yyyy-MM-dd HH-mm-ss')
                                                        .parse(data[
                                                            'traveldatereturn']!)),
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
                                            Text(data['etareturn']!,
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
                                            Text(data['seatreturn']!,
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
                                            Text(data['foodreturn']!,
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
                                                  Text(data['regionreturn']!,
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
                                    Container(
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(data['commentsreturn']!,
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
                  ])
                ]))));
  }
}
