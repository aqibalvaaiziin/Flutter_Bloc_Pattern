import 'package:flutter/material.dart';
import 'package:teststream/screens/bloc_colors/bloc_colors.dart';
import 'package:teststream/screens/multi_provider_cart/multi_provider_cart.dart';
import 'package:teststream/screens/provider_color/home_page.dart';

class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Bloc"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage())),
              child: Text("Color Provider"),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MultiProviderCart())),
              child: Text("Cart Multi Providers"),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => BlocColors())),
              child: Text("Bloc Color"),
            ),
          ],
        ),
      ),
    );
  }
}
