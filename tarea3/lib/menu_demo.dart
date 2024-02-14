import 'package:flutter/material.dart';

class MenuDemo extends StatefulWidget {
  const MenuDemo({
    super.key,
  });
  @override
  State<MenuDemo> createState() => _MenuDemoState();
}

class _MenuDemoState extends State<MenuDemo> {
  bool burger = false;
  bool hotdog = false;
  bool fries = false;
  bool soda = false;
  bool icecream = false;

  List<bool> isSelected = [false, false, false, false, false];

  List<String> emojis = [
    "assets/burger.png",
    "assets/hotdog.png",
    "assets/fries.png",
    "assets/soda.png",
    "assets/icecream.png"
  ];
  List<String> items = ["Burger", "Hot Dogs", "Fries", "Soda", "Ice Cream"];

  @override
  Widget build(BuildContext context) {
    // set up the button

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Menu Demo',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Explore the restaurant's delicious menu items below!",
                style: TextStyle(fontSize: 16)),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      emojis[index],
                      height: 40,
                      width: 40,
                    ),
                    title: Text(
                      items[index],
                      style: const TextStyle(color: Colors.black),
                    ),
                    tileColor:
                        (isSelected[index]) ? Colors.lightBlue : Colors.white,
                    onTap: () {
                      if (isSelected[index] == false) {
                        for (var i = 0; i < items.length; i++) {
                          if (i == index) {
                            isSelected[index] = true;
                          } else {
                            isSelected[i] = false;
                          }
                        }
                      } else if (isSelected[index] == true) {
                        isSelected[index] = false;
                      }

                      setState(() {});
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    onPressed: () {
                      String name = "";
                      for (var i = 0; i < items.length; i++) {
                        if (isSelected[i] == true) {
                          name = items[i];
                        }
                      }

                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Pick Up'),
                          content: Text(name == ""
                              ? "Select a dish"
                              : "You've selected: $name"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    color: Colors.grey[350],
                    child: const Text("Pick Up")),
                SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    thickness: 4,
                    width: 20,
                    color: Colors.grey[350],
                  ),
                ),
                MaterialButton(
                    onPressed: () {
                      String name = "";
                      for (var i = 0; i < items.length; i++) {
                        if (isSelected[i] == true) {
                          name = items[i];
                        }
                      }

                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Delivery'),
                          content: Text(name == ""
                              ? "Select a dish"
                              : "You've selected: $name"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    color: Colors.grey[350],
                    child: const Text("Delivery")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
