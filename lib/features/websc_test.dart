//todo -
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:wire_sense/common/widgets/app_button_widgets.dart';

class WebscTest extends StatefulWidget {
  const WebscTest({super.key});

  @override
  State<WebscTest> createState() => _WebscTestState();
}

class _WebscTestState extends State<WebscTest> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  late WebSocketChannel socket;

  @override
  void initState() {
    socketConnection();
    super.initState();
  }
  void socketConnection() async {
    debugPrint('001');
    socket = WebSocketChannel.connect(Uri.parse('ws://localhost:8765'));
    debugPrint('002');
  }

  sendChatMessage() async {
    debugPrint('1');
    await socket.ready;
    debugPrint('2');
    socket.sink.add('Gaurav gandu hai');
    debugPrint('3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("WebSocket Test")),
        body: Container(child: appButtons(buttonText: "Send message",anyWayDoor: (){
          sendChatMessage();
        }),)
    );
  }
}
