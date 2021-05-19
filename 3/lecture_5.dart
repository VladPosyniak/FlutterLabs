import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends ChangeNotifier {
  final List<Item> _items = [];
  double get amount => _items.fold(0, (value, item) => value + item.price);
  int get count => _items.length;
  bool hasItem(Item item) => _items.any((element) => item == element);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}


class Item {
  final String name;
  final double price;
  Item({ @required this.name, @required this.price }):
        assert(name != null), assert(price != null);
}

class CartBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    return Padding(
      padding: const EdgeInsets.all(20.0,),
      child: Row(
        children: [
          Expanded(
              child: Text("Товаров: ${cart.count}")
          ),
          Text("сумму: ${cart.amount}")
        ],
      ),
    );
  }
}

class ItemView extends StatelessWidget {
  final Item item;
  ItemView(this.item): assert(item != null);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => context.read<Cart>().add(item),
    child: Consumer<Cart>(
      builder: (context, cart, child) => Card(
        color: cart.hasItem(item)
            ? Colors.lightGreen
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(child: Text(item.name)),
              Text(item.price.toStringAsFixed(2))
            ],
          ),
        ),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Магазин"),
      actions: [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => context.read<Cart>().clear(),
        ),
      ],
    ),
    body: Column(
      children: [
        CartBar(),
        Expanded(
          child: Consumer<UnmodifiableListView>(
            builder: (context, list, child) =>
                ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, idx) => ItemView(list[idx]),
                ),
          ),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  final UnmodifiableListView products;
  MyApp({ @required this.products }): assert(products != null);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: products),
        ChangeNotifierProvider(create: (_) => Cart(),),
      ],
      child: MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage()
      ),
    );
  }
}

void main() {
  final List<Item> products = [
    Item(name: "Ноутбук", price: 100.0),
    Item(name: "Телефон", price: 200.0),
    Item(name: "Холодильник", price: 150.0),
    Item(name: "Телевизор", price: 120.0),
    Item(name: "Утюг", price: 60.0),
  ];
  runApp(MyApp(products: UnmodifiableListView(products)));
}
