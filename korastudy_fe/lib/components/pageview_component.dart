import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FrameSlideComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String imagePath;

  const FrameSlideComponent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Điều chỉnh chiều rộng của card
      height: 210, // Điều chỉnh chiều cao của card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(79, 85, 136, 0.06),
            offset: Offset(4, 8),
            blurRadius: 30,
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(255, 205, 107, 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1,
              decoration: TextDecoration.none,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Abel',
              fontSize: 15,
              fontWeight: FontWeight.normal,
              height: 1,
              decoration: TextDecoration.none,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/Date_range_duotone_line.svg',
                height: 13,
              ),
              const SizedBox(width: 3),
              Text(
                date,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color.fromRGBO(42, 39, 73, 1),
                  fontFamily: 'Abel',
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  height: 1,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}