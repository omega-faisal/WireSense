import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wire_sense/common/widgets/app_button_widgets.dart';
import '../../../../../../common/widgets/app_shadow.dart';
import '../../../../../../common/widgets/plotdata.dart';
import '../../../../../../common/widgets/text_widgets.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({super.key});

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  List<CastingTemp> temperatureData = [
    CastingTemp('Q1', 3.0),
    CastingTemp('Q2', 4.0),
    CastingTemp('Q3', 2.0),
    CastingTemp('Q4', 3.0),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(),
        /// Code of Initial UI
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     // Top Part
        //     _buildRealTimeProcessMonitor(
        //       UTS: '400',
        //       Elongation: '20',
        //       Conductivity: '50',
        //       screenHeight: screenHeight,
        //       screenWidth: screenWidth
        //     ),
        //     const SizedBox(height: 20),
        //     // Mid Part
        //     Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Expanded(
        //             flex: 5,
        //             child: _buildMonitoringSection(screenHeight, screenWidth)),
        //         Expanded(flex: 1, child: _buildLiveAlerts(screenHeight)),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }

/// Code of Initial UI
  // Widget _buildRealTimeProcessMonitor({
  //   required String UTS,
  //   required String Elongation,
  //   required String Conductivity,
  //   required double screenHeight,
  //   required double screenWidth,
  // }) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
  //     decoration: BoxDecoration(
  //       color: Colors.blue[50],
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           flex: 3,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const Text(
  //                         'Real-time Process Monitor',
  //                         style: TextStyle(
  //                           fontSize: 22,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.blueAccent,
  //                         ),
  //                       ),
  //                       const SizedBox(height: 5),
  //                       Text(
  //                         'Manufacturing in progress',
  //                         style: TextStyle(fontSize: 14, color: Colors.grey[600]),
  //                       ),
  //                     ],
  //                   ),
  //                   documentsButtons(
  //                       buttonText: "Stop Process",
  //                       buttonColor: Colors.red.shade600,
  //                       buttonTextColor: Colors.white,
  //                       buttonIcon: Icons.pause,
  //                       buttonBorderWidth: 0.0,
  //                       iconColor: Colors.white,
  //                       anyWayDoor: () {}),
  //                 ],
  //               ),
  //               const SizedBox(height: 50),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   _buildProcessDetail(
  //                       'Target UTS', '$UTS Mpa', Icons.handyman),
  //                   const SizedBox(width: 20,),
  //                   _buildProcessDetail(
  //                       'Target Elongation', '$Elongation %', Icons.straighten),
  //                   const SizedBox(width: 20,),
  //                   _buildProcessDetail(
  //                       'Target Conductivity', '$Conductivity S/M', Icons.bolt),
  //                   const SizedBox(width: 20,),
  //                   _buildProcessDetail('Process Time', '03:45:30', Icons.timer),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(width: 100,),
  //         Expanded(
  //           flex: 1,
  //             child: Container(
  //                 height: screenHeight*0.35,
  //                 width: screenWidth*0.15,
  //                 padding: const EdgeInsets.all(10),
  //                 decoration: appBoxShadow(radius: 10,color: Colors.white),
  //                 child: Image.asset('assets/images/unipol.png',fit: BoxFit.fill,)))
  //
  //       ],
  //     ),
  //
  //   );
  // }
  //Widget _buildProcessDetail(String label, String value, IconData icon) {
  //   return Column(
  //     children: [
  //       Icon(icon, color: Colors.blueAccent, size: 30),
  //       const SizedBox(height: 5),
  //       Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
  //       const SizedBox(height: 5),
  //       Text(value,
  //           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //     ],
  //   );
  // }
  //
  // Widget _buildMonitoringSection(double screenHeight, double screenWidth) {
  //   return Container(
  //     width: screenWidth * 0.7,
  //     height: screenHeight * 0.65,
  //     margin: const EdgeInsets.symmetric(horizontal: 20),
  //     padding: const EdgeInsets.all(10),
  //     child: GridView(
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 20),
  //       children: [
  //         plot(screenHeight, screenWidth),
  //         plot(screenHeight, screenWidth),
  //         plot(screenHeight, screenWidth),
  //         plot(screenHeight, screenWidth),
  //         plot(screenHeight, screenWidth),
  //         plot(screenHeight, screenWidth),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildLiveAlerts(double screenHeight) {
  //   return Container(
  //     height: screenHeight * 0.65,
  //     margin: const EdgeInsets.symmetric(horizontal: 20),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(15),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3),
  //           spreadRadius: 2,
  //           blurRadius: 5,
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
  //           child: Text(
  //             'Live Alerts',
  //             style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.orange),
  //           ),
  //         ),
  //         Container(
  //           height: screenHeight * 0.58,
  //           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
  //           child: SingleChildScrollView(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 _buildAlert(
  //                     'Temperature increased by 5°C - Adjusting pressure',
  //                     Colors.red),
  //                 _buildAlert(
  //                     'Speed optimization in progress,who cares what is in progress',
  //                     Colors.blue),
  //                 _buildAlert(
  //                     'Parameters stabilized at target values, the value are typically 123',
  //                     Colors.green),
  //                 _buildAlert(
  //                     'Parameters stabilized at target values, the value are typically 123',
  //                     Colors.redAccent),
  //                 _buildAlert(
  //                     'Parameters stabilized at target values, the value are typically 123',
  //                     Colors.redAccent),
  //               ],
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildAlert(String message, Color color) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 10),
  //     padding: const EdgeInsets.all(10),
  //     decoration: BoxDecoration(
  //       color: color.withOpacity(0.1),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Row(
  //       children: [
  //         Icon(Icons.info_outline, color: color, size: 20),
  //         const SizedBox(width: 10),
  //         Expanded(
  //           child: Text(
  //             message,
  //             style: TextStyle(color: color, fontSize: 14),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildStats() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       _buildStatCard('Production Count', '1200', Colors.blue),
  //       _buildStatCard('Avg. Temperature', '350°C', Colors.red),
  //       _buildStatCard('Avg. Pressure', '2.5 atm', Colors.green),
  //     ],
  //   );
  // }
  //
  // Widget _buildStatCard(String label, String value, Color color) {
  //   return Container(
  //     padding: const EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: color.withOpacity(0.1),
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: Column(
  //       children: [
  //         Text(
  //           value,
  //           style: TextStyle(
  //             fontSize: 24,
  //             fontWeight: FontWeight.bold,
  //             color: color,
  //           ),
  //         ),
  //         const SizedBox(height: 10),
  //         Text(
  //           label,
  //           style: TextStyle(
  //             fontSize: 14,
  //             color: Colors.grey[700],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildCorrelationMatrix() {
  //   return Container(
  //     margin: const EdgeInsets.all(20),
  //     padding: const EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: Colors.grey[200],
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child: const Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           'Correlation Matrix',
  //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //         ),
  //         SizedBox(height: 20),
  //         // Image.asset(
  //         //   'assets/images/correlation_matrix.png',
  //         //   // Replace with your image path
  //         //   height: 200,
  //         // ),
  //       ],
  //     ),
  //   );
  // }


}
/// Plot Data and Graphs
// Widget plot(double screenHeight, double screenWidth) {
//   return Container(
//     decoration: appBoxDecoration(
//         color: Colors.white,
//         borderColor: Colors.black12,
//         borderWidth: 1,
//         radius: 10),
//     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const text20normal(
//           text: 'Casting Temperature',
//           fontfamily: "Poppins",
//         ),
//         dashboardChart(castingTempData: temperatureData)
//       ],
//     ),
//   );
// }
//
// Widget dashboardChart({required List<CastingTemp> castingTempData}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//     height: 300,
//     child: SfCartesianChart(
//         primaryXAxis: const CategoryAxis(
//           majorGridLines: MajorGridLines(width: 0.0),
//         ),
//         primaryYAxis: const NumericAxis(
//           title: AxisTitle(text: "Temperature"),
//           minimum: 1,
//           maximum: 5,
//           interval: 1,
//           majorGridLines: MajorGridLines(width: 0.4),
//         ),
//         tooltipBehavior: TooltipBehavior(
//           enable: true,
//         ),
//         series: <CartesianSeries>[
//           // Renders line chart
//           LineSeries<CastingTemp, String>(
//               name: 'Temperature',
//               dataSource: castingTempData,
//               xValueMapper: (CastingTemp data, _) => data.quarter,
//               yValueMapper: (CastingTemp data, _) => data.temp)
//         ]),
//   );
// }