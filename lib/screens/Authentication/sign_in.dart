// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/screens/Home/home.dart';
import 'package:foodie_courier/screens/Layout/main_layout.dart';
import 'package:foodie_courier/screens/widgets/Alerts.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Image.asset("assets/img/logo_01.png"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                inputField("Email", emailController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Valid Email Address Required';
                  }
                  return null;
                }),
                inputField("Password", passwordController, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Valid Password Required';
                  }
                  return null;
                }, isPassword: true),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          fillColor: MaterialStateProperty.all(
                              Color.fromRGBO(252, 127, 87, 0.8)),
                          value: true,
                          onChanged: (value) {
                            print(value);
                          })
                    ],
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(252, 106, 87, 1.0)),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(MediaQuery.of(context).size.width * 0.9, 64))),
                    onPressed: () => signin(
                        context,
                        _key,
                        emailController.text.trim(),
                        passwordController.text.trim()),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void signin(BuildContext context, GlobalKey<FormState> key, String email,
    String password) async {
  if (key.currentState!.validate()) {
    Alert.showProgressDialog(context, "loading");
    bool status = await AuthProvider().loginUser(email, password);
    if (status == true) {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainLayout(index: 0)),
          (route) => false);
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Error!"),
                content: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text("Invalid Credentials"),
                ),
              ));
    }
  }
}

Container inputField(
  String label,
  TextEditingController controller,
  String? Function(String?) validator, {
  bool isPassword = false,
}) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    ),
  );
}
