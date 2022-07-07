import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/models/courier_model.dart';
import 'package:foodie_courier/screens/Authentication/login_screen.dart';
import 'package:foodie_courier/screens/Profile/edit_profile.dart';
import 'package:foodie_courier/services/service_locator.dart';
import 'package:load_switch/load_switch.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool? current_status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        Courier courier = authProvider.courier!;
        current_status = courier.currentStatus;
        return Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              wallet(courier.account_balance, courier.rating),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              settingsButton(() {}, "Change Password"),
              settingsButton(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfile()));
              }, "Edit Profile"),
              settingsButton(() {}, "Privacy and Security"),
              settingsButton(() {}, "Contact Support"),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.toggle_off,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Change Status",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomLoadingSwitch(
                title: "Go Offine",
                altTitle: "Go Online",
                status: authProvider.courier!.currentStatus,
                future: authProvider.changeCurrentStatus,
              ),
              customSwitch("On Assignment", courier.onAssingment, (value) {}),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: OutlinedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 40)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text("Logout"),
                                content: const Text(
                                    "Are you sure you wish to log out?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No")),
                                  TextButton(
                                      onPressed: () {
                                        Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .logout();
                                        Navigator.pop(context);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()),
                                            (route) => false);
                                      },
                                      child: const Text("Yes"))
                                ],
                              ));
                    },
                    child: const Text("LOG OUT")),
              )
            ],
          ),
        );
      }),
    );
  }

  Row customSwitch(
      String title, bool isActive, void Function(bool value)? onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            value: isActive,
            onChanged: onChanged,
            trackColor: Colors.red,
          ),
        )
      ],
    );
  }

  InkWell settingsButton(void Function() onTap, String title) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  SizedBox wallet(double amount, double ratings) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: Container(
          color: Colors.blue,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Total Balance",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$amount",
                          style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: Colors.yellow),
                        ),
                        const Text(
                          " ",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Ratings: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "$ratings",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.money,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Withdraw",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Positioned(
                  left: -170,
                  top: -170,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Colors.yellowAccent,
                  )),
              const Positioned(
                  left: -160,
                  top: -190,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Colors.redAccent,
                  )),
              const Positioned(
                  right: -170,
                  bottom: -170,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Colors.pinkAccent,
                  )),
              const Positioned(
                  right: -160,
                  bottom: -190,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: Colors.purpleAccent,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLoadingSwitch extends StatefulWidget {
  final String title;
  final String altTitle;
  final bool status;
  final Function future;
  const CustomLoadingSwitch(
      {Key? key,
      required this.title,
      required this.status,
      required this.future,
      required this.altTitle})
      : super(key: key);

  @override
  State<CustomLoadingSwitch> createState() => _CustomLoadingSwitchState();
}

class _CustomLoadingSwitchState extends State<CustomLoadingSwitch> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.status ? widget.title : widget.altTitle,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        isLoading
            ? Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.centerLeft,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                ))
            : Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  value: widget.status,
                  onChanged: (val) async {
                    setState(() {
                      isLoading = true;
                    });
                    await widget.future();
                    setState(() {
                      isLoading = false;
                    });
                  },
                  activeColor: Colors.green,
                  trackColor: Colors.red,
                )),
      ],
    );
  }
}
