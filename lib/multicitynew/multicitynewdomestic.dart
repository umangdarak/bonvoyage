import 'dart:convert';
import 'dart:math';

import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Multicitynewdomestic extends StatefulWidget {
  Multicitynewdomestic({Key? key, required this.data}) : super(key: key);
  List<Map<String, String>> data;

  @override
  _MulticitynewdomesticState createState() => _MulticitynewdomesticState();
}

class _MulticitynewdomesticState extends State<Multicitynewdomestic> {
  TextEditingController _modeController = TextEditingController();
  TextEditingController _currencyController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _cabController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();

  TextEditingController _approverController = TextEditingController();
  TextEditingController _travellernameController = TextEditingController();
  TextEditingController _travellergenderController = TextEditingController();
  TextEditingController _levelController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _travelleremailController = TextEditingController();
  TextEditingController _travellermobilenoContorller = TextEditingController();
  TextEditingController _debitexpensesController = TextEditingController();
  TextEditingController _costorprojectController = TextEditingController();
  TextEditingController _requesternameController = TextEditingController();
  TextEditingController _commentsController = TextEditingController();

  String gender = 'Male';
  String debittype = 'Cost Center';
  //all bool variables
  bool tripdetails = false;
  bool travellerdetails = false;
  bool requester = true;
  final formkey = GlobalKey<FormState>();
  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String generateRandomString({int length = 10}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    final result =
        List.generate(length, (index) => chars[random.nextInt(chars.length)]);
    return base64Url.encode(utf8.encode(result.join()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _travellernameController.text = "Umang";
    _travellergenderController.text = "Male";
    _travelleremailController.text = "abc@gmail.com";
    _travellermobilenoContorller.text = "909999999";
    _levelController.text = "xyz";
    _departmentController.text = "abc";
    _debitexpensesController.text = "Cost Center";
    _costorprojectController.text = "project";
    _requesternameController.text = "Umang";
    _approverController.text = "dde";
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
                child: Form(
                  key: formkey,
                  child: ListView(children: [
                    UsernameCard(),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Icon(FontAwesomeIcons.commentDots,
                                  size: 25,
                                  color: Color.fromARGB(255, 1, 75, 148)),
                              SizedBox(width: 5),
                              Text('Miscellaneous',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 1, 75, 148)))
                            ]),
                            Icon(Icons.arrow_drop_up,
                                size: 25,
                                color: Color.fromARGB(255, 1, 75, 148))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.black26)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(' Mode:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      DropdownMenu(
                                          onSelected: (s) {
                                            if (s == 'Select an option') {
                                              _modeController.text = '';
                                            }
                                          },
                                          controller: _modeController,
                                          inputDecorationTheme:
                                              InputDecorationTheme(
                                                  border: InputBorder.none),
                                          dropdownMenuEntries: [
                                            'Select an option',
                                            'Cheque',
                                            'Bank Transfer'
                                          ]
                                              .map((e) => DropdownMenuEntry(
                                                  label: e, value: e))
                                              .toList())
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.black26)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(' Currency',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      DropdownMenu(
                                          onSelected: (s) {
                                            if (s == 'Select an option') {
                                              _currencyController.text = '';
                                            }
                                          },
                                          controller: _currencyController,
                                          inputDecorationTheme:
                                              InputDecorationTheme(
                                                  border: InputBorder.none),
                                          dropdownMenuEntries: ['INR', 'USD']
                                              .map((e) => DropdownMenuEntry(
                                                  label: e, value: e))
                                              .toList())
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black26)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(' Amount',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextFormField(
                                    validator: _validateRequired,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: TextStyle(color: Colors.black),
                                    controller: _amountController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black26)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(' Airport Cab Required?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        value: 'Yes',
                                        onChanged: (i) {
                                          setState(() {
                                            _cabController.text = i.toString();
                                          });
                                        },
                                        groupValue: _cabController.text,
                                      ),
                                      Text('Yes',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Radio(
                                        value: 'No',
                                        onChanged: (i) {
                                          setState(() {
                                            _cabController.text = i.toString();
                                          });
                                        },
                                        groupValue: _cabController.text,
                                      ),
                                      Text('No',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black26)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(' Purpose',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    controller: _purposeController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ])),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Icon(FontAwesomeIcons.personWalkingLuggage,
                                  size: 25,
                                  color: Color.fromARGB(255, 1, 75, 148)),
                              SizedBox(width: 5),
                              Text('Traveller Details',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 1, 75, 148)))
                            ]),
                            Icon(Icons.arrow_drop_up,
                                size: 25,
                                color: Color.fromARGB(255, 1, 75, 148))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black26),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Text('Traveller Same as Requester*',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                40,
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
                                                  Text('Approver Name',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextFormField(
                                                    validator:
                                                        _validateRequired,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    controller:
                                                        _approverController,
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              100,
                                                        ),
                                                        hintText:
                                                            'Approver Name',
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    1,
                                                                    75,
                                                                    148))),
                                                  )
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
                                                          color:
                                                              Colors.black26),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                'Traveller Name',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextFormField(
                                                              validator:
                                                                  _validateRequired,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              controller:
                                                                  _travellernameController,
                                                              decoration:
                                                                  InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            MediaQuery.of(context).size.width -
                                                                                100,
                                                                      ),
                                                                      hintText:
                                                                          'Traveller Name',
                                                                      hintStyle: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148))),
                                                            )
                                                          ]))),
                                              SizedBox(width: 10),
                                              Container(
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.black26),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                'Traveller Gender',
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
                                                                        value:
                                                                            'Male',
                                                                        onChanged:
                                                                            (i) {
                                                                          setState(
                                                                              () {
                                                                            _travellergenderController.text =
                                                                                i!;
                                                                          });
                                                                        },
                                                                        groupValue:
                                                                            _travellergenderController.text,
                                                                      ),
                                                                      Text(
                                                                          'Male')
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
                                                                            _travellergenderController.text =
                                                                                i!;
                                                                          });
                                                                        },
                                                                        groupValue:
                                                                            _travellergenderController.text,
                                                                      ),
                                                                      Text(
                                                                          'Female')
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
                                                          color:
                                                              Colors.black26),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                'Level/Designation',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextFormField(
                                                                validator:
                                                                    _validateRequired,
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .onUserInteraction,
                                                                decoration:
                                                                    InputDecoration(
                                                                        border: InputBorder
                                                                            .none,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              MediaQuery.of(context).size.width - 100,
                                                                        ),
                                                                        hintText:
                                                                            'Level/Designation',
                                                                        hintStyle: TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                1,
                                                                                75,
                                                                                148))),
                                                                controller:
                                                                    _levelController)
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
                                                          color:
                                                              Colors.black26),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                                            TextFormField(
                                                                validator:
                                                                    _validateRequired,
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .onUserInteraction,
                                                                decoration:
                                                                    InputDecoration(
                                                                        border: InputBorder
                                                                            .none,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              MediaQuery.of(context).size.width - 100,
                                                                        ),
                                                                        hintText:
                                                                            'Function/Department',
                                                                        hintStyle: TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                1,
                                                                                75,
                                                                                148))),
                                                                controller:
                                                                    _departmentController)
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
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              'Traveller Email',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextFormField(
                                                              validator:
                                                                  _validateRequired,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              decoration:
                                                                  InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            MediaQuery.of(context).size.width -
                                                                                100,
                                                                      ),
                                                                      hintText:
                                                                          'Traveller Email',
                                                                      hintStyle: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148))),
                                                              controller:
                                                                  _travelleremailController)
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
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              'Traveller Mobile No',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextFormField(
                                                              validator:
                                                                  _validateRequired,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              decoration:
                                                                  InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            MediaQuery.of(context).size.width -
                                                                                100,
                                                                      ),
                                                                      hintText:
                                                                          'Traveller Mobile No',
                                                                      hintStyle: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148))),
                                                              controller:
                                                                  _travellermobilenoContorller)
                                                        ]))),
                                          ]),
                                        ],
                                      )
                                    : Container(),
                                SizedBox(height: 10),
                                Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Debit Expenses from*',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(children: [
                                                Radio(
                                                    value: 'Cost Center',
                                                    groupValue:
                                                        _debitexpensesController
                                                            .text,
                                                    onChanged: (i) {
                                                      setState(() {
                                                        _debitexpensesController
                                                            .text = i!;
                                                      });
                                                    }),
                                                Text('Cost Center',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Radio(
                                                    value: 'Project',
                                                    groupValue:
                                                        _debitexpensesController
                                                            .text,
                                                    onChanged: (i) {
                                                      setState(() {
                                                        _debitexpensesController
                                                            .text = i!;
                                                      });
                                                    }),
                                                Text('Project',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ])
                                            ]))),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                20,
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
                                                  Text(
                                                      'Cost Center/Project Name',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextFormField(
                                                      validator:
                                                          _validateRequired,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    100,
                                                              ),
                                                              hintText:
                                                                  'Cost Center/Project Name',
                                                              hintStyle: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148))),
                                                      controller:
                                                          _costorprojectController)
                                                ]))),
                                    SizedBox(width: 10),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                                  Text('Requester Name',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  TextFormField(
                                                      validator:
                                                          _validateRequired,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    100,
                                                              ),
                                                              hintText:
                                                                  'Requester Name',
                                                              hintStyle: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148))),
                                                      controller:
                                                          _requesternameController)
                                                ]))),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Comments',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextFormField(
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            100,
                                                      ),
                                                      hintText: 'Comments',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              1,
                                                              75,
                                                              148))),
                                                  controller:
                                                      _commentsController)
                                            ]))),
                                TextButton(
                                    onPressed: () async {
                                      if (formkey.currentState!.validate() &&
                                          _travellergenderController
                                              .text.isNotEmpty &&
                                          _debitexpensesController
                                              .text.isNotEmpty) {
                                        String connection =
                                            generateRandomString();
                                        var d = await DataBaseHelper
                                            .insertItemOneWayDom({
                                          'sameuser': connection,
                                          'currencymode': _modeController.text,
                                          'currency': _currencyController.text,
                                          'amount': _amountController.text,
                                          'cab': _cabController.text,
                                          'purpose': _purposeController.text,
                                          'connectiontotravellertable':
                                              connection
                                        }, "multicitydomestic");
                                        for (int i = 0;
                                            i < widget.data.length;
                                            i++) {
                                          await DataBaseHelper
                                              .insertItemOneWayDom({
                                            ...widget.data[i],
                                            'connection': connection
                                          }, 'multicityeachdomestic');
                                        }
                                        var c = await DataBaseHelper
                                            .insertItemOneWayDom({
                                          'connection': connection,
                                          'approver': _approverController.text,
                                          'travellername':
                                              _travellernameController.text,
                                          'travellergender':
                                              _travellergenderController.text,
                                          'travellerlevel':
                                              _levelController.text,
                                          'department':
                                              _departmentController.text,
                                          'email':
                                              _travelleremailController.text,
                                          'mobileno':
                                              _travellermobilenoContorller.text,
                                          'debitexpenses':
                                              _debitexpensesController.text,
                                          'costorproject':
                                              _costorprojectController.text,
                                          'requester':
                                              _requesternameController.text,
                                          'comments': _commentsController.text
                                        }, 'travellerdetails');
                                        print(d);
                                        print(c);
                                        print(await DataBaseHelper
                                            .readOneItemRandom(
                                                'multicityeachdomestic',
                                                'connection',
                                                connection));
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child: AlertDialog(
                                                content: Column(
                                                  mainAxisSize: MainAxisSize
                                                      .min, // Ensure it only takes the necessary space
                                                  children: <Widget>[
                                                    Text(
                                                      'Please fill all the details.',
                                                      textAlign: TextAlign
                                                          .center, // Center the text within the column
                                                    ),
                                                  ],
                                                ),
                                                actions: <Widget>[
                                                  Center(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(); // Close the dialog
                                                      },
                                                      child: Text('OK'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Text('SaveData'))
                              ]),
                        )),
                  ]),
                ))));
  }
}
