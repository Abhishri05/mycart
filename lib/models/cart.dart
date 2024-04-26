import 'package:my_cart/core/store.dart';
import 'package:my_cart/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
  CatalogModel _catalog = CatalogModel();

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // Remove Item

  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class Addmutation extends VxMutation<MyStore> {
  final Item item;

  Addmutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class removemutation extends VxMutation<MyStore> {
  final Item item;

  removemutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
