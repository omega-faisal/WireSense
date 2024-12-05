import 'package:flutter/material.dart';
import '../../../main.dart';

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
                  navKey.currentState?.pushNamed("/websc");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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

  Widget _buildInputField(
      {required TextEditingController controller,
      required String label,
      required IconData icon,
      required double screenWidth}) {
    return SizedBox(
      width: screenWidth * 0.3,
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
