import 'package:xoomship/contacts/all_contacts/data/data_notifier.dart';
import 'package:xoomship/dash_board/components/floating_icon_status_cubit.dart';
import 'package:xoomship/first_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomship/second_splash_screen.dart';
import 'core/bloc/theme_switch_cubit.dart';
import 'core/components/bloc/country_flag_cubit.dart';
import 'dash_board/dash_board.dart';
import 'dash_board/drawer/bloc/location_details_cubit.dart';
import 'onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PagedDataNotifier()),
        BlocProvider(create: (context) => SinglePagedDataNotifier()),
        BlocProvider(create: (context) => ThemeSwitchCubit()),
        BlocProvider(create: (context) => ConfirmedPickupCubit()),
        BlocProvider(create: (context) => CountryFlagCubit()),
        BlocProvider(create: (context) => LocationDetailsCubit()),
      ],
      child: BlocBuilder<ThemeSwitchCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            darkTheme: ThemeData.dark(),
            themeMode: state ? ThemeMode.light : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
            home: DashBoard(),
          );
        },
      ),
    );
  }
}
