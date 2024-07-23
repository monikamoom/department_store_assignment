import 'package:department_store_assignment/domain/entities/product_model.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductWidget({required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                productModel.imageUrl,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Text(productModel.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text(productModel.desc,
              maxLines: 3,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis),
          SizedBox(
              width: double.infinity,
              child: Text(
                productModel.price,
                textAlign: TextAlign.right,
              )),
        ],
      ),
    );
  }
}
