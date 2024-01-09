import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccomTravelAdvance extends StatefulWidget {
  Map<String, String> data;
  AccomTravelAdvance({super.key, required this.data});

  @override
  State<AccomTravelAdvance> createState() => _AccomTravelAdvanceState();
}

class _AccomTravelAdvanceState extends State<AccomTravelAdvance> {
  final formkey = GlobalKey<FormState>();
  List<String> currencymode = [];
  List<String> currency = [];
  List<String> amount = [];
  List<String> remarks = [];
  int indexcurrency = 1;
  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  bool requester = false;

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

  TextEditingController amount1 = TextEditingController();
  TextEditingController remarks1 = TextEditingController();
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
          title: Row(children: [
            Text('Accomodation',
                style: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
            SizedBox(width: 20),
            Icon(
              FontAwesomeIcons.hotel,
              color: Color.fromARGB(255, 1, 75, 148),
            )
          ]),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 5, top: 10, right: 1),
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
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.black26)),
                                  child: Column(
                                    children: [
                                      Row(children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.black26)),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Mode',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: DropdownMenu(
                                                            width: MediaQuery.of(context)
                                                                        .size
                                                                        .width /
                                                                    2 -
                                                                30,
                                                            hintText: 'Mode',
                                                            inputDecorationTheme: InputDecorationTheme(
                                                                hintStyle: TextStyle(
                                                                    color: Color.fromARGB(
                                                                        255,
                                                                        1,
                                                                        75,
                                                                        148)),
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                            onSelected: (s) {
                                                              if (s ==
                                                                  'select an option') {
                                                              } else {
                                                                if (currencymode
                                                                        .length ==
                                                                    0) {
                                                                  currencymode
                                                                      .add(s!);
                                                                } else {
                                                                  currencymode[
                                                                      0] = s!;
                                                                }
                                                                print(
                                                                    currencymode);
                                                              }
                                                            },
                                                            dropdownMenuEntries: [
                                                              'Select an option',
                                                              'Foreign Currency',
                                                              'Forex Card'
                                                            ]
                                                                .map((e) =>
                                                                    DropdownMenuEntry(
                                                                        label: e,
                                                                        value: e))
                                                                .toList()),
                                                      )
                                                    ]))),
                                        SizedBox(width: 5),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.black26)),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Currency',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: DropdownMenu(
                                                            hintText:
                                                                'Currency',
                                                            inputDecorationTheme: InputDecorationTheme(
                                                                hintStyle: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148)),
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                            onSelected: (s) {
                                                              if (s ==
                                                                  'select an option') {
                                                              } else {
                                                                if (currency
                                                                        .length ==
                                                                    0) {
                                                                  currency
                                                                      .add(s!);
                                                                } else {
                                                                  currency[0] =
                                                                      s!;
                                                                }
                                                                print(currency);
                                                              }
                                                            },
                                                            dropdownMenuEntries: [
                                                              'Select an option',
                                                              'EURO',
                                                              'GBP',
                                                              'SGD',
                                                              'USD'
                                                            ]
                                                                .map((e) =>
                                                                    DropdownMenuEntry(
                                                                        label:
                                                                            e,
                                                                        value:
                                                                            e))
                                                                .toList()),
                                                      )
                                                    ])))
                                      ]),
                                      SizedBox(height: 10),
                                      Row(children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.black26)),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Amount',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: TextFormField(
                                                            validator:
                                                                _validateRequired,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Amount',
                                                              hintStyle: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)),
                                                            ),
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .onUserInteraction,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            controller: amount1,
                                                            onEditingComplete:
                                                                () {
                                                              setState(() {
                                                                if (amount
                                                                        .length ==
                                                                    0) {
                                                                  amount.add(
                                                                      amount1
                                                                          .text);
                                                                } else {
                                                                  amount[0] =
                                                                      amount1
                                                                          .text;
                                                                }
                                                                print(amount);
                                                              });
                                                            },
                                                            onFieldSubmitted:
                                                                (s) {
                                                              setState(() {
                                                                if (amount
                                                                        .length ==
                                                                    0) {
                                                                  amount.add(
                                                                      amount1
                                                                          .text);
                                                                } else {
                                                                  amount[0] =
                                                                      amount1
                                                                          .text;
                                                                }
                                                                print(amount);
                                                              });
                                                            },
                                                          ))
                                                    ]))),
                                        SizedBox(width: 5),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.black26)),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Remarks',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: TextFormField(
                                                            validator:
                                                                _validateRequired,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .onUserInteraction,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Remarks',
                                                              hintStyle: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)),
                                                            ),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            controller:
                                                                remarks1,
                                                            onEditingComplete:
                                                                () {
                                                              setState(() {
                                                                if (remarks
                                                                        .length ==
                                                                    0) {
                                                                  remarks.add(
                                                                      remarks1
                                                                          .text);
                                                                } else {
                                                                  remarks[0] =
                                                                      remarks1
                                                                          .text;
                                                                }
                                                              });
                                                            },
                                                            onFieldSubmitted:
                                                                (s) {
                                                              setState(() {
                                                                if (remarks
                                                                        .length ==
                                                                    0) {
                                                                  remarks.add(
                                                                      remarks1
                                                                          .text);
                                                                } else {
                                                                  remarks[0] =
                                                                      remarks1
                                                                          .text;
                                                                }
                                                              });
                                                            },
                                                          ))
                                                    ]))),
                                      ]),
                                      SizedBox(height: 10),
                                      IconButton(
                                          onPressed: () {
                                            if (currencymode.isEmpty ||
                                                currency.isEmpty ||
                                                amount.isEmpty) {
                                              print("Error");
                                            } else {
                                              setState(() {
                                                indexcurrency += 1;
                                                print(currency);
                                                print(currencymode);
                                                print(amount);
                                                print(remarks);
                                              });
                                            }
                                          },
                                          icon: Icon(FontAwesomeIcons.add)),
                                    ],
                                  )),
                            ),
                            Column(
                                children: List.generate(indexcurrency, (index) {
                              TextEditingController amount1 =
                                  TextEditingController();
                              TextEditingController remarks1 =
                                  TextEditingController();
                              if (index != 0) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.black26)),
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
                                                              30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
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
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                              child:
                                                                  DropdownMenu(
                                                                      width: MediaQuery.of(context).size.width /
                                                                              2 -
                                                                          30,
                                                                      hintText:
                                                                          'Mode',
                                                                      inputDecorationTheme: InputDecorationTheme(
                                                                          hintStyle: TextStyle(
                                                                              color: Color.fromARGB(
                                                                                  255, 1, 75, 148)),
                                                                          border: InputBorder
                                                                              .none),
                                                                      onSelected:
                                                                          (s) {
                                                                        if (s ==
                                                                            'select an option') {
                                                                        } else {
                                                                          if (currencymode.length ==
                                                                              index) {
                                                                            currencymode.add(s!);
                                                                          } else {
                                                                            currencymode[index] =
                                                                                s!;
                                                                          }
                                                                        }
                                                                      },
                                                                      dropdownMenuEntries: [
                                                                        'Select an option',
                                                                        'Foreign Currency',
                                                                        'Forex Card'
                                                                      ]
                                                                          .map((e) => DropdownMenuEntry(
                                                                              label: e,
                                                                              value: e))
                                                                          .toList()),
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
                                                              30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
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
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                              child:
                                                                  DropdownMenu(
                                                                      hintText:
                                                                          'Currency',
                                                                      inputDecorationTheme:
                                                                          InputDecorationTheme(
                                                                        hintStyle: TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                1,
                                                                                75,
                                                                                148)),
                                                                        border:
                                                                            InputBorder.none,
                                                                      ),
                                                                      onSelected:
                                                                          (s) {
                                                                        if (s ==
                                                                            'select an option') {
                                                                        } else {
                                                                          if (currency.length ==
                                                                              index) {
                                                                            currency.add(s!);
                                                                          } else {
                                                                            currency[index] =
                                                                                s!;
                                                                          }
                                                                        }
                                                                      },
                                                                      dropdownMenuEntries: [
                                                                        'Select an option',
                                                                        'EURO',
                                                                        'GBP',
                                                                        'SGD',
                                                                        'USD'
                                                                      ]
                                                                          .map((e) => DropdownMenuEntry(
                                                                              label: e,
                                                                              value: e))
                                                                          .toList()),
                                                            )
                                                          ])))
                                            ]),
                                            SizedBox(height: 10),
                                            Row(children: [
                                              Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
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
                                                                child:
                                                                    TextFormField(
                                                                  validator:
                                                                      _validateRequired,
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  decoration: InputDecoration(
                                                                      hintText:
                                                                          'Amount',
                                                                      hintStyle: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148))),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  controller:
                                                                      amount1,
                                                                  onFieldSubmitted:
                                                                      (s) {
                                                                    setState(
                                                                        () {
                                                                      if (amount
                                                                              .length ==
                                                                          index) {
                                                                        amount.add(
                                                                            s);
                                                                      } else {
                                                                        amount[index] =
                                                                            s;
                                                                      }
                                                                      print(
                                                                          amount);
                                                                    });
                                                                  },
                                                                  onEditingComplete:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      if (amount
                                                                              .length ==
                                                                          index) {
                                                                        amount.add(
                                                                            amount1.text);
                                                                      } else {
                                                                        amount[index] =
                                                                            amount1.text;
                                                                      }
                                                                      print(
                                                                          amount);
                                                                    });
                                                                  },
                                                                ))
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
                                                              30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
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
                                                                  validator:
                                                                      _validateRequired,
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                  decoration: InputDecoration(
                                                                      hintText:
                                                                          'Remarks',
                                                                      hintStyle: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148))),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                  controller:
                                                                      remarks1,
                                                                  onFieldSubmitted:
                                                                      (s) {
                                                                    setState(
                                                                        () {
                                                                      if (remarks
                                                                              .length ==
                                                                          index) {
                                                                        remarks
                                                                            .add(s);
                                                                      } else {
                                                                        remarks[
                                                                            index] = s;
                                                                      }
                                                                    });
                                                                  },
                                                                  onEditingComplete:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      if (remarks
                                                                              .length ==
                                                                          index) {
                                                                        remarks.add(
                                                                            remarks1.text);
                                                                      } else {
                                                                        remarks[index] =
                                                                            remarks1.text;
                                                                      }
                                                                    });
                                                                  },
                                                                ))
                                                          ]))),
                                            ]),
                                            SizedBox(height: 10),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (currencymode.length ==
                                                            2 &&
                                                        currency.length == 2 &&
                                                        amount.length == 2 &&
                                                        remarks.length == 2) {
                                                      indexcurrency += 1;
                                                      print(currency);
                                                      print(currencymode);
                                                      print(amount);
                                                      print(remarks);
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
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center, // Center the text within the column
                                                                  ),
                                                                ],
                                                              ),
                                                              actions: <Widget>[
                                                                Center(
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(); // Close the dialog
                                                                    },
                                                                    child: Text(
                                                                        'OK'),
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
                                                icon:
                                                    Icon(FontAwesomeIcons.add)),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (currencymode.length ==
                                                            2 ||
                                                        currency.length == 2 ||
                                                        amount.length == 2 ||
                                                        remarks.length == 2) {
                                                      currencymode
                                                          .removeAt(index);
                                                      amount.removeAt(index);
                                                      currency.removeAt(index);
                                                      remarks.removeAt(index);
                                                      print(currencymode);
                                                      print(currency);
                                                      print(amount);
                                                      print(remarks);
                                                      indexcurrency -= 1;
                                                    } else {
                                                      print("error");
                                                      indexcurrency -= 1;
                                                    }
                                                  });
                                                },
                                                icon:
                                                    Icon(FontAwesomeIcons.cut))
                                          ],
                                        )));
                              } else {
                                return Container();
                              }
                            })),
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
                                      Icon(
                                          FontAwesomeIcons.personWalkingLuggage,
                                          size: 25,
                                          color:
                                              Color.fromARGB(255, 1, 75, 148)),
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
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          'Traveller Same as Requester*',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
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
                                                                'Approver Name',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextField(
                                                              controller:
                                                                  _approverController,
                                                            )
                                                          ]))),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                  'To change Approver this part')
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
                                                                    color: Colors
                                                                        .black26),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Padding(
                                                                padding: const EdgeInsets.only(
                                                                    left: 8.0),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          'Traveller Name',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold)),
                                                                      TextField(
                                                                          controller:
                                                                              _travellernameController)
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
                                                                        left:
                                                                            8.0),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          'Traveller Gender',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold)),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
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
                                                            width: MediaQuery.of(context)
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
                                                                        .circular(
                                                                            5)),
                                                            child: Padding(
                                                                padding: const EdgeInsets.only(
                                                                    left: 8.0),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          'Level/Designation',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold)),
                                                                      TextField(
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
                                                                    color: Colors
                                                                        .black26),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
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
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold)),
                                                                      TextField(
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
                                                                  color: Colors
                                                                      .black26),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Padding(
                                                              padding: const EdgeInsets.only(
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
                                                                    TextField(
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
                                                                  color: Colors
                                                                      .black26),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Padding(
                                                              padding: const EdgeInsets.only(
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
                                                                    TextField(
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
                                                            'Debit Expenses from*',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(children: [
                                                          Radio(
                                                              value:
                                                                  'Cost Center',
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
                                                                'Cost Center/Project Name',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextField(
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
                                                                'Requester Name',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextField(
                                                                controller:
                                                                    _requesternameController)
                                                          ]))),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Container(
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
                                                        Text('Comments',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        TextField(
                                                            controller:
                                                                _commentsController)
                                                      ])))
                                        ])))
                          ])),
                      TextButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate() &&
                                currencymode.isNotEmpty &&
                                currency.isNotEmpty &&
                                amount.isNotEmpty &&
                                remarks.isNotEmpty) {
                              var d = await DataBaseHelper.insertItemOneWayDom({
                                ...widget.data,
                                'currencymode': currencymode.join(','),
                                'currency': currency.join(','),
                                'amount': amount.join(','),
                                'remarks': remarks.join(','),
                                'approver': _approverController.text,
                                'travellername': _travellernameController.text,
                                'travellergender':
                                    _travellergenderController.text,
                                'travellerlevel': _levelController.text,
                                'department': _departmentController.text,
                                'email': _travelleremailController.text,
                                'mobileno': _travellermobilenoContorller.text,
                                'debitexpenses': _debitexpensesController.text,
                                'costorproject': _costorprojectController.text,
                                'requester': _requesternameController.text,
                                'comments': _commentsController.text
                              }, 'accomodation');
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
                          child: Text('Save Data'))
                    ])))));
  }
}
