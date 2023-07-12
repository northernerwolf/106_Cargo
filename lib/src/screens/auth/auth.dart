import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
        child: Container(
          height: 365,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: const [
              Text(
                'Hoş geldiňiz!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'ALS Hauss',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
