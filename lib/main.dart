import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_payer/bloc/music_player_bloc/music_player_bloc.dart';
import 'package:music_payer/ui/play_list/play_list_page.dart';

void main() {
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => MusicPlayerBloc(),)
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayListPage(),
    );
  }
}
