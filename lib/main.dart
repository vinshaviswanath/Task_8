import 'package:flutter/material.dart';
import 'package:task8/controller/controller.dart';
import 'package:task8/model/model.dart';

import 'factTile.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => HomeMain(),
    },
  ));
}

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 123, 0),
                    Color.fromARGB(255, 251, 255, 0)
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.ac_unit,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  FactTiles(),
                  Spacer(),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 100, left: 15, right: 15),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          FactModel fact = await Api.fetchFact();
                        } catch (e) {
                          print("Error fetching fact: $e");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.zero,
                        primary: Colors.transparent,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 255, 123, 0),
                              Color.fromARGB(255, 251, 255, 0),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                        
                          constraints:
                              BoxConstraints(minWidth: 88, minHeight: 38),
                          alignment: Alignment.center,
                          child: Text(
                            "SHOW",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
