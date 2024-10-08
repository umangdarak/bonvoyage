import 'dart:convert';
import 'dart:math';

import 'package:bonvoyage/multicitynew/multicitynewdomestic.dart';
import 'package:bonvoyage/multicitynew/multicitynext.dart';
import 'package:bonvoyage/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MultiCity extends StatefulWidget {
  MultiCity({super.key, required this.isInternational});
  bool isInternational;

  @override
  State<MultiCity> createState() => _MultiCityState();
}

class _MultiCityState extends State<MultiCity> {
  int counter = 1;
  Color c = Color.fromARGB(255, 1, 75, 148);
  List<bool> gestures = List.generate(1, (index) => false);
  final formkey = GlobalKey<FormState>();
  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  List<TextEditingController> _traveltypeController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _travelClassController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _originController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _destinationController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _traveldateController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _etaController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _foodController =
      List.generate(1, (index) => TextEditingController());

  List<TextEditingController> _seatController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _accomodationController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _occupancyController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _bagController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _checkinController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _checkoutController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _totalweightController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _remarksController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _hotelController =
      List.generate(1, (index) => TextEditingController());
  List<TextEditingController> _regionController =
      List.generate(1, (index) => TextEditingController());

  List<List<bool>> travelmode = List.generate(1, (index) => [true, false]);

  List<List<bool>> travelmodedomestic =
      List.generate(1, (index) => [true, false, false]);
  List<List<bool>> _isSelected = List.generate(1, (index) => [false, false]);

  List<List<bool>> trainclass =
      List.generate(1, (index) => List.generate(3, (index) => false));
  List<List<bool>> trainclassdomestic =
      List.generate(1, (index) => List.generate(6, (index) => false));
  List<List<bool>> roadclassdomestic =
      List.generate(1, (index) => [false, false]);
  List<List<bool>> _isSelected1 =
      List.generate(1, (index) => List.generate(4, (index) => false));
  List<List<bool>> _isSelected2 = List.generate(1, (index) => [false, false]);
  List<List<bool>> _accom2 = List.generate(1, (index) => [false, false]);
  List<List<bool>> _occupancy =
      List.generate(1, (index) => [false, false, false]);
  List<List<bool>> accom = List.generate(1, (index) => [false, false]);
  List<List<int>> bags =
      List.generate(1, (index) => List.generate(4, (index) => index));
  Color c1 = Color.fromARGB(255, 191, 218, 240);
  Color c2 = Color.fromARGB(255, 1, 75, 148);
  List<Set<String>> traveltimevalues = List.generate(1, (index) => {});
  List<String> traveltimevalues1 = [
    'Before 6am',
    '6am to 12pm',
    '12pm to 6pm',
    'After 6pm'
  ];
  String generateRandomString({int length = 10}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    final result =
        List.generate(length, (index) => chars[random.nextInt(chars.length)]);
    return base64Url.encode(utf8.encode(result.join()));
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
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => DashBoard()));
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.amber)),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                child: Column(children: [
                  Flexible(
                    child: ListView.builder(
                        itemCount: gestures.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Color.fromARGB(255, 250, 246, 246),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        gestures[index] = !gestures[index];
                                        _traveltypeController[index].text =
                                            'Flight';
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(FontAwesomeIcons.locationDot,
                                                  size: 25,
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148)),
                                              SizedBox(width: 5),
                                              Text('Travel Details',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Color.fromARGB(
                                                          255, 1, 75, 148))),
                                            ],
                                          ),
                                        ),
                                        Row(children: [
                                          index != 0
                                              ? IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      counter--;
                                                      if (index >= 0 && index < gestures.length) {     gestures.removeAt(index);    }
                                                      if (index >= 0 && index < _traveltypeController.length) {     _traveltypeController.removeAt(index);    }
                                                      if (index >= 0 && index < _travelClassController.length) {     _travelClassController.removeAt(index);    }
                                                      if (index >= 0 && index < _originController.length) {     _originController.removeAt(index);    }
                                                      if (index >= 0 && index < _destinationController.length) {     _destinationController.removeAt(index);    }
                                                      if (index >= 0 && index < _traveldateController.length) {     _traveldateController.removeAt(index);    }
                                                      if (index >= 0 && index < _etaController.length) {     _etaController.removeAt(index);    }
                                                      if (index >= 0 && index < _foodController.length) {     _foodController.removeAt(index);    }
                                                      if (index >= 0 && index < _seatController.length) {     _seatController.removeAt(index);    }
                                                      if (index >= 0 && index < _accomodationController.length) {     _accomodationController.removeAt(index);    }
                                                      if (index >= 0 && index < _occupancyController.length) {     _occupancyController.removeAt(index);    }
                                                      if (index >= 0 && index < _hotelController.length) {     _hotelController.removeAt(index);    }
                                                      if (index >= 0 && index < _checkinController.length) {     _checkinController.removeAt(index);    }
                                                      if (index >= 0 && index < _checkoutController.length) {     _checkoutController.removeAt(index);    }
                                                      if (index >= 0 && index < _bagController.length) {     _bagController.removeAt(index);    }
                                                      if (index >= 0 && index < _totalweightController.length) {     _totalweightController.removeAt(index);    }
                                                      if (index >= 0 && index < _remarksController.length) {     _remarksController.removeAt(index);    }
                                                      if (index >= 0 && index < _regionController.length) {     _regionController.removeAt(index);    }
                                                      if (index >= 0 && index < travelmode.length) {     travelmode.removeAt(index);    }
                                                      if (index >= 0 && index < _isSelected.length) {     _isSelected.removeAt(index);    }
                                                      if (index >= 0 && index < trainclass.length) {     trainclass.removeAt(index);    }
                                                      if (index >= 0 && index < _isSelected1.length) {     _isSelected1.removeAt(index);    }
                                                      if (index >= 0 && index < _isSelected2.length) {     _isSelected2.removeAt(index);    }
                                                      if (index >= 0 && index < _accom2.length) {     _accom2.removeAt(index);    }
                                                      if (index >= 0 && index < _occupancy.length) {     _occupancy.removeAt(index);    }
                                                      if (index >= 0 && index < accom.length) {     accom.removeAt(index);    }
                                                      if (index >= 0 && index < bags.length) {     bags.removeAt(index);    }
                                                      if (index >= 0 && index < traveltimevalues.length) {     traveltimevalues.removeAt(index);    }
                                                      if (index >= 0 && index < travelmodedomestic.length) {     travelmodedomestic.removeAt(index);    }
                                                      if (index >= 0 && index < trainclassdomestic.length) {     trainclassdomestic.removeAt(index);    }
                                                      if (index >= 0 && index < roadclassdomestic.length) {     roadclassdomestic.removeAt(index);    }

                                                      
                                                    });
                                                  },
                                                  icon: Icon(
                                                      Icons
                                                          .delete_outline_rounded,
                                                      color: c))
                                              : Container(),
                                          Icon(
                                              gestures[index]
                                                  ? Icons
                                                      .arrow_drop_down_outlined
                                                  : Icons
                                                      .arrow_drop_up_outlined,
                                              color: c,
                                              size: 34)
                                        ])
                                      ],
                                    ),
                                  ),
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Origin:',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: _validateRequired,
                                                controller:
                                                    _originController[index],
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
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
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          40,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black26),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Destination:',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: TextFormField(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: _validateRequired,
                                                controller:
                                                    _destinationController[
                                                        index],
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    constraints: BoxConstraints(
                                                        maxWidth: MediaQuery.of(
                                                                    context)
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
                                  gestures[index]
                                      ? Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                          'Select Travel Mode:',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                    widget.isInternational
                                                        ? ToggleButtons(
                                                            isSelected:
                                                                travelmode[
                                                                    index],
                                                            renderBorder: false,
                                                            children: [
                                                              Tooltip(
                                                                message:
                                                                    'Flight',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child: Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8),
                                                                    decoration: BoxDecoration(
                                                                        color: travelmode[index][0]
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
                                                                    child: Icon(
                                                                        FontAwesomeIcons.plane,
                                                                        size: 24,
                                                                        color: travelmode[index][0] ? Colors.white : Colors.blue[300])),
                                                              ),
                                                              Tooltip(
                                                                message:
                                                                    'Train',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child: Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8),
                                                                    decoration: BoxDecoration(
                                                                        color: travelmode[index][1]
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
                                                                    child: Icon(
                                                                        FontAwesomeIcons.train,
                                                                        size: 24,
                                                                        color: travelmode[index][1] ? Colors.white : Colors.blue[300])),
                                                              ),
                                                            ],
                                                            onPressed: (p) {
                                                              print(
                                                                  _traveltypeController[
                                                                          index]
                                                                      .text);
                                                              setState(() {
                                                                for (int i = 0;
                                                                    i <
                                                                        travelmode[index]
                                                                            .length;
                                                                    i++) {
                                                                  travelmode[
                                                                          index]
                                                                      [
                                                                      i] = i == p;
                                                                }
                                                              });
                                                              if (p == 0 &&
                                                                  travelmode[
                                                                          index]
                                                                      [p]) {
                                                                _traveltypeController[
                                                                            index]
                                                                        .text =
                                                                    'Flight';
                                                              }
                                                              if (p == 1 &&
                                                                  travelmode[
                                                                          index]
                                                                      [p]) {
                                                                _traveltypeController[
                                                                            index]
                                                                        .text =
                                                                    'Rail';
                                                              }
                                                              print(
                                                                  _traveltypeController[
                                                                          index]
                                                                      .text);
                                                            },
                                                          )
                                                        : ToggleButtons(
                                                            isSelected:
                                                                travelmodedomestic[
                                                                    index],
                                                            renderBorder: false,
                                                            children: [
                                                              Tooltip(
                                                                message:
                                                                    'Flight',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child: Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8),
                                                                    decoration: BoxDecoration(
                                                                        color: travelmodedomestic[index][0]
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
                                                                    child: Icon(
                                                                        FontAwesomeIcons.plane,
                                                                        size: 24,
                                                                        color: travelmodedomestic[index][0] ? Colors.white : Colors.blue[300])),
                                                              ),
                                                              Tooltip(
                                                                message:
                                                                    'Train',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child: Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8),
                                                                    decoration: BoxDecoration(
                                                                        color: travelmodedomestic[index][1]
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
                                                                    child: Icon(
                                                                        FontAwesomeIcons.train,
                                                                        size: 24,
                                                                        color: travelmodedomestic[index][1] ? Colors.white : Colors.blue[300])),
                                                              ),
                                                              Tooltip(
                                                                message: 'Road',
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .manual,
                                                                child: Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8),
                                                                    decoration: BoxDecoration(
                                                                        color: travelmodedomestic[index][2]
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
                                                                    child: Icon(
                                                                        FontAwesomeIcons.car,
                                                                        size: 24,
                                                                        color: travelmodedomestic[index][2] ? Colors.white : Colors.blue[300])),
                                                              )
                                                            ],
                                                            onPressed: (p) {
                                                              print(
                                                                  _traveltypeController[
                                                                          index]
                                                                      .text);
                                                              setState(() {
                                                                for (int i = 0;
                                                                    i <
                                                                        travelmodedomestic[index]
                                                                            .length;
                                                                    i++) {
                                                                  travelmodedomestic[
                                                                          index]
                                                                      [
                                                                      i] = i == p;
                                                                }
                                                              });
                                                              if (p == 0 &&
                                                                  travelmodedomestic[
                                                                          index]
                                                                      [p]) {
                                                                _traveltypeController[
                                                                            index]
                                                                        .text =
                                                                    'Flight';
                                                              }
                                                              if (p == 1 &&
                                                                  travelmodedomestic[
                                                                          index]
                                                                      [p]) {
                                                                _traveltypeController[
                                                                            index]
                                                                        .text =
                                                                    'Rail';
                                                              }
                                                              if (p == 2 &&
                                                                  travelmodedomestic[
                                                                          index]
                                                                      [p]) {
                                                                _traveltypeController[
                                                                            index]
                                                                        .text =
                                                                    'Road';
                                                              }
                                                              print(
                                                                  _traveltypeController[
                                                                          index]
                                                                      .text);
                                                            },
                                                          )
                                                  ],
                                                ),
                                                SizedBox(width: 20),
                                                widget.isInternational
                                                    ? (travelmode[index][0]
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
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  ToggleButtons(
                                                                    renderBorder:
                                                                        false,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    children: [
                                                                      Tooltip(
                                                                          message:
                                                                              'Economy',
                                                                          triggerMode: TooltipTriggerMode
                                                                              .manual,
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.all(8),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: _isSelected[index][0] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                              borderRadius: BorderRadius.circular(30),
                                                                            ),
                                                                            child:
                                                                                ImageIcon(
                                                                              size: 24,
                                                                              color: _isSelected[index][0] ? Colors.white : Colors.blue[300],
                                                                              AssetImage('assets/images/travel_class_flight_btn_economy_icon_active.png'),
                                                                            ),
                                                                          )),
                                                                      Tooltip(
                                                                          message:
                                                                              'Business',
                                                                          triggerMode: TooltipTriggerMode
                                                                              .manual,
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.all(8),
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(30), color: _isSelected[index][1] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240)),
                                                                            child:
                                                                                ImageIcon(
                                                                              size: 24,
                                                                              color: _isSelected[index][1] ? Colors.white : Colors.blue[300],
                                                                              AssetImage('assets/images/travel_class_flight_btn_business_icon_active.png'),
                                                                            ),
                                                                          ))
                                                                    ],
                                                                    isSelected:
                                                                        _isSelected[
                                                                            index],
                                                                    onPressed: (int
                                                                        index1) {
                                                                      setState(
                                                                          () {
                                                                        for (int i =
                                                                                0;
                                                                            i < _isSelected[index].length;
                                                                            i++) {
                                                                          _isSelected[index][i] =
                                                                              i == index1;
                                                                        }
                                                                      });

                                                                      if (index1 ==
                                                                              0 &&
                                                                          _isSelected[index][index1] ==
                                                                              true) {
                                                                        _travelClassController[index].text =
                                                                            'Economy class';
                                                                      } else if (index1 ==
                                                                              1 &&
                                                                          _isSelected[index][index1] ==
                                                                              true) {
                                                                        _travelClassController[index].text =
                                                                            'Business class';
                                                                      }
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        : travelmode[index][1]
                                                            ? Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child: Text(
                                                                          'Select Travel Class:',
                                                                          style:
                                                                              TextStyle(color: Colors.black)),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          50,
                                                                      width:
                                                                          210,
                                                                      child:
                                                                          ListView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          ToggleButtons(
                                                                              renderBorder: false,
                                                                              children: [
                                                                                Tooltip(
                                                                                    message: 'SL',
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: trainclass[index][0] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Text('SL', style: TextStyle(fontSize: 24, color: trainclass[index][0] ? Colors.white : Colors.blue[300])))),
                                                                                Tooltip(
                                                                                    message: '2A',
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: trainclass[index][1] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Text('2A', style: TextStyle(fontSize: 24, color: trainclass[index][1] ? Colors.white : Colors.blue[300])))),
                                                                                Tooltip(
                                                                                    message: '1A',
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: trainclass[index][2] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Text('1A', style: TextStyle(fontSize: 24, color: trainclass[index][2] ? Colors.white : Colors.blue[300]))))
                                                                              ],
                                                                              isSelected: trainclass[index],
                                                                              onPressed: (index1) {
                                                                                setState(() {
                                                                                  for (int i = 0; i < trainclass[index].length; i++) {
                                                                                    trainclass[index][i] = i == index1;
                                                                                  }
                                                                                });
                                                                                if (trainclass[index][0]) {
                                                                                  _travelClassController[index].text = 'SL';
                                                                                }

                                                                                if (trainclass[index][1]) {
                                                                                  _travelClassController[index].text = '2A';
                                                                                }
                                                                                if (trainclass[index][2]) {
                                                                                  _travelClassController[index].text = '1A';
                                                                                }
                                                                              })
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ])
                                                            : Container())
                                                    : travelmodedomestic[index]
                                                            [0]
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
                                                                        color: Colors
                                                                            .black)),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  ToggleButtons(
                                                                    renderBorder:
                                                                        false,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    children: [
                                                                      Tooltip(
                                                                          message:
                                                                              'Economy',
                                                                          triggerMode: TooltipTriggerMode
                                                                              .manual,
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.all(8),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: _isSelected[index][0] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                              borderRadius: BorderRadius.circular(30),
                                                                            ),
                                                                            child:
                                                                                ImageIcon(
                                                                              size: 24,
                                                                              color: _isSelected[index][0] ? Colors.white : Colors.blue[300],
                                                                              AssetImage('assets/images/travel_class_flight_btn_economy_icon_active.png'),
                                                                            ),
                                                                          )),
                                                                      Tooltip(
                                                                          message:
                                                                              'Business',
                                                                          triggerMode: TooltipTriggerMode
                                                                              .manual,
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.all(8),
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(30), color: _isSelected[index][1] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240)),
                                                                            child:
                                                                                ImageIcon(
                                                                              size: 24,
                                                                              color: _isSelected[index][1] ? Colors.white : Colors.blue[300],
                                                                              AssetImage('assets/images/travel_class_flight_btn_business_icon_active.png'),
                                                                            ),
                                                                          ))
                                                                    ],
                                                                    isSelected:
                                                                        _isSelected[
                                                                            index],
                                                                    onPressed: (int
                                                                        index1) {
                                                                      setState(
                                                                          () {
                                                                        for (int i =
                                                                                0;
                                                                            i < _isSelected[index].length;
                                                                            i++) {
                                                                          _isSelected[index][i] =
                                                                              i == index1;
                                                                        }
                                                                      });

                                                                      if (index1 ==
                                                                              0 &&
                                                                          _isSelected[index][index1] ==
                                                                              true) {
                                                                        _travelClassController[index].text =
                                                                            'Economy class';
                                                                      } else if (index1 ==
                                                                              1 &&
                                                                          _isSelected[index][index1] ==
                                                                              true) {
                                                                        _travelClassController[index].text =
                                                                            'Business class';
                                                                      }
                                                                      print(_travelClassController[
                                                                              index]
                                                                          .text);
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        : travelmodedomestic[
                                                                index][1]
                                                            ? Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child: Text(
                                                                          'Select Travel Class:',
                                                                          style:
                                                                              TextStyle(color: Colors.black)),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          50,
                                                                      width:
                                                                          210,
                                                                      child:
                                                                          ListView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        children: [
                                                                          ToggleButtons(
                                                                              renderBorder: false,
                                                                              children: [
                                                                                Tooltip(
                                                                                    message: 'SL',
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: trainclassdomestic[index][0] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Text('SL', style: TextStyle(fontSize: 24, color: trainclassdomestic[index][0] ? Colors.white : Colors.blue[300])))),
                                                                                Tooltip(
                                                                                    message: 'SC',
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: trainclassdomestic[index][1] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Text('SC', style: TextStyle(fontSize: 24, color: trainclassdomestic[index][1] ? Colors.white : Colors.blue[300])))),
                                                                                Tooltip(
                                                                                    message: 'CC',
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: trainclassdomestic[index][2] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Text('CC', style: TextStyle(fontSize: 24, color: trainclassdomestic[index][2] ? Colors.white : Colors.blue[300])))),
                                                                                Tooltip(
                                                                                    message: '3A',
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: trainclassdomestic[index][3] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Text('3A', style: TextStyle(fontSize: 24, color: trainclassdomestic[index][3] ? Colors.white : Colors.blue[300])))),
                                                                                Tooltip(
                                                                                    message: '2A',
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: trainclassdomestic[index][4] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Text('2A', style: TextStyle(fontSize: 24, color: trainclassdomestic[index][4] ? Colors.white : Colors.blue[300])))),
                                                                                Tooltip(
                                                                                    message: '1A',
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: trainclassdomestic[index][5] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Text('1A', style: TextStyle(fontSize: 24, color: trainclassdomestic[index][5] ? Colors.white : Colors.blue[300]))))
                                                                              ],
                                                                              isSelected: trainclassdomestic[index],
                                                                              onPressed: (index1) {
                                                                                setState(() {
                                                                                  for (int i = 0; i < trainclassdomestic[index].length; i++) {
                                                                                    trainclassdomestic[index][i] = i == index1;
                                                                                  }
                                                                                });
                                                                                if (trainclassdomestic[index][0]) {
                                                                                  _travelClassController[index].text = 'SL';
                                                                                }

                                                                                if (trainclassdomestic[index][1]) {
                                                                                  _travelClassController[index].text = 'SC';
                                                                                }
                                                                                if (trainclassdomestic[index][2]) {
                                                                                  _travelClassController[index].text = 'CC';
                                                                                }
                                                                                if (trainclassdomestic[index][3]) {
                                                                                  _travelClassController[index].text = '3A';
                                                                                }
                                                                                if (trainclassdomestic[index][4]) {
                                                                                  _travelClassController[index].text = '2A';
                                                                                }
                                                                                if (trainclassdomestic[index][5]) {
                                                                                  _travelClassController[index].text = '1A';
                                                                                }
                                                                                print(_travelClassController[index].text);
                                                                              }),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ])
                                                            : travelmodedomestic[
                                                                    index][2]
                                                                ? Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child: Text(
                                                                            'Select Travel Class:',
                                                                            style:
                                                                                TextStyle(color: Colors.black)),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      ToggleButtons(
                                                                          renderBorder:
                                                                              false,
                                                                          children: [
                                                                            Tooltip(
                                                                                message: 'Bus',
                                                                                triggerMode: TooltipTriggerMode.manual,
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(8),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: roadclassdomestic[index][0] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240)),
                                                                                  child: Icon(
                                                                                    FontAwesomeIcons.bus,
                                                                                    size: 24,
                                                                                    color: roadclassdomestic[index][0] ? Colors.white : Colors.blue[300],
                                                                                  ),
                                                                                )),
                                                                            Tooltip(
                                                                                message: 'Car',
                                                                                triggerMode: TooltipTriggerMode.manual,
                                                                                child: Container(
                                                                                    padding: EdgeInsets.all(8),
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: roadclassdomestic[index][1] ? Color.fromARGB(255, 1, 75, 148) : Color.fromARGB(255, 191, 218, 240)),
                                                                                    child: Icon(
                                                                                      FontAwesomeIcons.car,
                                                                                      size: 24,
                                                                                      color: roadclassdomestic[index][1] ? Colors.white : Colors.blue[300],
                                                                                    )))
                                                                          ],
                                                                          isSelected: roadclassdomestic[
                                                                              index],
                                                                          onPressed:
                                                                              (inde1x) {
                                                                            setState(() {
                                                                              for (int i = 0; i < roadclassdomestic[index].length; i++) {
                                                                                roadclassdomestic[index][i] = i == inde1x;
                                                                              }
                                                                            });
                                                                            if (roadclassdomestic[index][0]) {
                                                                              _travelClassController[index].text = 'Bus';
                                                                            }
                                                                            if (roadclassdomestic[index][1]) {
                                                                              _travelClassController[index].text = 'Car';
                                                                            }
                                                                            print(_travelClassController[index].text);
                                                                          }),
                                                                    ],
                                                                  )
                                                                : Container()
                                              ],
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
                                                          color:
                                                              Colors.black26),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('Travel Date:',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                          TextFormField(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              validator:
                                                                  _validateRequired,
                                                              style: TextStyle(
                                                                  color:
                                                                      Colors
                                                                          .black),
                                                              controller:
                                                                  _traveldateController[
                                                                      index],
                                                              readOnly: true,
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  constraints: BoxConstraints(
                                                                      maxWidth: MediaQuery.of(context)
                                                                              .size
                                                                              .width -
                                                                          100),
                                                                  hintText:
                                                                      'Travel Date',
                                                                  hintStyle: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          1,
                                                                          75,
                                                                          148))),
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

                                                                DateTime
                                                                    pickeddate =
                                                                    DateTime(
                                                                  d!.year,
                                                                  d.month,
                                                                  d.day,
                                                                );
                                                                setState(() {
                                                                  _traveldateController[
                                                                          index]
                                                                      .text = DateFormat(
                                                                          "yyyy-MM-dd")
                                                                      .format(
                                                                          pickeddate);
                                                                });
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
                                                                    .black)),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Column(
                                                          children: [
                                                            ToggleButtons(
                                                              renderBorder:
                                                                  false,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              children: [
                                                                Tooltip(
                                                                  message:
                                                                      '6am',
                                                                  triggerMode:
                                                                      TooltipTriggerMode
                                                                          .manual,
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(8),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: _isSelected1[index]
                                                                              [
                                                                              0]
                                                                          ? c2
                                                                          : c1,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                    child: ImageIcon(
                                                                        AssetImage(
                                                                            'assets/images/before6am_active.png'),
                                                                        size:
                                                                            24,
                                                                        color: _isSelected1[index][0]
                                                                            ? Colors.white
                                                                            : Colors.blue[300]),
                                                                  ),
                                                                ),
                                                                Tooltip(
                                                                  message:
                                                                      '6amto12pm',
                                                                  triggerMode:
                                                                      TooltipTriggerMode
                                                                          .manual,
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(8),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: _isSelected1[index]
                                                                              [
                                                                              1]
                                                                          ? c2
                                                                          : c1,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                    child: ImageIcon(
                                                                        AssetImage(
                                                                            'assets/images/6amto12pm_active.png'),
                                                                        size:
                                                                            24,
                                                                        color: _isSelected1[index][1]
                                                                            ? Colors.white
                                                                            : Colors.blue[300]),
                                                                  ),
                                                                ),
                                                                Tooltip(
                                                                    message:
                                                                        '12pmto6pm',
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
                                                                        color: _isSelected1[index][2]
                                                                            ? c2
                                                                            : c1,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                      child: ImageIcon(
                                                                          AssetImage(
                                                                              'assets/images/12pmto6pm_active.png'),
                                                                          size:
                                                                              24,
                                                                          color: _isSelected1[index][2]
                                                                              ? Colors.white
                                                                              : Colors.blue[300]),
                                                                    )),
                                                                Tooltip(
                                                                    message:
                                                                        'after6pm',
                                                                    triggerMode:
                                                                        TooltipTriggerMode
                                                                            .manual,
                                                                    child: Container(
                                                                        padding: EdgeInsets.all(8),
                                                                        decoration: BoxDecoration(
                                                                          color: _isSelected1[index][3]
                                                                              ? c2
                                                                              : c1,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        child: ImageIcon(AssetImage('assets/images/after6pm_active.png'), size: 24, color: _isSelected1[index][3] ? Colors.white : Colors.blue[300])))
                                                              ],
                                                              isSelected:
                                                                  _isSelected1[
                                                                      index],
                                                              onPressed:
                                                                  (int index1) {
                                                                setState(() {
                                                                  if (_isSelected1[
                                                                          index]
                                                                      [
                                                                      index1]) {
                                                                    traveltimevalues[
                                                                            index]
                                                                        .remove(
                                                                            traveltimevalues1[index1]);
                                                                  } else {
                                                                    traveltimevalues[
                                                                            index]
                                                                        .add(traveltimevalues1[
                                                                            index1]);
                                                                  }
                                                                  _isSelected1[
                                                                          index]
                                                                      [
                                                                      index1] = !_isSelected1[
                                                                          index]
                                                                      [index1];
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ]))
                                            ]),
                                            SizedBox(height: 10),
                                            Container(
                                              child: Row(children: [
                                                Container(
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
                                                            left: 8.0, top: 8),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Eta:',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black)),
                                                        Container(
                                                            width: 158,
                                                            child:
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
                                                                        _etaController[
                                                                            index],
                                                                    readOnly:
                                                                        true,
                                                                    decoration: InputDecoration(
                                                                        constraints: BoxConstraints(
                                                                            maxWidth: MediaQuery.of(context).size.width -
                                                                                100),
                                                                        hintText:
                                                                            'ETA',
                                                                        hintStyle: TextStyle(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                1,
                                                                                75,
                                                                                148))),
                                                                    onTap:
                                                                        () async {
                                                                      DateFormat
                                                                          t =
                                                                          DateFormat(
                                                                              "yyyy-MM-dd");

                                                                      DateTime? d = await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate: t.parse(_traveldateController[index]
                                                                              .text),
                                                                          firstDate: t.parse(_traveldateController[index]
                                                                              .text),
                                                                          lastDate:
                                                                              DateTime(2101));
                                                                      TimeOfDay? c = await showTimePicker(
                                                                          context:
                                                                              context,
                                                                          initialTime:
                                                                              TimeOfDay.now());
                                                                      DateTime pickeddate = DateTime(
                                                                          d!.year,
                                                                          d.month,
                                                                          d.day,
                                                                          c!.hour,
                                                                          c.minute);

                                                                      if (pickeddate !=
                                                                          null) {
                                                                        setState(
                                                                            () {
                                                                          _etaController[index].text =
                                                                              DateFormat("yyyy-MM-dd HH-mm-ss").format(pickeddate);
                                                                          print(
                                                                              _etaController[index].text);
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
                                                    Text(
                                                        'Select Food Preference',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    1,
                                                                    75,
                                                                    148),
                                                            fontSize: 12)),
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          ToggleButtons(
                                                            color: Colors.black,
                                                            fillColor: Colors
                                                                .transparent,
                                                            renderBorder: false,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            children: [
                                                              Tooltip(
                                                                  message:
                                                                      'veg',
                                                                  triggerMode:
                                                                      TooltipTriggerMode
                                                                          .manual,
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(8),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: _isSelected2[index]
                                                                              [
                                                                              0]
                                                                          ? c2
                                                                          : c1,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                    child: ImageIcon(
                                                                        AssetImage(
                                                                            'assets/images/carrot.png'),
                                                                        size:
                                                                            24,
                                                                        color: _isSelected2[index][0]
                                                                            ? Colors.white
                                                                            : Colors.blue[300]),
                                                                  )),
                                                              Tooltip(
                                                                  message:
                                                                      'nonveg',
                                                                  triggerMode:
                                                                      TooltipTriggerMode
                                                                          .manual,
                                                                  child:
                                                                      Container(
                                                                          padding: EdgeInsets.all(
                                                                              8),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: _isSelected2[index][1]
                                                                                ? c2
                                                                                : c1,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30),
                                                                          ),
                                                                          child: ImageIcon(
                                                                              AssetImage('assets/images/nonveg.png'),
                                                                              size: 24,
                                                                              color: _isSelected2[index][1] ? Colors.white : Colors.blue[300])))
                                                            ],
                                                            isSelected:
                                                                _isSelected2[
                                                                    index],
                                                            onPressed:
                                                                (int index1) {
                                                              setState(() {
                                                                for (int i = 0;
                                                                    i <
                                                                        _isSelected2[index]
                                                                            .length;
                                                                    i++) {
                                                                  _isSelected2[
                                                                              index]
                                                                          [i] =
                                                                      i ==
                                                                          index1;
                                                                }
                                                              });
                                                              if (index1 == 0 &&
                                                                  _isSelected2[
                                                                              index]
                                                                          [
                                                                          index1] ==
                                                                      true) {
                                                                _foodController[
                                                                            index]
                                                                        .text =
                                                                    'Vegetarian';
                                                              } else if (index1 ==
                                                                      1 &&
                                                                  _isSelected2[
                                                                              index]
                                                                          [
                                                                          index1] ==
                                                                      true) {
                                                                _foodController[
                                                                            index]
                                                                        .text =
                                                                    'Non-Vegetarian';
                                                              }
                                                              print(
                                                                  _foodController[
                                                                          index]
                                                                      .text);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ))
                                              ]),
                                            ),
                                            SizedBox(height: 10),
                                            Row(children: [
                                              (travelmode[index][0] || travelmode[index][1] || travelmode[index][2])
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width / 2 -
                                                      40,
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: DropdownMenu(
                                                  width: MediaQuery.of(context).size.width / 2 -
                                                      40,
                                                  hintText: 'Seat',
                                                  inputDecorationTheme: InputDecorationTheme(
                                                      border: InputBorder.none,
                                                      hintStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 1, 75, 148))),
                                                  onSelected: (s) {
                                                    if (s ==
                                                        'select an option') {
                                                      _seatController[index].text = '';
                                                    } else {
                                                      _seatController[index].text = s;
                                                    }
                                                  },
                                                  initialSelection:
                                                      _seatController[index].text,
                                                  controller: _seatController[index],
                                                  dropdownMenuEntries: (!widget
                                                              .isInternational
                                                          ? (_travelClassController[index].text == 'Business class' ||
                                                                  _travelClassController[index].text ==
                                                                      'Economy class'
                                                              ? [
                                                                  'Select',
                                                                  'Window',
                                                                  'Aisle'
                                                                ]
                                                              : (_travelClassController[index].text == 'SL' ||
                                                                      _travelClassController[index].text ==
                                                                          '3A'
                                                                  ? [
                                                                      'Select',
                                                                      'Lower',
                                                                      'Middle',
                                                                      'Side-Lower',
                                                                      'Side-Middle',
                                                                      'Side-Upper',
                                                                      'Upper'
                                                                    ]
                                                                  : (_travelClassController[index].text == 'SC' ||
                                                                          _travelClassController[index].text ==
                                                                              'CC'
                                                                      ? [
                                                                          'Select',
                                                                          'Normal',
                                                                          'Window'
                                                                        ]
                                                                      : (_travelClassController[index].text == '2A'
                                                                          ? ['Select', 'Side-Lower', 'Lower', 'Side-Upper', 'Upper']
                                                                          : (_travelClassController[index].text == '1A'
                                                                              ? ['Select', 'Cabin', 'Coupe', 'Lower', 'Upper']
                                                                              : (_travelClassController[index].text == 'Car'
                                                                                  ? ['Select', 'Normal']
                                                                                  : (_travelClassController[index].text == 'Bus'
                                                                                      ? [
                                                                                          'Select',
                                                                                          "Normal-Non AC",
                                                                                          "Semi Sleeper-Normal",
                                                                                          "Semi Sleeper-Window AC",
                                                                                          "Sleeper-Lower",
                                                                                          "Sleeper-Upper",
                                                                                          "Window-AC",
                                                                                          "Window-Non AC"
                                                                                        ]
                                                                                      : ([]))))))))
                                                          : (_travelClassController[index].text == 'Business class' || _travelClassController[index].text == 'Economy class' ? ['Select', 'Window', 'Aisle'] : (_travelClassController[index].text == 'SL' || _travelClassController[index].text == '3A' ? ['Select', 'Lower', 'Middle', 'Side-Lower', 'Side-Middle', 'Side-Upper', 'Upper'] : (_travelClassController[index].text == '2A' ? ['Select', 'Side-Lower', 'Lower', 'Side-Upper', 'Upper'] : (_travelClassController[index].text == '1A' ? ['Select', 'Cabin', 'Coupe', 'Lower', 'Upper'] : [])))))
                                                      .map((e) => DropdownMenuEntry(label: e, value: e))
                                                      .toList()),
                                            )
                                          ])))
                              : Container(),
                                              SizedBox(width: 10),
                                              widget.isInternational
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            20,
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
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 8.0,
                                                                      top: 8),
                                                              child: Text(
                                                                  'Region:',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black)),
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
                                                                          'Region',
                                                                      inputDecorationTheme: InputDecorationTheme(
                                                                          border: InputBorder
                                                                              .none,
                                                                          hintStyle: TextStyle(
                                                                              color: Color.fromARGB(255, 1, 75,
                                                                                  148))),
                                                                      onSelected:
                                                                          (s) {
                                                                        if (s ==
                                                                            'Select an option') {
                                                                          _regionController[index].text =
                                                                              '';
                                                                        }
                                                                      },
                                                                      controller:
                                                                          _regionController[
                                                                              index],
                                                                      dropdownMenuEntries: [
                                                                        'Select an option',
                                                                        'Asia/Africa',
                                                                        'Europe/America'
                                                                      ]
                                                                          .map((e) => DropdownMenuEntry(
                                                                              label: e,
                                                                              value: e))
                                                                          .toList()),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : Container()
                                            ]),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ToggleButtons(
                                                  color: Colors.black,
                                                  fillColor: Colors.transparent,
                                                  renderBorder: false,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  isSelected: accom[index],
                                                  children: [
                                                    Tooltip(
                                                        message: 'accomodation',
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .manual,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: accom[index]
                                                                    [0]
                                                                ? c2
                                                                : c1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          child: ImageIcon(
                                                              AssetImage(
                                                                  'assets/images/accommodation_icon.png'),
                                                              size: 24,
                                                              color: accom[
                                                                      index][0]
                                                                  ? Colors.white
                                                                  : Colors.blue[
                                                                      300]),
                                                        )),
                                                    Tooltip(
                                                        message: 'baggage',
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .manual,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: accom[index]
                                                                    [1]
                                                                ? c2
                                                                : c1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          child: ImageIcon(
                                                              AssetImage(
                                                                  'assets/images/baggage_btn_icon.png'),
                                                              size: 24,
                                                              color: accom[
                                                                      index][1]
                                                                  ? Colors.white
                                                                  : Colors.blue[
                                                                      300]),
                                                        ))
                                                  ],
                                                  onPressed: (int index1) {
                                                    setState(() {
                                                      accom[index][index1] =
                                                          !accom[index][index1];
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            Visibility(
                                                visible: accom[index][0],
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
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                            )),
                                                                        Column(
                                                                          children: [
                                                                            ToggleButtons(
                                                                              color: Colors.black,
                                                                              fillColor: Colors.transparent,
                                                                              renderBorder: false,
                                                                              borderRadius: BorderRadius.circular(30),
                                                                              children: [
                                                                                Tooltip(
                                                                                    message: 'house',
                                                                                    triggerMode: TooltipTriggerMode.manual,
                                                                                    child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: _accom2[index][0] ? c2 : c1,
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: ImageIcon(AssetImage('assets/images/accommodation_btn_icon.png'), size: 24, color: _accom2[index][0] ? Colors.white : Colors.blue[300]),
                                                                                    )),
                                                                                Tooltip(
                                                                                    message: 'hotel',
                                                                                    triggerMode: TooltipTriggerMode.manual,
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: _accom2[index][1] ? c2 : c1,
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: ImageIcon(AssetImage('assets/images/hotel_btn_icon.png'), size: 24, color: _accom2[index][1] ? Colors.white : Colors.blue[300])))
                                                                              ],
                                                                              isSelected: _accom2[index],
                                                                              onPressed: (int index1) {
                                                                                setState(() {
                                                                                  for (int i = 0; i < _accom2[index].length; i++) {
                                                                                    _accom2[index][i] = i == index1;
                                                                                  }
                                                                                });
                                                                                if (index1 == 0 && _accom2[index][index1] == true) {
                                                                                  _accomodationController[index].text = 'Private House';
                                                                                } else if (index1 == 1 && _accom2[index][index1] == true) {
                                                                                  _accomodationController[index].text = 'Hotel';
                                                                                }
                                                                              },
                                                                            ),
                                                                          ],
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
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                            )),
                                                                        Column(
                                                                          children: [
                                                                            ToggleButtons(
                                                                              color: Colors.black,
                                                                              fillColor: Colors.transparent,
                                                                              renderBorder: false,
                                                                              borderRadius: BorderRadius.circular(30),
                                                                              children: [
                                                                                Tooltip(
                                                                                    message: 'Single',
                                                                                    triggerMode: TooltipTriggerMode.manual,
                                                                                    child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: _occupancy[index][0] ? c2 : c1,
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: ImageIcon(AssetImage('assets/images/1_Occupancy_btn_icon.png'), size: 24, color: _occupancy[index][0] ? Colors.white : Colors.blue[300]),
                                                                                    )),
                                                                                Tooltip(
                                                                                    message: 'Couple',
                                                                                    triggerMode: TooltipTriggerMode.manual,
                                                                                    child: Container(
                                                                                      padding: EdgeInsets.all(8),
                                                                                      decoration: BoxDecoration(
                                                                                        color: _occupancy[index][1] ? c2 : c1,
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                      ),
                                                                                      child: ImageIcon(AssetImage('assets/images/2_Occupancies_btn_icon.png'), size: 24, color: _occupancy[index][1] ? Colors.white : Colors.blue[300]),
                                                                                    )),
                                                                                Tooltip(
                                                                                    message: 'Many',
                                                                                    triggerMode: TooltipTriggerMode.manual,
                                                                                    child: Container(
                                                                                        padding: EdgeInsets.all(8),
                                                                                        decoration: BoxDecoration(
                                                                                          color: _occupancy[index][2] ? c2 : c1,
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: ImageIcon(AssetImage('assets/images/3_Occupancies_btn_icon.png'), size: 24, color: _occupancy[index][2] ? Colors.white : Colors.blue[300])))
                                                                              ],
                                                                              isSelected: _occupancy[index],
                                                                              onPressed: (int index1) {
                                                                                setState(() {
                                                                                  for (int i = 0; i < _occupancy[index].length; i++) {
                                                                                    _occupancy[index][i] = i == index1;
                                                                                  }
                                                                                });
                                                                                if (index1 == 0 && _occupancy[index][index1] == true) {
                                                                                  _occupancyController[index].text = 'Single';
                                                                                } else if (index1 == 1 && _occupancy[index][index1] == true) {
                                                                                  _occupancyController[index].text = 'Couple';
                                                                                } else if (index == 2 && _occupancy[index][index1] == true) {
                                                                                  _occupancyController[index].text = 'Family';
                                                                                }
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          0.05,
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                _accom2[index]
                                                                        [1]
                                                                    ? Container(
                                                                        width: MediaQuery.of(context).size.width /
                                                                                2 -
                                                                            40,
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(color: Colors.black26),
                                                                            borderRadius: BorderRadius.circular(5)),
                                                                        child: Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 8.0),
                                                                          child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text('Hotel Preference:',
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                    )),
                                                                                TextFormField(
                                                                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                  validator: _validateRequired,
                                                                                  style: TextStyle(color: Colors.black),
                                                                                  controller: _hotelController[index],
                                                                                  decoration: InputDecoration(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100), hintText: 'Hotel', hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                                )
                                                                              ]),
                                                                        ))
                                                                    : Container(),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(children: [
                                                                  Container(
                                                                      width: MediaQuery.of(context).size.width /
                                                                              2 -
                                                                          40,
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              color: Colors
                                                                                  .black26),
                                                                          borderRadius: BorderRadius.circular(
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
                                                                              Text('Check-In:',
                                                                                  style: TextStyle(
                                                                                    color: Colors.black,
                                                                                  )),
                                                                              TextFormField(
                                                                                  validator: _validateRequired,
                                                                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                  style: TextStyle(color: Colors.black),
                                                                                  controller: _checkinController[index],
                                                                                  readOnly: true,
                                                                                  decoration: InputDecoration(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100), hintText: 'Check-In', hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                                  onTap: () async {
                                                                                    DateFormat t = DateFormat("yyyy-MM-dd");
                                                                                    DateTime? pickeddate = await showDatePicker(context: context, initialDate: t.parse(_etaController[index].text), firstDate: t.parse(_etaController[index].text), lastDate: DateTime(2101));
                                                                                    if (pickeddate != null) {
                                                                                      setState(() {
                                                                                        _checkinController[index].text = DateFormat("yyyy-MM-dd").format(pickeddate);
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
                                                                          borderRadius: BorderRadius.circular(
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
                                                                              Text('Check-Out:',
                                                                                  style: TextStyle(
                                                                                    color: Colors.black,
                                                                                  )),
                                                                              TextFormField(
                                                                                  validator: _validateRequired,
                                                                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                  style: TextStyle(color: Colors.black),
                                                                                  controller: _checkoutController[index],
                                                                                  readOnly: true,
                                                                                  decoration: InputDecoration(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100), hintText: 'Check-Out', hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                                  onTap: () async {
                                                                                    DateFormat t = DateFormat("yyyy-MM-dd");
                                                                                    DateTime? pickeddate = await showDatePicker(context: context, initialDate: t.parse(_checkinController[index].text), firstDate: t.parse(_checkinController[index].text), lastDate: DateTime(2101));
                                                                                    if (pickeddate != null) {
                                                                                      setState(() {
                                                                                        _checkoutController[index].text = DateFormat("yyyy-MM-dd").format(pickeddate);
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
                                                visible: accom[index][1],
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
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
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
                                                                    Row(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 2 - 40,
                                                                            decoration:
                                                                                BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.circular(5)),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text('Bags:',
                                                                                      style: TextStyle(
                                                                                        color: Colors.black,
                                                                                      )),
                                                                                  DropdownMenu(
                                                                                    requestFocusOnTap: false,
                                                                                    textStyle: TextStyle(color: Colors.black),
                                                                                    hintText: 'Bags',
                                                                                    inputDecorationTheme: InputDecorationTheme(border: InputBorder.none, hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                                    controller: _bagController[index],
                                                                                    initialSelection: _bagController[index].text,
                                                                                    width: MediaQuery.of(context).size.width / 2 - 40,
                                                                                    dropdownMenuEntries: bags[index].map((int e) {
                                                                                      return DropdownMenuEntry(value: e, label: '$e');
                                                                                    }).toList(),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                              width: 20),
                                                                          Container(
                                                                              width: MediaQuery.of(context).size.width / 2 - 40,
                                                                              decoration: BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.circular(5)),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text('Total Weight:',
                                                                                        style: TextStyle(
                                                                                          color: Colors.black,
                                                                                        )),
                                                                                    TextFormField(
                                                                                      validator: _validateRequired,
                                                                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                      controller: _totalweightController[index],
                                                                                      decoration: InputDecoration(border: InputBorder.none, constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100), hintText: 'Total Extra Weight(Kgs)', hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ))
                                                                        ]),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Container(
                                                                        width: MediaQuery.of(context).size.width -
                                                                            10,
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(color: Colors.black26),
                                                                            borderRadius: BorderRadius.circular(5)),
                                                                        child: Padding(
                                                                            padding: const EdgeInsets.all(8.0),
                                                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                              Text('Remarks:',
                                                                                  style: TextStyle(
                                                                                    color: Colors.black,
                                                                                  )),
                                                                              TextFormField(
                                                                                controller: _remarksController[index],
                                                                                decoration: InputDecoration(border: InputBorder.none, constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100), hintText: 'Remarks', hintStyle: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
                                                                              ),
                                                                            ]))),
                                                                  ])))),
                                                )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  gestures[index] =
                                                      !gestures[index];
                                                });
                                              },
                                              child: Icon(
                                                  gestures[index]
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: c,
                                                  size: 34),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () async {
                            if (counter >= 3) {
                              List<Map<String, String>> d = [];
                              for (int i = 0; i <= counter - 1; i++) {
                                if (formkey.currentState!.validate()) {
                                  // Map<String, String> each = {
                                  //   'travelmode': _traveltypeController[i].text,
                                  //   'travelclass':
                                  //       _travelClassController[i].text,
                                  //   'origin': _originController[i].text,
                                  //   'destination':
                                  //       _destinationController[i].text,
                                  //   'traveldate': _traveldateController[i].text,
                                  //   // 'traveltime': c,
                                  //   'eta': _etaController[i].text,
                                  //   'food': _foodController[i].text,
                                  //   'seat': _seatController[i].text,
                                  //   'accomodation':
                                  //       _accomodationController[i].text,
                                  //   'occupancy': _occupancyController[i].text,
                                  //   'checkin': _checkinController[i].text,
                                  //   'checkout': _checkoutController[i].text,
                                  //   'bags': _bagController[i].text,
                                  //   'weight': _totalweightController[i].text,
                                  //   'remarks': _remarksController[i].text,
                                  // };
                                  // print(each);
                                  if (_travelClassController[i]
                                          .text
                                          .isNotEmpty &&
                                      traveltimevalues[i].isNotEmpty &&
                                      _foodController[i].text.isNotEmpty) {
                                    bool isConditionMet = true;

                                    if (widget.isInternational) {
                                      isConditionMet = isConditionMet &&
                                          _regionController[i].text.isNotEmpty;
                                    }
                                    if (!widget.isInternational &&
                                        !travelmodedomestic[i][2]) {
                                      isConditionMet = isConditionMet &&
                                          _seatController[i].text.isNotEmpty;
                                    }
                                    if (accom[i][0] || accom[i][1]) {
                                      if (accom[i][0]) {
                                        isConditionMet = isConditionMet &&
                                            _accomodationController[i]
                                                .text
                                                .isNotEmpty;
                                      }

                                      if (accom[i][1]) {
                                        isConditionMet = isConditionMet &&
                                            _occupancyController[i]
                                                .text
                                                .isNotEmpty &&
                                            _bagController[i].text.isNotEmpty;
                                      }
                                    }
                                    if (isConditionMet) {
                                      if (widget.isInternational) {
                                        String c =
                                            traveltimevalues[i].join(',');
                                        Map<String, String> each = {
                                          'travelmode':
                                              _traveltypeController[i].text,
                                          'travelclass':
                                              _travelClassController[i].text,
                                          'origin': _originController[i].text,
                                          'destination':
                                              _destinationController[i].text,
                                          'traveldate':
                                              _traveldateController[i].text,
                                          'traveltime': c,
                                          'eta': _etaController[i].text,
                                          'food': _foodController[i].text,
                                          'seat': _seatController[i].text,
                                          'region': _regionController[i].text,
                                          'accomodation':accom[i][0]?
                                              _accomodationController[i].text:'',
                                          'occupancy':accom[i][0]?
                                              _occupancyController[i].text:'',
                                              'hotel':accom[i][0]?_accomodationController[i].text=='Hotel'?_hotelController[i].text:'':'',
                                          'checkin':accom[i][0]? _checkinController[i].text:'',
                                          'checkout':accom[i][0]?
                                              _checkoutController[i].text:'',
                                          'bags': accom[i][1]?_bagController[i].text:'',
                                          'weight':accom[i][1]?
                                              _totalweightController[i].text:"",
                                          'remarks':accom[i][1]? _remarksController[i].text:'',
                                        };
                                        print(each);
                                        d.add(each);
                                      } else {
                                        String c =
                                            traveltimevalues[i].join(',');
                                        Map<String, String> each = {
                                          'travelmode':
                                              _traveltypeController[i].text,
                                          'travelclass':
                                              _travelClassController[i].text,
                                          'origin': _originController[i].text,
                                          'destination':
                                              _destinationController[i].text,
                                          'traveldate':
                                              _traveldateController[i].text,
                                          'traveltime': c,
                                          'eta': _etaController[i].text,
                                          'food': _foodController[i].text,
                                          'seat': _seatController[i].text,
                                          'accomodation':accom[i][0]?
                                              _accomodationController[i].text:'',
                                                                                            'hotel':accom[i][0]?_accomodationController[i].text=='Hotel'?_hotelController[i].text:'':'',

                                          'occupancy':accom[i][0]?
                                              _occupancyController[i].text:'',
                                          'checkin':accom[i][0]? _checkinController[i].text:'',
                                          'checkout':accom[i][0]?
                                              _checkoutController[i].text:'',
                                          'bags': accom[i][1]?_bagController[i].text:'',
                                          'weight':accom[i][1]?
                                              _totalweightController[i].text:"",
                                          'remarks':accom[i][1]? _remarksController[i].text:'',
                                        };
                                        print(each);
                                        d.add(each);
                                      }
                                    } else {
                                      print(_travelClassController[i].text +
                                          "s " +
                                          traveltimevalues[i].toString() +
                                          "d " +
                                          _seatController[i].text +
                                          "e " +
                                          _foodController[i].text +
                                          "f " +
                                          _regionController[i].text);
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
                                      break;
                                    }
                                  } else {
                                    print("pp");
                                    print(_travelClassController[i].text +
                                        " s " +
                                        traveltimevalues[i].toString() +
                                        " d " +
                                        _seatController[i].text +
                                        " e " +
                                        _foodController[i].text +
                                        " f " +
                                        _regionController[i].text);
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
                                    break;
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
                                                'Please enter atleast 3 travel indexes',
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
                                  break;
                                }
                              }

                              if (d.length != counter) {
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
                                              'Please enter all the details',
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
                                if (widget.isInternational) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              MultiCityNext(data: d)));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              Multicitynewdomestic(data: d)));
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
                                            'Please enter atleast 3 travel indexes',
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
                                    builder: (_) => MultiCity(
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
                              ))),
                    ],
                  )
                ]),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
            gestures.add(false);
            _traveltypeController.add(TextEditingController());
            _travelClassController.add(TextEditingController());
            _originController.add(TextEditingController());
            _destinationController.add(TextEditingController());
            _traveldateController.add(TextEditingController());
            _etaController.add(TextEditingController());
            _foodController.add(TextEditingController());
            _seatController.add(TextEditingController());
            _accomodationController.add(TextEditingController());
            _occupancyController.add(TextEditingController());
            _hotelController.add(TextEditingController());
            _checkinController.add(TextEditingController());
            _checkoutController.add(TextEditingController());
            _bagController.add(TextEditingController());
            _totalweightController.add(TextEditingController());
            _remarksController.add(TextEditingController());
            _regionController.add(TextEditingController());
            if (widget.isInternational) {
              travelmode.add([true, false]);
              _isSelected.add([false, false]);
              trainclass.add(List.generate(3, (index) => false));
            } else {
              travelmodedomestic.add([true, false, false]);
              trainclassdomestic.add(List.generate(6, (index) => false));
              _isSelected.add([false, false]);
              roadclassdomestic.add([false, false]);
            }
            _isSelected1.add(List.generate(4, (index) => false));
            _isSelected2.add([false, false]);
            _accom2.add([false, false]);
            _occupancy.add([false, false, false]);
            accom.add([false, false]);
            bags.add(List.generate(4, (index) => index));
            traveltimevalues.add({});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
