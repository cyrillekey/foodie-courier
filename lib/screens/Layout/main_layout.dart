import 'package:flutter/material.dart';
import 'package:foodie_courier/screens/Home/home.dart';
import 'package:foodie_courier/screens/Orders/my_deliveries.dart';

class MainLayout extends StatefulWidget {
  final int index;
  const MainLayout({Key? key, required this.index}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> screens = [];
  late int item;
  @override
  void initState() {
    screens = [Home(), MyDeliveries()];
    item = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            tabButton(Icons.home, "Home", 0),
            tabButton(Icons.delivery_dining, "My Orders", 1),
            tabButton(Icons.mail, "Parcel Center", 2),
            tabButton(Icons.account_circle, "Profile", 3)
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: screens[item],
      ),
    );
  }

  Widget tabButton(IconData iconData, String label, int count) {
    return Container(
      child: InkWell(
        onTap: () {
          setState(() {
            setState(() {
              item = count;
            });
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData,
              size: 35,
              color: count == item ? Colors.black : Colors.grey.shade500,
            ),
            Text(
              label,
              style: TextStyle(
                  color: count == item ? Colors.black : Colors.grey.shade500),
            )
          ],
        ),
      ),
    );
  }
}
