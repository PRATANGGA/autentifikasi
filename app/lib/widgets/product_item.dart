import 'package:app/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../pages/edit_product_page.dart';

class ProductItem extends StatelessWidget {
  final String id, title, price;

  final DateTime updatedAt;

  ProductItem(this.id, this.title, this.price, this.updatedAt);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Products>(context, listen: false);
    String date = DateFormat.yMMMd().add_Hms().format(updatedAt);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        child: Card(
          color: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, EditProductPage.route,
                  arguments: id);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$title",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Last Edited: $date"),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      prov.deleteProduct(id);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.view_agenda_outlined),
                    onPressed: () {
                      // prov.deleteProduct(id);
                      Navigator.pushNamed(context, ProductDetailPage.route,
                          arguments: id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
