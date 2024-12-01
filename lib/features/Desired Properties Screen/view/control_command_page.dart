import 'package:flutter/material.dart';
import 'package:wire_sense/common/widgets/text_widgets.dart';
import '../../../common/utils/image_res.dart';
import '../../../main.dart';

class ControlCommand extends StatefulWidget {
  const ControlCommand({super.key});

  @override
  State<ControlCommand> createState() => _ControlCommandState();
}

class _ControlCommandState extends State<ControlCommand> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String selectedMenu = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Drawer(
              backgroundColor: Colors.grey.shade200,
              shape: const RoundedRectangleBorder(),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageRes.letterW,
                        fit: BoxFit.fill,
                        height: screenHeight*0.01,
                        width: screenWidth*0.01,
                      ),
                      const textcustomnormal(text: "ireSense", fontWeight: FontWeight.bold,fontfamily: "Inter",fontSize: 40,color: Color(0xff2074F2),)
                    ],
                  ),
                  ListTile(
                    title: const Text('Dashboard'),
                    onTap: () {
                      _key.currentState?.closeDrawer();
                      setState(() {
                        selectedMenu = 'Dashboard';
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Predict Properties'),
                    onTap: () {
                      _key.currentState?.closeDrawer();
                      setState(() {
                        selectedMenu = 'Predict Properties';
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Automate'),
                    onTap: () {
                      _key.currentState?.closeDrawer();
                      setState(() {
                        selectedMenu = 'Automate';
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Download Reports'),
                    onTap: () {
                      _key.currentState?.closeDrawer();
                      setState(() {
                        selectedMenu = 'Download Reports';
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //     flex: 1,
          //     child: Container(
          //       padding: const EdgeInsets.all(8),
          //       alignment: Alignment.topCenter,
          //       height: screenHeight,
          //       color: Colors.white,
          //       child: IconButton(
          //           onPressed: () {
          //             _key.currentState?.openDrawer();
          //           },
          //           icon: const Icon(
          //             Icons.menu,
          //             color: Colors.black,
          //           )),
          //     )),
          Expanded(
            flex: 25,
            child: getContentWidget(selectedMenu),
          ),
        ],
      ),
    );
  }

  Widget getContentWidget(String menu) {
    switch (menu) {
      case 'Predict Properties':
        return const Center(child: Text('Predict prop which has to be removed'));
      case 'Dashboard':
      default:
        return  Center(
          child: ControlCenterPage()
        );
    }
  }
}

class ControlCenterPage extends StatelessWidget {
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController pressureController = TextEditingController();
  final TextEditingController speedController = TextEditingController();

  ControlCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Wire Manufacturing Control Center',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Set your desired parameters to begin the process',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildInputField(
                screenWidth: screenWidth,
                controller: temperatureController,
                label: 'UTS (MPa)',
                icon: Icons.handyman,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                screenWidth: screenWidth,
                controller: pressureController,
                label: 'Elongation (%)',
                icon: Icons.straighten,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                screenWidth: screenWidth,
                controller: speedController,
                label: 'Conductivity (S/M)',
                icon: Icons.bolt,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  navKey.currentState
                      ?.pushNamed("/dashboard");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Initialize Manufacturing Process',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required double screenWidth
  }) {
    return SizedBox(
      width: screenWidth*0.3,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

