import 'package:flutter/material.dart';

class ProductFormView extends StatelessWidget {
  const ProductFormView ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('formulario de Produto'),
      )
    );
  }
}