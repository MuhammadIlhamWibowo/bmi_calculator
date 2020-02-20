import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMIState();
  }
}

class BMIState extends State<BMICalculator> {
  double _calculation;
  String _calculationResult, _result;

  TextEditingController _ageFieldController = new TextEditingController();
  TextEditingController _heightFieldController = new TextEditingController();
  TextEditingController _weightFieldController = new TextEditingController();

  void calculateBMI() {
    double height = double.parse(_heightFieldController.text);
    double weight = double.parse(_weightFieldController.text);

    if (height != null && weight != null) {
      setState(() {
        height *= 12;
        _calculation =(weight/(height*height))*703;
        _calculationResult = _calculation.toStringAsFixed(2);

        if (_calculation < 18.5) {
          _result = "Underweight";
        } else if (_calculation >= 18.5 && _calculation <= 24.9) {
          _result = "Good fit";
        } else if (_calculation >= 25.0 && _calculation <= 29.9) {
          _result = "Overweight";
        } else {
          _result = "Obese";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purple[800],
        title: new Text('BMI Calculator'),
      ),
      body: new ListView(
        padding: const EdgeInsets.all(3.5),
        children: <Widget>[
          new Image.asset(
            "images/logo.jpg",
            height: 120.0,
            width: 150.0,
          ),
          new Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(5.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  controller: _ageFieldController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Enter your age',
                    icon: new Icon(Icons.calendar_today)
                  ),
                ),
                new TextField(
                  controller: _heightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Enter your height (feet)',
                    icon: new Icon(Icons.info)
                  ),
                ),
                new TextField(
                  controller: _weightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Enter your weight (pounds)',
                    icon: new Icon(Icons.shutter_speed)
                  ),
                ),
                new Padding(padding: EdgeInsets.all(7.5)),
                new RaisedButton(
                  onPressed: calculateBMI,
                  child: new Text(
                    'Calculate',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  color: Colors.purple[800],
                  textColor: Colors.white,
                )
              ],
            ),
          ),
          new Padding(padding: const EdgeInsets.all(5.5)),
          new Container(
            alignment: Alignment.topCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  _calculationResult != null ? '$_calculationResult': '',
                  style: new TextStyle(
                    color: Colors.pink,
                    fontSize: 44.5,
                    fontWeight: FontWeight.w800
                  ),
                ),
                new Text(
                  _result != null ? _result: '',
                  style: new TextStyle(
                    fontSize: 28.0
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

