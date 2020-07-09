import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teststream/helper/provider/provider_color.dart';
import './home_page_view_model.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Consumer<ColorChanges>(
          builder: (context, state, _) => Text(
            "Belajar Simple Provider ",
            style: TextStyle(
              color: state.colorRed,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<ColorChanges>(
            builder: (context, state, _) => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              color: state.colorRed,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("merah"),
              Consumer<ColorChanges>(
                builder: (context, state, _) => Switch(
                  value: state.isRed,
                  onChanged: (newValue) {
                    state.isRed = newValue;
                  },
                ),
              ),
              Text("biru"),
            ],
          ),
        ],
      ),
    );
  }
}
