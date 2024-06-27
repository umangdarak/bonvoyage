import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/screens/dashboard.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CarBooking extends StatefulWidget {
  const CarBooking({super.key});

  @override
  State<CarBooking> createState() => _CarBookingState();
}

class _CarBookingState extends State<CarBooking> {
  String gender = 'Male';

  //all bool variables
  bool tripdetails = false;
  bool travellerdetails = false;
  bool requester = true;
  final formkey = GlobalKey<FormState>();

  TextEditingController _fromplaceController = TextEditingController();
  TextEditingController _placestovisitController = TextEditingController();
  TextEditingController _peopleController = TextEditingController();
  TextEditingController _cartypeController = TextEditingController();
  TextEditingController _fromdateController = TextEditingController();
  TextEditingController _todateController = TextEditingController();
  TextEditingController _pickupdetailsController = TextEditingController();
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
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _approverController = TextEditingController();

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
            children: [
              Text('Car', style: TextStyle(color: Colors.amber)),
              Icon(
                FontAwesomeIcons.car,
                color: Colors.amber,
              )
            ],
          ),
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
              child: ListView(children: [
                SizedBox(
                  height: 5,
                ),
                UsernameCard(),
                SizedBox(
                  height: 10,
                ),
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
                          Icon(Icons.location_on,
                              size: 25, color: Color.fromARGB(255, 1, 75, 148)),
                          SizedBox(width: 5),
                          Text('Trip Details',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 1, 75, 148)))
                        ]),
                        Icon(Icons.arrow_drop_down,
                            size: 25, color: Color.fromARGB(255, 1, 75, 148))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: formkey,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 8, bottom: 8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Row(children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('From Place',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextFormField(
                                            controller: _fromplaceController,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: _validateRequired,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: 'From Place',
                                                labelStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148)),
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Places to Visit',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextFormField(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: _validateRequired,
                                              decoration: InputDecoration(
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never,
                                                  labelText: 'Places to Visit',
                                                  labelStyle: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 1, 75, 148)),
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              100)),
                                              controller:
                                                  _placestovisitController),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text('No of People',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          DropdownMenu(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  40,
                                              hintText: "No of People",
                                              inputDecorationTheme:
                                                  InputDecorationTheme(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148)),
                                              ),
                                              onSelected: (i) {
                                                _peopleController.text = "$i";
                                              },
                                              dropdownMenuEntries:
                                                  List.generate(
                                                          20, (index) => index)
                                                      .map((e) =>
                                                          DropdownMenuEntry(
                                                              label: '$e',
                                                              value: e))
                                                      .toList()),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Car Type',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextFormField(
                                            controller: _cartypeController,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: _validateRequired,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: 'Car Type',
                                                labelStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148)),
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          40,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black26),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('From Date',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextFormField(
                                                  controller:
                                                      _fromdateController,
                                                  readOnly: true,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  decoration: InputDecoration(
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      labelText: 'From Date',
                                                      labelStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
                                                      constraints: BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              100)),
                                                  onTap: () async {
                                                    DateTime? d =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime.now(),
                                                            lastDate:
                                                                DateTime(2101));
                                                    TimeOfDay? t =
                                                        await showTimePicker(
                                                            initialTime:
                                                                TimeOfDay.now(),
                                                            context: context);

                                                    // Check if d and t are not null
                                                    DateTime pickeddate =
                                                        DateTime(
                                                      d!.year,
                                                      d.month,
                                                      d.day,
                                                      t!.hour,
                                                      t.minute,
                                                    );
                                                    setState(() {
                                                      _fromdateController
                                                          .text = DateFormat(
                                                              "yyyy-MM-dd HH-mm")
                                                          .format(pickeddate);
                                                    });
                                                  })
                                            ]),
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          40,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black26),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('To Date',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextFormField(
                                                  controller: _todateController,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  readOnly: true,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  decoration: InputDecoration(
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      labelText: 'To Date',
                                                      labelStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
                                                      constraints: BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              100)),
                                                  onTap: () async {
                                                    if (_fromdateController
                                                            .text ==
                                                        '') {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Please select from date'),
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
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      DateFormat e = DateFormat(
                                                          "yyyy-MM-dd HH-mm");
                                                      DateTime? d = await showDatePicker(
                                                          context: context,
                                                          initialDate: e.parse(
                                                              _fromdateController
                                                                  .text),
                                                          firstDate: e.parse(
                                                              _fromdateController
                                                                  .text),
                                                          lastDate:
                                                              DateTime(2101));
                                                      TimeOfDay? t =
                                                          await showTimePicker(
                                                              context: context,
                                                              initialTime:
                                                                  TimeOfDay
                                                                      .now());
                                                      DateTime pickeddate =
                                                          DateTime(
                                                        d!.year,
                                                        d.month,
                                                        d.day,
                                                        t!.hour,
                                                      );
                                                      if (pickeddate != null) {
                                                        setState(() {
                                                          _todateController
                                                              .text = DateFormat(
                                                                  "yyyy-MM-dd")
                                                              .format(
                                                                  pickeddate);
                                                        });
                                                      }
                                                    }
                                                  })
                                            ]),
                                      )),
                                ]),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black26),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Pick Up Details',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextFormField(
                                          controller: _pickupdetailsController,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: _validateRequired,
                                          decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              labelText: 'Pick Up Details',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148)),
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          100)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          Icon(
                                              FontAwesomeIcons
                                                  .personWalkingLuggage,
                                              size: 25,
                                              color: Color.fromARGB(
                                                  255, 1, 75, 148)),
                                          SizedBox(width: 5),
                                          Text('Traveller Details',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148)))
                                        ]),
                                        Icon(Icons.arrow_drop_down,
                                            size: 25,
                                            color:
                                                Color.fromARGB(255, 1, 75, 148))
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Column(
                                            children: [
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              40,
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
                                                                    'Traveller Name',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                TextFormField(
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    validator:
                                                                        _validateRequired,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      floatingLabelBehavior:
                                                                          FloatingLabelBehavior
                                                                              .never,
                                                                      labelText:
                                                                          'Traveller Name',
                                                                      labelStyle: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148)),
                                                                    ),
                                                                    readOnly:
                                                                        true,
                                                                    controller:
                                                                        _travellernameController)
                                                              ]))),
                                                  SizedBox(width: 10),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black26),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
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
                                                                            value:
                                                                                'Male',
                                                                            onChanged:
                                                                                (i) {
                                                                              setState(() {
                                                                                _travellergenderController.text = i!;
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
                                                                              setState(() {
                                                                                _travellergenderController.text = i!;
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              40,
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
                                                                    'Level/Designation',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                TextFormField(
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    validator:
                                                                        _validateRequired,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      floatingLabelBehavior:
                                                                          FloatingLabelBehavior
                                                                              .never,
                                                                      labelText:
                                                                          'Level/Designation',
                                                                      labelStyle: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148)),
                                                                    ),
                                                                    readOnly:
                                                                        true,
                                                                    controller:
                                                                        _levelController)
                                                              ]))),
                                                  SizedBox(width: 10),
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              40,
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
                                                                    'Function/Department',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                TextFormField(
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    validator:
                                                                        _validateRequired,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      floatingLabelBehavior:
                                                                          FloatingLabelBehavior
                                                                              .never,
                                                                      labelText:
                                                                          'Department',
                                                                      labelStyle: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148)),
                                                                    ),
                                                                    readOnly:
                                                                        true,
                                                                    controller:
                                                                        _departmentController)
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
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black26),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Padding(
                                                        padding: const EdgeInsets
                                                            .only(left: 8.0),
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
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                  validator:
                                                                      _validateRequired,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    floatingLabelBehavior:
                                                                        FloatingLabelBehavior
                                                                            .never,
                                                                    labelText:
                                                                        'Traveller Email',
                                                                    labelStyle: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148)),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  controller:
                                                                      _travelleremailController)
                                                            ]))),
                                                SizedBox(width: 10),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            40,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black26),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Padding(
                                                        padding: const EdgeInsets
                                                            .only(left: 8.0),
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
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                  validator:
                                                                      _validateRequired,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    floatingLabelBehavior:
                                                                        FloatingLabelBehavior
                                                                            .never,
                                                                    labelText:
                                                                        'Traveller Mobile No',
                                                                    labelStyle: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148)),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  controller:
                                                                      _travellermobilenoContorller)
                                                            ]))),
                                              ]),
                                            ],
                                          ),
                                          SizedBox(height: 10),
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
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text('Approver Name',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: TextFormField(
                                                      controller:
                                                          _approverController,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      validator:
                                                          _validateRequired,
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              'Approver Name',
                                                          hintStyle: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148)),
                                                          constraints: BoxConstraints(
                                                              maxWidth: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  100)),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
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
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextFormField(
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .onUserInteraction,
                                                                validator:
                                                                    _validateRequired,
                                                                decoration:
                                                                    InputDecoration(
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .never,
                                                                  labelText:
                                                                      'Cost Center/Project Name',
                                                                  labelStyle: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)),
                                                                ),
                                                                readOnly: true,
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
                                                            TextFormField(
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .onUserInteraction,
                                                                validator:
                                                                    _validateRequired,
                                                                decoration:
                                                                    InputDecoration(
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .never,
                                                                  labelText:
                                                                      'Requester Name',
                                                                  labelStyle: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)),
                                                                ),
                                                                readOnly: true,
                                                                controller:
                                                                    _requesternameController)
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
                                                            Text('Purpose',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextFormField(
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .onUserInteraction,
                                                                validator:
                                                                    _validateRequired,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Purpose',
                                                                  labelStyle: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)),
                                                                ),
                                                                controller:
                                                                    _purposeController)
                                                          ]))),
                                              SizedBox(width: 10),
                                              Container(
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
                                                            Text('Comments',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Comments',
                                                                  labelStyle: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)),
                                                                ),
                                                                controller:
                                                                    _commentsController)
                                                          ]))),
                                            ],
                                          ),
                                        ])),
                                SizedBox(height: 10),
                              ]))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            var d = await DataBaseHelper.insertItemOneWayDom({
                              'fromplace': _fromplaceController.text,
                              'places': _placestovisitController.text,
                              'people': _peopleController.text,
                              'cartype': _cartypeController.text,
                              'fromdate': _fromdateController.text,
                              'todate': _todateController.text,
                              'pickupdetails': _pickupdetailsController.text,
                              'travellername': _travellernameController.text,
                              'travellergender':
                                  _travellergenderController.text,
                              'level': _levelController.text,
                              'department': _departmentController.text,
                              'email': _travelleremailController.text,
                              'approver': _approverController.text,
                              'mobileno': _travellermobilenoContorller.text,
                              'debitexpenses': _debitexpensesController.text,
                              'project': _costorprojectController.text,
                              'requester': _requesternameController.text,
                              'comments': _commentsController.text,
                              'purpose': _purposeController.text
                            }, 'carbooking');
                            var c = await DataBaseHelper.readOneWayDom(
                                'carbooking');
                            print(c);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => DashBoard()));
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
                        child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 1, 75, 148)),
                            child: Center(
                              child: Text('Submit',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ))),
                    TextButton(
                        onPressed: () async {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => CarBooking()));
                        },
                        child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 131, 14, 5)),
                            child: Center(
                              child: Text('Clear',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ))),
                  ],
                )
              ]),
            )));
  }
}
