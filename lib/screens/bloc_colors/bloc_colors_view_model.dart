import 'package:flutter/material.dart';
import 'package:teststream/helper/bloc/color_bloc.dart';
import './bloc_colors.dart';

abstract class BlocColorsViewModel extends State<BlocColors> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
