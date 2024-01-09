import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MultiCityApprovalPage extends StatefulWidget {
  int id;
  MultiCityApprovalPage({super.key, required this.id});

  @override
  State<MultiCityApprovalPage> createState() => _MultiCityApprovalPageState();
}

class _MultiCityApprovalPageState extends State<MultiCityApprovalPage> {
  List<Map<String, dynamic>> data1 = [];
  getData() async {
    return await DataBaseHelper.readOneItem('multicity', widget.id);
  }

  getAllData(String connection) async {
    return await DataBaseHelper.readOneItemRandom(
        'multicityeach', 'connection', connection);
  }

  List<Map<String, dynamic>> data = [];
  List<bool> gestures = [];
  Color c = Color.fromARGB(255, 1, 75, 148);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    data1 = await getData();
    print(data1[0]['sameuser']);
    data = await getAllData(data1[0]['sameuser']!);
    print(data);
    var data2 = await DataBaseHelper.readOneWayDom('multicityeach');
    print(data2);
    gestures = List.generate(data.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leadingWidth: 20,
            leading: IconButton(
                onPressed: () async {
                  await DataBaseHelper.deletewholetableonewaydom('multicity');
                  await DataBaseHelper.deletewholetableonewaydom(
                      'multicityeach');
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.amber)),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MultiCity', style: TextStyle(color: Colors.amber)),
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
                child: Column(
                  children: [
                    Flexible(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  color: Color.fromARGB(255, 250, 246, 246),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    gestures[index] =
                                                        !gestures[index];
                                                  });
                                                },
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148),
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30))),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                  data[index][
                                                                          'origin']! +
                                                                      " - " +
                                                                      data[index]
                                                                          [
                                                                          'destination']!,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16)),
                                                              SizedBox(
                                                                width: 7,
                                                              ),
                                                              Text(
                                                                  data[index][
                                                                      'traveldate']!,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16)),
                                                              SizedBox(
                                                                width: 5,
                                                              )
                                                            ],
                                                          )),
                                                      Icon(
                                                          gestures[index]
                                                              ? Icons
                                                                  .arrow_drop_down_outlined
                                                              : Icons
                                                                  .arrow_drop_up_outlined,
                                                          color: c,
                                                          size: 34)
                                                    ])),
                                            gestures[index]
                                                ? Column(
                                                    children: [
                                                      SizedBox(height: 10),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 120,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text('Mode',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14)),
                                                                  SizedBox(
                                                                    height: 4,
                                                                  ),
                                                                  Text(
                                                                      data[index]
                                                                          [
                                                                          'travelmode']!,
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text('Class',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14)),
                                                                  SizedBox(
                                                                    height: 4,
                                                                  ),
                                                                  Text(
                                                                      data[index]
                                                                          [
                                                                          'travelclass']!,
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      'TravelDate',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14)),
                                                                  SizedBox(
                                                                    height: 4,
                                                                  ),
                                                                  Text(
                                                                      data[index]
                                                                          [
                                                                          'traveltime'],
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16))
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
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text('ETA',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14)),
                                                                  SizedBox(
                                                                    height: 4,
                                                                  ),
                                                                  Text(
                                                                      data[index]
                                                                          [
                                                                          'eta']!,
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      'Seat Preference',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14)),
                                                                  SizedBox(
                                                                    height: 4,
                                                                  ),
                                                                  Text(
                                                                      data[index]
                                                                          [
                                                                          'seat']!,
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      'Food Preference',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14)),
                                                                  SizedBox(
                                                                    height: 4,
                                                                  ),
                                                                  Text(
                                                                      data[index]
                                                                          [
                                                                          'food']!,
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16))
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          data[index]['region'] !=
                                                                  null
                                                              ? Container(
                                                                  width: 120,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            'Region',
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 14)),
                                                                        SizedBox(
                                                                          height:
                                                                              4,
                                                                        ),
                                                                        Text(
                                                                            data[index][
                                                                                'region']!,
                                                                            style: TextStyle(
                                                                                color: Color.fromARGB(255, 1, 75, 148),
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 16))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              : Container(),
                                                          data[index]['comments'] !=
                                                                  ''
                                                              ? Container(
                                                                  width: 120,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            'Comments',
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 14)),
                                                                        SizedBox(
                                                                          height:
                                                                              4,
                                                                        ),
                                                                        Text(
                                                                            data[index][
                                                                                'comments']!,
                                                                            style: TextStyle(
                                                                                color: Color.fromARGB(255, 1, 75, 148),
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 16))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              : Container()
                                                        ],
                                                      ),
                                                      SizedBox(height: 10),
                                                      data[index]['accomodation'] !=
                                                              ''
                                                          ? Column(children: [
                                                              Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration: BoxDecoration(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148),
                                                                      borderRadius:
                                                                          BorderRadius.only(
                                                                              topRight: Radius.circular(30))),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                          'Accomodation Details',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16)),
                                                                      SizedBox(
                                                                        width:
                                                                            2,
                                                                      ),
                                                                    ],
                                                                  )),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    width: 120,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              'Accomodation Type',
                                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                                                                          SizedBox(
                                                                            height:
                                                                                4,
                                                                          ),
                                                                          Text(
                                                                              data[index]['accomodation']!,
                                                                              style: TextStyle(color: Color.fromARGB(255, 1, 75, 148), fontWeight: FontWeight.bold, fontSize: 16))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 120,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              'Occupancy Type',
                                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                                                                          SizedBox(
                                                                            height:
                                                                                4,
                                                                          ),
                                                                          Text(
                                                                              data[index]['occupancy']!,
                                                                              style: TextStyle(color: Color.fromARGB(255, 1, 75, 148), fontWeight: FontWeight.bold, fontSize: 16))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  data[index]['hotel'] !=
                                                                          null
                                                                      ? Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text('Hotel Name', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                                                                              SizedBox(
                                                                                height: 4,
                                                                              ),
                                                                              Text(data[index]['hotel'], style: TextStyle(color: Color.fromARGB(255, 1, 75, 148), fontWeight: FontWeight.bold, fontSize: 16))
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    width: 150,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              'CheckIn',
                                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                                                                          SizedBox(
                                                                            height:
                                                                                4,
                                                                          ),
                                                                          Text(
                                                                              data[index]['checkin']!,
                                                                              style: TextStyle(color: Color.fromARGB(255, 1, 75, 148), fontWeight: FontWeight.bold, fontSize: 16))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 150,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              'CheckOut',
                                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                                                                          SizedBox(
                                                                            height:
                                                                                4,
                                                                          ),
                                                                          Text(
                                                                              data[index]['checkout']!,
                                                                              style: TextStyle(color: Color.fromARGB(255, 1, 75, 148), fontWeight: FontWeight.bold, fontSize: 16))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ])
                                                          : Container(),
                                                      SizedBox(height: 10),
                                                      data[index]['bags'] != ''
                                                          ? Column(children: [
                                                              Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration: BoxDecoration(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148),
                                                                      borderRadius:
                                                                          BorderRadius.only(
                                                                              topRight: Radius.circular(30))),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                          'Extra Baggage Details',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16)),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  )),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    width: 150,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              'No of Bags',
                                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                                                                          SizedBox(
                                                                            height:
                                                                                4,
                                                                          ),
                                                                          Text(
                                                                              data[index]['bags']!,
                                                                              style: TextStyle(color: Color.fromARGB(255, 1, 75, 148), fontWeight: FontWeight.bold, fontSize: 16))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 150,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              'Total Weight(kgs)',
                                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                                                                          SizedBox(
                                                                            height:
                                                                                4,
                                                                          ),
                                                                          Text(
                                                                              data[index]['weight']!,
                                                                              style: TextStyle(color: Color.fromARGB(255, 1, 75, 148), fontWeight: FontWeight.bold, fontSize: 16))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            'Remarks',
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 14)),
                                                                        SizedBox(
                                                                          height:
                                                                              4,
                                                                        ),
                                                                        Text(
                                                                            data[index][
                                                                                'remarks']!,
                                                                            style: TextStyle(
                                                                                color: Color.fromARGB(255, 1, 75, 148),
                                                                                fontWeight: FontWeight.bold,
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
                                                : Container()
                                          ])));
                            }))
                  ],
                ))));
  }
}
