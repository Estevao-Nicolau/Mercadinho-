import 'package:flutter/material.dart';
import 'package:flutter_provider/components/cart_item.dart';
import 'package:flutter_provider/models/cart.dart';
import 'package:flutter_provider/models/order_list.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white54,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Text(
                        'R\$${cart.totalAmount}',
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              ?.color,
                        ),
                      )),
                  const Spacer(),
                  CartButton(cart: cart)
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, i) => CartItemWidget(items[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class CartButton extends StatefulWidget {
  const CartButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading ? CircularProgressIndicator() : TextButton(
        onPressed: widget.cart.itemCount == 0
            ? null
            : () async {
                setState(() => _isLoading = true);

                await Provider.of<OrderList>(context, listen: false).addOrder(widget.cart);

                widget.cart.clear();
                setState(() => _isLoading = false);
              },
        child: const Text('COMPRA'),
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ));
  }
}
