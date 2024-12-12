import 'package:flutter/material.dart';
import 'package:wire_sense/common/utils/app_colors.dart';
import 'package:wire_sense/common/widgets/app_shadow.dart';
import 'package:wire_sense/common/widgets/text_widgets.dart';

class InputParametersScreen extends StatefulWidget {
  const InputParametersScreen({super.key});

  @override
  InputParametersScreenState createState() => InputParametersScreenState();
}

class InputParametersScreenState extends State<InputParametersScreen> {
  // Define slider values for each parameter
  double unnamed = 0.0;
  double emulOilTemp = 40.18;
  double standOilTemp = 39.58;
  double gearOilTemp = 49.99;
  double emulOilPr = 1.52;
  double quenchCWFlowExit = -0.03;
  double castWheelRPM = 1.23;
  double barTemp = 206.23;
  double quenchCWFlowEntry = -0.84;
  double gearOilPr = 1.75;
  double standOilPr = 1.39;
  double tundishTemp = -15.74;
  double rmMotorCoolWater = 1.07;
  double rollMillAmps = 220.61;
  double rmCoolWaterFlow = 193.92;
  double emulsionLevelAnalo = 806.48;
  double siPercent = 0.06;
  double fePercent = 0.14;
  double tiPercent = 0.001;
  double vPercent = 0.001;
  double alPercent = 99.62;
  double furnaceTemperature = 345.84;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const textcustomnormal(text: "Input Parameters",fontfamily: "Inter",fontWeight: FontWeight.w500,fontSize: 26,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Container(
                decoration: appBoxDecoration(borderColor: Colors.grey.shade400,radius: 20,borderWidth: 1,color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 20),
                child: Column(
                  children: [
                    // Header Row
                    const Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text('Sr.',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 3,
                            child: Text('Parameter',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 3,
                            child: Text('Graphical Value',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(
                          width: 150,
                        ),
                        Expanded(
                            flex: 2,
                            child: Text('Numeric Value',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                    const Divider(),
                    // Input Rows
                    buildParameterRow(
                        sr: 1,
                        parameter: 'Emulsion Oil Temp',
                        value: emulOilTemp,
                        unit: '°C',
                        min: 40.18,
                        max: 61.10,
                        sliderActiveColor: const Color(0xff0095FF)),
                    buildParameterRow(
                        sr: 2,
                        parameter: 'Stand Oil Temp',
                        value: standOilTemp,
                        unit: '°C',
                        min: 39.58,
                        max: 57.50,
                        sliderActiveColor: const Color(0xffbfcbed)),
                    buildParameterRow(
                        sr: 3,
                        parameter: 'Gear Oil Temp',
                        value: gearOilTemp,
                        unit: '°C',
                        min: 49.99,
                        max: 64.44,
                        sliderActiveColor: const Color(0xffb7efc5)),
                    buildParameterRow(
                        sr: 4,
                        parameter: 'Emulsion Oil Pressure',
                        value: emulOilPr,
                        unit: 'atm',
                        min: 1.52,
                        max: 2.70,
                        sliderActiveColor: const Color(0xff365abf)),
                    buildParameterRow(
                        sr: 5,
                        parameter: 'Quench CW Flow Exit',
                        value: quenchCWFlowExit,
                        unit: 'L/s',
                        min: -0.03,
                        max: 19.76,
                        sliderActiveColor: const Color(0xff4065C9)),
                    buildParameterRow(
                        sr: 6,
                        parameter: 'Cast Wheel RPM',
                        value: castWheelRPM,
                        unit: 'RPM',
                        min: 1.23,
                        max: 2.16,
                        sliderActiveColor: const Color(0xff5071CE)),
                    buildParameterRow(
                        sr: 7,
                        parameter: 'Bar Temp',
                        value: barTemp,
                        unit: '°C',
                        min: 206.23,
                        max: 600.01,
                        sliderActiveColor: const Color(0xff607ED2)),
                    buildParameterRow(
                        sr: 8,
                        parameter: 'Quench CW Flow Entry',
                        value: quenchCWFlowEntry,
                        unit: 'L/s',
                        min: -0.84,
                        max: 439.95,
                        sliderActiveColor: const Color(0xff90A5E0)),
                    buildParameterRow(
                        sr: 9,
                        parameter: 'Gear Oil Pressure',
                        value: gearOilPr,
                        unit: 'atm',
                        min: 1.75,
                        max: 2.21,
                        sliderActiveColor: const Color(0xff8098DB)),
                    buildParameterRow(
                        sr: 10,
                        parameter: 'Stand Oil Pressure',
                        value: standOilPr,
                        unit: 'atm',
                        min: 1.39,
                        max: 2.17,
                        sliderActiveColor: const Color(0xffAFBFE9)),
                    buildParameterRow(
                        sr: 11,
                        parameter: 'Tundish Temp',
                        value: tundishTemp,
                        unit: '°C',
                        min: -15.74,
                        max: 1070.33,
                        sliderActiveColor: const Color(0xffCFD9F2)),
                    buildParameterRow(
                        sr: 12,
                        parameter: 'RM Motor Cool Water',
                        value: rmMotorCoolWater,
                        unit: 'L/s',
                        min: 1.07,
                        max: 1.50,
                        sliderActiveColor: const Color(0xff7F99DC)),
                    buildParameterRow(
                        sr: 13,
                        parameter: 'Roll Mill Amps',
                        value: rollMillAmps,
                        unit: 'A',
                        min: 220.61,
                        max: 744.34,
                        sliderActiveColor: const Color(0xff3054B0)),
                    buildParameterRow(
                        sr: 14,
                        parameter: 'RM Cool Water Flow',
                        value: rmCoolWaterFlow,
                        unit: 'L/s',
                        min: 193.92,
                        max: 221.55,
                        sliderActiveColor: const Color(0xff73A2D4)),
                    buildParameterRow(
                        sr: 15,
                        parameter: 'Emulsion Level',
                        value: emulsionLevelAnalo,
                        unit: '',
                        min: 806.48,
                        max: 1380.93,
                        sliderActiveColor: const Color(0xff3A78BB)),
                    buildParameterRow(
                        sr: 21,
                        parameter: 'Furnace Temp',
                        value: furnaceTemperature,
                        unit: '°C',
                        min: 345.84,
                        max: 1115.69,
                        sliderActiveColor: const Color(0xffb7efc5)),
                    buildParameterRow(
                        sr: 16,
                        parameter: 'Si %',
                        value: siPercent,
                        unit: '%',
                        min: 0.06,
                        max: 0.13,
                        sliderActiveColor: const Color(0xff82ACD9)),
                    buildParameterRow(
                        sr: 17,
                        parameter: 'Fe %',
                        value: fePercent,
                        unit: '%',
                        min: 0.14,
                        max: 0.26,
                        sliderActiveColor: const Color(0xffb7efc5)),
                    buildParameterRow(
                        sr: 18,
                        parameter: 'Ti %',
                        value: tiPercent,
                        unit: '%',
                        min: 0.001,
                        max: 0.007,
                        sliderActiveColor: const Color(0xffb7efc5)),
                    buildParameterRow(
                        sr: 19,
                        parameter: 'V %',
                        value: vPercent,
                        unit: '%',
                        min: 0.001,
                        max: 0.015,
                        sliderActiveColor: const Color(0xffb7efc5)),

                    buildParameterRow(
                        sr: 20,
                        parameter: 'Al %',
                        value: alPercent,
                        unit: '%',
                        min: 99.62,
                        max: 99.75,
                        sliderActiveColor: const Color(0xffb7efc5)),
                    const SizedBox(height: 20),
                    // Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainThemeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        ),
                        child:  const Text('Verify and Proceed',
                            style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: "Poppins",)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildParameterRow({
    required int sr,
    required String parameter,
    required double value,
    required String unit,
    required double min,
    required double max,
    required Color sliderActiveColor,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(flex: 1, child: Text('$sr')),
            Expanded(
                flex: 3,
                child: Text(
                  parameter,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600),
                )),
            Expanded(
              flex: 3,
              child: Slider(
                activeColor: const Color(0xff502cff),
                inactiveColor: const Color(0xfff3f0ff),
                value: value,
                min: min,
                max: max,
                onChanged: (newValue) {
                  // This line was the problem - you need to use a method that can modify the state
                  setState(() {
                    switch (parameter) {
                      case 'Emulsion Oil Temp':
                        emulOilTemp = newValue;
                        break;
                      case 'Stand Oil Temp':
                        standOilTemp = newValue;
                        break;
                      case 'Gear Oil Temp':
                        gearOilTemp = newValue;
                        break;
                      case 'Emulsion Oil Pressure':
                        emulOilPr = newValue;
                        break;
                      case 'Quench CW Flow Exit':
                        quenchCWFlowExit = newValue;
                        break;
                      case 'Cast Wheel RPM':
                        castWheelRPM = newValue;
                        break;
                      case 'Bar Temp':
                        barTemp = newValue;
                        break;
                      case 'Quench CW Flow Entry':
                        quenchCWFlowEntry = newValue;
                        break;
                      case 'Gear Oil Pressure':
                        gearOilPr = newValue;
                        break;
                      case 'Stand Oil Pressure':
                        standOilPr = newValue;
                        break;
                      case 'Tundish Temp':
                        tundishTemp = newValue;
                        break;
                      case 'RM Motor Cool Water':
                        rmMotorCoolWater = newValue;
                        break;
                      case 'Roll Mill Amps':
                        rollMillAmps = newValue;
                        break;
                      case 'RM Cool Water Flow':
                        rmCoolWaterFlow = newValue;
                        break;
                      case 'Emulsion Level':
                        emulsionLevelAnalo = newValue;
                        break;
                      case 'Si %':
                        siPercent = newValue;
                        break;
                      case 'Fe %':
                        fePercent = newValue;
                        break;
                      case 'Ti %':
                        tiPercent = newValue;
                        break;
                      case 'V %':
                        vPercent = newValue;
                        break;
                      case 'Al %':
                        alPercent = newValue;
                        break;
                      case 'Furnace Temp':
                        furnaceTemperature = newValue;
                        break;
                    }
                  });
                },
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xfff3f0ff),
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${value.toStringAsFixed(2)} $unit',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
