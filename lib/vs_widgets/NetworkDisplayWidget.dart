import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../stateproviders/internet_connection_state_provider.dart';

class NetworkDisplayWidget extends ConsumerStatefulWidget {
  final Widget child;
  const NetworkDisplayWidget({super.key,required this.child});

  @override
  ConsumerState createState() => _NetworkDisplayWidgetState();
}

class _NetworkDisplayWidgetState extends ConsumerState<NetworkDisplayWidget> {
  @override
  Widget build(BuildContext context) {
   final internetConnectionStatus =  ref.watch(internetConnectionStreamProvider);

    return internetConnectionStatus.when(
        data: (data) {
        /*  if(data==ConnectivityResult.mobile){
            return const Text("You are on Mobile connection");
          }

          if(data==ConnectivityResult.wifi){
            return const Text("You are on Wifi Connection");
          }

          if(data==ConnectivityResult.ethernet){
            return const Text("You are on Ethernet Connection");
          }*/
          if(checkNow(data)){
            return widget.child;
          }
          return const CircularProgressIndicator();
        },
        error: (error, stackTrace) {
          return const Text("an error occurred");
        },
        loading: () {
          return const Text("Its loading");
        },
    );
  }
  bool checkNow(data){
    if(data == ConnectivityResult.mobile||data==ConnectivityResult.wifi||data==ConnectivityResult.ethernet){
      return true;
    }else{
      return false;
    }
  }
}
