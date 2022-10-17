import 'package:flutter/material.dart';

class WaitingVerificationScreen extends StatelessWidget {
  const WaitingVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Text(
              "Akunmu belum terverifikasi, silahkan ikuti link yang telah kami kirimkan",
            ),
          ],
        ),
      ),
    );
  }
}
