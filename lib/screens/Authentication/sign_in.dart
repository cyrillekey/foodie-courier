import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Access Account",
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {}, child: const Icon(Icons.g_mobiledata)),
                  TextButton(onPressed: () {}, child: Icon(Icons.facebook))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
