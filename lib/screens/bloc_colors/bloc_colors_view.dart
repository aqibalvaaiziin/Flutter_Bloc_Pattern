import 'package:flutter/material.dart';
import 'package:teststream/helper/bloc/color_bloc.dart';
import './bloc_colors_view_model.dart';

class BlocColorsView extends BlocColorsViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Colors"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.green,
            heroTag: "ijo",
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_green);
            },
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            heroTag: "merah",
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_red);
            },
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stateColorStream,
          initialData: Colors.green,
          builder: (context, state) => AnimatedContainer(
            width: 100,
            height: 100,
            color: state.data,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
