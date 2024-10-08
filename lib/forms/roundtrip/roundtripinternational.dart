import 'dart:convert';
import 'dart:math';

import 'package:bonvoyage/approval%20pages/roundtripapproval.dart';
import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/main.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RoundTripInternational extends StatefulWidget {
  Map<String, String> data;
  RoundTripInternational({super.key, required this.data});

  @override
  State<RoundTripInternational> createState() => _RoundTripInternationalState();
}

class _RoundTripInternationalState extends State<RoundTripInternational> {
  TextEditingController _visaController = TextEditingController();
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
  TextEditingController _insurancerequiredController = TextEditingController();
  TextEditingController _insurancefromdateController = TextEditingController();
  TextEditingController _insurancetodateController = TextEditingController();
  TextEditingController _insuranceavailableController = TextEditingController();
  TextEditingController _insurancenameController = TextEditingController();
  TextEditingController _insurancevaliddateController = TextEditingController();
  List<TextEditingController> currencymode =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> currency =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> amount =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> remarks =
      List.generate(1, (index) => TextEditingController());
  int indexcurrency = 1;

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

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _cabController.text = 'No';
    _visaController.text = 'No';
    _insurancerequiredController.text = 'No';
    _insuranceavailableController.text = 'No';
    // _travellernameController.text = "Umang";
    // _travellergenderController.text = "Male";
    // _travelleremailController.text = "abc@gmail.com";
    // _travellermobilenoContorller.text = "909999999";
    // _levelController.text = "xyz";
    // _departmentController.text = "abc";
    // _debitexpensesController.text = "Cost Center";
    // _costorprojectController.text = "project";
    // _requesternameController.text = "Umang";
    // _approverController.text = "dde";
  }

  String generateRandomString({int length = 10}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    final result =
        List.generate(length, (index) => chars[random.nextInt(chars.length)]);
    return base64Url.encode(utf8.encode(result.join()));
  }

  String getTextFromControllers(List<TextEditingController> a) {
    String text = "";
    for (TextEditingController t in a) {
      text += t.text + ",";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    _travellernameController.text = auth.current.employeeName;
    _travellergenderController.text =
        auth.current.sex == 'M' ? "Male" : "Female";
    _travelleremailController.text = auth.current.emailId;
    _travellermobilenoContorller.text = auth.current.mobileNo;
    _levelController.text = auth.current.descName;
    _departmentController.text = auth.current.deptName;
    _debitexpensesController.text = "Cost Center";
    _costorprojectController.text = auth.current.costCentre;
    _requesternameController.text = auth.current.employeeName;
    _approverController.text = auth.current.managerName;
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
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: currencymode.length,
                              itemBuilder: (ctx, index) {
                                print(index);
                                if (true) {
                                  return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.black26)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Container(
                                                          width:
                                                              MediaQuery.of(context)
                                                                          .size
                                                                          .width /
                                                                      2 -
                                                                  60,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black26)),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Mode',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                                  child:
                                                                      DropdownMenu(
                                                                          width: MediaQuery.of(context).size.width / 2 -
                                                                              60,
                                                                          inputDecorationTheme: InputDecorationTheme(
                                                                              border: InputBorder
                                                                                  .none),
                                                                          onSelected:
                                                                              (s) {
                                                                            if (s ==
                                                                                'select an option') {
                                                                            } else {
                                                                              currencymode[index].text = s!;
                                                                            }
                                                                          },
                                                                          controller: currencymode[
                                                                              index],
                                                                          dropdownMenuEntries:
                                                                              [
                                                                            'Select an option',
                                                                            'Foreign Currency',
                                                                            'Forex Card'
                                                                          ].map((e) => DropdownMenuEntry(label: e, value: e)).toList()),
                                                                )
                                                              ]))),
                                                  SizedBox(width: 5),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Container(
                                                          width:
                                                              MediaQuery.of(context)
                                                                          .size
                                                                          .width /
                                                                      2 -
                                                                  60,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black26)),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Currency',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                                  child: DropdownMenu(
                                                                      width: MediaQuery.of(context).size.width / 2 - 60,
                                                                      inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
                                                                      onSelected: (s) {
                                                                        if (s ==
                                                                            'select an option') {
                                                                        } else {
                                                                          currency[index].text =
                                                                              s!;
                                                                        }
                                                                      },
                                                                      controller: currency[index],
                                                                      dropdownMenuEntries: [
                                                                        'Select an option',
                                                                        'EURO',
                                                                        'GBP',
                                                                        'SGD',
                                                                        'USD', 
                                                                      ].map((e) => DropdownMenuEntry(label: e, value: e)).toList()),
                                                                )
                                                              ]))),
                                                  Column(children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            if (currencymode[
                                                                        index]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                currency[index]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                amount[index]
                                                                    .text
                                                                    .isNotEmpty &&
                                                                remarks[index]
                                                                    .text
                                                                    .isNotEmpty) {
                                                              setState(() {
                                                                indexcurrency +=
                                                                    1;
                                                                currency.add(
                                                                    TextEditingController());
                                                                currencymode.add(
                                                                    TextEditingController());
                                                                amount.add(
                                                                    TextEditingController());
                                                                remarks.add(
                                                                    TextEditingController());
                                                              });

                                                              print(currency);
                                                              print(
                                                                  currencymode);
                                                              print(amount);
                                                              print(remarks);
                                                            } else {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Center(
                                                                    child:
                                                                        AlertDialog(
                                                                      content:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min, // Ensure it only takes the necessary space
                                                                        children: <Widget>[
                                                                          Text(
                                                                            'Please fill all the details.',
                                                                            textAlign:
                                                                                TextAlign.center, // Center the text within the column
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      actions: <Widget>[
                                                                        Center(
                                                                          child:
                                                                              ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop(); // Close the dialog
                                                                            },
                                                                            child:
                                                                                Text('OK'),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          });
                                                        },
                                                        iconSize: 20,
                                                        icon: Icon(
                                                            FontAwesomeIcons
                                                                .add)),
                                                    index != 0
                                                        ? IconButton(
                                                            iconSize: 20,
                                                            onPressed: () {
                                                              setState(() {
                                                                if (index >=
                                                                        0 &&
                                                                    index <
                                                                        currencymode
                                                                            .length) {
                                                                  currencymode[
                                                                          index]
                                                                      .dispose();
                                                                  currencymode
                                                                      .removeAt(
                                                                          index);
                                                                }
                                                                if (index >=
                                                                        0 &&
                                                                    index <
                                                                        amount
                                                                            .length) {
                                                                  amount[index]
                                                                      .dispose();
                                                                  amount
                                                                      .removeAt(
                                                                          index);
                                                                }
                                                                if (index >=
                                                                        0 &&
                                                                    index <
                                                                        currency
                                                                            .length) {
                                                                  currency[
                                                                          index]
                                                                      .dispose();
                                                                  currency
                                                                      .removeAt(
                                                                          index);
                                                                }
                                                                if (index >=
                                                                        0 &&
                                                                    index <
                                                                        remarks
                                                                            .length) {
                                                                  remarks[index]
                                                                      .dispose();
                                                                  remarks
                                                                      .removeAt(
                                                                          index);
                                                                }

                                                                indexcurrency -=
                                                                    1;
                                                              });
                                                            },
                                                            icon: Icon(
                                                                Icons.delete))
                                                        : Container()
                                                  ]),
                                                ]),
                                                SizedBox(height: 10),
                                                Row(children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Container(
                                                          width:
                                                              MediaQuery.of(context)
                                                                          .size
                                                                          .width /
                                                                      2 -
                                                                  60,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black26)),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Amount',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                    child: TextFormField(
                                                                        validator: _validateRequired,
                                                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                        keyboardType: TextInputType.number,
                                                                        style: TextStyle(color: Colors.black),
                                                                        controller: amount[index],
                                                                        onChanged: (s) {
                                                                          setState(
                                                                              () {
                                                                            amount[index].text =
                                                                                s;

                                                                            print(amount);
                                                                          });
                                                                        }))
                                                              ]))),
                                                  SizedBox(width: 5),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Container(
                                                          width:
                                                              MediaQuery.of(context)
                                                                          .size
                                                                          .width /
                                                                      2 -
                                                                  60,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black26)),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Remarks',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          remarks[
                                                                              index],
                                                                      validator:
                                                                          _validateRequired,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                      onChanged:
                                                                          (s) {
                                                                        setState(
                                                                            () {
                                                                          remarks[index].text =
                                                                              s;
                                                                        });
                                                                      },
                                                                    ))
                                                              ]))),
                                                ]),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          )));
                                } else {
                                  return Container();
                                }
                              }),
                          Divider(),
                          Column(
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
                                      Text(
                                        ' Insurance Required?',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                value: 'Yes',
                                                onChanged: (i) {
                                                  setState(() {
                                                    _insurancerequiredController
                                                        .text = i.toString();
                                                  });
                                                },
                                                groupValue:
                                                    _insurancerequiredController
                                                        .text,
                                              ),
                                              Text('Yes')
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Radio(
                                                value: 'No',
                                                onChanged: (i) {
                                                  setState(() {
                                                    _insurancerequiredController
                                                        .text = i.toString();
                                                  });
                                                },
                                                groupValue:
                                                    _insurancerequiredController
                                                        .text,
                                              ),
                                              Text('No')
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              _insurancerequiredController.text == 'Yes'
                                  ? Column(children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, top: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'From Date',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black54),
                                                  ),
                                                  Container(
                                                      width: 150,
                                                      child: TextFormField(
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          controller:
                                                              _insurancefromdateController,
                                                          readOnly: true,
                                                          decoration: InputDecoration(
                                                              constraints: BoxConstraints(
                                                                  maxWidth: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      100)),
                                                          onTap: () async {
                                                            DateFormat t =
                                                                DateFormat(
                                                                    "yyyy-MM-dd HH-mm-ss");

                                                            DateTime? d = await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                firstDate:
                                                                    DateTime
                                                                        .now(),
                                                                lastDate:
                                                                    DateTime(
                                                                        2101));
                                                            TimeOfDay? c =
                                                                await showTimePicker(
                                                                    context:
                                                                        context,
                                                                    initialTime:
                                                                        TimeOfDay
                                                                            .now());
                                                            DateTime
                                                                pickeddate =
                                                                DateTime(
                                                                    d!.year,
                                                                    d.month,
                                                                    d.day,
                                                                    c!.hour,
                                                                    c.minute);

                                                            if (pickeddate !=
                                                                null) {
                                                              setState(() {
                                                                _insurancefromdateController
                                                                    .text = DateFormat(
                                                                        "yyyy-MM-dd HH-mm-ss")
                                                                    .format(
                                                                        pickeddate);
                                                              });
                                                            }
                                                          }))
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, top: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'To Date',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black54),
                                                  ),
                                                  Container(
                                                      width: 150,
                                                      child: TextFormField(
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          controller:
                                                              _insurancetodateController,
                                                          readOnly: true,
                                                          decoration: InputDecoration(
                                                              constraints: BoxConstraints(
                                                                  maxWidth: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      100)),
                                                          onTap: () async {
                                                            DateFormat t =
                                                                DateFormat(
                                                                    "yyyy-MM-dd HH-mm-ss");

                                                            DateTime? d = await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                firstDate: t.parse(
                                                                    _insurancefromdateController
                                                                        .text),
                                                                lastDate:
                                                                    DateTime(
                                                                        2101));
                                                            TimeOfDay? c =
                                                                await showTimePicker(
                                                                    context:
                                                                        context,
                                                                    initialTime:
                                                                        TimeOfDay
                                                                            .now());
                                                            DateTime
                                                                pickeddate =
                                                                DateTime(
                                                                    d!.year,
                                                                    d.month,
                                                                    d.day,
                                                                    c!.hour,
                                                                    c.minute);

                                                            if (pickeddate !=
                                                                null) {
                                                              setState(() {
                                                                _insurancetodateController
                                                                    .text = DateFormat(
                                                                        "yyyy-MM-dd HH-mm-ss")
                                                                    .format(
                                                                        pickeddate);
                                                              });
                                                            }
                                                          }))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.black26)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' Insurance Available?',
                                                style: TextStyle(
                                                    color: Colors.black54),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Radio(
                                                        value: 'Yes',
                                                        onChanged: (i) {
                                                          setState(() {
                                                            _insuranceavailableController
                                                                    .text =
                                                                i.toString();
                                                          });
                                                        },
                                                        groupValue:
                                                            _insuranceavailableController
                                                                .text,
                                                      ),
                                                      Text('Yes')
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                        value: 'No',
                                                        onChanged: (i) {
                                                          setState(() {
                                                            _insuranceavailableController
                                                                    .text =
                                                                i.toString();
                                                          });
                                                        },
                                                        groupValue:
                                                            _insuranceavailableController
                                                                .text,
                                                      ),
                                                      Text('No')
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      _insuranceavailableController.text ==
                                              'Yes'
                                          ? Row(children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      20,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color:
                                                              Colors.black26)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Insurance Name',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      TextFormField(
                                                        validator:
                                                            _validateRequired,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        controller:
                                                            _insurancenameController,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black26),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0, top: 8),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Valid Upto...',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      Container(
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              20,
                                                          child: TextFormField(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              controller:
                                                                  _insurancevaliddateController,
                                                              readOnly: true,
                                                              decoration: InputDecoration(
                                                                  constraints: BoxConstraints(
                                                                      maxWidth: MediaQuery.of(context)
                                                                              .size
                                                                              .width -
                                                                          100)),
                                                              onTap: () async {
                                                                DateFormat t =
                                                                    DateFormat(
                                                                        "yyyy-MM-dd HH-mm-ss");

                                                                DateTime? d = await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime
                                                                            .now(),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2101));
                                                                TimeOfDay? c = await showTimePicker(
                                                                    context:
                                                                        context,
                                                                    initialTime:
                                                                        TimeOfDay
                                                                            .now());
                                                                DateTime
                                                                    pickeddate =
                                                                    DateTime(
                                                                        d!.year,
                                                                        d.month,
                                                                        d.day,
                                                                        c!.hour,
                                                                        c.minute);

                                                                if (pickeddate !=
                                                                    null) {
                                                                  setState(() {
                                                                    _insurancevaliddateController
                                                                        .text = DateFormat(
                                                                            "yyyy-MM-dd HH-mm-ss")
                                                                        .format(
                                                                            pickeddate);
                                                                  });
                                                                }
                                                              }))
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ])
                                          : Container()
                                    ])
                                  : Container()
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
                                  Text(
                                    ' Airport Cab Required?',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Radio(
                                            value: 'Yes',
                                            onChanged: (i) {
                                              setState(() {
                                                _cabController.text =
                                                    i.toString();
                                              });
                                            },
                                            groupValue: _cabController.text,
                                          ),
                                          Text('Yes')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                            value: 'No',
                                            onChanged: (i) {
                                              setState(() {
                                                _cabController.text =
                                                    i.toString();
                                              });
                                            },
                                            groupValue: _cabController.text,
                                          ),
                                          Text('No')
                                        ],
                                      )
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
                                  Text(
                                    ' Visa Required?',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Radio(
                                            value: 'Yes',
                                            onChanged: (i) {
                                              setState(() {
                                                _visaController.text =
                                                    i.toString();
                                              });
                                            },
                                            groupValue: _visaController.text,
                                          ),
                                          Text('Yes')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                            value: 'No',
                                            onChanged: (i) {
                                              setState(() {
                                                _visaController.text =
                                                    i.toString();
                                              });
                                            },
                                            groupValue: _visaController.text,
                                          ),
                                          Text('No')
                                        ],
                                      )
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
                                  Text(
                                    ' Purpose',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  TextFormField(
                                    validator: _validateRequired,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: TextStyle(color: Colors.black),
                                    controller: _purposeController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Icon(FontAwesomeIcons.personWalkingLuggage,
                                        size: 25,
                                        color: Color.fromARGB(255, 1, 75, 148)),
                                    SizedBox(width: 5),
                                    Text('Traveller Details',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Color.fromARGB(
                                                255, 1, 75, 148)))
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      FittedBox(
                                        fit: BoxFit.contain,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black26),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                      'Traveller Same as Requester*',
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
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black26),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Approver Name',
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
                                                              _approverController,
                                                          decoration:
                                                              InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth: MediaQuery.of(context)
                                                                            .size
                                                                            .width -
                                                                        100,
                                                                  ),
                                                                  hintText:
                                                                      'Approver Name',
                                                                  hintStyle: TextStyle(
                                                                      color: Color.fromARGB(
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
                                      !requester
                                          ? Column(
                                              children: [
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Container(
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            40,
                                                        height: 80,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black26),
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
                                                                              FontWeight.bold)),
                                                                  TextFormField(
                                                                    validator:
                                                                        _validateRequired,
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    controller:
                                                                        _travellernameController,
                                                                    decoration: InputDecoration(
                                                                        border: InputBorder.none,
                                                                        constraints: BoxConstraints(
                                                                          maxWidth:
                                                                              MediaQuery.of(context).size.width - 100,
                                                                        ),
                                                                        hintText: 'Traveller Name',
                                                                        hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                  )
                                                                ]))),
                                                    SizedBox(width: 10),
                                                    Container(
                                                        height: 80,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black26),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
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
                                                                              FontWeight.bold)),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
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
                                                                              onChanged: (i) {
                                                                                setState(() {
                                                                                  _travellergenderController.text = i!;
                                                                                });
                                                                              },
                                                                              groupValue: _travellergenderController.text,
                                                                            ),
                                                                            Text('Male')
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Radio(
                                                                              value: 'Female',
                                                                              onChanged: (i) {
                                                                                setState(() {
                                                                                  _travellergenderController.text = i!;
                                                                                });
                                                                              },
                                                                              groupValue: _travellergenderController.text,
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
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            40,
                                                        height: 80,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black26),
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
                                                                              FontWeight.bold)),
                                                                  TextFormField(
                                                                      validator:
                                                                          _validateRequired,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      decoration: InputDecoration(
                                                                          border: InputBorder.none,
                                                                          constraints: BoxConstraints(
                                                                            maxWidth:
                                                                                MediaQuery.of(context).size.width - 100,
                                                                          ),
                                                                          hintText: 'Level/Designation',
                                                                          hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                      controller: _levelController)
                                                                ]))),
                                                    SizedBox(width: 10),
                                                    Container(
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            40,
                                                        height: 80,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black26),
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
                                                                              FontWeight.bold)),
                                                                  TextFormField(
                                                                      validator:
                                                                          _validateRequired,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      decoration: InputDecoration(
                                                                          border: InputBorder.none,
                                                                          constraints: BoxConstraints(
                                                                            maxWidth:
                                                                                MediaQuery.of(context).size.width - 100,
                                                                          ),
                                                                          hintText: 'Function/Department',
                                                                          hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                      controller: _departmentController)
                                                                ]))),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(children: [
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              40,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black26),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
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
                                                                            FontWeight.bold)),
                                                                TextFormField(
                                                                    validator:
                                                                        _validateRequired,
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    decoration: InputDecoration(
                                                                        border: InputBorder.none,
                                                                        constraints: BoxConstraints(
                                                                          maxWidth:
                                                                              MediaQuery.of(context).size.width - 100,
                                                                        ),
                                                                        hintText: 'Traveller Email',
                                                                        hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                    controller: _travelleremailController)
                                                              ]))),
                                                  SizedBox(width: 10),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              40,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black26),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
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
                                                                            FontWeight.bold)),
                                                                TextFormField(
                                                                    validator:
                                                                        _validateRequired,
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    decoration: InputDecoration(
                                                                        border: InputBorder.none,
                                                                        constraints: BoxConstraints(
                                                                          maxWidth:
                                                                              MediaQuery.of(context).size.width - 100,
                                                                        ),
                                                                        hintText: 'Traveller Mobile No',
                                                                        hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                    controller: _travellermobilenoContorller)
                                                              ]))),
                                                ]),
                                              ],
                                            )
                                          : Container(),
                                      SizedBox(height: 10),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Debit Expenses from*',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
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
                                                                  FontWeight
                                                                      .bold)),
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
                                                                  FontWeight
                                                                      .bold)),
                                                    ])
                                                  ]))),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  20,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black26),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
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
                                                            'Cost Center/Project Name',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
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
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          MediaQuery.of(context).size.width -
                                                                              100,
                                                                    ),
                                                                    hintText:
                                                                        'Cost Center/Project Name',
                                                                    hintStyle: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148))),
                                                            controller:
                                                                _costorprojectController)
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Requester Name',
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
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          MediaQuery.of(context).size.width -
                                                                              100,
                                                                    ),
                                                                    hintText:
                                                                        'Requester Name',
                                                                    hintStyle: TextStyle(
                                                                        color: Color.fromARGB(
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
                                                    Text('Comments',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextFormField(
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
                                                                    'Comments',
                                                                hintStyle: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148))),
                                                        controller:
                                                            _commentsController)
                                                  ]))),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () async {
                                                if (formkey.currentState!
                                                        .validate() &&
                                                    currencymode.isNotEmpty &&
                                                    currency.isNotEmpty &&
                                                    amount.isNotEmpty &&
                                                    remarks.isNotEmpty &&
                                                    _travellergenderController
                                                        .text.isNotEmpty &&
                                                    _debitexpensesController
                                                        .text.isNotEmpty) {
                                                  String connection =
                                                      generateRandomString();
                                                  var d = await DataBaseHelper
                                                      .insertItemOneWayDom({
                                                    "currencymode":
                                                        getTextFromControllers(
                                                            currencymode),
                                                    "currency":
                                                        getTextFromControllers(
                                                            currency),
                                                    "amount":
                                                        getTextFromControllers(
                                                            amount),
                                                    "remarkscurrency":
                                                        getTextFromControllers(
                                                            remarks),
                                                    "insurancerequired":
                                                        _insurancerequiredController
                                                            .text,
                                                    "insurancefromdate":
                                                        _insurancefromdateController
                                                            .text,
                                                    "insurancetodate":
                                                        _insurancetodateController
                                                            .text,
                                                    "insuranceavailability":
                                                        _insuranceavailableController
                                                            .text,
                                                    "insurancename":
                                                        _insurancenameController
                                                            .text,
                                                    "insurancevaliddate":
                                                        _insurancevaliddateController
                                                            .text,
                                                    "connectiontotravellertable":
                                                        connection
                                                  }, 'roundtripinternational');
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              RoundTripApproval(
                                                                  id: d,
                                                                  international:
                                                                      1)));
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Center(
                                                        child: AlertDialog(
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
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
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close the dialog
                                                                },
                                                                child:
                                                                    Text('OK'),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              child: Container(
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Color.fromARGB(
                                                          255, 1, 75, 148)),
                                                  child: Center(
                                                    child: Text('Submit',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20)),
                                                  ))),
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            RoundTripInternational(
                                                              data: widget.data,
                                                            )));
                                              },
                                              child: Container(
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 131, 14, 5)),
                                                  child: Center(
                                                    child: Text('Clear',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20)),
                                                  ))),
                                        ],
                                      )
                                    ])),
                          )
                        ]),
                      )
                    ])))));
  }
}
