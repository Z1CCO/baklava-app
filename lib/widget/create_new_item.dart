import 'dart:io';
import 'package:coffee_app/ui/screens/home/view/my_container.dart';
import 'package:coffee_app/ui/my_text.dart';
import 'package:coffee_app/widget/buy_and_publish.dart';
import 'package:flutter/material.dart';

String? category;

// ignore: must_be_immutable
class CreateNewItem extends StatefulWidget {
  bool uploading;
  File? image;
  TextEditingController name;
  TextEditingController discription;
  TextEditingController cost;
  TextEditingController number;
  VoidCallback onPressed;
  VoidCallback handleSubmit;

  CreateNewItem({
    super.key,
    required this.name,
    required this.cost,
    required this.discription,
    required this.onPressed,
    required this.number,
    required this.uploading,
    required this.handleSubmit,
    this.image,
  });

  @override
  State<CreateNewItem> createState() => _CreateNewItemState();
}

class _CreateNewItemState extends State<CreateNewItem> {
  int selected = 0;
  List<String> items = ['Baklava', 'Coffee', 'Tea'];

  Widget customRadio(String text, int index) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor:
              (selected == index) ? Colors.amber : Colors.amber.shade100),
      onPressed: () {
        selected = index;
        category = text;

        setState(() {});
      },
      child: MyText(
        height: -0.5,
        text: text,
        color: Colors.black,
        size: 20.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 7,
        shadowColor: Colors.grey,
        backgroundColor: Colors.amber,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: MyText(
          color: Colors.black,
          height: -0.3,
          text: 'Add Newness',
          size: 26.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              widget.uploading == true
                  ? const LinearProgressIndicator(
                      color: Colors.red,
                    )
                  : const SizedBox(),
              GestureDetector(
                onTap: widget.onPressed,
                child: Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    image: widget.image == null
                        ? const DecorationImage(
                            image: AssetImage('assets/images/upload.png'),
                          )
                        : DecorationImage(
                            image: FileImage(
                              File(widget.image!.path),
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              MyContainerBorder(
                width: double.infinity,
                title: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: widget.name,
                        decoration: const InputDecoration(
                          fillColor: Colors.amber,
                          filled: true,
                          hintText: 'name',
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: TextField(
                          controller: widget.discription,
                          decoration: const InputDecoration(
                            fillColor: Colors.amber,
                            filled: true,
                            hintText: 'discription',
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                      ),
                      TextField(
                        controller: widget.cost,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          fillColor: Colors.amber,
                          filled: true,
                          hintText: 'cost',
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: widget.number,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          fillColor: Colors.amber,
                          filled: true,
                          hintText: 'number',
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: MyText(
                          text: 'Category',
                          color: Colors.black,
                          size: 25.0,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: customRadio('Baklava', 1)),
                          const SizedBox(width: 10),
                          Expanded(child: customRadio('Tea', 2)),
                          const SizedBox(width: 10),
                          Expanded(child: customRadio('Coffee', 3)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: widget.image == null ? () {} : widget.handleSubmit,
        child: BuyAndPublish(text: 'Publish'),
      ),
    );
  }
}
