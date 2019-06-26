import 'package:eshop/blocs/cart.bloc.dart';
import 'package:eshop/models/cart-item.model.dart';
import 'package:eshop/ui/shared/widgets/cart/cart-item.widget.dart';
import 'package:eshop/ui/shared/widgets/shared/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  var bloc;
  final price = new NumberFormat("#,##0.00", "pt_BR");
  var items = new List<CartItemModel>();

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBloc>(context);
    items = bloc.cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "R\$ ${price.format(bloc.total)}",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Loader(
          object: bloc.cart,
          callback: list,
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          child: CartItem(
            item: items[index],
          ),
          key: Key(items[index].id),
          onDismissed: (direction) {
            bloc.remove(items[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.1),
          ),
        );
      },
    );
  }
}
