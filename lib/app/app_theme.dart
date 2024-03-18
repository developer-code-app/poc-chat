import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:poc_chat/gen/assets.gen.dart';
import 'package:poc_chat/gen/colors.gen.dart';
import 'package:poc_chat/app/themes/dark_theme.dart';
import 'package:poc_chat/app/themes/light_theme.dart';
import 'package:poc_chat/app/themes/marble_theme.dart';
import 'package:poc_chat/gen/fonts.gen.dart';

enum PageSize { small, regular, large }

enum SupportedTheme { dark, light, marble }

abstract class AppTheme {
  AppTheme({
    required this.typography,
    required this.fontColor,
  });

  // RueJai app theme.
  final Typography typography;
  final FontColor fontColor;
  late final ComponentStyle componentStyle;
  late final ImageProvider? wallpaper;
  late final AssetGenImage ruejaiLogo;
  late final bool isDarkTheme;

  // Flutter app theme.
  late final ThemeMode mode;
  late final NeumorphicThemeData neumorphic;
  late final ThemeData material;
  late final ThemeData imagePickerTheme;

  AppTheme theme(PageSize pageSize);

  InputDecoration textFormFieldInputDecoration({
    required BuildContext context,
    String? titleText,
    String? hintText,
    String? subTitleText,
    Function()? onPressed,
  }) {
    const underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    );

    return InputDecoration(
      errorBorder: underlineInputBorder,
      focusedErrorBorder: underlineInputBorder,
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
      labelText: titleText,
      labelStyle: componentStyle.input.labelStyle,
      helperText: subTitleText,
      helperStyle: componentStyle.input.textStyle,
      hintText: hintText,
      hintStyle: componentStyle.input.placeholderStyle,
      errorStyle: componentStyle.input.errorStyle,
      contentPadding: const EdgeInsets.all(12),
    );
  }

  InputDecoration passwordFormFieldInputDecoration({
    required BuildContext context,
    required bool shouldShowPassword,
    required Function() onPressedToggleShowPassword,
    String? titleText,
    String? hintText,
  }) {
    return textFormFieldInputDecoration(
      context: context,
      titleText: titleText,
      hintText: hintText,
      onPressed: onPressedToggleShowPassword,
    ).copyWith(
      suffixIcon: IconButton(
        icon: Icon(
          shouldShowPassword ? Icons.visibility_off : Icons.visibility,
          color: ColorName.scOrange,
        ),
        onPressed: onPressedToggleShowPassword,
      ),
    );
  }

  InputDecoration pickerFormFieldInputDecoration({
    required BuildContext context,
    required String titleText,
    required Function() onPressed,
  }) {
    return textFormFieldInputDecoration(
      context: context,
      titleText: titleText,
      onPressed: onPressed,
    ).copyWith(
      suffixIcon: IconButton(
        icon: const Icon(
          Icons.visibility,
          color: ColorName.scOrange,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class Typography {
  Typography({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.headline5,
    required this.subtitle1,
    required this.subtitle2,
    required this.body1,
    required this.body2,
    required this.caption,
    required this.buttonLabel,
    required this.overline,
    this.defaultFontFamily = FontFamily.sukhumvitTadmai,
  });

  final String defaultFontFamily;
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle headline4;
  final TextStyle headline5;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle caption;
  final TextStyle buttonLabel;
  final TextStyle overline;
}

class FontColor {
  FontColor({
    required this.textHighlight,
    required this.textDefault,
    required this.error,
    required this.placeholder1,
    required this.placeholder2,
    required this.subtitle,
    required this.subtitle2,
  });

  final Color textHighlight;
  final Color textDefault;
  final Color error;
  final Color placeholder1;
  final Color placeholder2;
  final Color subtitle;
  final Color subtitle2;
}

class ComponentStyle {
  ComponentStyle({
    required this.appBar,
    required this.calendar,
    required this.card,
    required this.stackCard,
    required this.dialog,
    required this.input,
    required this.separatorColor,
    required this.primaryButton,
    required this.secondaryButton,
    required this.stackButton,
    required this.sceneButton,
    required this.actionButton,
    required this.disableButton,
    required this.compactButton,
    required this.hilightCompactButton,
    required this.subduedCompactButton,
    required this.disableCompactButton,
    required this.switchButton,
    required this.checkbox,
    required this.radio,
    required this.toggle,
    required this.avatar,
    required this.stepper,
    required this.tabBar,
    required this.bottomNavigationBar,
    required this.placeholderBackgroundColor,
    required this.shimmer,
    required this.ratingBar,
    required this.editableWidget,
    required this.couponCodeBackgroundColor,
  });

  final AppBarStyle appBar;
  final CalendarStyle calendar;
  final CardStyle card;
  final CardStyle stackCard;
  final DialogStyle dialog;
  final InputStyle input;
  final Color separatorColor;
  final Avatar avatar;
  final Stepper stepper;
  final TabBar tabBar;
  final BottomNavigationBar bottomNavigationBar;
  final Color placeholderBackgroundColor;
  final Shimmer shimmer;
  final RatingBarStyle ratingBar;
  final EditableWidgetStyle editableWidget;
  final Color couponCodeBackgroundColor;

  // Buttons.
  final ButtonStyle primaryButton;
  final ButtonStyle secondaryButton;
  final ButtonStyle stackButton;
  final ButtonStyle sceneButton;
  final ButtonStyle actionButton;
  final ButtonStyle disableButton;
  final CompactButtonStyle compactButton;
  final CompactButtonStyle hilightCompactButton;
  final CompactButtonStyle subduedCompactButton;
  final CompactButtonStyle disableCompactButton;
  final SwitchButtonStyle switchButton;

  // Selection controls.
  final CheckboxStyle checkbox;
  final RadioStyle radio;
  final ToggleStyle toggle;
}

class TabBar {
  TabBar({
    required this.indicatorColor,
    required this.subtitleStyle,
  });

  final Color indicatorColor;
  final TextStyle subtitleStyle;
}

class BottomNavigationBar {
  BottomNavigationBar({
    required this.decoration,
  });

  final Decoration decoration;
}

class Shimmer {
  Shimmer({
    required this.color,
    required this.highlightColor,
  });

  final Color color;
  final Color highlightColor;
}

class AppBarStyle {
  AppBarStyle({
    required this.titleStyle,
    required this.largeTitleStyle,
  });

  final TextStyle titleStyle;
  final TextStyle largeTitleStyle;
}

class CalendarStyle {
  CalendarStyle({
    required this.monthLabelStyle,
    required this.dayOfTheWeekLabelStyle,
    required this.dateLabelStyle,
    required this.disabledLabelStyle,
    required this.todayDateBoxStyle,
    required this.todayEventDateBoxStyle,
    required this.incomingEventDateBoxStyle,
    required this.pastEventDateBoxStyle,
    required this.eventCardStyle,
  });

  final TextStyle monthLabelStyle;
  final TextStyle dayOfTheWeekLabelStyle;
  final TextStyle dateLabelStyle;
  final TextStyle disabledLabelStyle;
  final DateBoxStyle todayDateBoxStyle;
  final DateBoxStyle todayEventDateBoxStyle;
  final DateBoxStyle incomingEventDateBoxStyle;
  final DateBoxStyle pastEventDateBoxStyle;
  final EventCardStyle eventCardStyle;
}

class DateBoxStyle {
  DateBoxStyle({
    required this.textStyle,
    required this.backgroundColor,
    this.borderColor,
  });

  final TextStyle textStyle;
  final Color backgroundColor;
  final Color? borderColor;
}

class EventCardStyle {
  EventCardStyle({
    required this.titleStyle,
    required this.subtitleStyle,
  });

  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
}

class CardStyle {
  CardStyle({
    required this.backgroundColor,
    required this.stackBackgroundColor,
    required this.highlightBackgroundColor,
    required this.dent,
    required this.stackDent,
  });

  final Color backgroundColor;
  final Color stackBackgroundColor;
  final Color highlightBackgroundColor;
  final Dent dent;
  final Dent stackDent;
}

class Dent {
  Dent({
    required this.shadowDarkColor,
    required this.shadowDarkColorEmboss,
    required this.shadowLightColor,
    required this.shadowLightColorEmboss,
    required this.backgroundColor,
  });

  final Color shadowDarkColor;
  final Color shadowDarkColorEmboss;
  final Color shadowLightColor;
  final Color shadowLightColorEmboss;
  final Color backgroundColor;
}

class DialogStyle {
  DialogStyle({
    required this.titleStyle,
    required this.messageStyle,
    required this.buttonLabelStyle,
    required this.cancelActionSheetColor,
  });

  final TextStyle titleStyle;
  final TextStyle messageStyle;
  final TextStyle buttonLabelStyle;
  final Color cancelActionSheetColor;
}

class InputStyle {
  InputStyle({
    required this.labelStyle,
    required this.textStyle,
    required this.errorStyle,
    required this.placeholderStyle,
    required this.counterStyle,
    required this.backgroundColor,
    required this.disabledBackgroundColor,
  });

  final TextStyle labelStyle;
  final TextStyle textStyle;
  final TextStyle errorStyle;
  final TextStyle placeholderStyle;
  final TextStyle counterStyle;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
}

class Avatar {
  Avatar({
    required this.backgroundColor,
    required this.borderColor,
  });
  final Color backgroundColor;
  final Color borderColor;
}

class Stepper {
  Stepper({
    required this.titleStyle,
    required this.orderLabelStyle,
    required this.borderColor,
    required this.backgroundColor,
    required this.activeLineColor,
    required this.inactiveLineColor,
  });
  final StepperTextStyleState titleStyle;
  final StepperTextStyleState orderLabelStyle;
  final StepperColorState borderColor;
  final StepperColorState backgroundColor;
  final Color activeLineColor;
  final Color inactiveLineColor;
}

class StepperTextStyleState {
  StepperTextStyleState({
    required this.pass,
    required this.current,
    required this.incoming,
  });

  final TextStyle pass;
  final TextStyle current;
  final TextStyle incoming;
}

class StepperColorState {
  StepperColorState({
    required this.pass,
    required this.current,
    required this.incoming,
    required this.base,
  });

  final Color pass;
  final Color current;
  final Color incoming;
  final Color base;
}

class ButtonStyle {
  ButtonStyle({
    required this.textStyle,
    required this.iconColor,
    required this.backgroundColor,
    this.shadowDarkColor,
    this.shadowLightColor,
    this.placeholderColor,
  });

  final TextStyle textStyle;
  final Color iconColor;
  final AppColor backgroundColor;
  final SolidColor? shadowDarkColor;
  final SolidColor? shadowLightColor;
  final Color? placeholderColor;
}

class CompactButtonStyle {
  CompactButtonStyle({
    required this.titleStyle,
    required this.subtitleStyle,
    required this.iconColor,
    required this.backgroundColor,
  });

  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final Color iconColor;
  final AppColor backgroundColor;
}

class SwitchButtonStyle {
  SwitchButtonStyle({
    required this.titleStyle,
    required this.subtitleStyle,
    required this.iconColor,
    required this.backgroundColor,
  });

  final SwitchButtonTextStyleState titleStyle;
  final SwitchButtonTextStyleState subtitleStyle;
  final SwitchButtonColorState iconColor;
  final SwitchButtonColorState backgroundColor;
}

class SwitchButtonTextStyleState {
  SwitchButtonTextStyleState({
    required this.base,
    required this.active,
    required this.error,
    required this.loading,
  });

  final TextStyle base;
  final TextStyle active;
  final TextStyle error;
  final TextStyle loading;
}

class SwitchButtonColorState {
  SwitchButtonColorState({
    required this.base,
    required this.active,
    required this.error,
    required this.loading,
  });

  final Color base;
  final Color active;
  final Color error;
  final Color loading;
}

class CheckboxStyle {
  CheckboxStyle({
    required this.textStyle,
    required this.checkmarkColor,
    required this.borderColor,
    required this.selectedColor,
    required this.backgroundColor,
  });

  final TextStyle textStyle;
  final Color checkmarkColor;
  final Color borderColor;
  final GradientColor selectedColor;
  final Color backgroundColor;
}

class RadioStyle {
  RadioStyle({
    required this.textStyle,
    required this.checkmarkColor,
    required this.borderColor,
    required this.selectedColor,
    required this.backgroundColor,
  });

  final TextStyle textStyle;
  final Color checkmarkColor;
  final Color borderColor;
  final GradientColor selectedColor;
  final Color backgroundColor;
}

class ToggleStyle {
  ToggleStyle({
    required this.textStyle,
    required this.selectedColor,
    required this.unselectedColor,
  });

  final TextStyle textStyle;
  final Color selectedColor;
  final Color unselectedColor;
}

class RatingBarStyle {
  RatingBarStyle({
    required this.unratedColor,
  });

  final Color unratedColor;
}

class EditableWidgetStyle {
  EditableWidgetStyle({
    required this.removeButtonBackgroundColor,
    required this.removeButtonBorder,
  });

  final Color removeButtonBackgroundColor;
  final NeumorphicBorder removeButtonBorder;
}

abstract class AppColor {}

class SolidColor extends AppColor {
  SolidColor(this.color);

  final Color color;
}

class GradientColor extends AppColor {
  GradientColor(this.colors);

  final List<Color> colors;
}

extension Background on Decoration {
  static BoxDecoration of(AppTheme theme) {
    if (theme.wallpaper != null) {
      return BoxDecoration(
        color: theme.neumorphic.baseColor,
        image: DecorationImage(
          image: theme.wallpaper!,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return BoxDecoration(color: theme.neumorphic.baseColor);
    }
  }
}

extension SupportedThemeContructor on SupportedTheme {
  static SupportedTheme fromString(String value) {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    switch (value) {
      case 'dark':
        return SupportedTheme.dark;
      case 'light':
        return SupportedTheme.light;
      case 'marble':
        return SupportedTheme.marble;
      default:
        return isDarkMode ? SupportedTheme.dark : SupportedTheme.light;
    }
  }

  static SupportedTheme fromAppTheme(AppTheme theme) {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    if (theme is DarkTheme) {
      return SupportedTheme.dark;
    } else if (theme is LightTheme) {
      return SupportedTheme.light;
    } else if (theme is MarbleTheme) {
      return SupportedTheme.marble;
    } else {
      return isDarkMode ? SupportedTheme.dark : SupportedTheme.light;
    }
  }

  String get valueString {
    switch (this) {
      case SupportedTheme.dark:
        return 'dark';
      case SupportedTheme.light:
        return 'light';
      case SupportedTheme.marble:
        return 'marble';
    }
  }

  AppTheme get appTheme {
    switch (this) {
      case SupportedTheme.dark:
        return DarkTheme();
      case SupportedTheme.light:
        return LightTheme();
      case SupportedTheme.marble:
        return MarbleTheme();
    }
  }
}
