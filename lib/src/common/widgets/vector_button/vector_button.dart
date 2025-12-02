import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

final class VectorButton extends StatefulWidget {
  final VoidCallback? onTapDown;
  final VoidCallback? onTapUp;
  final VoidCallback? onTap;
  final String svgAssetPath;
  final String? pressedSvgAssetPath;
  final EdgeInsets? innerPadding;
  final double? cornerRadius;
  final Color? iconColor;
  final Color? buttonColor;

  const VectorButton({
    required this.svgAssetPath,
    this.onTap,
    this.pressedSvgAssetPath,
    this.innerPadding,
    this.cornerRadius,
    this.iconColor,
    this.buttonColor,
    this.onTapDown,
    this.onTapUp,
    super.key,
  });

  @override
  State<VectorButton> createState() => _VectorButtonState();
}

class _VectorButtonState extends State<VectorButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoButton(
        color: widget.buttonColor ?? context.theme.surfaceColor,
        padding: EdgeInsets.zero,
        onPressed: () {},
        borderRadius: BorderRadius.all(
          Radius.circular(widget.cornerRadius ?? AppDimensions.extraLarge),
        ),
        child: GestureDetector(
          onTapDown: (_) {
            if (widget.pressedSvgAssetPath != null) {
              setState(() => isPressed = true);
            }
            widget.onTapDown?.call();
          },
          onTapUp: (_) {
            if (widget.pressedSvgAssetPath != null) {
              setState(() => isPressed = false);
            }
            widget.onTapUp?.call();
          },
          onTapCancel: () {
            if (widget.pressedSvgAssetPath != null) {
              setState(() => isPressed = false);
            }
            widget.onTapUp?.call();
          },
          onTap: widget.onTap,
          child: Container(
            padding: widget.innerPadding ??
                const EdgeInsets.all(AppDimensions.large),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  widget.cornerRadius ?? AppDimensions.extraLarge,
                ),
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: VectorImage(
                key: ValueKey(isPressed),
                svgAssetPath: isPressed && widget.pressedSvgAssetPath != null
                    ? widget.pressedSvgAssetPath!
                    : widget.svgAssetPath,
                color: widget.iconColor ?? context.theme.primaryIconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
