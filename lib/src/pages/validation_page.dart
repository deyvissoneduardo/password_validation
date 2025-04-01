import 'package:flutter/material.dart';

import '../shared/colors_app.dart';

class ValidationPage extends StatelessWidget {
  const ValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 41, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 44, bottom: 42),
                child: Image.asset('assets/logo.png'),
              ),
              Text(
                'Defina uma senha',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Text(
                'Uma senha forte ajudar a manter sua conta segura',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: mediumGray,
                ),
              ),
              const SizedBox(height: 26),
              TextFormField(),
              const SizedBox(height: 22),
              TextFormField(),
              const SizedBox(height: 37),
              Container(height: 145, color: Colors.amber),
              const SizedBox(height: 40),
              ElevatedButton(onPressed: () {}, child: Text('Salvar')),
            ],
          ),
        ),
      ),
    );
  }
}
