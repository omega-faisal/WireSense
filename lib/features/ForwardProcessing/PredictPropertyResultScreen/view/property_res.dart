import 'package:flutter/material.dart';



class PropertyResultScreen extends StatefulWidget {

  const PropertyResultScreen({super.key});

  @override
  State<PropertyResultScreen> createState() => _PropertyResultScreenState();
}

class _PropertyResultScreenState extends State<PropertyResultScreen> {
  final List<Map<String, dynamic>> properties = [
    {
      'title': 'Conductivity',
      'value': '58.6 % IACS',
      'icon': Icons.bolt,
      'color': Colors.blue,
    },
    {
      'title': 'Elongation',
      'value': '32.5 %',
      'icon': Icons.straighten,
      'color': Colors.green,
    },
    {
      'title': 'UTS',
      'value': '450 MPa',
      'icon': Icons.speed,
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Key Properties',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  final property = properties[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: property['color'].withOpacity(0.2),
                            radius: 30,
                            child: Icon(
                              property['icon'],
                              color: property['color'],
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                property['title'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                property['value'],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
