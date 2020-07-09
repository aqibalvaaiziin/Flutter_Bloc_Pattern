import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teststream/helper/provider/provider_balance.dart';
import 'package:teststream/helper/provider/provider_cart.dart';
import 'package:teststream/helper/provider/provider_color.dart';
import 'package:teststream/widgets/navigator_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ColorChanges>(
          create: (context) => ColorChanges(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider<Balance>(
          create: (context) => Balance(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigatorPage(),
      ),
    );
  }
}
