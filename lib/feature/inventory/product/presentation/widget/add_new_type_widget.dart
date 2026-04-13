import 'package:ecommerce/common/widget/custom_contaner.dart';
import 'package:flutter/material.dart';

class AddNewTypeButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  const AddNewTypeButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomContainer(width: 36,height: 36,
        onTap: onTap,verticalPadding: 0,
        borderRadius: 5,horizontalPadding: 0,
        showShadow: false,border: Border.all(width: .5,
            color: Theme.of(context).hintColor),
        child: Icon(Icons.add, size: 20),
      ),
    );
  }
}
