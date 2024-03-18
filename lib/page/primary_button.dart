import 'package:dfunc/dfunc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:poc_chat/app/app_theme.dart';
import 'package:poc_chat/app/cubits/app_theme_cubit.dart';
import 'package:poc_chat/gen/colors.gen.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.title,
    this.width,
    this.height = defaultHeight,
    this.padding,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.borderRadius,
    this.onPressed,
    this.enable = true,
    this.isStackButton = false,
    this.color,
    this.titleColor,
    this.shadowDarkColor,
    this.shadowLightColor,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.border = const NeumorphicBorder.none(),
  });

  final String? title;
  final EdgeInsets? padding;
  final EdgeInsets contentPadding;
  final double? width;
  final double height;
  final BorderRadius? borderRadius;
  final NeumorphicButtonClickListener? onPressed;
  final bool enable;
  final bool isStackButton;
  final Color? color;
  final Color? titleColor;
  final Color? shadowDarkColor;
  final Color? shadowLightColor;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final MainAxisAlignment mainAxisAlignment;
  final NeumorphicBorder border;

  static const double defaultHeight = 44;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppThemeCubit>().state;
    final _prefixIcon = prefixIcon;
    final _suffixIcon = suffixIcon;
    final _icon = icon;
    final _title = title;
    final textStyle = enable
        ? titleColor?.let(
              (p0) => theme.componentStyle.primaryButton.textStyle
                  .copyWith(color: p0),
            ) ??
            theme.componentStyle.primaryButton.textStyle
        : theme.componentStyle.disableButton.textStyle;
    final appColor = enable
        ? color?.let(SolidColor.new) ??
            theme.componentStyle.primaryButton.backgroundColor
        : isStackButton
            ? theme.componentStyle.stackButton.backgroundColor
            : theme.componentStyle.disableButton.backgroundColor;
    final List<Color> backgroundColors = appColor is SolidColor
        ? [appColor.color, appColor.color]
        : appColor is GradientColor
            ? appColor.colors
            : [];

    return IgnorePointer(
      ignoring: !enable,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: SizedBox(
          width: width,
          height: height,
          child: NeumorphicButton(
            onPressed: () {
              if (enable) onPressed?.call();
            },
            style: NeumorphicStyle(
              shadowDarkColor: enable
                  ? shadowDarkColor ??
                      theme.componentStyle.primaryButton.shadowDarkColor
                          ?.color ??
                      (color ?? ColorName.scOrange).withOpacity(0.5)
                  : null,
              shadowLightColor: enable
                  ? shadowLightColor ??
                      theme.componentStyle.primaryButton.shadowLightColor
                          ?.color ??
                      (color ?? ColorName.scOrange).withOpacity(0.5)
                  : null,
              border: border,
              boxShape: NeumorphicBoxShape.roundRect(
                borderRadius ?? BorderRadius.circular(height / 2),
              ),
            ),
            padding: EdgeInsets.zero,
            provideHapticFeedback: false,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: backgroundColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: contentPadding,
                child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    if (_prefixIcon != null) ...[
                      _prefixIcon,
                      const SizedBox(width: 8),
                    ],
                    if (_icon != null) Flexible(child: _icon),
                    if (_title != null)
                      Flexible(
                        child: Text(
                          _title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle,
                        ),
                      ),
                    if (_suffixIcon != null) ...[
                      const SizedBox(width: 8),
                      _suffixIcon,
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
