import 'package:coffee_app/ui/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CaruselItem extends StatelessWidget {
  double? width;
  double? height;
  CaruselItem({
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.red,
              width: 100,
              child: const Center(
                child: Icon(
                  Icons.cookie,
                  size: 100,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Cookies',
                      size: 24.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: SingleChildScrollView(
                          child: MyText(
                            text:
                                'dsaddasdadadadaasfdasdadsadsadsadsadsadadadadadaddddsadsadsasdadsadsadsadsadsadsadsadaddadad,',
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText(
                          text: '\$55.0',
                          size: 24.0,
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
