import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.purpleAccent,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
                hintText: 'Height [cm]',
                icon: Icon(
                  Icons.trending_up_outlined,
                  color: Colors.purpleAccent,
                  size: 40,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.purpleAccent,
              decoration: InputDecoration(
                hintText: 'Weight [kg]',
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purpleAccent)),
                icon: Icon(
                  Icons.monitor_weight_outlined,
                  color: Colors.purpleAccent,
                  size: 40,
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent, //background color of button
                  padding: EdgeInsets.all(10) //content padding inside button
                  ),
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 30),
            Text(
              _result == null
                  ? "Enter Value"
                  : "${_result.toStringAsFixed(2)},${_textResult}",
              style: TextStyle(
                color: Colors.purpleAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;

    setState(() {
      if (_result > 25) {
        _textResult = " You\'re over weight";
      } else if (_result >= 18.5 && _result <= 25) {
        _textResult = " You have normal weight";
      } else {
        _textResult = " You\'re under weight";
      }
    });
  }
}
