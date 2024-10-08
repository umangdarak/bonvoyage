// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CarBookingApproval extends StatefulWidget {
  Map<String, dynamic> data;
  CarBookingApproval({super.key, required this.data});

  @override
  State<CarBookingApproval> createState() => _CarBookingApprovalState();
}

class _CarBookingApprovalState extends State<CarBookingApproval> {
  List<Map<String, dynamic>> tabledata = [];
  List<Map<String, dynamic>> travellerdata = [];
  getData() async {
    var d = await DataBaseHelper.readOneItem(
        "carbooking", widget.data['connection']);
    var e = await d;
    var h = await DataBaseHelper.readOneItemRandom(
        "Employee", "EmployeeNumber", widget.data['EmployeeNumber']);
    setState(() {
      tabledata = e;
      travellerdata = h;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    getData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leadingWidth: 25,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 1, 75, 148))),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Request ID - ${widget.data['id']} - Car Travel',
                style: TextStyle(color: Color.fromARGB(255, 1, 75, 148))),
            Icon(
              FontAwesomeIcons.personWalkingLuggage,
              color: Color.fromARGB(255, 1, 75, 148),
            )
          ]),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 5, top: 5, right: 1),
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/Bon_Voyage_Login_BG.gif'),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(children: [
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 1, 75, 148),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(30))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              "${widget.data['Origin']} - ${widget.data['Destination']} - ${tabledata[0]['fromdate']}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16))
                        ],
                      )),
                  Row(
                    children: [
                      Container(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Car Type',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(tabledata[0]['cartype'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('No of People',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(tabledata[0]['people'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pick Up Details',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(tabledata[0]['pickupdetails'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('From Date',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(tabledata[0]['fromdate'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('To Date',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(tabledata[0]['todate'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 1, 75, 148),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(30))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Miscellaneous",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16))
                        ],
                      )),
                  Container(
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Travel Advance not submitted',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 1, 75, 148),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(30))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Traveller Details",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16))
                        ],
                      )),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Request Id',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text("${widget.data['id']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Request Status',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(widget.data['Status'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Travel Type',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(widget.data['TravelType'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Trip Type',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(widget.data['TripType'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Approver Employee Id',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text("${widget.data['ApproverId']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Approver Name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(auth.current.employeeName,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Approver Email',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(auth.current.emailId,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Approver Designation',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(auth.current.descName,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Traveller Employee Id',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text("${widget.data['EmployeeNumber']}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Traveller Name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(widget.data['TravellerName'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Traveller Email',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(travellerdata[0]['EmailId'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Traveller Designation',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(travellerdata[0]['DescName'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Traveller Mobile Number',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(travellerdata[0]['MobileNo'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Traveller Gender',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(travellerdata[0]['Sex'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Debit Expenses from',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(tabledata[0]['debitexpenses'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cost Center/Project Name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(tabledata[0]['project'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Purpose',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(tabledata[0]['purpose'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Comments',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              SizedBox(
                                height: 4,
                              ),
                              Text(tabledata[0]['comments'],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 75, 148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 1, 75, 148)),
                              child: Center(
                                child: Text('Approve',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ))),
                      TextButton(
                          onPressed: () {},
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
                    ],
                  )
                ]))));
  }
}
