import 'package:coffee_app/ui/screens/home/upload/upload_screen.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:coffee_app/ui/screens/home/orders/orders.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OredersTapp extends StatelessWidget {
  bool admin;
  OredersTapp({
    super.key,
    required this.admin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: SizedBox(
        height: 50.0,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            alignment: const Alignment(0, -0.5),
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => admin ? const UploadImage() : const Orders(),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyText(
                text: admin ? 'Add Newness' : 'Orders',
                size: 24.0,
              ),
              Icon(
                admin ? Icons.add_box_outlined : Icons.shopping_cart,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
