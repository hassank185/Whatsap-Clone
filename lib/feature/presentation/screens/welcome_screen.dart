import 'package:flutter/material.dart';
import 'package:whatsapp_clone/feature/presentation/screens/registration_screen.dart';
import 'package:whatsapp_clone/feature/presentation/widgets/theme/style.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to Whatsapp Clone",
              style: TextStyle(
                fontSize: 20,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 290,
              width: 290,
              child: Image.asset("assets/brand.png"),
            ),
            Column(
              children: [
                Text(
                  "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "AGREE AND CONTINUE",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
