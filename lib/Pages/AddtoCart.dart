import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cart/models/cart.dart';
import 'package:my_cart/models/catalog.dart';
import 'package:my_cart/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class addtoCart extends StatefulWidget {
  final Item catalog;

  const addtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<addtoCart> createState() => addtoCartState();
}

class addtoCartState extends State<addtoCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();
            _cart.catalog = _catalog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(5),
            overlayColor: const MaterialStatePropertyAll(Colors.blueAccent),
            // shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(5))),
            shape: const MaterialStatePropertyAll(StadiumBorder()),
            backgroundColor: MaterialStateProperty.all(MyTheme.darBluish)),
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.amber,
              ));
  }
}
