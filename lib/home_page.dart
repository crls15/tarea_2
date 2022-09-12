import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Vars
  int? optionRadio = 0;
  bool flagRoundTip = false;
  double propina = 0;

  var costOfServiceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: ListView(
          children: [
            SizedBox(height: 14),
            ListTile(
              leading: Icon(
                Icons.room_service,
                color: Colors.green,
              ),
              title: Padding(
                padding: EdgeInsets.only(right: 100),
                child: TextField(
                  controller: costOfServiceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 107, 157, 109),
                    ),
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        style: BorderStyle.solid,
                      ),
                    ),
                    label: Text(
                      "Cost of Service",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.dinner_dining,
                color: Colors.green,
              ),
              title: Text("How was the service?"),
            ),
            Column(
              children: [
                ListTile(
                  title: Text('Amazing (20%)'),
                  leading: Radio(
                    activeColor: Colors.green,
                    value: 1,
                    groupValue: optionRadio,
                    onChanged: (int? val) {
                      setState(() {
                        optionRadio = val;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Good (18%)'),
                  leading: Radio(
                    activeColor: Colors.green,
                    value: 2,
                    groupValue: optionRadio,
                    onChanged: (int? val) {
                      setState(() {
                        optionRadio = val;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('OK (15%)'),
                  leading: Radio(
                    activeColor: Colors.green,
                    value: 3,
                    groupValue: optionRadio,
                    onChanged: (int? val) {
                      setState(() {
                        optionRadio = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.credit_card,
                color: Colors.green,
              ),
              title: Text("Round up tip"),
              trailing: Switch(
                  activeColor: Colors.green,
                  value: flagRoundTip,
                  onChanged: (value) {
                    flagRoundTip = !flagRoundTip;
                    setState(() {});
                  }),
            ),
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("CALCULATE"),
              onPressed: () {
                setState(() {
                  try {
                    _tipCalculation();
                    setState(() {});
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content: Text('Ingrese valores validos...')),
                      );
                  }
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Tip amount: \$${propina.toStringAsFixed(2)}'),
              ],
            )
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  void _tipCalculation() {
    double total = double.parse(costOfServiceController.text);

    switch (optionRadio) {
      case 1:
        propina = total * 0.2;
        break;
      case 2:
        propina = total * 0.18;
        break;
      case 3:
        propina = total * 0.15;
        break;
      default:
        propina = 0;
    }

    if (flagRoundTip) {
      propina = propina.ceil().toDouble();
    }
  }
}
