import 'package:bonvoyage/forms/roundtrip/roundtripdomestic.dart';
import 'package:bonvoyage/forms/roundtrip/roundtripinternational.dart';
import 'package:bonvoyage/forms/travelerdetails.dart';
import 'package:bonvoyage/screens/dashboard.dart';
import 'package:bonvoyage/screens/usernamecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class RoundTrip extends StatefulWidget {
  bool isInternational;
  RoundTrip({super.key, required this.isInternational});

  @override
  State<RoundTrip> createState() => _RoundTripState();
}

class _RoundTripState extends State<RoundTrip> {
  List<bool> select = [true, false];
  final formkey = GlobalKey<FormState>();
  TextEditingController _traveltypeController = TextEditingController();
  TextEditingController _travelClassController = TextEditingController();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  TextEditingController _traveldateController = TextEditingController();
  TextEditingController _traveltimeController = TextEditingController();
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
  // TextEditingController _modeController = TextEditingController();
  // TextEditingController _currencyController = TextEditingController();
  // TextEditingController _amountController = TextEditingController();
  // TextEditingController _cabController = TextEditingController();
  // TextEditingController _purposeController = TextEditingController();
  TextEditingController _traveltype1Controller = TextEditingController();
  TextEditingController _travelClass1Controller = TextEditingController();
  TextEditingController _seat1Controller = TextEditingController();
  TextEditingController _traveldate1Controller = TextEditingController();
  TextEditingController _traveltime1Controller = TextEditingController();
  TextEditingController _eta1Controller = TextEditingController();
  TextEditingController _food1Controller = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _region2Controller = TextEditingController();
  TextEditingController _bag2Controller = TextEditingController();
  TextEditingController _totalweight2Controller = TextEditingController();
  TextEditingController _remarks2Controller = TextEditingController();
  Image img = Image.asset('assets/images/Bon_Voyage_Login_BG.gif',
      height: 1000, width: 1000);

  bool i = false;

  List<bool> _isSelected = [false, false];
  List<bool> _isSelectedflight = [false, false];
  List<bool> _isSelected1 = [false, false, false, false];
  List<bool> _isSelected2 = [false, false];
  List<bool> _accom2 = [false, false];
  List<bool> _occupancy = [false, false, false];
  List<bool> travelmode = [true, false, false];
  List<bool> travelmode1 = [true, false, false];
  List<bool> trainclass = List.generate(6, (index) => false);
  List<bool> trainclass1 = List.generate(6, (index) => false);
  List<bool> roadclass = List.generate(2, (i) => false);
  List<bool> roadclass1 = List.generate(2, (i) => false);
  bool s = false;
  List<bool> accom = [false, false];
  List<int> bags = List.generate(11, (index) => index);
  List<int> bags2 = List.generate(11, (index) => index);
  bool baggagereturn = false;
  static String? validate(String? i) {
    if (i!.isEmpty) {
      return 'Field Required';
    }
    return null;
  }

  Color c1 = Color.fromARGB(255, 191, 218, 240);
  Color c2 = Color.fromARGB(255, 1, 75, 148);

  void initState() {
    super.initState();
    setState(() {
      _traveltypeController.text = 'Flight';
      _traveltype1Controller.text = 'Flight';
    });
  }

//all bools
  bool tripdetails = false;
  bool misc = false;
  List<bool> bottom = [true, false, false];

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
                icon: Icon(Icons.arrow_back_ios, color: Colors.amber)),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('RoundTrip', style: TextStyle(color: Colors.amber)),
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
                child: ListView(
                  children: [
                    UsernameCard(),
                    Divider(),
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        Form(
                          key: formkey,
                          child: Container(
                              child: Column(children: [
                            SizedBox(height: 40),
                            select[0]
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          'Select Travel Mode:',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148),
                                                              fontSize: 12)),
                                                    ),
                                                    SizedBox(height: 5),
                                                    ToggleButtons(
                                                      isSelected: travelmode,
                                                      renderBorder: false,
                                                      children: [
                                                        Tooltip(
                                                          message: 'Flight',
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .manual,
                                                          child: Container(
                                                              padding: EdgeInsets.all(
                                                                  8),
                                                              decoration: BoxDecoration(
                                                                  color: travelmode[0]
                                                                      ? Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)
                                                                      : Color.fromARGB(
                                                                          255,
                                                                          191,
                                                                          218,
                                                                          240),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          30)),
                                                              child: Icon(FontAwesomeIcons.plane,
                                                                  size: 24,
                                                                  color: travelmode[0]
                                                                      ? Colors.white
                                                                      : Colors.blue[300])),
                                                        ),
                                                        Tooltip(
                                                          message: 'Train',
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .manual,
                                                          child: Container(
                                                              padding: EdgeInsets.all(
                                                                  8),
                                                              decoration: BoxDecoration(
                                                                  color: travelmode[1]
                                                                      ? Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)
                                                                      : Color.fromARGB(
                                                                          255,
                                                                          191,
                                                                          218,
                                                                          240),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          30)),
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
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child: Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8),
                                                                    decoration: BoxDecoration(
                                                                        color: travelmode[2]
                                                                            ? Color.fromARGB(
                                                                                255, 1, 75, 148)
                                                                            : Color.fromARGB(
                                                                                255,
                                                                                191,
                                                                                218,
                                                                                240),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                30)),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .car,
                                                                        size: 24,
                                                                        color: travelmode[2] ? Colors.white : Colors.blue[300])),
                                                              )
                                                            : Container()
                                                      ],
                                                      onPressed: (int p) {
                                                        setState(() {
                                                          for (int i = 0;
                                                              i <
                                                                  travelmode
                                                                      .length;
                                                              i++) {
                                                            travelmode[i] =
                                                                i == p;
                                                            travelmode1[i] =
                                                                i == p;
                                                          }
                                                        });
                                                        if (travelmode[0]) {
                                                          _traveltypeController
                                                              .text = 'Flight';
                                                        }
                                                        if (travelmode[1]) {
                                                          _traveltypeController
                                                              .text = 'Rail';
                                                        }
                                                        if (travelmode[2] &&
                                                            !widget
                                                                .isInternational) {
                                                          _traveltypeController
                                                              .text = 'Road';
                                                        }
                                                      },
                                                    )
                                                  ]),
                                              SizedBox(width: 20),
                                              travelmode[0]
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                              'Select Travel Class:',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148))),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        ToggleButtons(
                                                          renderBorder: false,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          children: [
                                                            Tooltip(
                                                                message:
                                                                    'Economy',
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
                                                                    color: _isSelected[
                                                                            0]
                                                                        ? Color.fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148)
                                                                        : Color.fromARGB(
                                                                            255,
                                                                            191,
                                                                            218,
                                                                            240),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  child:
                                                                      ImageIcon(
                                                                    size: 24,
                                                                    color: _isSelected[
                                                                            0]
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .blue[300],
                                                                    AssetImage(
                                                                        'assets/images/travel_class_flight_btn_economy_icon_active.png'),
                                                                  ),
                                                                )),
                                                            Tooltip(
                                                                message:
                                                                    'Business',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                      color: _isSelected[
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
                                                                  child:
                                                                      ImageIcon(
                                                                    size: 24,
                                                                    color: _isSelected[
                                                                            1]
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .blue[300],
                                                                    AssetImage(
                                                                        'assets/images/travel_class_flight_btn_business_icon_active.png'),
                                                                  ),
                                                                ))
                                                          ],
                                                          isSelected:
                                                              _isSelected,
                                                          onPressed:
                                                              (int index) {
                                                            setState(() {
                                                              for (int i = 0;
                                                                  i <
                                                                      _isSelected
                                                                          .length;
                                                                  i++) {
                                                                _isSelected[i] =
                                                                    i == index;
                                                                _isSelectedflight[
                                                                        i] =
                                                                    i == index;
                                                              }
                                                            });
                                                            if (index == 0 &&
                                                                _isSelected[
                                                                        index] ==
                                                                    true) {
                                                              _travelClassController
                                                                      .text =
                                                                  'Economy class';
                                                            } else if (index ==
                                                                    1 &&
                                                                _isSelected[
                                                                        index] ==
                                                                    true) {
                                                              _travelClassController
                                                                      .text =
                                                                  'Business class';
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    )
                                                  : (travelmode[2] &&
                                                          !widget
                                                              .isInternational)
                                                      ? Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Text(
                                                                    'Select Travel Class:',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
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
                                                                  child: ToggleButtons(
                                                                      renderBorder: false,
                                                                      children: [
                                                                        Tooltip(
                                                                            message:
                                                                                'Bus',
                                                                            triggerMode:
                                                                                TooltipTriggerMode.manual,
                                                                            child: Container(
                                                                              padding: EdgeInsets.all(8),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: roadclass[0] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240)),
                                                                              child: Icon(
                                                                                FontAwesomeIcons.bus,
                                                                                size: 24,
                                                                                color: roadclass[0] ? Colors.white : Colors.blue[300],
                                                                              ),
                                                                            )),
                                                                        Tooltip(
                                                                            message:
                                                                                'Car',
                                                                            triggerMode:
                                                                                TooltipTriggerMode.manual,
                                                                            child: Container(
                                                                                padding: EdgeInsets.all(8),
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: roadclass[1] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240)),
                                                                                child: Icon(
                                                                                  FontAwesomeIcons.car,
                                                                                  size: 24,
                                                                                  color: roadclass[1] ? Colors.white : Colors.blue[300],
                                                                                )))
                                                                      ],
                                                                      isSelected: roadclass,
                                                                      onPressed: (index) {
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < roadclass.length;
                                                                              i++) {
                                                                            roadclass[i] =
                                                                                i == index;
                                                                            roadclass1[i] =
                                                                                i == index;
                                                                          }
                                                                        });
                                                                        if (roadclass[
                                                                            0]) {
                                                                          _travelClassController.text =
                                                                              'Bus';
                                                                        }
                                                                        if (roadclass[
                                                                            1]) {
                                                                          _travelClassController.text =
                                                                              'Car';
                                                                        }
                                                                        print(_travelClassController
                                                                            .text);
                                                                      }))
                                                            ])
                                                      : travelmode[1]
                                                          ? Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child: Text(
                                                                        'Select Travel Class:',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
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
                                                                    child:
                                                                        ListView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      children: [
                                                                        ToggleButtons(
                                                                            renderBorder:
                                                                                false,
                                                                            children: [
                                                                              Tooltip(
                                                                                  message: 'SL',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass[0] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('SL', style: TextStyle(fontSize: 24, color: trainclass[0] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: 'SC',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass[1] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('SC', style: TextStyle(fontSize: 24, color: trainclass[1] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: 'CC',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass[2] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('CC', style: TextStyle(fontSize: 24, color: trainclass[2] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: '3A',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass[3] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('3A', style: TextStyle(fontSize: 24, color: trainclass[3] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: '2A',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass[4] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('2A', style: TextStyle(fontSize: 24, color: trainclass[4] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: '1A',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass[5] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('1A', style: TextStyle(fontSize: 24, color: trainclass[5] ? Colors.white : Colors.blue[300]))))
                                                                            ],
                                                                            isSelected:
                                                                                trainclass,
                                                                            onPressed:
                                                                                (index) {
                                                                              setState(() {
                                                                                for (int i = 0; i < trainclass.length; i++) {
                                                                                  trainclass[i] = i == index;
                                                                                }
                                                                                trainclass1 = trainclass;
                                                                              });
                                                                              if (trainclass[0]) {
                                                                                _travelClassController.text = 'SL';
                                                                              }
                                                                              if (trainclass[1]) {
                                                                                _travelClassController.text = 'SC';
                                                                              }
                                                                              if (trainclass[2]) {
                                                                                _travelClassController.text = 'CC';
                                                                              }
                                                                              if (trainclass[3]) {
                                                                                _travelClassController.text = '3A';
                                                                              }
                                                                              if (trainclass[4]) {
                                                                                _travelClassController.text = '2A';
                                                                              }
                                                                              if (trainclass[5]) {
                                                                                _travelClassController.text = '1A';
                                                                              }
                                                                            }),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ])
                                                          : Container(),
                                            ],
                                          ),
                                          //Text('${_travelClassController.text}'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            Container(
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
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      'Origin',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: TextFormField(
                                                        controller:
                                                            _originController,
                                                        decoration: InputDecoration(
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
                                              width: 20,
                                            ),
                                            Container(
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
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      'Destination',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: TextFormField(
                                                        controller:
                                                            _destinationController,
                                                        decoration: InputDecoration(
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
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    40,
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
                                                          'Travel Date',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            controller:
                                                                _traveldateController,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                                constraints: BoxConstraints(
                                                                    maxWidth: MediaQuery.of(context)
                                                                            .size
                                                                            .width -
                                                                        100)),
                                                            onTap: () async {
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
                                                              TimeOfDay? t = await showTimePicker(
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
                                                                  print(
                                                                      _etaController
                                                                          .text);
                                                                });
                                                              }
                                                            })
                                                      ]),
                                                )),
                                            SizedBox(
                                              width: 1,
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Select Travel Time:',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 12)),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      ToggleButtons(
                                                        renderBorder: false,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        children: [
                                                          Tooltip(
                                                            message: '6am',
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .manual,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    _isSelected1[
                                                                            0]
                                                                        ? c2
                                                                        : c1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: ImageIcon(
                                                                  AssetImage(
                                                                      'assets/images/before6am_active.png'),
                                                                  size: 24,
                                                                  color: _isSelected1[
                                                                          0]
                                                                      ? Colors
                                                                          .white
                                                                      : Colors.blue[
                                                                          300]),
                                                            ),
                                                          ),
                                                          Tooltip(
                                                            message:
                                                                '6amto12pm',
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .manual,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    _isSelected1[
                                                                            1]
                                                                        ? c2
                                                                        : c1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: ImageIcon(
                                                                  AssetImage(
                                                                      'assets/images/6amto12pm_active.png'),
                                                                  size: 24,
                                                                  color: _isSelected1[
                                                                          1]
                                                                      ? Colors
                                                                          .white
                                                                      : Colors.blue[
                                                                          300]),
                                                            ),
                                                          ),
                                                          Tooltip(
                                                              message:
                                                                  '12pmto6pm',
                                                              triggerMode:
                                                                  TooltipTriggerMode
                                                                      .manual,
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      _isSelected1[
                                                                              2]
                                                                          ? c2
                                                                          : c1,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: ImageIcon(
                                                                    AssetImage(
                                                                        'assets/images/12pmto6pm_active.png'),
                                                                    size: 24,
                                                                    color: _isSelected1[
                                                                            2]
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .blue[300]),
                                                              )),
                                                          Tooltip(
                                                              message:
                                                                  'after6pm',
                                                              triggerMode:
                                                                  TooltipTriggerMode
                                                                      .manual,
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        _isSelected1[3]
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
                                                                      color: _isSelected1[
                                                                              2]
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .blue[300])))
                                                        ],
                                                        isSelected:
                                                            _isSelected1,
                                                        onPressed: (int index) {
                                                          setState(() {
                                                            for (int i = 0;
                                                                i <
                                                                    _isSelected1
                                                                        .length;
                                                                i++) {
                                                              _isSelected1[i] =
                                                                  i == index;
                                                            }
                                                          });
                                                          if (index == 0 &&
                                                              _isSelected1[
                                                                      index] ==
                                                                  true) {
                                                            _traveltimeController
                                                                    .text =
                                                                'Before 6am';
                                                          } else if (index ==
                                                                  1 &&
                                                              _isSelected1[
                                                                      index] ==
                                                                  true) {
                                                            _traveltimeController
                                                                    .text =
                                                                '6am to 12pm';
                                                          } else if (index ==
                                                                  2 &&
                                                              _isSelected1[
                                                                      index] ==
                                                                  true) {
                                                            _traveltimeController
                                                                    .text =
                                                                '12pm to 6pm';
                                                          } else {
                                                            _traveltimeController
                                                                    .text =
                                                                'After 6pm';
                                                          }
                                                          print(
                                                              _traveltimeController
                                                                  .text);
                                                        },
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
                                                        'ETA',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      Container(
                                                          width: 150,
                                                          child: TextFormField(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              controller:
                                                                  _etaController,
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
                                                                        t.parse(_traveldateController
                                                                            .text),
                                                                    firstDate: t.parse(
                                                                        _traveldateController
                                                                            .text),
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
                                                                    _etaController
                                                                        .text = DateFormat(
                                                                            "yyyy-MM-dd HH-mm-ss")
                                                                        .format(
                                                                            pickeddate);
                                                                    print(_etaController
                                                                        .text);
                                                                    _traveldate1Controller
                                                                            .text =
                                                                        _etaController
                                                                            .text;
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Select Food Preference',
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 12)),
                                                  Container(
                                                    child: ToggleButtons(
                                                      color: Colors.black,
                                                      fillColor:
                                                          Colors.transparent,
                                                      renderBorder: false,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      children: [
                                                        Tooltip(
                                                            message: 'veg',
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .manual,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    _isSelected2[
                                                                            0]
                                                                        ? c2
                                                                        : c1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: ImageIcon(
                                                                  AssetImage(
                                                                      'assets/images/carrot.png'),
                                                                  size: 24,
                                                                  color: _isSelected2[
                                                                          0]
                                                                      ? Colors
                                                                          .white
                                                                      : Colors.blue[
                                                                          300]),
                                                            )),
                                                        Tooltip(
                                                            message: 'nonveg',
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .manual,
                                                            child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      _isSelected2[
                                                                              1]
                                                                          ? c2
                                                                          : c1,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: ImageIcon(
                                                                    AssetImage(
                                                                        'assets/images/nonveg.png'),
                                                                    size: 24,
                                                                    color: _isSelected2[
                                                                            1]
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .blue[300])))
                                                      ],
                                                      isSelected: _isSelected2,
                                                      onPressed: (int index) {
                                                        setState(() {
                                                          for (int i = 0;
                                                              i <
                                                                  _isSelected2
                                                                      .length;
                                                              i++) {
                                                            _isSelected2[i] =
                                                                i == index;
                                                          }
                                                        });
                                                        if (index == 0 &&
                                                            _isSelected2[
                                                                    index] ==
                                                                true) {
                                                          _foodController.text =
                                                              'Vegetarian';
                                                        } else if (index == 1 &&
                                                            _isSelected2[
                                                                    index] ==
                                                                true) {
                                                          _foodController.text =
                                                              'Non-Vegetarian';
                                                        }
                                                      },
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Container(
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
                                                                ' Seat Preference',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                              travelmode[0]
                                                                  ? DropdownMenu(
                                                                      inputDecorationTheme: InputDecorationTheme(
                                                                          border: InputBorder
                                                                              .none),
                                                                      onSelected:
                                                                          (s) {
                                                                        if (s ==
                                                                            'select an option') {
                                                                          _seatController.text =
                                                                              '';
                                                                        }
                                                                        if (s ==
                                                                            'Window') {
                                                                          _seatController.text =
                                                                              'Window';
                                                                        }
                                                                        if (s ==
                                                                            'Aisle') {
                                                                          _seatController.text =
                                                                              'Aisle';
                                                                        }
                                                                      },
                                                                      controller:
                                                                          _seatController,
                                                                      dropdownMenuEntries: [
                                                                        'select an option',
                                                                        'Window',
                                                                        'Aisle'
                                                                      ]
                                                                          .map((e) => DropdownMenuEntry(
                                                                              label:
                                                                                  e,
                                                                              value:
                                                                                  e))
                                                                          .toList())
                                                                  : DropdownMenu(
                                                                      onSelected:
                                                                          (s) {
                                                                        if (s ==
                                                                            'Select an option') {
                                                                          _seatController.text =
                                                                              '';
                                                                        }
                                                                      },
                                                                      controller:
                                                                          _seatController,
                                                                      inputDecorationTheme: InputDecorationTheme(
                                                                          border: InputBorder
                                                                              .none),
                                                                      dropdownMenuEntries:
                                                                          [
                                                                        'Select an option'
                                                                            'up',
                                                                        'down'
                                                                      ].map((e) => DropdownMenuEntry(label: e, value: e)).toList())
                                                            ])))
                                                : Container(),
                                            !widget.isInternational
                                                ? Container()
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              20,
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
                                                            ' Region',
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
                                                            child: DropdownMenu(
                                                                hintText:
                                                                    'Region',
                                                                inputDecorationTheme: InputDecorationTheme(
                                                                    border: InputBorder
                                                                        .none,
                                                                    hintStyle: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148))),
                                                                onSelected:
                                                                    (s) {
                                                                  if (s ==
                                                                      'Select an option') {
                                                                    _regionController
                                                                        .text = '';
                                                                  }
                                                                  _region2Controller
                                                                          .text =
                                                                      _regionController
                                                                          .text;
                                                                },
                                                                controller:
                                                                    _regionController,
                                                                dropdownMenuEntries: [
                                                                  'Select an option',
                                                                  'Asia/Africa',
                                                                  'Europe/America'
                                                                ]
                                                                    .map((e) => DropdownMenuEntry(
                                                                        label:
                                                                            e,
                                                                        value:
                                                                            e))
                                                                    .toList()),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                          ]),
                                          SizedBox(height: 10),

                                          SizedBox(
                                            height: 5,
                                          ),
                                          ToggleButtons(
                                            color: Colors.black,
                                            fillColor: Colors.transparent,
                                            renderBorder: false,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            isSelected: accom,
                                            children: [
                                              Tooltip(
                                                  message: 'accomodation',
                                                  triggerMode:
                                                      TooltipTriggerMode.manual,
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: accom[0] ? c2 : c1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
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
                                                  triggerMode:
                                                      TooltipTriggerMode.manual,
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: accom[1] ? c2 : c1,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0,
                                                          top: 8,
                                                          bottom: 8),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 8.0,
                                                                top: 8,
                                                                bottom: 1),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
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
                                                                      Text(
                                                                          'Accomodation Type:',
                                                                          style: TextStyle(
                                                                              color: Colors.black54,
                                                                              fontSize: 12)),
                                                                      ToggleButtons(
                                                                        color: Colors
                                                                            .black,
                                                                        fillColor:
                                                                            Colors.transparent,
                                                                        renderBorder:
                                                                            false,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                        children: [
                                                                          Tooltip(
                                                                              message: 'house',
                                                                              triggerMode: TooltipTriggerMode.manual,
                                                                              child: Container(
                                                                                padding: EdgeInsets.all(8),
                                                                                decoration: BoxDecoration(
                                                                                  color: _accom2[0] ? c2 : c1,
                                                                                  borderRadius: BorderRadius.circular(30),
                                                                                ),
                                                                                child: ImageIcon(AssetImage('assets/images/accommodation_btn_icon.png'), size: 24, color: _accom2[0] ? Colors.white : Colors.blue[300]),
                                                                              )),
                                                                          Tooltip(
                                                                              message: 'hotel',
                                                                              triggerMode: TooltipTriggerMode.manual,
                                                                              child: Container(
                                                                                  padding: EdgeInsets.all(8),
                                                                                  decoration: BoxDecoration(
                                                                                    color: _accom2[1] ? c2 : c1,
                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                  ),
                                                                                  child: ImageIcon(AssetImage('assets/images/hotel_btn_icon.png'), size: 24, color: _accom2[1] ? Colors.white : Colors.blue[300])))
                                                                        ],
                                                                        isSelected:
                                                                            _accom2,
                                                                        onPressed:
                                                                            (int
                                                                                index) {
                                                                          setState(
                                                                              () {
                                                                            for (int i = 0;
                                                                                i < _accom2.length;
                                                                                i++) {
                                                                              _accom2[i] = i == index;
                                                                            }
                                                                          });
                                                                          if (index == 0 &&
                                                                              _accom2[index] ==
                                                                                  true) {
                                                                            _accomodationController.text =
                                                                                'Private House';
                                                                          } else if (index == 1 &&
                                                                              _accom2[index] == true) {
                                                                            _accomodationController.text =
                                                                                'Hotel';
                                                                          }
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          'Occupancy:',
                                                                          style: TextStyle(
                                                                              color: Colors.black54,
                                                                              fontSize: 12)),
                                                                      ToggleButtons(
                                                                        color: Colors
                                                                            .black,
                                                                        fillColor:
                                                                            Colors.transparent,
                                                                        renderBorder:
                                                                            false,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                        children: [
                                                                          Tooltip(
                                                                              message: 'Single',
                                                                              triggerMode: TooltipTriggerMode.manual,
                                                                              child: Container(
                                                                                padding: EdgeInsets.all(8),
                                                                                decoration: BoxDecoration(
                                                                                  color: _occupancy[0] ? c2 : c1,
                                                                                  borderRadius: BorderRadius.circular(30),
                                                                                ),
                                                                                child: ImageIcon(AssetImage('assets/images/1_Occupancy_btn_icon.png'), size: 24, color: _occupancy[0] ? Colors.white : Colors.blue[300]),
                                                                              )),
                                                                          Tooltip(
                                                                              message: 'Couple',
                                                                              triggerMode: TooltipTriggerMode.manual,
                                                                              child: Container(
                                                                                padding: EdgeInsets.all(8),
                                                                                decoration: BoxDecoration(
                                                                                  color: _occupancy[1] ? c2 : c1,
                                                                                  borderRadius: BorderRadius.circular(30),
                                                                                ),
                                                                                child: ImageIcon(AssetImage('assets/images/2_Occupancies_btn_icon.png'), size: 24, color: _occupancy[1] ? Colors.white : Colors.blue[300]),
                                                                              )),
                                                                          Tooltip(
                                                                              message: 'Many',
                                                                              triggerMode: TooltipTriggerMode.manual,
                                                                              child: Container(
                                                                                  padding: EdgeInsets.all(8),
                                                                                  decoration: BoxDecoration(
                                                                                    color: _occupancy[2] ? c2 : c1,
                                                                                    borderRadius: BorderRadius.circular(30),
                                                                                  ),
                                                                                  child: ImageIcon(AssetImage('assets/images/3_Occupancies_btn_icon.png'), size: 24, color: _occupancy[2] ? Colors.white : Colors.blue[300])))
                                                                        ],
                                                                        isSelected:
                                                                            _occupancy,
                                                                        onPressed:
                                                                            (int
                                                                                index) {
                                                                          setState(
                                                                              () {
                                                                            for (int i = 0;
                                                                                i < _occupancy.length;
                                                                                i++) {
                                                                              _occupancy[i] = i == index;
                                                                            }
                                                                          });
                                                                          if (index == 0 &&
                                                                              _occupancy[index] ==
                                                                                  true) {
                                                                            _occupancyController.text =
                                                                                'Single';
                                                                          } else if (index == 1 &&
                                                                              _accom2[index] ==
                                                                                  true) {
                                                                            _occupancyController.text =
                                                                                'Couple';
                                                                          } else if (index == 2 &&
                                                                              _occupancy[index] == true) {
                                                                            _occupancyController.text =
                                                                                'Family';
                                                                          }
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width: 0.05,
                                                                  )
                                                                ],
                                                              ),
                                                              Row(children: [
                                                                Container(
                                                                    width: MediaQuery.of(context).size.width /
                                                                            2 -
                                                                        40,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black26),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5)),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              8.0),
                                                                      child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Check-In:',
                                                                              style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 5,
                                                                            ),
                                                                            TextFormField(
                                                                                style: TextStyle(color: Colors.black),
                                                                                controller: _checkinController,
                                                                                readOnly: true,
                                                                                decoration: InputDecoration(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100)),
                                                                                onTap: () async {
                                                                                  DateTime? pickeddate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
                                                                                  if (pickeddate != null) {
                                                                                    setState(() {
                                                                                      _checkinController.text = DateFormat("yyyy-MM-dd").format(pickeddate);
                                                                                    });
                                                                                  }
                                                                                })
                                                                          ]),
                                                                    )),
                                                                SizedBox(
                                                                  width: 19,
                                                                ),
                                                                Container(
                                                                    width: MediaQuery.of(context).size.width /
                                                                            2 -
                                                                        40,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black26),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5)),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              8.0),
                                                                      child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Check-Out:',
                                                                              style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 5,
                                                                            ),
                                                                            TextFormField(
                                                                                style: TextStyle(color: Colors.black),
                                                                                controller: _checkoutController,
                                                                                readOnly: true,
                                                                                decoration: InputDecoration(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100)),
                                                                                onTap: () async {
                                                                                  DateTime? pickeddate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
                                                                                  if (pickeddate != null) {
                                                                                    setState(() {
                                                                                      _checkoutController.text = DateFormat("yyyy-MM-dd").format(pickeddate);
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            top: 1,
                                                            bottom: 8),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
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
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 2 - 40,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: Colors.black26),
                                                                              borderRadius: BorderRadius.circular(5)),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'No of Extra Bags:',
                                                                                  style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                DropdownMenu(
                                                                                  requestFocusOnTap: false,
                                                                                  textStyle: TextStyle(color: Colors.black),
                                                                                  inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
                                                                                  hintText: 'Bags',
                                                                                  controller: _bagController,
                                                                                  width: MediaQuery.of(context).size.width / 2 - 40,
                                                                                  dropdownMenuEntries: bags.map((int e) {
                                                                                    return DropdownMenuEntry(value: e, label: '$e');
                                                                                  }).toList(),
                                                                                  onSelected: (index) {
                                                                                    int p = index! * 5;
                                                                                    _totalweightController.text = '$p';
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                20),
                                                                        Container(
                                                                            width: MediaQuery.of(context).size.width / 2 -
                                                                                40,
                                                                            decoration:
                                                                                BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.circular(5)),
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Total Extra Wgt.(Kgs):',
                                                                                    style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 5,
                                                                                  ),
                                                                                  TextField(
                                                                                    controller: _totalweightController,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ))
                                                                      ]),
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width -
                                                                          10,
                                                                      decoration: BoxDecoration(
                                                                          border:
                                                                              Border.all(color: Colors.black26),
                                                                          borderRadius: BorderRadius.circular(5)),
                                                                      child: Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                            Text(
                                                                              'Remarks:',
                                                                              style: TextStyle(fontSize: 12, color: Colors.black54),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 5,
                                                                            ),
                                                                            TextFormField(
                                                                              controller: _remarksController,
                                                                            )
                                                                          ]))),
                                                                ])))),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                            SizedBox(height: 10),
                            select[1]
                                ? Container(
                                    child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 8, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          'Select Travel Mode:',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148),
                                                              fontSize: 12)),
                                                    ),
                                                    SizedBox(height: 5),
                                                    ToggleButtons(
                                                      isSelected: travelmode1,
                                                      renderBorder: false,
                                                      children: [
                                                        Tooltip(
                                                          message: 'Flight',
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .manual,
                                                          child: Container(
                                                              padding: EdgeInsets.all(
                                                                  8),
                                                              decoration: BoxDecoration(
                                                                  color: travelmode1[0]
                                                                      ? Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)
                                                                      : Color.fromARGB(
                                                                          255,
                                                                          191,
                                                                          218,
                                                                          240),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          30)),
                                                              child: Icon(FontAwesomeIcons.plane,
                                                                  size: 24,
                                                                  color: travelmode1[0]
                                                                      ? Colors.white
                                                                      : Colors.blue[300])),
                                                        ),
                                                        Tooltip(
                                                          message: 'Train',
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .manual,
                                                          child: Container(
                                                              padding: EdgeInsets.all(
                                                                  8),
                                                              decoration: BoxDecoration(
                                                                  color: travelmode1[1]
                                                                      ? Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148)
                                                                      : Color.fromARGB(
                                                                          255,
                                                                          191,
                                                                          218,
                                                                          240),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          30)),
                                                              child: Icon(FontAwesomeIcons.train,
                                                                  size: 24,
                                                                  color: travelmode1[1]
                                                                      ? Colors.white
                                                                      : Colors.blue[300])),
                                                        ),
                                                        !widget.isInternational
                                                            ? Tooltip(
                                                                message: 'Road',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child: Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8),
                                                                    decoration: BoxDecoration(
                                                                        color: travelmode1[2]
                                                                            ? Color.fromARGB(
                                                                                255, 1, 75, 148)
                                                                            : Color.fromARGB(
                                                                                255,
                                                                                191,
                                                                                218,
                                                                                240),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                30)),
                                                                    child: Icon(
                                                                        FontAwesomeIcons
                                                                            .car,
                                                                        size: 24,
                                                                        color: travelmode1[2] ? Colors.white : Colors.blue[300])),
                                                              )
                                                            : Container()
                                                      ],
                                                      onPressed: (int p) {
                                                        setState(() {
                                                          for (int i = 0;
                                                              i <
                                                                  travelmode1
                                                                      .length;
                                                              i++) {
                                                            travelmode1[i] =
                                                                i == p;
                                                          }
                                                        });
                                                        if (travelmode1[0]) {
                                                          _traveltype1Controller
                                                              .text = 'Flight';
                                                        }
                                                        if (travelmode1[1]) {
                                                          _traveltype1Controller
                                                              .text = 'Rail';
                                                        }
                                                        if (travelmode1[2] &&
                                                            widget
                                                                .isInternational) {
                                                          _traveltype1Controller
                                                              .text = 'Road';
                                                        }
                                                      },
                                                    )
                                                  ]),
                                              SizedBox(width: 20),
                                              travelmode1[0]
                                                  ? Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                              'Select Travel Class:',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148))),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        ToggleButtons(
                                                          renderBorder: false,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          children: [
                                                            Tooltip(
                                                                message:
                                                                    'Economy',
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
                                                                    color: _isSelectedflight[
                                                                            0]
                                                                        ? Color.fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148)
                                                                        : Color.fromARGB(
                                                                            255,
                                                                            191,
                                                                            218,
                                                                            240),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  child:
                                                                      ImageIcon(
                                                                    size: 24,
                                                                    color: _isSelectedflight[
                                                                            0]
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .blue[300],
                                                                    AssetImage(
                                                                        'assets/images/travel_class_flight_btn_economy_icon_active.png'),
                                                                  ),
                                                                )),
                                                            Tooltip(
                                                                message:
                                                                    'Business',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                      color: _isSelectedflight[
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
                                                                  child:
                                                                      ImageIcon(
                                                                    size: 24,
                                                                    color: _isSelectedflight[
                                                                            1]
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .blue[300],
                                                                    AssetImage(
                                                                        'assets/images/travel_class_flight_btn_business_icon_active.png'),
                                                                  ),
                                                                ))
                                                          ],
                                                          isSelected:
                                                              _isSelectedflight,
                                                          onPressed:
                                                              (int index) {
                                                            setState(() {
                                                              for (int i = 0;
                                                                  i <
                                                                      _isSelectedflight
                                                                          .length;
                                                                  i++) {
                                                                _isSelectedflight[
                                                                        i] =
                                                                    i == index;
                                                              }
                                                            });
                                                            if (index == 0 &&
                                                                _isSelectedflight[
                                                                        index] ==
                                                                    true) {
                                                              _travelClass1Controller
                                                                      .text =
                                                                  'Economy class';
                                                            } else if (index ==
                                                                    1 &&
                                                                _isSelectedflight[
                                                                        index] ==
                                                                    true) {
                                                              _travelClass1Controller
                                                                      .text =
                                                                  'Business class';
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    )
                                                  : (travelmode1[2] &&
                                                          !widget
                                                              .isInternational)
                                                      ? Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Text(
                                                                    'Select Travel Class:',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
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
                                                                  child: ToggleButtons(
                                                                      renderBorder: false,
                                                                      children: [
                                                                        Tooltip(
                                                                            message:
                                                                                'Bus',
                                                                            triggerMode:
                                                                                TooltipTriggerMode.manual,
                                                                            child: Container(
                                                                              padding: EdgeInsets.all(8),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: roadclass1[0] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240)),
                                                                              child: Icon(
                                                                                FontAwesomeIcons.bus,
                                                                                size: 24,
                                                                                color: roadclass1[0] ? Colors.white : Colors.blue[300],
                                                                              ),
                                                                            )),
                                                                        Tooltip(
                                                                            message:
                                                                                'Car',
                                                                            triggerMode:
                                                                                TooltipTriggerMode.manual,
                                                                            child: Container(
                                                                                padding: EdgeInsets.all(8),
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: roadclass1[1] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240)),
                                                                                child: Icon(
                                                                                  FontAwesomeIcons.car,
                                                                                  size: 24,
                                                                                  color: roadclass1[1] ? Colors.white : Colors.blue[300],
                                                                                )))
                                                                      ],
                                                                      isSelected: roadclass1,
                                                                      onPressed: (index) {
                                                                        setState(
                                                                            () {
                                                                          for (int i = 0;
                                                                              i < roadclass1.length;
                                                                              i++) {
                                                                            roadclass1[i] =
                                                                                i == index;
                                                                          }
                                                                        });
                                                                        if (roadclass1[
                                                                            0]) {
                                                                          _travelClass1Controller.text =
                                                                              'Bus';
                                                                        }
                                                                        if (roadclass1[
                                                                            1]) {
                                                                          _travelClass1Controller.text =
                                                                              'Car';
                                                                        }
                                                                      }))
                                                            ])
                                                      : travelmode1[1]
                                                          ? Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child: Text(
                                                                        'Select Travel Class:',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
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
                                                                    child:
                                                                        ListView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      children: [
                                                                        ToggleButtons(
                                                                            renderBorder:
                                                                                false,
                                                                            children: [
                                                                              Tooltip(
                                                                                  message: 'SL',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass1[0] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('SL', style: TextStyle(fontSize: 24, color: trainclass1[0] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: 'SC',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass1[1] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('SC', style: TextStyle(fontSize: 24, color: trainclass1[1] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: 'CC',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass1[2] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('CC', style: TextStyle(fontSize: 24, color: trainclass1[2] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: '3A',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass1[3] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('3A', style: TextStyle(fontSize: 24, color: trainclass1[3] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: '2A',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass1[4] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('2A', style: TextStyle(fontSize: 24, color: trainclass1[4] ? Colors.white : Colors.blue[300])))),
                                                                              Tooltip(
                                                                                  message: '1A',
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: trainclass1[5] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: Text('1A', style: TextStyle(fontSize: 24, color: trainclass1[5] ? Colors.white : Colors.blue[300]))))
                                                                            ],
                                                                            isSelected:
                                                                                trainclass1,
                                                                            onPressed:
                                                                                (index) {
                                                                              setState(() {
                                                                                for (int i = 0; i < trainclass1.length; i++) {
                                                                                  trainclass1[i] = i == index;
                                                                                }
                                                                              });
                                                                              if (trainclass1[0]) {
                                                                                _travelClass1Controller.text = 'SL';
                                                                              }
                                                                              if (trainclass1[1]) {
                                                                                _travelClass1Controller.text = 'SC';
                                                                              }
                                                                              if (trainclass1[2]) {
                                                                                _travelClass1Controller.text = 'CC';
                                                                              }
                                                                              if (trainclass1[3]) {
                                                                                _travelClass1Controller.text = '3A';
                                                                              }
                                                                              if (trainclass1[4]) {
                                                                                _travelClass1Controller.text = '2A';
                                                                              }
                                                                              if (trainclass1[5]) {
                                                                                _travelClass1Controller.text = '1A';
                                                                              }
                                                                            }),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ])
                                                          : Container(),
                                            ],
                                          ),
                                          //Text('${_travelClassController.text}'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            Container(
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
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      'Origin',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: TextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            _destinationController,
                                                        decoration: InputDecoration(
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
                                              width: 20,
                                            ),
                                            Container(
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
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      'Destination',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: TextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            _originController,
                                                        decoration: InputDecoration(
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
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    40,
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
                                                          'Travel Date',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                            controller:
                                                                _traveldate1Controller,
                                                            readOnly: true,
                                                            decoration: InputDecoration(
                                                                constraints: BoxConstraints(
                                                                    maxWidth: MediaQuery.of(context)
                                                                            .size
                                                                            .width -
                                                                        100)),
                                                            onTap: () async {
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
                                                              TimeOfDay? t = await showTimePicker(
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
                                                                t!.hour,
                                                              );
                                                              if (pickeddate !=
                                                                  null) {
                                                                setState(() {
                                                                  _traveldate1Controller
                                                                      .text = DateFormat(
                                                                          "yyyy-MM-dd HH-mm-ss")
                                                                      .format(
                                                                          pickeddate);
                                                                  print(
                                                                      _etaController
                                                                          .text);
                                                                });
                                                              }
                                                            })
                                                      ]),
                                                )),
                                            SizedBox(
                                              width: 1,
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          'Select Travel Time:',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 12)),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      ToggleButtons(
                                                        renderBorder: false,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        children: [
                                                          Tooltip(
                                                            message: '6am',
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .manual,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    _isSelected1[
                                                                            0]
                                                                        ? c2
                                                                        : c1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: ImageIcon(
                                                                  AssetImage(
                                                                      'assets/images/before6am_active.png'),
                                                                  size: 24,
                                                                  color: _isSelected1[
                                                                          0]
                                                                      ? Colors
                                                                          .white
                                                                      : Colors.blue[
                                                                          300]),
                                                            ),
                                                          ),
                                                          Tooltip(
                                                            message:
                                                                '6amto12pm',
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .manual,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    _isSelected1[
                                                                            1]
                                                                        ? c2
                                                                        : c1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: ImageIcon(
                                                                  AssetImage(
                                                                      'assets/images/6amto12pm_active.png'),
                                                                  size: 24,
                                                                  color: _isSelected1[
                                                                          1]
                                                                      ? Colors
                                                                          .white
                                                                      : Colors.blue[
                                                                          300]),
                                                            ),
                                                          ),
                                                          Tooltip(
                                                              message:
                                                                  '12pmto6pm',
                                                              triggerMode:
                                                                  TooltipTriggerMode
                                                                      .manual,
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      _isSelected1[
                                                                              2]
                                                                          ? c2
                                                                          : c1,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: ImageIcon(
                                                                    AssetImage(
                                                                        'assets/images/12pmto6pm_active.png'),
                                                                    size: 24,
                                                                    color: _isSelected1[
                                                                            2]
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .blue[300]),
                                                              )),
                                                          Tooltip(
                                                              message:
                                                                  'after6pm',
                                                              triggerMode:
                                                                  TooltipTriggerMode
                                                                      .manual,
                                                              child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        _isSelected1[3]
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
                                                                      color: _isSelected1[
                                                                              3]
                                                                          ? Colors
                                                                              .white
                                                                          : Colors
                                                                              .blue[300])))
                                                        ],
                                                        isSelected:
                                                            _isSelected1,
                                                        onPressed: (int index) {
                                                          setState(() {
                                                            for (int i = 0;
                                                                i <
                                                                    _isSelected1
                                                                        .length;
                                                                i++) {
                                                              _isSelected1[i] =
                                                                  i == index;
                                                            }
                                                          });
                                                          if (index == 0 &&
                                                              _isSelected1[
                                                                      index] ==
                                                                  true) {
                                                            _traveltime1Controller
                                                                    .text =
                                                                'Before 6am';
                                                          } else if (index ==
                                                                  1 &&
                                                              _isSelected1[
                                                                      index] ==
                                                                  true) {
                                                            _traveltime1Controller
                                                                    .text =
                                                                '6am to 12pm';
                                                          } else if (index ==
                                                                  2 &&
                                                              _isSelected1[
                                                                      index] ==
                                                                  true) {
                                                            _traveltime1Controller
                                                                    .text =
                                                                '12pm to 6pm';
                                                          } else {
                                                            _traveltime1Controller
                                                                    .text =
                                                                'After 6pm';
                                                          }
                                                        },
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
                                                        'ETA',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      Container(
                                                          width: 150,
                                                          child: TextFormField(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              controller:
                                                                  _eta1Controller,
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
                                                                        t.parse(_traveldate1Controller
                                                                            .text),
                                                                    firstDate: t.parse(
                                                                        _traveldate1Controller
                                                                            .text),
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
                                                                    _eta1Controller
                                                                        .text = DateFormat(
                                                                            "yyyy-MM-dd HH-mm-ss")
                                                                        .format(
                                                                            pickeddate);
                                                                    print(_etaController
                                                                        .text);
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Select Food Preference',
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 12)),
                                                  Container(
                                                    child: ToggleButtons(
                                                      color: Colors.black,
                                                      fillColor:
                                                          Colors.transparent,
                                                      renderBorder: false,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      children: [
                                                        Tooltip(
                                                            message: 'veg',
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .manual,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    _isSelected2[
                                                                            0]
                                                                        ? c2
                                                                        : c1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                              child: ImageIcon(
                                                                  AssetImage(
                                                                      'assets/images/carrot.png'),
                                                                  size: 24,
                                                                  color: _isSelected2[
                                                                          0]
                                                                      ? Colors
                                                                          .white
                                                                      : Colors.blue[
                                                                          300]),
                                                            )),
                                                        Tooltip(
                                                            message: 'nonveg',
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .manual,
                                                            child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      _isSelected2[
                                                                              1]
                                                                          ? c2
                                                                          : c1,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: ImageIcon(
                                                                    AssetImage(
                                                                        'assets/images/nonveg.png'),
                                                                    size: 24,
                                                                    color: _isSelected2[
                                                                            1]
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .blue[300])))
                                                      ],
                                                      isSelected: _isSelected2,
                                                      onPressed: (int index) {
                                                        setState(() {
                                                          for (int i = 0;
                                                              i <
                                                                  _isSelected2
                                                                      .length;
                                                              i++) {
                                                            _isSelected2[i] =
                                                                i == index;
                                                          }
                                                        });
                                                        if (index == 0 &&
                                                            _isSelected2[
                                                                    index] ==
                                                                true) {
                                                          _food1Controller
                                                                  .text =
                                                              'Vegetarian';
                                                        } else if (index == 1 &&
                                                            _isSelected2[
                                                                    index] ==
                                                                true) {
                                                          _food1Controller
                                                                  .text =
                                                              'Non-Vegetarian';
                                                        }
                                                      },
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Container(
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
                                                                ' Seat Preference',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                              travelmode[0]
                                                                  ? DropdownMenu(
                                                                      inputDecorationTheme: InputDecorationTheme(
                                                                          border: InputBorder
                                                                              .none),
                                                                      onSelected:
                                                                          (s) {
                                                                        if (s ==
                                                                            'select an option') {
                                                                          _seat1Controller.text =
                                                                              '';
                                                                        }
                                                                        if (s ==
                                                                            'Window') {
                                                                          _seat1Controller.text =
                                                                              'Window';
                                                                        }
                                                                        if (s ==
                                                                            'Aisle') {
                                                                          _seat1Controller.text =
                                                                              'Aisle';
                                                                        }
                                                                      },
                                                                      controller:
                                                                          _seat1Controller,
                                                                      dropdownMenuEntries: [
                                                                        'select an option',
                                                                        'Window',
                                                                        'Aisle'
                                                                      ]
                                                                          .map((e) => DropdownMenuEntry(
                                                                              label:
                                                                                  e,
                                                                              value:
                                                                                  e))
                                                                          .toList())
                                                                  : DropdownMenu(
                                                                      onSelected:
                                                                          (s) {
                                                                        if (s ==
                                                                            'Select an option') {
                                                                          _seat1Controller.text =
                                                                              '';
                                                                        }
                                                                      },
                                                                      controller:
                                                                          _seat1Controller,
                                                                      inputDecorationTheme: InputDecorationTheme(
                                                                          border: InputBorder
                                                                              .none),
                                                                      dropdownMenuEntries:
                                                                          [
                                                                        'Select an option'
                                                                            'up',
                                                                        'down'
                                                                      ].map((e) => DropdownMenuEntry(label: e, value: e)).toList())
                                                            ])))
                                                : Container(),
                                            !widget.isInternational
                                                ? Container()
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 -
                                                              20,
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
                                                            ' Region',
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
                                                            child: DropdownMenu(
                                                                hintText:
                                                                    'Region',
                                                                inputDecorationTheme: InputDecorationTheme(
                                                                    border: InputBorder
                                                                        .none,
                                                                    hintStyle: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            1,
                                                                            75,
                                                                            148))),
                                                                onSelected:
                                                                    (s) {
                                                                  if (s ==
                                                                      'Select an option') {
                                                                    _region2Controller
                                                                        .text = '';
                                                                  }
                                                                },
                                                                controller:
                                                                    _region2Controller,
                                                                dropdownMenuEntries: [
                                                                  'Select an option',
                                                                  'Asia/Africa',
                                                                  'Europe/America'
                                                                ]
                                                                    .map((e) => DropdownMenuEntry(
                                                                        label:
                                                                            e,
                                                                        value:
                                                                            e))
                                                                    .toList()),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                          ]),
                                          SizedBox(height: 10),

                                          SizedBox(
                                            height: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                baggagereturn = !baggagereturn;
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: baggagereturn ? c2 : c1,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: ImageIcon(
                                                  AssetImage(
                                                      'assets/images/baggage_btn_icon.png'),
                                                  size: 24,
                                                  color: baggagereturn
                                                      ? Colors.white
                                                      : Colors.blue[300]),
                                            ),
                                          ),
                                          Visibility(
                                              visible: baggagereturn,
                                              child: Card(
                                                elevation: 4,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 8.0,
                                                                bottom: 8,
                                                                top: 8),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(children: [
                                                                Container(
                                                                  width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          2 -
                                                                      40,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .black26),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
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
                                                                            'Bags:',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                            )),
                                                                        DropdownMenu(
                                                                          requestFocusOnTap:
                                                                              false,
                                                                          textStyle:
                                                                              TextStyle(color: Colors.black),
                                                                          hintText:
                                                                              'Bags',
                                                                          inputDecorationTheme: InputDecorationTheme(
                                                                              border: InputBorder.none,
                                                                              hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                          controller:
                                                                              _bag2Controller,
                                                                          initialSelection:
                                                                              _bag2Controller.text,
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 2 - 40,
                                                                          dropdownMenuEntries:
                                                                              bags.map((int e) {
                                                                            return DropdownMenuEntry(
                                                                                value: e,
                                                                                label: '$e');
                                                                          }).toList(),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 20),
                                                                Container(
                                                                    width: MediaQuery.of(context).size.width /
                                                                            2 -
                                                                        40,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .black26),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5)),
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
                                                                              'Total Weight:',
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                              )),
                                                                          TextFormField(
                                                                            autovalidateMode:
                                                                                AutovalidateMode.onUserInteraction,
                                                                            controller:
                                                                                _totalweight2Controller,
                                                                            decoration: InputDecoration(
                                                                                border: InputBorder.none,
                                                                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100),
                                                                                hintText: 'Total Extra Weight(Kgs)',
                                                                                hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ))
                                                              ]),
                                                              SizedBox(
                                                                  height: 10),
                                                              Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      10,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .black26),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                        Text(
                                                                            'Remarks:',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                            )),
                                                                        TextFormField(
                                                                          controller:
                                                                              _remarks2Controller,
                                                                          decoration: InputDecoration(
                                                                              border: InputBorder.none,
                                                                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100),
                                                                              hintText: 'Remarks',
                                                                              hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                        ),
                                                                      ]))),
                                                            ]))),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ))
                                : Container(),
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
                                      ' Comments',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      controller: _comments1Controller,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ])),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: ToggleButtons(
                                      isSelected: select,
                                      renderBorder: false,
                                      children: [
                                        Container(
                                            width: 125,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: select[0]
                                                  ? Colors.amber
                                                  : Colors.white,
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Onwards',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: const Color.fromARGB(
                                                    255, 1, 75, 148),
                                              ),
                                            ))),
                                        Container(
                                            width: 125,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: select[1]
                                                  ? Colors.amber
                                                  : Colors.white,
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Return',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: const Color.fromARGB(
                                                    255, 1, 75, 148),
                                              ),
                                            )))
                                      ],
                                      onPressed: (index) {
                                        setState(() {
                                          for (int i = 0;
                                              i < select.length;
                                              i++) select[i] = i == index;
                                        });
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      TextButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              print("1");
                              if (_travelClassController.text.isNotEmpty &&
                                  _seatController.text.isNotEmpty &&
                                  _foodController.text.isNotEmpty) {
                                print(2);
                                bool isConditionMet = true;
                                bool Condition2 = true;
                                bool Condition3 = true;
                                if (accom[0] || accom[1]) {
                                  if (accom[0]) {
                                    isConditionMet = isConditionMet &&
                                        _accomodationController.text.isNotEmpty;
                                  }

                                  if (accom[1]) {
                                    isConditionMet = isConditionMet &&
                                        _occupancyController.text.isNotEmpty &&
                                        _bagController.text.isNotEmpty;
                                  }
                                  if (widget.isInternational) {
                                    Condition2 = Condition2 &&
                                        _regionController.text.isNotEmpty;
                                  }
                                }
                                if (baggagereturn) {
                                  if (_bag2Controller.text.isNotEmpty &&
                                      _totalweight2Controller.text.isNotEmpty) {
                                    Condition3 = true;
                                  } else {
                                    Condition3 = false;
                                  }
                                }
                                if (widget.isInternational) {
                                  if (isConditionMet &&
                                      Condition2 &&
                                      Condition3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                RoundTripInternational(data: {
                                                  'travelmode':
                                                      _traveltypeController
                                                          .text,
                                                  'travelclass':
                                                      _travelClassController
                                                          .text,
                                                  'origin':
                                                      _originController.text,
                                                  'destination':
                                                      _destinationController
                                                          .text,
                                                  'traveldate':
                                                      _traveldateController
                                                          .text,
                                                  'traveltime':
                                                      _traveltimeController
                                                          .text,
                                                  'eta': _etaController.text,
                                                  'food': _foodController.text,
                                                  'seat': _seatController.text,
                                                  'comments':
                                                      _comments1Controller.text,
                                                  'accomodation':
                                                      _accomodationController
                                                          .text,
                                                  'occupancy':
                                                      _occupancyController.text,
                                                  'checkin':
                                                      _checkinController.text,
                                                  'checkout':
                                                      _checkoutController.text,
                                                  'bags': _bagController.text,
                                                  'weight':
                                                      _totalweightController
                                                          .text,
                                                  'remarks':
                                                      _remarksController.text,
                                                  'travelmodeereturn':
                                                      _traveltype1Controller
                                                          .text,
                                                  'travelclassreturn':
                                                      _travelClass1Controller
                                                          .text,
                                                  'originreturn':
                                                      _destinationController
                                                          .text,
                                                  'destinationreturn':
                                                      _originController.text,
                                                  'traveldatereturn':
                                                      _traveldate1Controller
                                                          .text,
                                                  'traveltimereturn':
                                                      _traveltime1Controller
                                                          .text,
                                                  'etareturn':
                                                      _eta1Controller.text,
                                                  'foodreturn':
                                                      _food1Controller.text,
                                                  'seatreturn':
                                                      _seat1Controller.text,
                                                  'region':
                                                      _regionController.text,
                                                  'regionreturn':
                                                      _region2Controller.text,
                                                  'bagreturn':
                                                      _bag2Controller.text,
                                                  'totalweightreturn':
                                                      _totalweight2Controller
                                                          .text,
                                                  'remarksreturn':
                                                      _remarks2Controller.text
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
                                } else {
                                  if (isConditionMet) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                RoundTripDomestic(data: {
                                                  'travelmode':
                                                      _traveltypeController
                                                          .text,
                                                  'travelclass':
                                                      _travelClassController
                                                          .text,
                                                  'origin':
                                                      _originController.text,
                                                  'destination':
                                                      _destinationController
                                                          .text,
                                                  'traveldate':
                                                      _traveldateController
                                                          .text,
                                                  'traveltime':
                                                      _traveltimeController
                                                          .text,
                                                  'eta': _etaController.text,
                                                  'food': _foodController.text,
                                                  'seat': _seatController.text,
                                                  'comments':
                                                      _comments1Controller.text,
                                                  'accomodation':
                                                      _accomodationController
                                                          .text,
                                                  'occupancy':
                                                      _occupancyController.text,
                                                  'checkin':
                                                      _checkinController.text,
                                                  'checkout':
                                                      _checkoutController.text,
                                                  'bags': _bagController.text,
                                                  'weight':
                                                      _totalweightController
                                                          .text,
                                                  'remarks':
                                                      _remarksController.text,
                                                  'travelmodeereturn':
                                                      _traveltype1Controller
                                                          .text,
                                                  'travelclassreturn':
                                                      _travelClass1Controller
                                                          .text,
                                                  'originreturn':
                                                      _destinationController
                                                          .text,
                                                  'destinationreturn':
                                                      _originController.text,
                                                  'traveldatereturn':
                                                      _traveldate1Controller
                                                          .text,
                                                  'traveltimereturn':
                                                      _traveltime1Controller
                                                          .text,
                                                  'etareturn':
                                                      _eta1Controller.text,
                                                  'foodreturn':
                                                      _food1Controller.text,
                                                  'seatreturn':
                                                      _seat1Controller.text,
                                                  'bagreturn':
                                                      _bag2Controller.text,
                                                  'totalweightreturn':
                                                      _totalweight2Controller
                                                          .text,
                                                  'remarksreturn':
                                                      _remarks2Controller.text
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ))),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RoundTrip(
                                        isInternational:
                                            widget.isInternational)));
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
                              )))
                    ])
                  ],
                ))));
  }
}
