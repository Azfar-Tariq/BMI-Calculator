import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _bmiResult = 0;
  final TextEditingController _heightController = TextEditingController();
  String _textResult = "";
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
              color: Color.fromARGB(500, 252, 201, 28),
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(28, 28, 28, 28),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _heightController,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(500, 252, 201, 28),
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height(m)",
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _weightController,
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(500, 252, 201, 28),
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight(kg)",
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double h = double.parse(_heightController.text);
                double w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = w / (h * h);
                  if (_bmiResult > 25) {
                    _textResult = "You're over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight";
                  } else {
                    _textResult = "You're under weight";
                  }
                });
              },
              child: const Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(500, 252, 201, 28),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              _bmiResult.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 90,
                color: Color.fromARGB(500, 252, 201, 28),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(500, 252, 201, 28),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LeftBar(
              barWidth: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(
              barWidth: 70,
            ),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(
              barWidth: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            const RightBar(
              barWidth: 70,
            ),
            const SizedBox(
              height: 50,
            ),
            const RightBar(
              barWidth: 70,
            ),
          ],
        )),
      ),
    );
  }
}
