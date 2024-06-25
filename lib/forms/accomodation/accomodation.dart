import 'package:bonvoyage/forms/accomodation/accomodationtraveladvance.dart';
import 'package:bonvoyage/screens/dashboard.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class AccomodationPage extends StatefulWidget {
  const AccomodationPage({super.key});

  @override
  State<AccomodationPage> createState() => _AccomodationPageState();
}

class _AccomodationPageState extends State<AccomodationPage> {
  TextEditingController _accomodationController = TextEditingController();
  TextEditingController _occupancyController = TextEditingController();
  TextEditingController _hotelController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _checkinController = TextEditingController();
  TextEditingController _checkoutController = TextEditingController();
  TextEditingController _peopleController = TextEditingController();
  TextEditingController _adultsController = TextEditingController();
  TextEditingController _childrenController = TextEditingController();
  TextEditingController _roomsController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();
  List<bool> _accom2 = [false, false];
  List<bool> _occupancy = [false, false, false];
  Color c1 = Color.fromARGB(255, 191, 218, 240);
  Color c2 = Color.fromARGB(255, 1, 75, 148);
  int peeps = 0;
  List<String> currencymode = [];
  List<String> currency = [];
  List<String> amount = [];
  List<String> remarks = [];
  int indexcurrency = 1;
  final formkey = GlobalKey<FormState>();
  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  bool show = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accomodationController.text = 'Private House';
    _accom2[0] = true;
  }

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
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => DashBoard()));
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
                  child: ListView(
                    children: [
                      UsernameCard(),
                      Stack(
                        children: [
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
                                    Row(children: [
                                      Icon(FontAwesomeIcons.house,
                                          size: 24,
                                          color:
                                              Color.fromARGB(255, 1, 75, 148)),
                                      SizedBox(width: 10),
                                      Text(
                                        'Accomodation Details',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 1, 75, 148),
                                            fontSize: 24),
                                      )
                                    ]),
                                    SizedBox(height: 20),
                                    Row(children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              50,
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
                                                Text('Accomodation Type:',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148),
                                                        fontSize: 12)),
                                                ToggleButtons(
                                                  color: Colors.black,
                                                  fillColor: Colors.transparent,
                                                  renderBorder: false,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  children: [
                                                    Tooltip(
                                                        message: 'house',
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .manual,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _accom2[0]
                                                                ? c2
                                                                : c1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          child: ImageIcon(
                                                              AssetImage(
                                                                  'assets/images/accommodation_btn_icon.png'),
                                                              size: 24,
                                                              color: _accom2[0]
                                                                  ? Colors.white
                                                                  : Colors.blue[
                                                                      300]),
                                                        )),
                                                    Tooltip(
                                                        message: 'hotel',
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .manual,
                                                        child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _accom2[1]
                                                                  ? c2
                                                                  : c1,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                            ),
                                                            child: ImageIcon(
                                                                AssetImage(
                                                                    'assets/images/hotel_btn_icon.png'),
                                                                size: 24,
                                                                color: _accom2[
                                                                        1]
                                                                    ? Colors
                                                                        .white
                                                                    : Colors.blue[
                                                                        300])))
                                                  ],
                                                  isSelected: _accom2,
                                                  onPressed: (int index) {
                                                    setState(() {
                                                      for (int i = 0;
                                                          i < _accom2.length;
                                                          i++) {
                                                        _accom2[i] = i == index;
                                                      }
                                                    });
                                                    if (index == 0 &&
                                                        _accom2[index] ==
                                                            true) {
                                                      _accomodationController
                                                              .text =
                                                          'Private House';
                                                    } else if (index == 1 &&
                                                        _accom2[index] ==
                                                            true) {
                                                      _accomodationController
                                                          .text = 'Hotel';
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              50,
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
                                                Text('Occupancy:',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 1, 75, 148),
                                                        fontSize: 12)),
                                                ToggleButtons(
                                                  color: Colors.black,
                                                  fillColor: Colors.transparent,
                                                  renderBorder: false,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  children: [
                                                    Tooltip(
                                                        message: 'Single',
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .manual,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _occupancy[0]
                                                                ? c2
                                                                : c1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          child: ImageIcon(
                                                              AssetImage(
                                                                  'assets/images/1_Occupancy_btn_icon.png'),
                                                              size: 24,
                                                              color: _occupancy[
                                                                      0]
                                                                  ? Colors.white
                                                                  : Colors.blue[
                                                                      300]),
                                                        )),
                                                    Tooltip(
                                                        message: 'Couple',
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .manual,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _occupancy[1]
                                                                ? c2
                                                                : c1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          child: ImageIcon(
                                                              AssetImage(
                                                                  'assets/images/2_Occupancies_btn_icon.png'),
                                                              size: 24,
                                                              color: _occupancy[
                                                                      1]
                                                                  ? Colors.white
                                                                  : Colors.blue[
                                                                      300]),
                                                        )),
                                                    Tooltip(
                                                        message: 'Many',
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .manual,
                                                        child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  _occupancy[2]
                                                                      ? c2
                                                                      : c1,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                            ),
                                                            child: ImageIcon(
                                                                AssetImage(
                                                                    'assets/images/3_Occupancies_btn_icon.png'),
                                                                size: 24,
                                                                color: _occupancy[
                                                                        2]
                                                                    ? Colors
                                                                        .white
                                                                    : Colors.blue[
                                                                        300])))
                                                  ],
                                                  isSelected: _occupancy,
                                                  onPressed: (int index) {
                                                    setState(() {
                                                      for (int i = 0;
                                                          i < _occupancy.length;
                                                          i++) {
                                                        _occupancy[i] =
                                                            i == index;
                                                      }
                                                    });
                                                    if (index == 0 &&
                                                        _occupancy[index] ==
                                                            true) {
                                                      _occupancyController
                                                          .text = 'Single';
                                                    } else if (index == 1 &&
                                                        _accom2[index] ==
                                                            true) {
                                                      _occupancyController
                                                          .text = 'Couple';
                                                    } else if (index == 2 &&
                                                        _occupancy[index] ==
                                                            true) {
                                                      _occupancyController
                                                          .text = 'Family';
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          )),
                                    ]),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                50,
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
                                                Text('Hotel Preference',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextFormField(
                                                  controller: _hotelController,
                                                  autovalidateMode:
                                                      _accomodationController
                                                                  .text ==
                                                              'Hotel'
                                                          ? AutovalidateMode
                                                              .onUserInteraction
                                                          : AutovalidateMode
                                                              .disabled,
                                                  validator:
                                                      _accomodationController
                                                                  .text ==
                                                              'Hotel'
                                                          ? _validateRequired
                                                          : (s) {},
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'Hotel Preference',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
                                                      constraints: BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              100)),
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                50,
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
                                                Text('City',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextFormField(
                                                  controller: _cityController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  decoration: InputDecoration(
                                                      hintText: 'City',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
                                                      constraints: BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              100)),
                                                ),
                                              ],
                                            )),
                                      )
                                    ]),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                50,
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
                                                Text('Check In',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Stack(
                                                  children: [
                                                    TextFormField(
                                                      controller:
                                                          _checkinController,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      validator:
                                                          _validateRequired,
                                                      readOnly: true,
                                                      decoration: InputDecoration(
                                                          hintText: 'Check In',
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
                                                            _checkinController
                                                                .text = DateFormat(
                                                                    "yyyy-MM-dd HH-mm-ss")
                                                                .format(
                                                                    pickeddate);
                                                          });
                                                        }
                                                      },
                                                    ),
                                                    _checkinController.text !=
                                                            ''
                                                        ? Container()
                                                        : Positioned(
                                                            top: 10,
                                                            right: 3,
                                                            child: Icon(
                                                                FontAwesomeIcons
                                                                    .calendar))
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                50,
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
                                                Text('Check Out',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Stack(
                                                  children: [
                                                    TextFormField(
                                                        controller:
                                                            _checkoutController,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                        validator:
                                                            _validateRequired,
                                                        readOnly: true,
                                                        decoration: InputDecoration(
                                                            hintText:
                                                                'Check Out',
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
                                                              _checkoutController
                                                                  .text = DateFormat(
                                                                      "yyyy-MM-dd HH-mm-ss")
                                                                  .format(
                                                                      pickeddate);
                                                            });
                                                          }
                                                        }),
                                                    _checkoutController.text !=
                                                            ''
                                                        ? Container()
                                                        : Positioned(
                                                            top: 10,
                                                            right: 3,
                                                            child: Icon(
                                                                FontAwesomeIcons
                                                                    .calendar))
                                                  ],
                                                ),
                                              ],
                                            )),
                                      )
                                    ]),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                50,
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
                                                Text('No of People',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextFormField(
                                                  controller: _peopleController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: _validateRequired,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                      hintText: 'No of People',
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148)),
                                                      constraints: BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              100)),
                                                  onFieldSubmitted: (s) {
                                                    setState(() {
                                                      peeps = int.parse(
                                                              _peopleController
                                                                  .text) +
                                                          1;
                                                    });
                                                  },
                                                  onChanged: (s) {
                                                    setState(() {
                                                      peeps = int.parse(
                                                              _peopleController
                                                                  .text) +
                                                          1;
                                                    });
                                                  },
                                                ),
                                              ],
                                            )),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                50,
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
                                                Text('No of Rooms',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                DropdownMenu(
                                                    width: MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2 -
                                                        50,
                                                    hintText: 'No of Rooms',
                                                    inputDecorationTheme:
                                                        InputDecorationTheme(
                                                            hintStyle: TextStyle(
                                                                color: Color.fromARGB(
                                                                    255, 1, 75, 148)),
                                                            border: InputBorder
                                                                .none),
                                                    onSelected: (s) {
                                                      setState(() {
                                                        _roomsController.text =
                                                            '$s';
                                                      });
                                                    },
                                                    controller:
                                                        _roomsController,
                                                    dropdownMenuEntries:
                                                        List.generate(5, (index) => index)
                                                            .map((e) =>
                                                                DropdownMenuEntry(
                                                                    label: '$e',
                                                                    value: e))
                                                            .toList()),
                                              ],
                                            )),
                                      )
                                    ]),
                                    SizedBox(height: 10),
                                    Column(children: [
                                      _peopleController.text.isEmpty
                                          ? Container()
                                          : Row(children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    50,
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
                                                        Text('Adults',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        DropdownMenu(
                                                          width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              50,
                                                          hintText: 'Adults',
                                                          inputDecorationTheme:
                                                              InputDecorationTheme(
                                                            hintStyle: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        1,
                                                                        75,
                                                                        148)),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          onSelected: (s) {
                                                            setState(() {
                                                              _adultsController
                                                                  .text = '$s';
                                                              peeps = peeps -
                                                                  int.parse(s
                                                                      .toString());
                                                            });
                                                          },
                                                          controller:
                                                              _adultsController,
                                                          dropdownMenuEntries: (_peopleController
                                                                  .text
                                                                  .isNotEmpty)
                                                              ? List.generate(
                                                                      peeps,
                                                                      (index) =>
                                                                          index)
                                                                  .map((e) =>
                                                                      DropdownMenuEntry(
                                                                          label:
                                                                              '$e',
                                                                          value:
                                                                              e))
                                                                  .toList()
                                                              : [], // Empty list when _peopleController is empty
                                                        )
                                                      ],
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    50,
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
                                                        Text('Children',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        DropdownMenu(
                                                            width: MediaQuery.of(context)
                                                                        .size
                                                                        .width /
                                                                    2 -
                                                                50,
                                                            hintText:
                                                                'Children',
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
                                                              setState(() {
                                                                _childrenController
                                                                        .text =
                                                                    '$s';
                                                              });
                                                            },
                                                            controller:
                                                                _childrenController,
                                                            dropdownMenuEntries: List.generate(
                                                                    (_adultsController.text)
                                                                            .isEmpty
                                                                        ? 0
                                                                        : peeps,
                                                                    (index) =>
                                                                        index)
                                                                .map((e) => DropdownMenuEntry(label: '$e', value: e))
                                                                .toList()),
                                                      ],
                                                    )),
                                              ),
                                            ]),
                                      SizedBox(height: 10),
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
                                                    left: 8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Remarks',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextFormField(
                                                      controller:
                                                          _remarksController,
                                                      decoration: InputDecoration(
                                                          hintText: 'Remarks',
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
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      )
                                    ]),
                                  ]),
                                )),
                          ),
                        ],
                      ),
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
                                    Row(children: [
                                      Icon(FontAwesomeIcons.handshake,
                                          size: 24,
                                          color:
                                              Color.fromARGB(255, 1, 75, 148)),
                                      SizedBox(width: 10),
                                      Text(
                                        'Travel Advance',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 1, 75, 148),
                                            fontSize: 24),
                                      )
                                    ]),
                                  ])))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // TextButton(
                          //     onPressed: () {},
                          //     child: Container(
                          //         width: 100,
                          //         height: 40,
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             color: Colors.green),
                          //         child: Center(
                          //           child: Text('Save',
                          //               style: TextStyle(
                          //                   color: Colors.white, fontSize: 20)),
                          //         ))),
                          TextButton(
                              onPressed: () {
                                if (_peopleController.text.isEmpty) {
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
                                                'Please Enter No of People.',
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
                                } else {
                                  if (formkey.currentState!.validate() &&
                                      _accomodationController.text != '' &&
                                      _occupancyController.text != '' &&
                                      _peopleController.text != '') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                AccomTravelAdvance(data: {
                                                  'accomodation':
                                                      _accomodationController
                                                          .text,
                                                  'occupancy':
                                                      _occupancyController.text,
                                                  'hotel':
                                                      _hotelController.text,
                                                  'city': _cityController.text,
                                                  'checkin':
                                                      _checkinController.text,
                                                  'checkout':
                                                      _checkoutController.text,
                                                  'people':
                                                      _peopleController.text,
                                                  'adults':
                                                      _adultsController.text,
                                                  'children':
                                                      _childrenController.text,
                                                  'rooms':
                                                      _roomsController.text,
                                                  'remarks':
                                                      _remarksController.text
                                                })));
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
                              onPressed: () {
                                // setState(() {
                                //   _accomodationController.clear();
                                //   _occupancyController.clear();
                                //   _hotelController.clear();
                                //   _checkinController.clear();
                                //   _checkoutController.clear();
                                //   _cityController.clear();
                                //   _peopleController.clear();
                                //   _roomsController.clear();
                                //   _adultsController.clear();
                                //   _childrenController.clear();
                                //   _remarksController.clear();
                                // });
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AccomodationPage()));
                              },
                              child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          255, 131, 14, 5)),
                                  child: Center(
                                    child: Text('Clear',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  )))
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
