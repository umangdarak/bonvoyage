import 'package:flutter/material.dart';
import 'dart:math' as math;

class UsernameCard extends StatelessWidget {
  const UsernameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 70,
                    child: Image.asset('assets/images/person.png',
                        fit: BoxFit.cover),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Traveller Name',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                          Text('Employee Name',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 1, 75, 148),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Designation',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                              Text('Designation Name',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15))
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Department',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                              Text('Department Name',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )
                ],
              ),
              Positioned(
                bottom: -10,
                left: MediaQuery.of(context).size.width / 2 - 20,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (context, setState) {
                            return AlertDialog(
                                alignment: Alignment(2, -0.5),
                                // Adjust these values
                                insetPadding: EdgeInsets.all(5),
                                actions: [
                                  Container(
                                      height: 450,
                                      width: MediaQuery.of(context).size.width -
                                          25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    radius: 65,
                                                    child: Image.asset(
                                                        'assets/images/person.png',
                                                        fit: BoxFit.cover),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 20),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Traveller Name',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      14)),
                                                          Text('Employee Name',
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
                                                                  fontSize: 15))
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Designation',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          14)),
                                                              Text(
                                                                  'Designation Name',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Department',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          14)),
                                                              Text(
                                                                  'Department Name',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          15))
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Traveller Mobile No',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14)),
                                                      Text('99999999',
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
                                                              fontSize: 15))
                                                    ],
                                                  ),
                                                  SizedBox(width: 60),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Traveller Gender',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14)),
                                                      Text('Male',
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
                                                              fontSize: 15))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Debit Expenses from',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14)),
                                                      Text('Cost Center',
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
                                                              fontSize: 15))
                                                    ],
                                                  ),
                                                  SizedBox(width: 60),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Cost Center/Project Name',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14)),
                                                      Container(
                                                        width: 150,
                                                        child: Text(
                                                            '90012104- Corporate - IITS-Common-Corporate',
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
                                                                fontSize: 15)),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Traveller Email',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14)),
                                                      Text(
                                                          'testemail@gmail.com',
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
                                                              fontSize: 15))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Stack(
                                                children: [
                                                  Divider(
                                                      color: Color.fromARGB(
                                                          255, 1, 75, 148)),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Color.fromARGB(
                                                                    255, 1, 75, 148)),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10),
                                                            color:
                                                                Colors.white),
                                                        child: Text('Approver Details',
                                                            style: TextStyle(
                                                                color: Color.fromARGB(
                                                                    255,
                                                                    1,
                                                                    75,
                                                                    148)))),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Approver Name',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14)),
                                                      Text('Approver Name',
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
                                                              fontSize: 15))
                                                    ],
                                                  ),
                                                  SizedBox(width: 60),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Approver Designation',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14)),
                                                      Text(
                                                          'Approver Designation',
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
                                                              fontSize: 15))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Approver Email',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 14)),
                                                      Text(
                                                          'testexample@gmail.com',
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
                                                              fontSize: 15))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            bottom: -10,
                                            left: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                20,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.white,
                                                child: Stack(children: [
                                                  Transform.rotate(
                                                      angle: 90 * math.pi / 180,
                                                      child: Icon(
                                                          Icons
                                                              .arrow_back_ios_new,
                                                          color: Colors
                                                              .orange[800])),
                                                  Positioned(
                                                    top: 5,
                                                    child: Transform.rotate(
                                                        angle:
                                                            90 * math.pi / 180,
                                                        child: Icon(
                                                          Icons
                                                              .arrow_back_ios_new,
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148),
                                                        )),
                                                  ),
                                                ]),
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ]);
                          });
                        });
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Stack(children: [
                      Transform.rotate(
                          angle: 270 * math.pi / 180,
                          child: Icon(Icons.arrow_back_ios_new,
                              color: Colors.orange[800])),
                      Positioned(
                        top: 5,
                        child: Transform.rotate(
                            angle: 270 * math.pi / 180,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color.fromARGB(255, 1, 75, 148),
                            )),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
