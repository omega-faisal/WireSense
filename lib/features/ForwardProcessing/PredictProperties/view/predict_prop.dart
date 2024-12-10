import 'package:flutter/material.dart';



class ParameterSliders extends StatefulWidget {
  const ParameterSliders({super.key});

  @override
  ParameterSlidersState createState() => ParameterSlidersState();
}

class ParameterSlidersState extends State<ParameterSliders> {
  final List<String> parameters = [
    'Casting Temp',
    'Cooling Water Temp',
    'Casting Speed',
    'Entry Temp.',
    'Emulsion Temp.',
    'Emulsion Conc.',
    'Quench Water Pressure',
    'Emulsion Pressure',
  ];

  final List<double> values = [703.6, 25.0, 3.0, 602.2, 78, 3.2, 2.1, 6.0];
  final List<double> minValues = [0, 0, 0, 0, 0, 0, 0, 0];
  final List<double> maxValues = [1000, 100, 10, 1000, 100, 10, 10, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parameter Sliders"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: parameters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            parameters[index],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Slider(
                            value: values[index],
                            min: minValues[index],
                            max: maxValues[index],
                            divisions: 100,
                            onChanged: (newValue) {
                              setState(() {
                                values[index] = newValue;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            controller: TextEditingController(
                                text: values[index].toStringAsFixed(1)),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            onSubmitted: (newValue) {
                              setState(() {
                                values[index] = double.tryParse(newValue) ??
                                    values[index];
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your prediction logic here
              },
              child: Text('PREDICT PROPERTIES'),
            ),
          ],
        ),
      ),
    );
  }
}
