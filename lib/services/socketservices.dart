import 'package:flutter/material.dart';
import 'package:gestiones_app/global/environment.dart';
import 'package:gestiones_app/services/authservices.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  io.Socket? _socket;

  ServerStatus get serverStatus => _serverStatus;

  io.Socket get socket => _socket!;
  Function get emit => _socket!.emit;

  void connect() async {
    final token = await AuthServices.getToken();
    // Dart client
    _socket = io.io(Enviroment.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {
        'x-token': token,
      }
    });

    _socket!.on('connect', (_) {
      _serverStatus = ServerStatus.online;

      notifyListeners();
    });

    _socket!.on('disconnect', (_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }

  void disconnect() {
    _serverStatus = ServerStatus.offline;
    socket.disconnect();
  }
}
