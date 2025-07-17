library global_internet_listener;

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global_internet_listener_bloc/global_internet_listener_bloc.dart';
import 'global_internet_listener_bloc/global_internet_listener_state.dart';



class GlobalInternetListener extends StatelessWidget {
  final Widget child;

  const GlobalInternetListener({super.key, required this.child});

  void showAwesomeSnackbar(BuildContext context, String title, String message, ContentType type) {
    // Delay to avoid ScaffoldMessenger error
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 3),
        content: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: type,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InternetBloc(),
      child: Builder(
        builder: (context) {
          return BlocListener<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetLooseState) {
                showAwesomeSnackbar(
                  context,
                  'No Internet',
                  'You are currently offline. Please check your connection.',
                  ContentType.failure,
                );
              } else if (state is InternetGainedState) {
                showAwesomeSnackbar(
                  context,
                  'Internet Restored',
                  'You are now back online!',
                  ContentType.success,
                );
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
