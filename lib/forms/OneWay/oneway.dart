import 'package:bonvoyage/classmodels/oneway/OneWayModel.dart';
import 'package:bonvoyage/forms/OneWay/onewaymisc.dart';
import 'package:bonvoyage/forms/OneWay/onewaymiscInternational.dart';
import 'package:bonvoyage/main.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:bonvoyage/screens/dashboard.dart';
import 'package:provider/provider.dart';

class OneWay extends StatefulWidget {
  bool isInternational;
  String? name;
  String? password;
  OneWayModelNormal? modelpassed;
  OneWayModelInternational? modelpassedinternational;
  OneWay(
      {super.key,
      required this.isInternational,
      this.name,
      this.password,
      this.modelpassed,
      this.modelpassedinternational});

  @override
  State<OneWay> createState() => _OneWayTicketNewState();
}

class _OneWayTicketNewState extends State<OneWay> {
  final formkey = GlobalKey<FormState>();
  TextEditingController _traveltypeController = TextEditingController();
  TextEditingController _travelClassController = TextEditingController();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  TextEditingController _traveldateController = TextEditingController();
  TextEditingController _etaController = TextEditingController();
  TextEditingController _foodController = TextEditingController();
  TextEditingController _comments1Controller = TextEditingController();
  TextEditingController _accomodationController = TextEditingController();
  TextEditingController _occupancyController = TextEditingController();
  TextEditingController _checkinController = TextEditingController();
  TextEditingController _checkoutController = TextEditingController();
  TextEditingController _bagController = TextEditingController();
  TextEditingController _totalweightController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();
  TextEditingController _seatController = TextEditingController();
  TextEditingController _hotelController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late OneWayModelNormal model;
  late OneWayModelInternational model1;

  @override
  void initState() {
    super.initState();
    bool check = true;
    if (widget.isInternational) {
      model1 = widget.modelpassedinternational ?? OneWayModelInternational();
    } else {
      model = widget.modelpassed ?? OneWayModelNormal();
    }
    _traveltypeController.text = 'Flight';
    print(_traveltypeController.text);
    if (widget.isInternational) {
      if (model1.name == null) {
        check = true;
      } else {
        check = false;
      }
    } else {
      if (model.name == null) {
        check = true;
      } else {
        check = false;
      }
    }
    print(widget.name);
    if (check) {
      setState(() {
        print('h');
        _traveltypeController.text = 'Flight';
        if (widget.isInternational) {
          model1.travelmode = _traveltypeController.text;
        } else {
          model.travelmode = _traveltypeController.text;
        }
      });
    } else {
      if (!widget.isInternational) {
        _nameController.text = model.name ?? '';
        _traveltypeController.text = model.travelmode ?? '';
        _travelClassController.text = model.travelclass ?? '';
        _originController.text = model.origin ?? '';
        _destinationController.text = model.destination ?? '';
        _traveldateController.text = model.traveldate ?? '';
        _etaController.text = model.eta ?? '';
        _seatController.text = model.seat ?? '';
        _foodController.text = model.food ?? '';
        _comments1Controller.text = model.comments ?? '';
        _accomodationController.text = model.accomodation ?? '';
        _occupancyController.text = model.occupancy ?? '';
        _bagController.text = model.bags ?? '';
        _totalweightController.text = model.weight ?? '';
        _remarksController.text = model.remarks ?? '';
        _hotelController.text = model.hotel ?? '';
      } else {
        _nameController.text = model1.name ?? '';
        _traveltypeController.text = model1.travelmode ?? '';
        _travelClassController.text = model1.travelclass ?? '';
        _originController.text = model1.origin ?? '';
        _destinationController.text = model1.destination ?? '';
        _traveldateController.text = model1.traveldate ?? '';
        _etaController.text = model1.eta ?? '';
        _seatController.text = model1.seat ?? '';
        _foodController.text = model1.food ?? '';
        _comments1Controller.text = model1.comments ?? '';
        _accomodationController.text = model1.accomodation ?? '';
        _occupancyController.text = model1.occupancy ?? '';
        _bagController.text = model1.bags ?? '';
        _totalweightController.text = model1.weight ?? '';
        _remarksController.text = model1.remarks ?? '';
        _hotelController.text = model1.hotel ?? '';
        _regionController.text = model1.region ?? '';
      }
    }
  }

  Set<String> traveltimevalues = {};
  List<String> traveltimevalues1 = [
    'Before 6am',
    '6am to 12pm',
    '12pm to 6pm',
    'After 6pm'
  ];
  bool i = false;
  List<bool> _isSelected = [false, false];
  List<bool> _isSelected1 = [false, false, false, false];
  List<bool> _isSelected2 = [false, false];
  List<bool> _accom2 = [false, false];
  List<bool> _occupancy = [false, false, false];
  List<bool> travelmode = [true, false, false];
  List<bool> trainclass = List.generate(6, (index) => false);
  List<bool> roadclass = List.generate(2, (i) => false);
  bool s = false;
  List<bool> accom = [false, false];
  List<int> bags = List.generate(4, (index) => index);

  Color c1 = Color.fromARGB(255, 191, 218, 240);
  Color c2 = Color.fromARGB(255, 1, 75, 148);

//all bools
  bool tripdetails = false;

  List<bool> bottom = [true, false, false];
  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
                  image: AssetImage('assets/images/Bon_Voyage_Login_BG.gif'),
                  fit: BoxFit.fitWidth),
              borderRadius: BorderRadius.circular(20)),
          child: ListView(children: [
            UsernameCard(),
            Divider(),
            SizedBox(height: 2),
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
                      Icon(FontAwesomeIcons.locationDot,
                          size: 25, color: Color.fromARGB(255, 1, 75, 148)),
                      SizedBox(width: 5),
                      Text('Travel Details',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 1, 75, 148)))
                    ]),
                    Icon(Icons.arrow_drop_up,
                        size: 25, color: Color.fromARGB(255, 1, 75, 148))
                  ],
                ),
              ),
            ),
            Form(
                key: formkey,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Select Travel Mode:',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 1, 75, 148),
                                            fontSize: 12)),
                                  ),
                                  SizedBox(height: 5),
                                  ToggleButtons(
                                    isSelected: travelmode,
                                    renderBorder: false,
                                    children: [
                                      Tooltip(
                                        message: 'Flight',
                                        triggerMode: TooltipTriggerMode.manual,
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: travelmode[0]
                                                    ? Color.fromARGB(
                                                        255, 1, 75, 148)
                                                    : Color.fromARGB(
                                                        255, 191, 218, 240),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Icon(FontAwesomeIcons.plane,
                                                size: 24,
                                                color: travelmode[0]
                                                    ? Colors.white
                                                    : Colors.blue[300])),
                                      ),
                                      Tooltip(
                                        message: 'Train',
                                        triggerMode: TooltipTriggerMode.manual,
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: travelmode[1]
                                                    ? Color.fromARGB(
                                                        255, 1, 75, 148)
                                                    : Color.fromARGB(
                                                        255, 191, 218, 240),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Icon(FontAwesomeIcons.train,
                                                size: 24,
                                                color: travelmode[1]
                                                    ? Colors.white
                                                    : Colors.blue[300])),
                                      ),
                                      !widget.isInternational
                                          ? Tooltip(
                                              message: 'Road',
                                              triggerMode:
                                                  TooltipTriggerMode.manual,
                                              child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      color: travelmode[2]
                                                          ? Color.fromARGB(
                                                              255, 1, 75, 148)
                                                          : Color.fromARGB(255,
                                                              191, 218, 240),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Icon(
                                                      FontAwesomeIcons.car,
                                                      size: 24,
                                                      color: travelmode[2]
                                                          ? Colors.white
                                                          : Colors.blue[300])),
                                            )
                                          : Container()
                                    ],
                                    onPressed: (int p) {
                                      setState(() {
                                        for (int i = 0;
                                            i < travelmode.length;
                                            i++) {
                                          travelmode[i] = i == p;
                                        }
                                      });
                                      if (travelmode[0]) {
                                        _traveltypeController.text = 'Flight';
                                      }
                                      if (travelmode[1]) {
                                        _traveltypeController.text = 'Rail';
                                      }
                                      if (travelmode[2] &&
                                          !widget.isInternational) {
                                        _traveltypeController.text = 'Road';
                                      }
                                    },
                                  )
                                ]),
                            SizedBox(width: 20),
                            travelmode[0]
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Select Travel Class:',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 1, 75, 148))),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Column(
                                        children: [
                                          ToggleButtons(
                                            renderBorder: false,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            children: [
                                              Tooltip(
                                                  message: 'Economy',
                                                  triggerMode:
                                                      TooltipTriggerMode.manual,
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: _isSelected[0]
                                                          ? Color.fromARGB(
                                                              255, 1, 75, 148)
                                                          : Color.fromARGB(255,
                                                              191, 218, 240),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: ImageIcon(
                                                      size: 24,
                                                      color: _isSelected[0]
                                                          ? Colors.white
                                                          : Colors.blue[300],
                                                      AssetImage(
                                                          'assets/images/travel_class_flight_btn_economy_icon_active.png'),
                                                    ),
                                                  )),
                                              Tooltip(
                                                  message: 'Business',
                                                  triggerMode:
                                                      TooltipTriggerMode.manual,
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color: _isSelected[1]
                                                            ? Color.fromARGB(
                                                                255, 1, 75, 148)
                                                            : Color.fromARGB(
                                                                255,
                                                                191,
                                                                218,
                                                                240)),
                                                    child: ImageIcon(
                                                      size: 24,
                                                      color: _isSelected[1]
                                                          ? Colors.white
                                                          : Colors.blue[300],
                                                      AssetImage(
                                                          'assets/images/travel_class_flight_btn_business_icon_active.png'),
                                                    ),
                                                  ))
                                            ],
                                            isSelected: _isSelected,
                                            onPressed: (int index) {
                                              setState(() {
                                                for (int i = 0;
                                                    i < _isSelected.length;
                                                    i++) {
                                                  _isSelected[i] = i == index;
                                                }
                                              });

                                              if (index == 0 &&
                                                  _isSelected[index] == true) {
                                                _travelClassController.text =
                                                    'Economy class';
                                              } else if (index == 1 &&
                                                  _isSelected[index] == true) {
                                                _travelClassController.text =
                                                    'Business class';
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : (travelmode[2] && !widget.isInternational)
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  'Select Travel Class:',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color.fromARGB(
                                                          255, 1, 75, 148))),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                                height: 50,
                                                child: ToggleButtons(
                                                    renderBorder: false,
                                                    children: [
                                                      Tooltip(
                                                          message: 'Bus',
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .manual,
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                                color: roadclass[
                                                                        0]
                                                                    ? Color
                                                                        .fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148)
                                                                    : Color
                                                                        .fromARGB(
                                                                            255,
                                                                            191,
                                                                            218,
                                                                            240)),
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .bus,
                                                              size: 24,
                                                              color: roadclass[
                                                                      0]
                                                                  ? Colors.white
                                                                  : Colors.blue[
                                                                      300],
                                                            ),
                                                          )),
                                                      Tooltip(
                                                          message: 'Car',
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .manual,
                                                          child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: roadclass[
                                                                          1]
                                                                      ? Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)
                                                                      : Color.fromARGB(
                                                                          255,
                                                                          191,
                                                                          218,
                                                                          240)),
                                                              child: Icon(
                                                                FontAwesomeIcons
                                                                    .car,
                                                                size: 24,
                                                                color: roadclass[
                                                                        1]
                                                                    ? Colors
                                                                        .white
                                                                    : Colors.blue[
                                                                        300],
                                                              )))
                                                    ],
                                                    isSelected: roadclass,
                                                    onPressed: (index) {
                                                      setState(() {
                                                        for (int i = 0;
                                                            i <
                                                                roadclass
                                                                    .length;
                                                            i++) {
                                                          roadclass[i] =
                                                              i == index;
                                                        }
                                                      });
                                                      if (roadclass[0]) {
                                                        _travelClassController
                                                            .text = 'Bus';
                                                      }
                                                      if (roadclass[1]) {
                                                        _travelClassController
                                                            .text = 'Car';
                                                      }
                                                      print(
                                                          _travelClassController
                                                              .text);
                                                    }))
                                          ])
                                    : travelmode[1]
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      'Select Travel Class:',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color.fromARGB(
                                                              255,
                                                              1,
                                                              75,
                                                              148))),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 210,
                                                  child: ListView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    children: [
                                                      ToggleButtons(
                                                          renderBorder: false,
                                                          children: [
                                                            Tooltip(
                                                                message: 'SL',
                                                                child:
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                8),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: trainclass[0]
                                                                              ? Color.fromARGB(255, 1, 75, 148)
                                                                              : Color.fromARGB(255, 191, 218, 240),
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        child: Text(
                                                                            'SL',
                                                                            style:
                                                                                TextStyle(fontSize: 24, color: trainclass[0] ? Colors.white : Colors.blue[300])))),
                                                            Tooltip(
                                                                message: 'SC',
                                                                child:
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                8),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: trainclass[1]
                                                                              ? Color.fromARGB(255, 1, 75, 148)
                                                                              : Color.fromARGB(255, 191, 218, 240),
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        child: Text(
                                                                            'SC',
                                                                            style:
                                                                                TextStyle(fontSize: 24, color: trainclass[1] ? Colors.white : Colors.blue[300])))),
                                                            Tooltip(
                                                                message: 'CC',
                                                                child:
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                8),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: trainclass[2]
                                                                              ? Color.fromARGB(255, 1, 75, 148)
                                                                              : Color.fromARGB(255, 191, 218, 240),
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        child: Text(
                                                                            'CC',
                                                                            style:
                                                                                TextStyle(fontSize: 24, color: trainclass[2] ? Colors.white : Colors.blue[300])))),
                                                            Tooltip(
                                                                message: '3A',
                                                                child:
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                8),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: trainclass[3]
                                                                              ? Color.fromARGB(255, 1, 75, 148)
                                                                              : Color.fromARGB(255, 191, 218, 240),
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        child: Text(
                                                                            '3A',
                                                                            style:
                                                                                TextStyle(fontSize: 24, color: trainclass[3] ? Colors.white : Colors.blue[300])))),
                                                            Tooltip(
                                                                message: '2A',
                                                                child:
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                8),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: trainclass[4]
                                                                              ? Color.fromARGB(255, 1, 75, 148)
                                                                              : Color.fromARGB(255, 191, 218, 240),
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        child: Text(
                                                                            '2A',
                                                                            style:
                                                                                TextStyle(fontSize: 24, color: trainclass[4] ? Colors.white : Colors.blue[300])))),
                                                            Tooltip(
                                                                message: '1A',
                                                                child:
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                8),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: trainclass[5]
                                                                              ? Color.fromARGB(255, 1, 75, 148)
                                                                              : Color.fromARGB(255, 191, 218, 240),
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        child: Text(
                                                                            '1A',
                                                                            style:
                                                                                TextStyle(fontSize: 24, color: trainclass[5] ? Colors.white : Colors.blue[300]))))
                                                          ],
                                                          isSelected:
                                                              trainclass,
                                                          onPressed: (index) {
                                                            setState(() {
                                                              for (int i = 0;
                                                                  i <
                                                                      trainclass
                                                                          .length;
                                                                  i++) {
                                                                trainclass[i] =
                                                                    i == index;
                                                              }
                                                            });
                                                            if (trainclass[0]) {
                                                              _travelClassController
                                                                  .text = 'SL';
                                                            }
                                                            if (trainclass[1]) {
                                                              _travelClassController
                                                                  .text = 'SC';
                                                            }
                                                            if (trainclass[2]) {
                                                              _travelClassController
                                                                  .text = 'CC';
                                                            }
                                                            if (trainclass[3]) {
                                                              _travelClassController
                                                                  .text = '3A';
                                                            }
                                                            if (trainclass[4]) {
                                                              _travelClassController
                                                                  .text = '2A';
                                                            }
                                                            if (trainclass[5]) {
                                                              _travelClassController
                                                                  .text = '1A';
                                                            }
                                                          }),
                                                    ],
                                                  ),
                                                )
                                              ])
                                        : Container(),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Destination:',
                                      style: TextStyle(color: Colors.black)),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: _validateRequired,
                                      controller: _originController,
                                      decoration: InputDecoration(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                100,
                                          ),
                                          hintText: 'Origin',
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 1, 75, 148))),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Destination:',
                                      style: TextStyle(color: Colors.black)),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: _validateRequired,
                                      controller: _destinationController,
                                      decoration: InputDecoration(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100),
                                          hintText: 'Destination',
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 1, 75, 148))),
                                    )),
                              ],
                            ),
                          )
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Travel Date:',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: _validateRequired,
                                          style: TextStyle(color: Colors.black),
                                          controller: _traveldateController,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          100),
                                              hintText: 'Travel Date',
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148))),
                                          onTap: () async {
                                            DateTime? d = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime(2101));

                                            DateTime pickeddate = DateTime(
                                              d!.year,
                                              d.month,
                                              d.day,
                                            );
                                            setState(() {
                                              _traveldateController.text =
                                                  DateFormat("yyyy-MM-dd")
                                                      .format(pickeddate);
                                            });
                                          })
                                    ]),
                              )),
                          SizedBox(
                            width: 1,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Select Travel Time:',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 1, 75, 148),
                                            fontSize: 12)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        ToggleButtons(
                                          renderBorder: false,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          children: [
                                            Tooltip(
                                              message: '6am',
                                              triggerMode:
                                                  TooltipTriggerMode.manual,
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color:
                                                      _isSelected1[0] ? c2 : c1,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: ImageIcon(
                                                    AssetImage(
                                                        'assets/images/before6am_active.png'),
                                                    size: 24,
                                                    color: _isSelected1[0]
                                                        ? Colors.white
                                                        : Colors.blue[300]),
                                              ),
                                            ),
                                            Tooltip(
                                              message: '6amto12pm',
                                              triggerMode:
                                                  TooltipTriggerMode.manual,
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color:
                                                      _isSelected1[1] ? c2 : c1,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: ImageIcon(
                                                    AssetImage(
                                                        'assets/images/6amto12pm_active.png'),
                                                    size: 24,
                                                    color: _isSelected1[1]
                                                        ? Colors.white
                                                        : Colors.blue[300]),
                                              ),
                                            ),
                                            Tooltip(
                                                message: '12pmto6pm',
                                                triggerMode:
                                                    TooltipTriggerMode.manual,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: _isSelected1[2]
                                                        ? c2
                                                        : c1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: ImageIcon(
                                                      AssetImage(
                                                          'assets/images/12pmto6pm_active.png'),
                                                      size: 24,
                                                      color: _isSelected1[2]
                                                          ? Colors.white
                                                          : Colors.blue[300]),
                                                )),
                                            Tooltip(
                                                message: 'after6pm',
                                                triggerMode:
                                                    TooltipTriggerMode.manual,
                                                child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: _isSelected1[3]
                                                          ? c2
                                                          : c1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child: ImageIcon(
                                                        AssetImage(
                                                            'assets/images/after6pm_active.png'),
                                                        size: 24,
                                                        color: _isSelected1[3]
                                                            ? Colors.white
                                                            : Colors
                                                                .blue[300])))
                                          ],
                                          isSelected: _isSelected1,
                                          onPressed: (int index) {
                                            setState(() {
                                              if (_isSelected1[index]) {
                                                traveltimevalues.remove(
                                                    traveltimevalues1[index]);
                                              } else {
                                                traveltimevalues.add(
                                                    traveltimevalues1[index]);
                                              }
                                              _isSelected1[index] =
                                                  !_isSelected1[index];
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ]))
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Eta:',
                                        style: TextStyle(color: Colors.black)),
                                    Container(
                                        width: 150,
                                        child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: _validateRequired,
                                            style:
                                                TextStyle(color: Colors.black),
                                            controller: _etaController,
                                            readOnly: true,
                                            decoration: InputDecoration(
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100),
                                                hintText: 'ETA',
                                                hintStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 1, 75, 148))),
                                            onTap: () async {
                                              DateFormat t =
                                                  DateFormat("yyyy-MM-dd");

                                              DateTime? d =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: t.parse(
                                                          _traveldateController
                                                              .text),
                                                      firstDate: t.parse(
                                                          _traveldateController
                                                              .text),
                                                      lastDate: DateTime(2101));
                                              TimeOfDay? c =
                                                  await showTimePicker(
                                                      context: context,
                                                      initialTime:
                                                          TimeOfDay.now());
                                              DateTime pickeddate = DateTime(
                                                  d!.year,
                                                  d.month,
                                                  d.day,
                                                  c!.hour,
                                                  c.minute);

                                              if (pickeddate != null) {
                                                setState(() {
                                                  _etaController
                                                      .text = DateFormat(
                                                          "yyyy-MM-dd HH-mm-ss")
                                                      .format(pickeddate);
                                                  print(_etaController.text);
                                                });
                                              }
                                            }))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Select Food Preference',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 75, 148),
                                        fontSize: 12)),
                                Container(
                                  child: Column(
                                    children: [
                                      ToggleButtons(
                                        color: Colors.black,
                                        fillColor: Colors.transparent,
                                        renderBorder: false,
                                        borderRadius: BorderRadius.circular(30),
                                        children: [
                                          Tooltip(
                                              message: 'veg',
                                              triggerMode:
                                                  TooltipTriggerMode.manual,
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color:
                                                      _isSelected2[0] ? c2 : c1,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: ImageIcon(
                                                    AssetImage(
                                                        'assets/images/carrot.png'),
                                                    size: 24,
                                                    color: _isSelected2[0]
                                                        ? Colors.white
                                                        : Colors.blue[300]),
                                              )),
                                          Tooltip(
                                              message: 'nonveg',
                                              triggerMode:
                                                  TooltipTriggerMode.manual,
                                              child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: _isSelected2[1]
                                                        ? c2
                                                        : c1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: ImageIcon(
                                                      AssetImage(
                                                          'assets/images/nonveg.png'),
                                                      size: 24,
                                                      color: _isSelected2[1]
                                                          ? Colors.white
                                                          : Colors.blue[300])))
                                        ],
                                        isSelected: _isSelected2,
                                        onPressed: (int index) {
                                          setState(() {
                                            for (int i = 0;
                                                i < _isSelected2.length;
                                                i++) {
                                              _isSelected2[i] = i == index;
                                            }
                                          });
                                          if (index == 0 &&
                                              _isSelected2[index] == true) {
                                            _foodController.text = 'Vegetarian';
                                          } else if (index == 1 &&
                                              _isSelected2[index] == true) {
                                            _foodController.text =
                                                'Non-Vegetarian';
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          (travelmode[0] || travelmode[1])
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.black26)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Seat:',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            travelmode[0]
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0),
                                                    child: DropdownMenu(
                                                        width: MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            20,
                                                        hintText: 'Seat',
                                                        inputDecorationTheme:
                                                            InputDecorationTheme(
                                                                border: InputBorder
                                                                    .none,
                                                                hintStyle: TextStyle(
                                                                    color: Color.fromARGB(
                                                                        255,
                                                                        1,
                                                                        75,
                                                                        148))),
                                                        onSelected: (s) {
                                                          if (s ==
                                                              'select an option') {
                                                            _seatController
                                                                .text = '';
                                                          }
                                                          if (s == 'Window') {
                                                            _seatController
                                                                    .text =
                                                                'Window';
                                                          }
                                                          if (s == 'Aisle') {
                                                            _seatController
                                                                .text = 'Aisle';
                                                          }
                                                        },
                                                        initialSelection:
                                                            _seatController
                                                                .text,
                                                        controller:
                                                            _seatController,
                                                        dropdownMenuEntries: [
                                                          'Select an option',
                                                          'Window',
                                                          'Aisle'
                                                        ]
                                                            .map((e) =>
                                                                DropdownMenuEntry(
                                                                    label: e,
                                                                    value: e))
                                                            .toList()),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0),
                                                    child: DropdownMenu(
                                                        width:
                                                            MediaQuery.of(context)
                                                                        .size
                                                                        .width /
                                                                    2 -
                                                                20,
                                                        onSelected: (s) {
                                                          if (s ==
                                                              'Select an option') {
                                                            _seatController
                                                                .text = '';
                                                          }
                                                        },
                                                        controller:
                                                            _seatController,
                                                        hintText: 'Seat',
                                                        inputDecorationTheme:
                                                            InputDecorationTheme(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintStyle: TextStyle(
                                                                    color: Color.fromARGB(
                                                                        255,
                                                                        1,
                                                                        75,
                                                                        148))),
                                                        dropdownMenuEntries: [
                                                          'Select an option',
                                                          'up',
                                                          'down'
                                                        ]
                                                            .map((e) =>
                                                                DropdownMenuEntry(
                                                                    label: e,
                                                                    value: e))
                                                            .toList()),
                                                  )
                                          ])))
                              : Container(),
                          !widget.isInternational
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.black26)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Region:',
                                            style:
                                                TextStyle(color: Colors.black)),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: DropdownMenu(
                                              hintText: 'Region',
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  20,
                                              inputDecorationTheme:
                                                  InputDecorationTheme(
                                                      border: InputBorder.none,
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              1,
                                                              75,
                                                              148))),
                                              onSelected: (s) {
                                                if (s == 'Select an option') {
                                                  _regionController.text = '';
                                                }
                                              },
                                              controller: _regionController,
                                              dropdownMenuEntries: [
                                                'Select an option',
                                                'Asia/Africa',
                                                'Europe/America'
                                              ]
                                                  .map((e) => DropdownMenuEntry(
                                                      label: e, value: e))
                                                  .toList()),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ]),
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
                                Text('Comments:',
                                    style: TextStyle(color: Colors.black)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      controller: _comments1Controller,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Comments',
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 1, 75, 148)),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ToggleButtons(
                          color: Colors.black,
                          fillColor: Colors.transparent,
                          renderBorder: false,
                          borderRadius: BorderRadius.circular(30),
                          isSelected: accom,
                          children: [
                            Tooltip(
                                message: 'accomodation',
                                triggerMode: TooltipTriggerMode.manual,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: accom[0] ? c2 : c1,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ImageIcon(
                                      AssetImage(
                                          'assets/images/accommodation_icon.png'),
                                      size: 24,
                                      color: accom[0]
                                          ? Colors.white
                                          : Colors.blue[300]),
                                )),
                            Tooltip(
                                message: 'baggage',
                                triggerMode: TooltipTriggerMode.manual,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: accom[1] ? c2 : c1,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ImageIcon(
                                      AssetImage(
                                          'assets/images/baggage_btn_icon.png'),
                                      size: 24,
                                      color: accom[1]
                                          ? Colors.white
                                          : Colors.blue[300]),
                                ))
                          ],
                          onPressed: (int index) {
                            setState(() {
                              accom[index] = !accom[index];
                            });
                          },
                        ),
                        Visibility(
                            visible: accom[0],
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 8, bottom: 8),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8, bottom: 1),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text('Accomodation Type:',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        )),
                                                    Column(
                                                      children: [
                                                        ToggleButtons(
                                                          color: Colors.black,
                                                          fillColor: Colors
                                                              .transparent,
                                                          renderBorder: false,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          children: [
                                                            Tooltip(
                                                                message:
                                                                    'house',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        _accom2[0]
                                                                            ? c2
                                                                            : c1,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  child: ImageIcon(
                                                                      AssetImage(
                                                                          'assets/images/accommodation_btn_icon.png'),
                                                                      size: 24,
                                                                      color: _accom2[
                                                                              0]
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .blue[300]),
                                                                )),
                                                            Tooltip(
                                                                message:
                                                                    'hotel',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child:
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                8),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: _accom2[1]
                                                                              ? c2
                                                                              : c1,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        child: ImageIcon(
                                                                            AssetImage(
                                                                                'assets/images/hotel_btn_icon.png'),
                                                                            size:
                                                                                24,
                                                                            color: _accom2[1]
                                                                                ? Colors.white
                                                                                : Colors.blue[300])))
                                                          ],
                                                          isSelected: _accom2,
                                                          onPressed:
                                                              (int index) {
                                                            setState(() {
                                                              for (int i = 0;
                                                                  i <
                                                                      _accom2
                                                                          .length;
                                                                  i++) {
                                                                _accom2[i] =
                                                                    i == index;
                                                              }
                                                            });
                                                            if (index == 0 &&
                                                                _accom2[index] ==
                                                                    true) {
                                                              _accomodationController
                                                                      .text =
                                                                  'Private House';
                                                            } else if (index ==
                                                                    1 &&
                                                                _accom2[index] ==
                                                                    true) {
                                                              _accomodationController
                                                                      .text =
                                                                  'Hotel';
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Occupancy:',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        )),
                                                    Column(
                                                      children: [
                                                        ToggleButtons(
                                                          color: Colors.black,
                                                          fillColor: Colors
                                                              .transparent,
                                                          renderBorder: false,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          children: [
                                                            Tooltip(
                                                                message:
                                                                    'Single',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        _occupancy[0]
                                                                            ? c2
                                                                            : c1,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  child: ImageIcon(
                                                                      AssetImage(
                                                                          'assets/images/1_Occupancy_btn_icon.png'),
                                                                      size: 24,
                                                                      color: _occupancy[
                                                                              0]
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .blue[300]),
                                                                )),
                                                            Tooltip(
                                                                message:
                                                                    'Couple',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        _occupancy[1]
                                                                            ? c2
                                                                            : c1,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  child: ImageIcon(
                                                                      AssetImage(
                                                                          'assets/images/2_Occupancies_btn_icon.png'),
                                                                      size: 24,
                                                                      color: _occupancy[
                                                                              1]
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .blue[300]),
                                                                )),
                                                            Tooltip(
                                                                message: 'Many',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child:
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                8),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: _occupancy[2]
                                                                              ? c2
                                                                              : c1,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        child: ImageIcon(
                                                                            AssetImage(
                                                                                'assets/images/3_Occupancies_btn_icon.png'),
                                                                            size:
                                                                                24,
                                                                            color: _occupancy[2]
                                                                                ? Colors.white
                                                                                : Colors.blue[300])))
                                                          ],
                                                          isSelected:
                                                              _occupancy,
                                                          onPressed:
                                                              (int index) {
                                                            setState(() {
                                                              for (int i = 0;
                                                                  i <
                                                                      _occupancy
                                                                          .length;
                                                                  i++) {
                                                                _occupancy[i] =
                                                                    i == index;
                                                              }
                                                            });
                                                            if (index == 0 &&
                                                                _occupancy[
                                                                        index] ==
                                                                    true) {
                                                              _occupancyController
                                                                      .text =
                                                                  'Single';
                                                            } else if (index ==
                                                                    1 &&
                                                                _occupancy[
                                                                        index] ==
                                                                    true) {
                                                              _occupancyController
                                                                      .text =
                                                                  'Couple';
                                                            } else if (index ==
                                                                    2 &&
                                                                _occupancy[
                                                                        index] ==
                                                                    true) {
                                                              _occupancyController
                                                                      .text =
                                                                  'Family';
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 0.05,
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            _accom2[1]
                                                ? Container(
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
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                'Hotel Preference:',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                )),
                                                            TextFormField(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              validator:
                                                                  _validateRequired,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              controller:
                                                                  _hotelController,
                                                              decoration: InputDecoration(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                          maxWidth: MediaQuery.of(context).size.width -
                                                                              100),
                                                                  hintText:
                                                                      'Hotel',
                                                                  hintStyle: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148))),
                                                            )
                                                          ]),
                                                    ))
                                                : Container(),
                                            SizedBox(height: 10),
                                            Row(children: [
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
                                                          Text('Check-In:',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                          TextFormField(
                                                              validator:
                                                                  _validateRequired,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              controller:
                                                                  _checkinController,
                                                              readOnly: true,
                                                              decoration: InputDecoration(
                                                                  constraints: BoxConstraints(
                                                                      maxWidth: MediaQuery.of(context)
                                                                              .size
                                                                              .width -
                                                                          100),
                                                                  hintText:
                                                                      'Check-In',
                                                                  hintStyle: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148))),
                                                              onTap: () async {
                                                                DateFormat t =
                                                                    DateFormat(
                                                                        "yyyy-MM-dd");
                                                                DateTime? pickeddate = await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        t.parse(_etaController
                                                                            .text),
                                                                    firstDate: t.parse(
                                                                        _etaController
                                                                            .text),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2101));
                                                                if (pickeddate !=
                                                                    null) {
                                                                  setState(() {
                                                                    _checkinController
                                                                        .text = DateFormat(
                                                                            "yyyy-MM-dd")
                                                                        .format(
                                                                            pickeddate);
                                                                  });
                                                                }
                                                              })
                                                        ]),
                                                  )),
                                              SizedBox(
                                                width: 19,
                                              ),
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
                                                          Text('Check-Out:',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                          TextFormField(
                                                              validator:
                                                                  _validateRequired,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              controller:
                                                                  _checkoutController,
                                                              readOnly: true,
                                                              decoration: InputDecoration(
                                                                  constraints: BoxConstraints(
                                                                      maxWidth: MediaQuery.of(context)
                                                                              .size
                                                                              .width -
                                                                          100),
                                                                  hintText:
                                                                      'Check-Out',
                                                                  hintStyle: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148))),
                                                              onTap: () async {
                                                                DateFormat t =
                                                                    DateFormat(
                                                                        "yyyy-MM-dd");
                                                                DateTime? pickeddate = await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        t.parse(_checkinController
                                                                            .text),
                                                                    firstDate: t.parse(
                                                                        _checkinController
                                                                            .text),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2101));
                                                                if (pickeddate !=
                                                                    null) {
                                                                  setState(() {
                                                                    _checkoutController
                                                                        .text = DateFormat(
                                                                            "yyyy-MM-dd")
                                                                        .format(
                                                                            pickeddate);
                                                                  });
                                                                }
                                                              })
                                                        ]),
                                                  ))
                                            ])
                                          ]),
                                    )),
                              ),
                            )),
                        SizedBox(height: 20),
                        Visibility(
                            visible: accom[1],
                            child: Card(
                              elevation: 4,
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 1, bottom: 8),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Bags:',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                          DropdownMenu(
                                                            requestFocusOnTap:
                                                                false,
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            hintText: 'Bags',
                                                            inputDecorationTheme: InputDecorationTheme(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintStyle: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148))),
                                                            controller:
                                                                _bagController,
                                                            initialSelection:
                                                                _bagController
                                                                    .text,
                                                            width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    2 -
                                                                40,
                                                            dropdownMenuEntries:
                                                                bags.map(
                                                                    (int e) {
                                                              return DropdownMenuEntry(
                                                                  value: e,
                                                                  label: '$e');
                                                            }).toList(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                'Total Weight:',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                )),
                                                            TextFormField(
                                                              validator:
                                                                  _validateRequired,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              controller:
                                                                  _totalweightController,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  constraints: BoxConstraints(
                                                                      maxWidth: MediaQuery.of(
                                                                                  context)
                                                                              .size
                                                                              .width -
                                                                          100),
                                                                  hintText:
                                                                      'Total Extra Weight(Kgs)',
                                                                  hintStyle: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148))),
                                                            )
                                                          ],
                                                        ),
                                                      ))
                                                ]),
                                                SizedBox(height: 10),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            10,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black26),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text('Remarks:',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                  )),
                                                              TextFormField(
                                                                controller:
                                                                    _remarksController,
                                                                decoration: InputDecoration(
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    constraints: BoxConstraints(
                                                                        maxWidth:
                                                                            MediaQuery.of(context).size.width -
                                                                                100),
                                                                    hintText:
                                                                        'Remarks',
                                                                    hintStyle: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148))),
                                                              ),
                                                            ]))),
                                              ])))),
                            )),
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      if (_travelClassController.text.isNotEmpty &&
                          traveltimevalues.isNotEmpty &&
                          _seatController.text.isNotEmpty &&
                          _foodController.text.isNotEmpty) {
                        if (accom[0] || accom[1]) {
                          bool isConditionMet = true;

                          if (accom[0]) {
                            isConditionMet = isConditionMet &&
                                _accomodationController.text.isNotEmpty;
                          }

                          if (accom[1]) {
                            isConditionMet = isConditionMet &&
                                _occupancyController.text.isNotEmpty &&
                                _bagController.text.isNotEmpty;
                          }
                          bool Condition2 = true;
                          if (widget.isInternational) {
                            Condition2 =
                                Condition2 && _regionController.text.isNotEmpty;
                          }
                          if (isConditionMet) {
                            if (widget.isInternational) {
                              if (Condition2) {
                                setState(() {
                                  //international+region is present
                                  String c = '';

                                  for (int i = 0;
                                      i < traveltimevalues.length;
                                      i++) {
                                    c = "$c${traveltimevalues.elementAt(i)} ";
                                  }
                                  model1.name = authProvider.username;
                                  model1.travelmode =
                                      _traveltypeController.text;
                                  model1.travelclass =
                                      _travelClassController.text;
                                  model1.origin = _originController.text;
                                  model1.destination =
                                      _destinationController.text;
                                  model1.traveldate =
                                      _traveldateController.text;
                                  model1.traveltime = c;
                                  model1.eta = _etaController.text;
                                  model1.seat = _seatController.text;
                                  model1.food = _foodController.text;
                                  model1.comments = _comments1Controller.text;
                                  model1.accomodation =
                                      _accomodationController.text;
                                  model1.occupancy = _occupancyController.text;
                                  model1.bags = _bagController.text;
                                  model1.checkin = _checkinController.text;
                                  model1.checkout = _checkoutController.text;
                                  model1.weight = _totalweightController.text;
                                  model1.remarks = _remarksController.text;
                                  model1.hotel = _hotelController.text;
                                  model1.region = _regionController.text;
                                });
                                print(model1.toMap());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => OneWayMiscInternational(
                                            isInternational:
                                                widget.isInternational,
                                            model: model1)));
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
                            } else {
                              setState(() {
                                String c = '';

                                for (int i = 0;
                                    i < traveltimevalues.length;
                                    i++) {
                                  c = "$c${traveltimevalues.elementAt(i)} ";
                                }
                                model.name = authProvider.username;

                                model.travelmode = _traveltypeController.text;
                                model.travelclass = _travelClassController.text;
                                model.origin = _originController.text;
                                model.destination = _destinationController.text;
                                model.traveldate = _traveldateController.text;
                                model.traveltime = c;
                                model.eta = _etaController.text;
                                model.seat = _seatController.text;
                                model.food = _foodController.text;
                                model.comments = _comments1Controller.text;
                                model.accomodation =
                                    _accomodationController.text;
                                model.occupancy = _occupancyController.text;
                                model.bags = _bagController.text;
                                model.checkin = _checkinController.text;
                                model.checkout = _checkoutController.text;
                                model.weight = _totalweightController.text;
                                model.remarks = _remarksController.text;
                                model.hotel = _hotelController.text;
                              });
                              print(model.toMap());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => OneWayMisc(
                                          isInternational:
                                              widget.isInternational,
                                          model: model)));
                            }
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
                        } else {
                          bool Condition2 = true;
                          if (widget.isInternational) {
                            Condition2 =
                                Condition2 && _regionController.text.isNotEmpty;
                          }
                          if (widget.isInternational) {
                            if (Condition2) {
                              setState(() {
                                String c = '';
                                //international
                                for (int i = 0;
                                    i < traveltimevalues.length;
                                    i++) {
                                  c = "$c${traveltimevalues.elementAt(i)} ";
                                }
                                model1.name = authProvider.username;

                                model1.travelmode = _traveltypeController.text;
                                model1.travelclass =
                                    _travelClassController.text;
                                model1.origin = _originController.text;
                                model1.destination =
                                    _destinationController.text;
                                model1.traveldate = _traveldateController.text;
                                model1.traveltime = c;
                                model1.eta = _etaController.text;
                                model1.seat = _seatController.text;
                                model1.food = _foodController.text;
                                model1.comments = _comments1Controller.text;
                                model1.accomodation = '';
                                model1.occupancy = '';
                                model1.bags = '';
                                model1.weight = '';
                                model1.remarks = '';
                                model1.checkin = '';
                                model1.checkout = '';
                                model1.hotel = '';
                                model1.region = _regionController.text;
                              });
                              print(model1.toMap());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => OneWayMiscInternational(
                                          isInternational:
                                              widget.isInternational,
                                          model: model1)));
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
                          } else {
                            setState(() {
                              String c = '';

                              for (int i = 0;
                                  i < traveltimevalues.length;
                                  i++) {
                                c = "$c${traveltimevalues.elementAt(i)} ";
                              }
                              model.name = authProvider.username;

                              model.travelmode = _traveltypeController.text;
                              model.travelclass = _travelClassController.text;
                              model.origin = _originController.text;
                              model.destination = _destinationController.text;
                              model.traveldate = _traveldateController.text;
                              model.traveltime = c;
                              model.eta = _etaController.text;
                              model.seat = _seatController.text;
                              model.food = _foodController.text;
                              model.comments = _comments1Controller.text;
                              model.accomodation = '';
                              model.occupancy = '';
                              model.bags = '';
                              model.checkin = '';
                              model.checkout = '';
                              model.weight = '';
                              model.remarks = '';
                              model.hotel = '';
                            });
                            print(model.toMap());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => OneWayMisc(
                                        isInternational: widget.isInternational,
                                        model: model)));
                          }
                        }
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ))),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => OneWay(
                                isInternational: widget.isInternational)));
                  },
                  child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 131, 14, 5)),
                      child: Center(
                        child: Text('Clear',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )))
            ])
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarTheme(
        data: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white54,
            unselectedItemColor: Colors.grey,
            selectedItemColor: const Color.fromARGB(255, 1, 75, 148)),
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.home_outlined, size: 24),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => DashBoard()));
                    },
                  ),
                  label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.backpack_outlined, size: 24), label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person_4_outlined, size: 24), label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.help_center_outlined, size: 24), label: '')
            ]),
      ),
    );
  }
}
