import 'package:amazon_clone_flutter/constants/globlal_variables.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  final double rating;
  const Start({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: rating,
      itemSize: 15,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: GlobalVariables.secondaryColor,
      ),
    );
  }
}
