import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          color: Color.alphaBlend(
              const Color.fromRGBO(0, 50, 86, 1), Colors.black),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  'Hourly Forecast',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                Container(
                  margin: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 29, 53, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("16°", style: TextStyle(color: Colors.white)),
                            Text(""),
                            Icon(Icons.nightlight_rounded, color: Colors.blue),
                            Text("Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200))
                          ],
                        ),
                        Column(
                          children: [
                            Text("14°", style: TextStyle(color: Colors.white)),
                            Text(""),
                            Icon(Icons.nightlight_rounded, color: Colors.blue),
                            Text("12 AM",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200))
                          ],
                        ),
                        Column(
                          children: [
                            Text("14°", style: TextStyle(color: Colors.white)),
                            Text(""),
                            Icon(Icons.nightlight_rounded, color: Colors.blue),
                            Text("1 AM",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200))
                          ],
                        ),
                        Column(
                          children: [
                            Text("13°", style: TextStyle(color: Colors.white)),
                            Text(""),
                            Icon(Icons.nightlight_rounded, color: Colors.blue),
                            Text("2 AM",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200))
                          ],
                        ),
                        Column(
                          children: [
                            Text("11°", style: TextStyle(color: Colors.white)),
                            Text(""),
                            Icon(Icons.nightlight_rounded, color: Colors.blue),
                            Text("3 AM",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text("10-day forecast",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300)),
                const SizedBox(height: 6),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Today's temperature will be 28°/9°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Today",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 80),
                            Text("28°/9°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Tuesday's temperature will be 27°/9°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Tuesday",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 80),
                            Text("27°/9°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Wednesday's temperature will be 26°/7°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Wednesday",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.cloud,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(width: 80),
                            Text("26°/7°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Thursday's temperature will be 28°/8°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Thursday",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 80),
                            Text("28°/8°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Friday's temperature will be 28°/9°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Friday",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 80),
                            Text("28°/9°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Saturday's temperature will be 29°/10°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Saturday",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 73),
                            Text("29°/10°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Sunday's temperature will be 29°/12°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Sunday",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 73),
                            Text("29°/12°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Monday's temperature will be 26°/12°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Monday",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.cloud,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(width: 73),
                            Text("26°/12°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Tuesday's temperature will be 24°/11°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Tuesday",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.cloud,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(width: 73),
                            Text("24°/11°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 29, 53, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Wednesday's temperature will be 29°/9°")));
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text("Wednesday",
                                    style: TextStyle(color: Colors.white))),
                            Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 80),
                            Text("29°/9°",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                          ]),
                    )),
              ],
            ),
          )),
    );
  }
}
