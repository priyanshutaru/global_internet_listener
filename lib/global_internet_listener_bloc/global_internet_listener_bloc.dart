import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global_internet_listener_event.dart';
import 'global_internet_listener_state.dart';



class InternetBloc extends Bloc<InternetEvent,InternetState>{
  Connectivity _connectivity = Connectivity();

  StreamSubscription? connectivitySubscription;

  InternetBloc():super(InitialState()){
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    on<InternetLooseEvent>((event,emit) => emit (InternetLooseState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      print("connect device of internet ${result.first}");
      print("connect device of internet ${ConnectivityResult.mobile}");
      print("connect device of internet ${ConnectivityResult.wifi}");
      if(result.first == ConnectivityResult.mobile || result.first == ConnectivityResult.wifi){
        add(InternetGainedEvent());
      } else{
        add(InternetLooseEvent());
      }
    });

  }


  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}