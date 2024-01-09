import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TravellerDetails extends StatefulWidget {
  const TravellerDetails({super.key});

  @override
  State<TravellerDetails> createState() => _TravellerDetailsState();
}

class _TravellerDetailsState extends State<TravellerDetails> {
  String gender = 'Male';
  String debittype = 'Cost Center';
  //all bool variables
  bool tripdetails = false;
  bool travellerdetails = false;
  bool requester = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          setState(() {
            travellerdetails = !travellerdetails;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(FontAwesomeIcons.personWalkingLuggage,
                      size: 25, color: Color.fromARGB(255, 1, 75, 148)),
                  SizedBox(width: 5),
                  Text('Traveller Details',
                      style: TextStyle(
                          fontSize: 25, color: Color.fromARGB(255, 1, 75, 148)))
                ]),
                Icon(
                    travellerdetails
                        ? Icons.arrow_drop_down
                        : Icons.arrow_drop_up,
                    size: 25,
                    color: Color.fromARGB(255, 1, 75, 148))
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      travellerdetails
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      Text('Traveller Same as Requester*',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Checkbox(
                                          value: requester,
                                          onChanged: (i) {
                                            setState(() {
                                              requester = i!;
                                            });
                                          })
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      40,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black26),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Approver Name',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('Manager to be changed')
                                          ]))),
                              SizedBox(
                                width: 10,
                              ),
                              Text('To change Approver this part')
                            ],
                          ),
                          requester
                              ? Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                40,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Traveller Name',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('name')
                                                    ]))),
                                        SizedBox(width: 10),
                                        Container(
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Traveller Gender',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Radio(
                                                                  value: 'Male',
                                                                  onChanged:
                                                                      (i) {
                                                                    setState(
                                                                        () {
                                                                      gender =
                                                                          i!;
                                                                    });
                                                                  },
                                                                  groupValue:
                                                                      gender,
                                                                ),
                                                                Text('Male')
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Radio(
                                                                  value:
                                                                      'Female',
                                                                  onChanged:
                                                                      (i) {
                                                                    setState(
                                                                        () {
                                                                      gender =
                                                                          i!;
                                                                    });
                                                                  },
                                                                  groupValue:
                                                                      gender,
                                                                ),
                                                                Text('Female')
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ]))),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                40,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Level/Designation',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('designation')
                                                    ]))),
                                        SizedBox(width: 10),
                                        Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                40,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Function/Department',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('IT/IT')
                                                    ]))),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              40,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black26),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Traveller Email',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text('Email')
                                                  ]))),
                                      SizedBox(width: 10),
                                      Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              40,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black26),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Traveller Mobile No',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text('Mobile No')
                                                  ]))),
                                    ]),
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 10),
                          Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Debit Expenses from*',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: [
                                          Row(
                                            children: [
                                              Radio(
                                                  value: 'Cost Center',
                                                  groupValue: debittype,
                                                  onChanged: (i) {
                                                    setState(() {
                                                      debittype = i!;
                                                    });
                                                  }),
                                              Text('Cost Center')
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Radio(
                                                  value: 'Project',
                                                  groupValue: debittype,
                                                  onChanged: (i) {
                                                    setState(() {
                                                      debittype = i!;
                                                    });
                                                  }),
                                              Text('Project')
                                            ],
                                          ),
                                        ])
                                      ]))),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      40,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black26),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Cost Center/Project Name',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('Project Name...')
                                          ]))),
                              SizedBox(width: 10),
                              Container(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      40,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black26),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Requester Name',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('Name')
                                          ]))),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Comments',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none))
                                      ]))),
                        ]),
                  )),
            )
          : Container(),
      SizedBox(height: 20)
    ]);
  }
}
