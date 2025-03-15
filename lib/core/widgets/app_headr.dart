import 'package:baridx_order_creation/core/resources/app_assets.dart';
import 'package:baridx_order_creation/core/widgets/app_deafult_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppHeader extends StatelessWidget {
  final String text;
  final bool hasBackButton;
  final VoidCallback? onTapBackButton;

  const AppHeader({
    super.key,
    required this.text,
    this.hasBackButton = false,
    this.onTapBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.appBarHeader,
          width: MediaQuery.sizeOf(context).width,
        ),
        Positioned(
          top: 55,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (hasBackButton)
                  InkWell(
                    onTap: () {
                      if (onTapBackButton != null) {
                        onTapBackButton!();
                      } else {
                        context.pop();
                      }
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                const SizedBox(width: 15),
                AppDefaultText(
                  text,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
