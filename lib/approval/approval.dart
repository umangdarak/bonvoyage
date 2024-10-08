import 'package:bonvoyage/approval/carbookingapproval.dart';
import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/main.dart';
import 'package:bonvoyage/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Approval extends StatefulWidget {
  const Approval({Key? key}) : super(key: key);

  @override
  _ApprovalState createState() => _ApprovalState();
}

class _ApprovalState extends State<Approval> {
  List<Map<String, dynamic>> data = [];
  void getData(int id) async {
    var d =
        await DataBaseHelper.readOneItemRandom("Requests", "ApproverId", id);
    setState(() {
      data = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    getData(auth.current.employeeNumber);

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
              icon: Icon(Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 1, 75, 148))),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Approvals',
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
                        image:
                            AssetImage('assets/images/Bon_Voyage_Login_BG.gif'),
                        fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      CarBookingApproval(data: data[0])));
                        },
                        child: Card(
                          elevation: 4, // Adding elevation for shadow effect
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15), // Margin around the card
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(16), // Inner padding
                            decoration: BoxDecoration(
                              color: Colors.white, // Card background color
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align text to the left
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(data[0]['TravellerName'],
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Text(data[0]['Designation'],
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                                SizedBox(height: 8), // Spacer

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(
                                            "Request Id : ${data[0]['id']}",
                                            style: TextStyle(fontSize: 16))),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Text(
                                            "Status : " + data[0]['Status'],
                                            style: TextStyle(fontSize: 16))),
                                  ],
                                ),
                                SizedBox(height: 8), // Spacer

                                // Row 3: Travel Type and Trip Type
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(
                                            "Travel Type : ${data[0]['TravelType']}",
                                            style: TextStyle(fontSize: 16))),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Text(
                                            "Trip Type : ${data[0]['TripType']}",
                                            style: TextStyle(fontSize: 16))),
                                  ],
                                ),
                                SizedBox(height: 8), // Spacer

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text(
                                            "Origin : " + data[0]['Origin'],
                                            style: TextStyle(fontSize: 16))),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Text(
                                            "Destination : " +
                                                data[0]['Destination'],
                                            style: TextStyle(fontSize: 16))),
                                  ],
                                ),
                                SizedBox(height: 8), // Spacer

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text("ETA : " + data[0]['ETA'],
                                            style: TextStyle(fontSize: 16))),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Text(
                                            "Purpose : " + data[0]['Purpose'],
                                            style: TextStyle(fontSize: 16))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }))));
  }
}
