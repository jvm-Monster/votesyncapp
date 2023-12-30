import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCheck extends StatefulWidget {
  const ConnectionCheck({Key? key}) : super(key: key);

  @override
  _ConnectionCheckState createState() => _ConnectionCheckState();
}

class _ConnectionCheckState extends State<ConnectionCheck> {
  late Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();


    var subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.wifi) {
        print("There is a connection");
      }
      // Handle connectivity changes
      print("Connectivity Status: $result");
    });

  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connection Check'),
      ),
      body: Column(
        children: [
          // Use StreamBuilder to build UI based on connectivity changes
          StreamBuilder<ConnectivityResult>(
            stream: _connectivity.onConnectivityChanged,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                // Check if data is available before accessing it
                if (snapshot.hasData &&
                    (snapshot.data == ConnectivityResult.mobile ||
                        snapshot.data == ConnectivityResult.wifi)) {
                  return Text("Internet Connection Available");
                } else {
                  return Text("No Internet Connection");
                }
              } else {
                // Show a loading indicator or handle other states
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
