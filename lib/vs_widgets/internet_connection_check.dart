import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCheck extends StatefulWidget {
  const ConnectionCheck({super.key});

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
        title: const Text('Connection Check'),
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
                  return const Text("Internet Connection Available");
                } else {
                  return const Text("No Internet Connection");
                }
              } else {
                // Show a loading indicator or handle other states
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
