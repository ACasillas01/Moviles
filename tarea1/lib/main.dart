import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color accesibilityColor = Colors.black;
  Color timerColor = Colors.black;
  Color androidColor = Colors.black;
  Color iphoneColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Mc Flutter'),
            backgroundColor: Colors.blueAccent,
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10.0),
            color: Colors.black12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          "Flutter McFlutter",
                          style: TextStyle(fontSize: 23),
                        ),
                        Text("Experieced App Developer")
                      ],
                    )
                  ],
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text("123 Main Street")],
                      ),
                      Column(
                        children: [Text("(415) 555-0198")],
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.accessibility),
                              color: accesibilityColor,
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (accesibilityColor == Colors.black) {
                                      accesibilityColor = Colors.indigo;
                                    } else {
                                      accesibilityColor = Colors.black;
                                    }
                                  });
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.timer),
                              color: timerColor,
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (timerColor == Colors.black) {
                                      timerColor = Colors.indigo;
                                    } else {
                                      timerColor = Colors.black;
                                    }
                                  });
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.phone_android),
                              color: androidColor,
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (androidColor == Colors.black) {
                                      androidColor = Colors.indigo;
                                    } else {
                                      androidColor = Colors.black;
                                    }
                                  });
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.phone_iphone),
                              color: iphoneColor,
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    if (iphoneColor == Colors.black) {
                                      iphoneColor = Colors.indigo;
                                    } else {
                                      iphoneColor = Colors.black;
                                    }
                                  });
                                });
                              })
                        ],
                      )
                    ])
              ],
            ),
          )),
    );
  }
}
