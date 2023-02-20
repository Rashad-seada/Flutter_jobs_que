import 'package:data_connection_checker/data_connection_checker.dart';

abstract class ConnectionInfo {
  Future<bool> get isConnected;
}

class ConnectionInfoImpl implements ConnectionInfo{
  final DataConnectionChecker connectionChecker;

  ConnectionInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

}