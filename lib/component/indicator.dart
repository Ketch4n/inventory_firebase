import 'package:flutter/cupertino.dart';
import 'data.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: PieData.data
            .map((data) => Container(
                  child: buildIndicator(color: data.color, text: data.name),
                ))
            .toList(),
      );

  Widget buildIndicator({
    required Color color,
    required String text,
    bool isSquare = false,
    double size = 16,
    Color textColor = const Color(0xff505050),
  }) =>
      Row(
        children: <Widget>[
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      );
}
