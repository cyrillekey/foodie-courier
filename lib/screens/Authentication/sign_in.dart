// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:foodie_courier/controllers/auth_provider.dart';
import 'package:foodie_courier/screens/Home/home.dart';
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
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 229, 229, 229)),
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
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    "Access Account",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(140, 60))),
                          onPressed: () {},
                          child: const Icon(
                            Icons.g_mobiledata,
                            size: 45,
                          )),
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueAccent),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(140, 60))),
                          onPressed: () {},
                          child: const Icon(
                            Icons.facebook,
                            color: Colors.white,
                            size: 45,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    "or Login with Email",
                    style: TextStyle(
                        color: Color.fromRGBO(110, 142, 176, 1.0),
                        fontSize: 14),
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
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(109, 97, 242, 1.0)),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(MediaQuery.of(context).size.width * 0.8, 64))),
                    onPressed: () => signin(
                        context,
                        _key,
                        emailController.text.trim(),
                        passwordController.text.trim()),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have and account?"),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: const Text("Register"),
                      onTap: () {},
                    )
                  ],
                )
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
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                content: Text("Tiel"),
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
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0),
                borderRadius: BorderRadius.circular(18),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0),
                borderRadius: BorderRadius.circular(18),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0),
                borderRadius: BorderRadius.circular(18),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(18),
              ),
              fillColor: Colors.white),
        )
      ],
    ),
  );
}
