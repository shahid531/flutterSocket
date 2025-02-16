import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../socket/socket_service.dart';

class SocketScreen extends StatefulWidget {
  const SocketScreen({super.key});

  @override
  State<SocketScreen> createState() => _SocketScreenState();
}

class _SocketScreenState extends State<SocketScreen> {
  var socketService = SocketService();
  late IO.Socket socket;

  final textController = TextEditingController();

  @override
  void initState() {
    socketService.connect('http://123456:3000');
    super.initState();
  }

  @override
  void dispose() {
    socketService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
              stream: socketService.getResponse,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text('${snapshot.data}',style: const TextStyle(fontSize: 18),);
                }
                return const Text('Loading From Server...');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textController,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  socketService.sendMessage(textController.text.trim());
                },
                child: const Text('Send'))
          ],
        ),
      ),
    );
  }
}
