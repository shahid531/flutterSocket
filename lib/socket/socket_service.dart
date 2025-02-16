import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final _instance = SocketService._internal();
  final _socketResponse = StreamController<int>.broadcast();
  late IO.Socket _socket;

  SocketService._internal();

  factory SocketService() => _instance;

  Stream<int> get getResponse => _socketResponse.stream;

  void connect(String url, {Map<String, dynamic>? options}) {
    _socket = IO.io(
        url,
        options ??
            {
              'transports': ['websocket'],
              'autoConnect': true,
            });

    _socket.onConnect(
      (data) {
        print('CONNECTION_SUCCESSFUL');
      },
    );

    _socket.on(
      'randomValue',
      (data) {
        _socketResponse.add(data);
      },
    );

    _socket.onDisconnect(
      (data) {
        print('DISCONNECTED');
      },
    );
  }

  void sendMessage(String msg) {
    _socket.emit('message', msg);
  }

  void disconnect() {
    _socketResponse.close();
    _socket.disconnect();
  }
}
