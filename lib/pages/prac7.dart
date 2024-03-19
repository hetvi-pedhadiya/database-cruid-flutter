 import 'package:databse_cruid/pages/lab7.dart';
import 'package:databse_cruid/pages/login_page.dart';
import 'package:flutter/material.dart';
// import 'package:project1flutter/prac8.dart';

class grid5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Layout 5",
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.pink.shade100,
      ),
      body: (Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.pink.shade900,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => practicelab7(),
                                    ));
                              },
                              icon: Icon(
                                Icons.navigate_next_outlined,
                                color: Colors.white,
                                size: 30,
                              )))),
                  Expanded(
                      child: Container(
                    color: Colors.pink.shade400,
                  )),
                ],
              )),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.pink.shade50,
                    )),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.yellow.shade700,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.orange.shade200,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.yellow.shade900,
                          )),
                        ],
                      ),
                      flex: 4,
                    ),
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue.shade500,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.blue.shade100,
                    )),
                    Expanded(
                        child: Container(
                      color: Colors.blue.shade900,
                    )),
                  ],
                ),
                flex: 2,
              ),
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.brown.shade800,
                    ),
                    flex: 3,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.brown.shade300,
                    ),
                    flex: 3,
                  ),
                ],
              )),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(color: Colors.grey.shade800),
                            flex: 2,
                          ),
                          Expanded(
                              child: Container(color: Colors.orangeAccent),
                              flex: 2),
                          Expanded(
                              child: Container(color: Colors.lightGreen),
                              flex: 2),
                          Expanded(child: Container(color: Colors.purple)),
                          Expanded(
                              child: Container(color: Colors.blue.shade200),
                              flex: 2),
                        ],
                      ),
                      flex: 5,
                    ),
                    Expanded(child: Container(color: Colors.grey.shade600)),
                    Expanded(
                      child: Container(color: Colors.grey.shade500),
                      flex: 5,
                    ),
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: Container(color: Colors.lightGreen.shade200),
                          flex: 8,
                        ),
                        Expanded(
                            child:
                                Container(color: Colors.lightGreen.shade500)),
                        Expanded(
                          child: Container(color: Colors.lime.shade900),
                          flex: 3,
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child:
                                Container(color: Colors.lightGreen.shade900)),
                        Expanded(
                            child: Container(color: Colors.green.shade300)),
                        Expanded(
                            child: Container(color: Colors.green.shade600)),
                      ],
                    )),
                  ],
                ),
                flex: 2,
              ),
            ],
          )),
        ],
      )),
    );
  }
}
