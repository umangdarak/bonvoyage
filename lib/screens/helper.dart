import 'package:flutter/material.dart';

class Helper {
  static snackbarshow(String? s, context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(s!),
    ));
  }

  static dialogshow(String? s, context) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
              elevation: 4,
              actionsPadding: EdgeInsets.all(2),
              content: Container(
                height: 100,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(s!, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton(
                          child:
                              Text('Ok', style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
