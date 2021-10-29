import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking_app/theme/app_colors.dart';
import 'package:no_smoking_app/views/global/conditional_expanded.dart';

class ImagePageViewWithDotIndicator extends StatelessWidget {
  ImagePageViewWithDotIndicator({
    Key? key,
    required this.scrollImages,
    this.height,
    this.width,
    this.isExpanded = false,
    this.isNetwork = false,
  }) : super(key: key);

  final PageController splashImagesController = PageController();
  final List<String> scrollImages;
  final double? height;
  final double? width;
  final bool isExpanded;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    // Active Scroll Index
    var activeScrollIndex = 0.obs;

    return ConditionalExpanded(
      isExpanded: isExpanded,
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: scrollImages.length,
                controller: splashImagesController,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: isNetwork
                      ? Image.network(
                          scrollImages[index],
                        )
                      : Image.asset(
                          scrollImages[index],
                        ),
                ),
                onPageChanged: (index) => activeScrollIndex.value = index,
              ),
            ),
            const SizedBox(height: 8.0),

            // Row for scroll indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < scrollImages.length; i++)

                  // Tap Detector for Indicator
                  GestureDetector(
                    onTap: () {
                      splashImagesController.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    },
                    // Scroll Indicator
                    child: Obx(
                      () => Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: activeScrollIndex.value == i
                              ? AppColors.darkGreen
                              : AppColors.gray,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
