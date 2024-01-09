import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  Map<dynamic, dynamic>? send;
  final int? no;
  Details({super.key, required this.no,required this.send});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController _traveltypeController = TextEditingController();
  TextEditingController _travelClassController = TextEditingController();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  TextEditingController _traveldateController = TextEditingController();
  TextEditingController _traveltimeController = TextEditingController();
  TextEditingController _etaController = TextEditingController();
  TextEditingController _foodController = TextEditingController();
  TextEditingController _comments1Controller = TextEditingController();
  TextEditingController _seatController = TextEditingController();

  List<bool> _isSelected = [false, false];
  List<bool> _isSelected1 = [false, false, false, false];
  List<bool> _isSelected2 = [false, false];
  List<bool> travelmode = [true, false, false];
  List<bool> trainclass = List.generate(6, (index) => false);
  List<bool> roadclass = List.generate(2, (i) => false);
  bool s = false;
  Color c1 = Color.fromARGB(255, 191, 218, 240);
  Color c2 = Color.fromARGB(255, 1, 75, 148);

//all bools
  bool tripdetails = false;
  bool misc = false;

  List<bool> bottom = [true, false, false];
  saveall() {
    setState(() {
      widget.send = {
        'TravelType': _traveltypeController.text,
        'TravelClass': _travelClassController.text,
        'Origin': _originController.text,
        'Destination': _destinationController.text,
        'TravelDate': _traveldateController.text,
        'TravelTime': _traveltimeController.text,
        'ETA': _etaController.text,
        'Food': _foodController.text,
        'Comments': _comments1Controller.text,
        'SeatType': _seatController.text,
      };
    });
    print(widget.send);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              tripdetails = !tripdetails;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(Icons.location_on,
                        size: 25, color: Color.fromARGB(255, 1, 75, 148)),
                    SizedBox(width: 5),
                    Text('Location ${(widget.no! + 1)} Details',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 1, 75, 148)))
                  ]),
                  Icon(
                      tripdetails ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      size: 25,
                      color: Color.fromARGB(255, 1, 75, 148))
                ],
              ),
            ),
          ),
        ),
        tripdetails
            ? Form(
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
                                      Tooltip(
                                        message: 'Road',
                                        triggerMode: TooltipTriggerMode.manual,
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: travelmode[2]
                                                    ? Color.fromARGB(
                                                        255, 1, 75, 148)
                                                    : Color.fromARGB(
                                                        255, 191, 218, 240),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Icon(FontAwesomeIcons.car,
                                                size: 24,
                                                color: travelmode[2]
                                                    ? Colors.white
                                                    : Colors.blue[300])),
                                      ),
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
                                      if (travelmode[2]) {
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
                                      ToggleButtons(
                                        renderBorder: false,
                                        borderRadius: BorderRadius.circular(30),
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
                                                      : Color.fromARGB(
                                                          255, 191, 218, 240),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
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
                                                        BorderRadius.circular(
                                                            30),
                                                    color: _isSelected[1]
                                                        ? Color.fromARGB(
                                                            255, 1, 75, 148)
                                                        : Color.fromARGB(255,
                                                            191, 218, 240)),
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
                                  )
                                : travelmode[2]
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
                                                                color: _isSelected[
                                                                        1]
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
                                                              color: _isSelected[
                                                                      1]
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
                                                              child: Icon(
                                                                FontAwesomeIcons
                                                                    .car,
                                                                size: 24,
                                                                color: _isSelected[
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
                        //Text('${_travelClassController.text}'),
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
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Origin',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextFormField(
                                      controller: _destinationController,
                                      decoration: InputDecoration(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
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
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Destination',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextFormField(
                                      controller: _originController,
                                      decoration: InputDecoration(
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
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
                                      Text(
                                        'Travel Date',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          controller: _traveldateController,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          100)),
                                          onTap: () async {
                                            DateTime? d = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime(2101));
                                            TimeOfDay? t = await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now());
                                            DateTime pickeddate = DateTime(
                                              d!.year,
                                              d.month,
                                              d.day,
                                              t!.hour,
                                            );
                                            if (pickeddate != null) {
                                              setState(() {
                                                _traveldateController
                                                    .text = DateFormat(
                                                        "yyyy-MM-dd HH-mm-ss")
                                                    .format(pickeddate);
                                                print(_etaController.text);
                                              });
                                            }
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
                                            color: Colors.black54,
                                            fontSize: 12)),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ToggleButtons(
                                      renderBorder: false,
                                      borderRadius: BorderRadius.circular(30),
                                      children: [
                                        Tooltip(
                                          message: '6am',
                                          triggerMode:
                                              TooltipTriggerMode.manual,
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: _isSelected1[0] ? c2 : c1,
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
                                              color: _isSelected1[1] ? c2 : c1,
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
                                                color:
                                                    _isSelected1[2] ? c2 : c1,
                                                borderRadius:
                                                    BorderRadius.circular(30),
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
                                                  color:
                                                      _isSelected1[3] ? c2 : c1,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: ImageIcon(
                                                    AssetImage(
                                                        'assets/images/after6pm_active.png'),
                                                    size: 24,
                                                    color: _isSelected1[2]
                                                        ? Colors.white
                                                        : Colors.blue[300])))
                                      ],
                                      isSelected: _isSelected1,
                                      onPressed: (int index) {
                                        setState(() {
                                          for (int i = 0;
                                              i < _isSelected1.length;
                                              i++) {
                                            _isSelected1[i] = i == index;
                                          }
                                        });
                                        if (index == 0 &&
                                            _isSelected1[index] == true) {
                                          _traveltimeController.text =
                                              'Before 6am';
                                        } else if (index == 1 &&
                                            _isSelected1[index] == true) {
                                          _traveltimeController.text =
                                              '6am to 12pm';
                                        } else if (index == 2 &&
                                            _isSelected1[index] == true) {
                                          _traveltimeController.text =
                                              '12pm to 6pm';
                                        } else {
                                          _traveltimeController.text =
                                              'After 6pm';
                                        }
                                        print(_traveltimeController.text);
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
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ETA',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                    Container(
                                        width: 150,
                                        child: TextFormField(
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
                                                            100)),
                                            onTap: () async {
                                              DateFormat t = DateFormat(
                                                  "yyyy-MM-dd HH-mm-ss");

                                              DateTime? d =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
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
                                        color: Colors.black54, fontSize: 12)),
                                Container(
                                  child: ToggleButtons(
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
                                              color: _isSelected2[0] ? c2 : c1,
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
                                                color:
                                                    _isSelected2[1] ? c2 : c1,
                                                borderRadius:
                                                    BorderRadius.circular(30),
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
                                        _foodController.text = 'Non-Vegetarian';
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

                        (travelmode[0] || travelmode[1])
                            ? Padding(
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
                                            ' Seat Preference',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                          travelmode[0]
                                              ? DropdownMenu(
                                                  inputDecorationTheme:
                                                      InputDecorationTheme(
                                                          border:
                                                              InputBorder.none),
                                                  onSelected: (s) {
                                                    if (s ==
                                                        'select an option') {
                                                      _seatController.text = '';
                                                    }
                                                    if (s == 'Window') {
                                                      _seatController.text =
                                                          'Window';
                                                    }
                                                    if (s == 'Aisle') {
                                                      _seatController.text =
                                                          'Aisle';
                                                    }
                                                  },
                                                  controller: _seatController,
                                                  dropdownMenuEntries: [
                                                    'select an option',
                                                    'Window',
                                                    'Aisle'
                                                  ]
                                                      .map((e) =>
                                                          DropdownMenuEntry(
                                                              label: e,
                                                              value: e))
                                                      .toList())
                                              : DropdownMenu(
                                                  onSelected: (s) {
                                                    if (s ==
                                                        'Select an option') {
                                                      _seatController.text = '';
                                                    }
                                                  },
                                                  controller: _seatController,
                                                  inputDecorationTheme:
                                                      InputDecorationTheme(
                                                          border:
                                                              InputBorder.none),
                                                  dropdownMenuEntries: [
                                                    'Select an option'
                                                        'up',
                                                    'down'
                                                  ]
                                                      .map((e) =>
                                                          DropdownMenuEntry(
                                                              label: e,
                                                              value: e))
                                                      .toList())
                                        ])))
                            : Container(),
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
                                  ' Comments',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _comments1Controller,
                                  onFieldSubmitted: (v) {
                                    saveall();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
