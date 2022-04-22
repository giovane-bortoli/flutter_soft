import 'dart:developer';

import 'package:flutter/material.dart';
import 'calculate.dart';

String _result = ' ';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _controllerWeight = TextEditingController();
  final TextEditingController _controllerHeight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Text(
                'Enter the informations',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            createEditText('Weight(Kg)', _controllerWeight),
            createEditText('height(Cm)', _controllerHeight),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
              child: Text(
                _result,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            Container(
              color: Colors.grey,
              height: 50.0,
              width: 200,
              child: ElevatedButton(
                onPressed: calc,
                child: const Text('BMI Calculate'),
              ),
            )
          ],
        ),
      ),
    );
  }

  // como chamar de outra tela esse método ?
  // maneiras de refatorar esse projeto ?
  void calc() {
    try {
      double? weight = double.tryParse(_controllerWeight.text);
      double? height = double.tryParse(_controllerHeight.text);

      if (weight != null && height != null) {
        height = height / 100.0;

        double _bmi = (weight / (height * height)).roundToDouble();
        setState(() {
          _result = 'BMI: $_bmi';
        });
      } else {
        throw Exception('invalid weight!');
      }
    } catch (_) {
      log('Wrong value', name: 'calc_test');
    }
  }

  Padding createEditText(String texto, TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: texto,
            border: const OutlineInputBorder(),
            labelStyle: const TextStyle(
              fontSize: 25.0,
              color: Colors.grey,
            )),
      ),
    );
  }
}
