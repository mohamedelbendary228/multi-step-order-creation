import 'package:baridx_order_creation/core/resources/app_colors.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isLast;
  const ReviewItem({
    super.key,
    required this.title,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AppDefaultText(
                title,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGray,
              ),
            ),
            Container(
              width: 210,
              alignment: Alignment.centerRight,
              child: AppDefaultText(
                value,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
                height: 1.2,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        if (!isLast) ...[
          const Divider(color: AppColors.darkGray, thickness: 0.2),
          const SizedBox(height: 5),
        ]
      ],
    );
  }
}
