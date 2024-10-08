import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/main.dart';
import 'package:bonvoyage/screens/dashboard.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BusForm extends StatefulWidget {
  String destination;
  BusForm({super.key, required this.destination});

  @override
  State<BusForm> createState() => _BusFormState();
}

class _BusFormState extends State<BusForm> {
  TextEditingController _travellerController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _approverController = TextEditingController();
  TextEditingController _requesterController = TextEditingController();
  TextEditingController _goingtoController = TextEditingController();
  TextEditingController _peopleController = TextEditingController();
  TextEditingController _traveldateController = TextEditingController();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _commentsController = TextEditingController();
  TextEditingController _debitexpensesController = TextEditingController();
  TextEditingController _costorprojectController = TextEditingController();
  TextEditingController _droplocationController = TextEditingController();
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
    _goingtoController.text = widget.destination;
    // _travellerController.text = "Umang";
    // _genderController.text = "Male";
    // _emailController.text = "abc@gmail.com";
    // _mobileController.text = "909999999";
    // _designationController.text = "xyz";
    // _departmentController.text = "abc";
    // _approverController.text = "ddc";
    // _requesterController.text = "Umang";
    // _debitexpensesController.text = "Cost Center";
    // _costorprojectController.text = "project";
    _peopleController.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    _travellerController.text = auth.current.employeeName;
    _genderController.text =
        auth.current.sex == 'M' ? "Male" : "Female";
    _emailController.text = auth.current.emailId;
    _mobileController.text = auth.current.mobileNo;
    _designationController.text = auth.current.descName;
    _departmentController.text = auth.current.deptName;
    _debitexpensesController.text = "Cost Center";
    _costorprojectController.text = auth.current.costCentre;
    _requesterController.text = auth.current.employeeName;
    _approverController.text = auth.current.managerName;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leadingWidth: 25,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => DashBoard()));
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.amber)),
          title: Row(children: [
            Text('Company Bus',
                style: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
            SizedBox(width: 20),
            Icon(
              FontAwesomeIcons.busSimple,
              color: Color.fromARGB(255, 1, 75, 148),
            )
          ]),
        ),
        body: Form(
          key: formkey,
          child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 10, right: 1),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Bon_Voyage_Login_BG.gif'),
                          fit: BoxFit.fitWidth),
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView(children: [
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 4.0,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  UsernameCard(),
                                  Row(children: [
                                    Icon(FontAwesomeIcons.locationDot,
                                        size: 24,
                                        color: Color.fromARGB(255, 1, 75, 148)),
                                    SizedBox(width: 10),
                                    Text(
                                      'Travel details',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 1, 75, 148),
                                          fontSize: 24),
                                    )
                                  ]),
                                  SizedBox(height: 20),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Traveller Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: TextFormField(
                                              controller: _travellerController,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: _validateRequired,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                  hintText: 'Traveller Name',
                                                  hintStyle: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 1, 75, 148)),
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              100)),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                10,
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
                                                Text('Traveller Gender',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Radio(
                                                          value: 'Male',
                                                          onChanged: (i) {
                                                            setState(() {
                                                              _genderController
                                                                      .text =
                                                                  i.toString();
                                                            });
                                                          },
                                                          groupValue:
                                                              _genderController
                                                                  .text,
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
                                                              _genderController
                                                                      .text =
                                                                  i.toString();
                                                            });
                                                          },
                                                          groupValue:
                                                              _genderController
                                                                  .text,
                                                        ),
                                                        Text('Female')
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black26),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Level/Designation',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: TextFormField(
                                                  controller:
                                                      _designationController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  readOnly: true,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'Level/Designation',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
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
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                            Text('Function/Department',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: TextFormField(
                                                  readOnly: true,
                                                  controller:
                                                      _departmentController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'Function/Department',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
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
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                            Text('Traveller Email',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: TextFormField(
                                                  controller: _emailController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'Traveller Email',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
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
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                            Text('Traveller Mobile',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: TextFormField(
                                                  controller: _mobileController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  decoration: InputDecoration(
                                                      hintText: 'Mobile Number',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
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
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                            Text('Approver Name',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: TextFormField(
                                                  controller:
                                                      _approverController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  decoration: InputDecoration(
                                                      hintText: 'Approver Name',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
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
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                            Text('Requester Name',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: TextFormField(
                                                  readOnly: true,
                                                  controller:
                                                      _requesterController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'Requester Name',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
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
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                            Text('Going to',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: TextFormField(
                                                  controller:
                                                      _goingtoController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  decoration: InputDecoration(
                                                      hintText: 'Going to',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
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
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('No of People',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              DropdownMenu(
                                                controller: _peopleController,
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    20,
                                                inputDecorationTheme:
                                                    InputDecorationTheme(
                                                        border:
                                                            InputBorder.none),
                                                dropdownMenuEntries:
                                                    List.generate(
                                                        6,
                                                        (int index) =>
                                                            DropdownMenuEntry(
                                                                value: "$index",
                                                                label:
                                                                    "$index")),
                                                onSelected: (value) {
                                                  setState(() {
                                                    _peopleController.text =
                                                        "$value";
                                                  });
                                                },
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                            Text('Travel Date',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Stack(
                                                  children: [
                                                    TextFormField(
                                                        controller:
                                                            _traveldateController,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                        validator:
                                                            _validateRequired,
                                                        readOnly: true,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                'Travel Date',
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
                                                        onTap: () async {
                                                          DateTime? d =
                                                              await showDatePicker(
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
                                                          TimeOfDay? t =
                                                              await showTimePicker(
                                                                  context:
                                                                      context,
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
                                                          if (pickeddate !=
                                                              null) {
                                                            setState(() {
                                                              _traveldateController
                                                                  .text = DateFormat(
                                                                      "yyyy-MM-dd HH-mm-ss")
                                                                  .format(
                                                                      pickeddate);
                                                            });
                                                          }
                                                        }),
                                                    Positioned(
                                                        top: 10,
                                                        right: 2,
                                                        child: Icon(
                                                            FontAwesomeIcons
                                                                .calendar))
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                      height: 80,
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
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        'Cost Center/Project Name',
                                                        overflow: TextOverflow
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
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148)),
                                                        ),
                                                        readOnly: true,
                                                        controller:
                                                            _costorprojectController)
                                                  ]))),
                                      SizedBox(
                                        width: 10,
                                      ),
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
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Drop Location',
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
                                                              'Drop Location',
                                                          labelStyle: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148)),
                                                        ),
                                                        controller:
                                                            _droplocationController)
                                                  ]))),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          20,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black26),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Purpose',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: TextFormField(
                                                controller: _purposeController,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: _validateRequired,
                                                decoration: InputDecoration(
                                                    hintText: 'Purpose',
                                                    hintStyle: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148)),
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
                                    SizedBox(width: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          20,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black26),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Comments',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: TextFormField(
                                                controller: _commentsController,
                                                decoration: InputDecoration(
                                                    hintText: 'Comments',
                                                    hintStyle: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148)),
                                                    constraints: BoxConstraints(
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            100)),
                                              )),
                                        ],
                                      ),
                                    )
                                  ]),
                                ])))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate() &&
                                  _peopleController.text != '' &&
                                  _peopleController.text != "0" &&
                                  _genderController.text != '') {
                                await DataBaseHelper.insertItemOneWayDom({
                                  "name": _travellerController.text,
                                  "gender": _genderController.text,
                                  "level": _designationController.text,
                                  "department": _departmentController.text,
                                  "email": _emailController.text,
                                  "mobileno": _mobileController.text,
                                  "approver": _approverController.text,
                                  "requester": _requesterController.text,
                                  "goingto": _goingtoController.text,
                                  "people": _peopleController.text,
                                  "traveldate": _traveldateController.text,
                                  "purpose": _purposeController.text,
                                  "comments": _commentsController.text,
                                  "droplocation": _droplocationController.text,
                                  "debitexpenses":
                                      _debitexpensesController.text,
                                  "costorproject": _costorprojectController.text
                                }, "companybus");
                                print(await DataBaseHelper.readOneWayDom(
                                    'companybus'));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DashBoard()));
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => BusForm(
                                            destination: widget.destination,
                                          )));
                            },
                            child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromARGB(255, 131, 14, 5)),
                                child: Center(
                                  child: Text('Clear',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ))),
                      ],
                    )
                  ]))),
        ));
  }
}
