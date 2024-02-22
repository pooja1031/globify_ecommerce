
import 'package:flutter/material.dart';
import 'package:myshopping/Providers/cart_providers.dart';
import 'package:myshopping/Providers/favorite_providers.dart';
import 'package:myshopping/models/product.dart';

class ProductCard extends StatefulWidget {
  final Products products;

  const ProductCard({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final cartProvider = CartProvider.of(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8.0),
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Set your desired background color here
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                      child: Image.asset(
                        widget.products.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.products.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "\$${widget.products.price}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: GestureDetector(
                onTap: () => provider.toggleFavorite(widget.products),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 247, 240, 240),
                  child: Icon(
                    provider.isExist(widget.products)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: GestureDetector(
                onTap: () => cartProvider.toggleProducts(widget.products),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
