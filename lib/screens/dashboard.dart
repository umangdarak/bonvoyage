import 'package:bonvoyage/approval/approval.dart';
import 'package:bonvoyage/forms/accomodation/accomodation.dart';
import 'package:bonvoyage/forms/bus.dart';
import 'package:bonvoyage/main.dart';

import 'package:bonvoyage/forms/roundtrip/roundtrip.dart';
import 'package:bonvoyage/multicitynew/multicity.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../forms/carbooking.dart';

import '../forms/OneWay/oneway.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  String? username;
  String? password;
  DashBoard({super.key, this.username, this.password});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<String> origins = ['Hyderabad', 'Mumbai', 'Delhi'];
  List<String> loc = ['Hyderabad', 'Mumbai', 'Delhi'];
  List<String> des = ['Delhi', 'Hyderabad', 'Mumbai'];
  List<String> date = ['29-01-2023', '01-02-2023', '04-01-2023'];
  List<String> datea = ['01-02-2023', '02-02-2023', '05-01-2023'];
  List<String> startt = ['06:50', '12:40', '16:30'];
  List<String> endt = ['23:00', '16:00', '04:20'];
  List<String> hotel = ['Taj', 'Taj Krishna', 'Ashok'];
  List<int> bags = [2, 4, 5];
  List<bool> traveltype = [false, false];
  List<bool> triptype = [false, false, false];
  String s = '';
  List<bool> busdestination = [true, false];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (DateTime.now().hour < 12) {
      s = 'Morning';
    } else if (DateTime.now().hour < 17) {
      s = 'Afternoon';
    } else {
      s = 'Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 75, 148),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mr ${authProvider.current.employeeName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Hotel Booking'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AccomodationPage()));
              },
            ),
            ListTile(
              title: Text('OutStation Booking'),
              onTap: () {
                closeDrawer();
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return StatefulBuilder(builder: (ctx, setState) {
                        return AlertDialog(
                          insetPadding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.topCenter,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Out Station',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 1, 75, 148)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.cancel_outlined,
                                    color: Colors.red),
                              )
                            ],
                          ),
                          actions: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Travel Trip',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          traveltype[0] = !traveltype[0];
                                          traveltype[1] = false;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: traveltype[0]
                                              ? const Color.fromARGB(
                                                  255, 1, 75, 148)
                                              : Colors.transparent,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text('Domestic Travel',
                                              style: TextStyle(
                                                  color: traveltype[0]
                                                      ? Colors.white
                                                      : Colors.black)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          traveltype[1] = !traveltype[1];
                                          traveltype[0] = false;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: traveltype[1]
                                              ? const Color.fromARGB(
                                                  255, 1, 75, 148)
                                              : Colors.transparent,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text('International Travel',
                                              style: TextStyle(
                                                  color: traveltype[1]
                                                      ? Colors.white
                                                      : Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Trip Type',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        triptype[0] = !triptype[0];
                                        triptype[2] = false;
                                        triptype[1] = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                        color: triptype[0]
                                            ? const Color.fromARGB(
                                                255, 1, 75, 148)
                                            : Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text('One Way',
                                            style: TextStyle(
                                                color: triptype[0]
                                                    ? Colors.white
                                                    : Colors.black)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        triptype[1] = !triptype[1];
                                        triptype[0] = false;
                                        triptype[2] = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                        color: triptype[1]
                                            ? const Color.fromARGB(
                                                255, 1, 75, 148)
                                            : Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text('Round Trip',
                                            style: TextStyle(
                                                color: triptype[1]
                                                    ? Colors.white
                                                    : Colors.black)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        triptype[2] = !triptype[2];
                                        triptype[0] = false;
                                        triptype[1] = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                        color: triptype[2]
                                            ? const Color.fromARGB(
                                                255, 1, 75, 148)
                                            : Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text('Multi City',
                                            style: TextStyle(
                                                color: triptype[2]
                                                    ? Colors.white
                                                    : Colors.black)),
                                      ),
                                    ),
                                  ),
                                ]),
                                const Divider(color: Colors.black),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: TextButton(
                                            onPressed: () {
                                              if (triptype[0] &&
                                                  traveltype[0]) {
                                                Navigator.push(
                                                    ctx,
                                                    MaterialPageRoute(
                                                        builder: (_) => OneWay(
                                                            isInternational:
                                                                false,
                                                            name:
                                                                widget.username,
                                                            password: widget
                                                                .password)));
                                              }
                                              if (triptype[1] &&
                                                  traveltype[0]) {
                                                Navigator.push(
                                                    ctx,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            RoundTrip(
                                                                isInternational:
                                                                    false)));
                                              }
                                              if ((triptype[2] &&
                                                  traveltype[0])) {
                                                Navigator.push(
                                                    ctx,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            MultiCity(
                                                                isInternational:
                                                                    false)));
                                              }
                                              if ((triptype[2] &&
                                                  traveltype[1])) {
                                                Navigator.push(
                                                    ctx,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            MultiCity(
                                                                isInternational:
                                                                    true)));
                                              }
                                              if (triptype[0] &&
                                                  traveltype[1]) {
                                                Navigator.push(
                                                    ctx,
                                                    MaterialPageRoute(
                                                        builder: (_) => OneWay(
                                                            isInternational:
                                                                true,
                                                            name:
                                                                widget.username,
                                                            password: widget
                                                                .password)));
                                              }
                                              if (triptype[1] &&
                                                  traveltype[1]) {
                                                Navigator.push(
                                                    ctx,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            RoundTrip(
                                                              isInternational:
                                                                  true,
                                                            )));
                                              }
                                            },
                                            child: Text('Ok',
                                                style: TextStyle(
                                                    color: Colors.green)),
                                          ),
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                for (int i = 0;
                                                    i < traveltype.length;
                                                    i++) {
                                                  traveltype[i] = false;
                                                }
                                                for (int i = 0;
                                                    i < triptype.length;
                                                    i++) {
                                                  triptype[i] = false;
                                                }
                                              });
                                            },
                                            child: Text('Cancel',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      });
                    });
              },
            ),
            ListTile(
              title: Text('Bus Booking'),
              onTap: () {
                closeDrawer();
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return StatefulBuilder(builder: (ctx, setState) {
                        return AlertDialog(
                          title: Text('Company Bus -8 PM'),
                          actions: [
                            Column(
                              children: [
                                Text(
                                  'Bus going from Shameerpet to',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => {
                                        setState(() {
                                          busdestination[0] =
                                              !busdestination[0];
                                          busdestination[1] = false;
                                        })
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: busdestination[0]
                                              ? const Color.fromARGB(
                                                  255, 1, 75, 148)
                                              : Colors.transparent,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text('Azamabad',
                                              style: TextStyle(
                                                  color: busdestination[0]
                                                      ? Colors.white
                                                      : Colors.black)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          busdestination[1] =
                                              !busdestination[1];
                                          busdestination[0] = false;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: busdestination[1]
                                              ? const Color.fromARGB(
                                                  255, 1, 75, 148)
                                              : Colors.transparent,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text('Lingampalli',
                                              style: TextStyle(
                                                  color: busdestination[1]
                                                      ? Colors.white
                                                      : Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                if (busdestination[0] == true) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) => BusForm(
                                                              destination:
                                                                  "Azamabad")));
                                                } else {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) => BusForm(
                                                              destination:
                                                                  "Lingampalli")));
                                                }
                                              });
                                            },
                                            child: Text('OK',
                                                style: TextStyle(
                                                    color: Colors.green)),
                                          ),
                                        )),
                                    Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text('Cancel',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      });
                    });
              },
            ),
            ListTile(
              title: Text('Car Booking'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => CarBooking()));
              },
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/Bon_Voyage_Login_BG.gif'),
                  fit: BoxFit.fill,
                  scale: 2),
              borderRadius: BorderRadius.circular(20)),
          child: SafeArea(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Container(
                        height: 250,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 5,
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 1, 75, 148),
                                    borderRadius: BorderRadius.circular(5)),
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  children: [
                                    Center(
                                        child: Image.asset(
                                            'assets/images/vv.png')),
                                    Positioned(
                                        child: IconButton(
                                      onPressed: () {
                                        openDrawer();
                                      },
                                      icon: Icon(Icons.menu, size: 34),
                                    )),
                                    Positioned(
                                      left: 50,
                                      top: 10,
                                      child: Text(
                                        'Bon',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 165, 0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                    ),
                                    Positioned(
                                      left: 95,
                                      top: 10,
                                      child: Text(
                                        'Voyage',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                    ),
                                    Positioned(
                                      top: 70,
                                      left: 5,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            child: Text(
                                                'Good $s ${authProvider.current.employeeName}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                      255,
                                                      255,
                                                      165,
                                                      0,
                                                    ),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                          ),
                                          const SizedBox(
                                            width: 200,
                                            child: Text('Welcome to BonVoyage',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 30,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          AccomodationPage()));
                                            },
                                            child: Stack(children: [
                                              Center(
                                                child: CircleAvatar(
                                                    radius: 36,
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 1, 75, 148),
                                                    child: Image.asset(
                                                        'assets/images/hotel.png')),
                                              ),
                                              Positioned.fill(
                                                bottom: 10,
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text('Hotel')),
                                                ),
                                              )
                                            ]),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return StatefulBuilder(
                                                        builder:
                                                            (ctx, setState) {
                                                      return AlertDialog(
                                                        insetPadding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        alignment:
                                                            Alignment.topCenter,
                                                        title: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Out Station',
                                                              style: TextStyle(
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      1,
                                                                      75,
                                                                      148)),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Icon(
                                                                  Icons
                                                                      .cancel_outlined,
                                                                  color: Colors
                                                                      .red),
                                                            )
                                                          ],
                                                        ),
                                                        actions: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Travel Trip',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                            .blue[
                                                                        800]),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        traveltype[0] =
                                                                            !traveltype[0];
                                                                        traveltype[1] =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.black),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: traveltype[0]
                                                                            ? const Color.fromARGB(
                                                                                255,
                                                                                1,
                                                                                75,
                                                                                148)
                                                                            : Colors.transparent,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                8.0),
                                                                        child: Text(
                                                                            'Domestic Travel',
                                                                            style:
                                                                                TextStyle(color: traveltype[0] ? Colors.white : Colors.black)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        traveltype[1] =
                                                                            !traveltype[1];
                                                                        traveltype[0] =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.black),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: traveltype[1]
                                                                            ? const Color.fromARGB(
                                                                                255,
                                                                                1,
                                                                                75,
                                                                                148)
                                                                            : Colors.transparent,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                8.0),
                                                                        child: Text(
                                                                            'International Travel',
                                                                            style:
                                                                                TextStyle(color: traveltype[1] ? Colors.white : Colors.black)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                'Trip Type',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                            .blue[
                                                                        800]),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      triptype[
                                                                              0] =
                                                                          !triptype[
                                                                              0];
                                                                      triptype[
                                                                              2] =
                                                                          false;
                                                                      triptype[
                                                                              1] =
                                                                          false;
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: triptype[
                                                                              0]
                                                                          ? const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148)
                                                                          : Colors
                                                                              .transparent,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              8.0),
                                                                      child: Text(
                                                                          'One Way',
                                                                          style:
                                                                              TextStyle(color: triptype[0] ? Colors.white : Colors.black)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      triptype[
                                                                              1] =
                                                                          !triptype[
                                                                              1];
                                                                      triptype[
                                                                              0] =
                                                                          false;
                                                                      triptype[
                                                                              2] =
                                                                          false;
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: triptype[
                                                                              1]
                                                                          ? const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148)
                                                                          : Colors
                                                                              .transparent,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              8.0),
                                                                      child: Text(
                                                                          'Round Trip',
                                                                          style:
                                                                              TextStyle(color: triptype[1] ? Colors.white : Colors.black)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      triptype[
                                                                              2] =
                                                                          !triptype[
                                                                              2];
                                                                      triptype[
                                                                              0] =
                                                                          false;
                                                                      triptype[
                                                                              1] =
                                                                          false;
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: triptype[
                                                                              2]
                                                                          ? const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              1,
                                                                              75,
                                                                              148)
                                                                          : Colors
                                                                              .transparent,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              8.0),
                                                                      child: Text(
                                                                          'Multi City',
                                                                          style:
                                                                              TextStyle(color: triptype[2] ? Colors.white : Colors.black)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]),
                                                              const Divider(
                                                                  color: Colors
                                                                      .black),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Container(
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              color: Colors
                                                                                  .grey),
                                                                          borderRadius: BorderRadius.circular(
                                                                              10)),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                5.0),
                                                                        child:
                                                                            TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            if (triptype[0] &&
                                                                                traveltype[0]) {
                                                                              Navigator.push(ctx, MaterialPageRoute(builder: (_) => OneWay(isInternational: false, name: widget.username, password: widget.password)));
                                                                            }
                                                                            if (triptype[1] &&
                                                                                traveltype[0]) {
                                                                              Navigator.push(ctx, MaterialPageRoute(builder: (_) => RoundTrip(isInternational: false)));
                                                                            }
                                                                            if ((triptype[2] &&
                                                                                traveltype[0])) {
                                                                              Navigator.push(ctx, MaterialPageRoute(builder: (_) => MultiCity(isInternational: false)));
                                                                            }
                                                                            if ((triptype[2] &&
                                                                                traveltype[1])) {
                                                                              Navigator.push(ctx, MaterialPageRoute(builder: (_) => MultiCity(isInternational: true)));
                                                                            }
                                                                            if (triptype[0] &&
                                                                                traveltype[1]) {
                                                                              Navigator.push(ctx, MaterialPageRoute(builder: (_) => OneWay(isInternational: true, name: widget.username, password: widget.password)));
                                                                            }
                                                                            if (triptype[1] &&
                                                                                traveltype[1]) {
                                                                              Navigator.push(
                                                                                  ctx,
                                                                                  MaterialPageRoute(
                                                                                      builder: (_) => RoundTrip(
                                                                                            isInternational: true,
                                                                                          )));
                                                                            }
                                                                          },
                                                                          child: Text(
                                                                              'Ok',
                                                                              style: TextStyle(color: Colors.green)),
                                                                        ),
                                                                      )),
                                                                  Container(
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              color: Colors
                                                                                  .red),
                                                                          borderRadius: BorderRadius.circular(
                                                                              10)),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                5.0),
                                                                        child:
                                                                            TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              for (int i = 0; i < traveltype.length; i++) {
                                                                                traveltype[i] = false;
                                                                              }
                                                                              for (int i = 0; i < triptype.length; i++) {
                                                                                triptype[i] = false;
                                                                              }
                                                                            });
                                                                          },
                                                                          child: Text(
                                                                              'Cancel',
                                                                              style: TextStyle(color: Colors.red)),
                                                                        ),
                                                                      )),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      );
                                                    });
                                                  });
                                            },
                                            child: Stack(children: [
                                              Center(
                                                child: CircleAvatar(
                                                    radius: 36,
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 1, 75, 148),
                                                    child: Image.asset(
                                                        'assets/images/earth.png',
                                                        fit: BoxFit.scaleDown)),
                                              ),
                                              Positioned(
                                                  bottom: 10,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                        // width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Text(
                                                              'Out Station',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14)),
                                                        )),
                                                  ))
                                            ]),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return StatefulBuilder(
                                                        builder:
                                                            (ctx, setState) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Company Bus -8 PM'),
                                                        actions: [
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Bus going from Shameerpet to',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                            .blue[
                                                                        800]),
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () =>
                                                                        {
                                                                      setState(
                                                                          () {
                                                                        busdestination[0] =
                                                                            !busdestination[0];
                                                                        busdestination[1] =
                                                                            false;
                                                                      })
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.black),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: busdestination[0]
                                                                            ? const Color.fromARGB(
                                                                                255,
                                                                                1,
                                                                                75,
                                                                                148)
                                                                            : Colors.transparent,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                8.0),
                                                                        child: Text(
                                                                            'Azamabad',
                                                                            style:
                                                                                TextStyle(color: busdestination[0] ? Colors.white : Colors.black)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          30),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        busdestination[1] =
                                                                            !busdestination[1];
                                                                        busdestination[0] =
                                                                            false;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.black),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: busdestination[1]
                                                                            ? const Color.fromARGB(
                                                                                255,
                                                                                1,
                                                                                75,
                                                                                148)
                                                                            : Colors.transparent,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                8.0),
                                                                        child: Text(
                                                                            'Lingampalli',
                                                                            style:
                                                                                TextStyle(color: busdestination[1] ? Colors.white : Colors.black)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 30),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Container(
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              color: Colors
                                                                                  .green),
                                                                          borderRadius: BorderRadius.circular(
                                                                              10)),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                5.0),
                                                                        child:
                                                                            TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              if (busdestination[0] == true) {
                                                                                Navigator.push(context, MaterialPageRoute(builder: (_) => BusForm(destination: "Azamabad")));
                                                                              } else {
                                                                                Navigator.push(context, MaterialPageRoute(builder: (_) => BusForm(destination: "Lingampalli")));
                                                                              }
                                                                            });
                                                                          },
                                                                          child: Text(
                                                                              'OK',
                                                                              style: TextStyle(color: Colors.green)),
                                                                        ),
                                                                      )),
                                                                  Container(
                                                                      decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              color: Colors
                                                                                  .red),
                                                                          borderRadius: BorderRadius.circular(
                                                                              10)),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                5.0),
                                                                        child:
                                                                            TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              Navigator.pop(context);
                                                                            });
                                                                          },
                                                                          child: Text(
                                                                              'Cancel',
                                                                              style: TextStyle(color: Colors.red)),
                                                                        ),
                                                                      )),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      );
                                                    });
                                                  });
                                            },
                                            child: Stack(children: [
                                              Center(
                                                child: CircleAvatar(
                                                    radius: 36,
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 1, 75, 148),
                                                    child: Image.asset(
                                                        'assets/images/bus.png')),
                                              ),
                                              Positioned.fill(
                                                  bottom: 10,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Text('Bus')),
                                                  ))
                                            ]),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          CarBooking()));
                                            },
                                            child: Stack(children: [
                                              Center(
                                                child: CircleAvatar(
                                                    radius: 36,
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 1, 75, 148),
                                                    child: Image.asset(
                                                        'assets/images/car.png')),
                                              ),
                                              Positioned.fill(
                                                  bottom: 10,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Text('Car')),
                                                  ))
                                            ]),
                                          )
                                        ]),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    const Text('    Upcoming Travels:',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 1, 75, 148),
                            fontStyle: FontStyle.italic)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 400,
                      child: ListView.builder(
                          itemCount: loc.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                shadowColor: Colors.grey[300],
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Stack(
                                      children: [
                                        Row(children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                startt[index],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(date[index]),
                                              Text(loc[index])
                                            ],
                                          ),
                                          Image.asset('assets/images/1.png',
                                              fit: BoxFit.contain,
                                              width: 90,
                                              height: 100),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                endt[index],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(datea[index]),
                                              Text(des[index])
                                            ],
                                          ),
                                          const VerticalDivider(
                                              indent: 2,
                                              endIndent: 2,
                                              color: Colors.black),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.hotel,
                                                      size: 40,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 1, 75, 148)),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          width: 70,
                                                          child: Text(
                                                            ' Hotel ${hotel[index]}',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.luggage,
                                                      size: 40,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 1, 75, 148)),
                                                  SizedBox(width: 5),
                                                  Container(
                                                      width: 70,
                                                      child: Text(
                                                          '${bags[index]}bags/${bags[index] * 10}kgs'))
                                                ],
                                              )
                                            ],
                                          )
                                        ]),
                                        Positioned(
                                          top: 30,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Color.fromARGB(255, 1,
                                                    75, 148), // Border color
                                                width: 2.0, // Border width
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Color.fromARGB(
                                                      255, 1, 75, 148)),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBarTheme(
        data: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white54,
            selectedItemColor: const Color.fromARGB(255, 1, 75, 148)),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color.fromARGB(255, 1, 75, 148),
            onTap: (int i) {
              if (i == 2) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Approval()));
              }
            },
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 24), label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.work_outline_rounded, size: 24),
                  label: 'My Request'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person_4_outlined, size: 24),
                  label: 'Profile'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.help_outline_outlined, size: 24),
                  label: 'help')
            ]),
      ),
    );
  }
}
