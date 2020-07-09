import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teststream/helper/provider/provider_balance.dart';
import 'package:teststream/helper/provider/provider_cart.dart';
import './multi_provider_cart_view_model.dart';

class MultiProviderCartView extends MultiProviderCartViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Cart"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Consumer<Balance>(
            builder: (context, stateBalance, _) => Consumer<Cart>(
              builder: (context, stateCart, _) => FloatingActionButton(
                heroTag: "kulak",
                onPressed: () {
                  if (stateBalance.balance >= 500) {
                    stateCart.qty += 1;
                    stateBalance.balance -= 1000;
                  }
                },
                backgroundColor: Colors.green,
                child: Text("kulak"),
              ),
            ),
          ),
          Consumer<Balance>(
            builder: (context, stateBalance, _) => Consumer<Cart>(
              builder: (context, stateCart, _) => FloatingActionButton(
                heroTag: "dodol",
                onPressed: () {
                  if (stateCart.qty > 0) {
                    stateCart.qty -= 1;
                    stateBalance.balance += 1200;
                  }
                },
                backgroundColor: Colors.blue,
                child: Text("dodol"),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("balance"),
              SizedBox(width: 5),
              Consumer<Balance>(
                builder: (context, state, _) => Container(
                  width: 100,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    state.balance.toString(),
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(8),
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(),
            ),
            child: Consumer<Cart>(
              builder: (context, state, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Apple (1000) X ${state.qty.toString()}"),
                  Text((1000 * state.qty).toString()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
