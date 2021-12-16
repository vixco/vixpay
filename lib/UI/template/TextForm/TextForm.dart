import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yollet/Mgr/redux/state.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/UI/template/TextForm/TenderKeypadFormManager.dart';
// import 'package:yollet/UI/STR/TenderKeypadPageOrangeTablet.dart';
import 'package:yollet/UI/template/button/CustomSwitch.dart';
import 'package:yollet/Util/Format/NumberFormatUtil.dart';


class DefaultDeco extends InputDecoration {
  final Widget? icon;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? helperText;
  final TextStyle? helperStyle;
  final String hintText;
  final TextStyle hintStyle;
  final int? hintMaxLines;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final bool hasFloatingPlaceholder;
  final bool isDense;
  final EdgeInsetsGeometry contentPadding;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final String? counterText;
  final Widget? counter;
  final TextStyle? counterStyle;
  final bool filled;
  final Color fillColor;
  final Color focusColor;
  final Color hoverColor;
  final InputBorder? errorBorder;
  final InputBorder focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder disabledBorder;
  final InputBorder enabledBorder;
  final bool? alignLabelWithHint;
  final InputBorder? border;
  bool enabled;
  final String? semanticCounterText;

  DefaultDeco({
    this.icon,
    this.labelText,
    this.labelStyle,
    this.helperText,
    this.helperStyle,
    this.hintText = "",
    this.hintStyle = ThemeTextStyles.bodyBlack26,
    this.hintMaxLines,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.hasFloatingPlaceholder = true,
    this.isDense = true,
    this.contentPadding =
        const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
    this.prefixIcon,
    this.prefix,
    this.prefixText,
    this.prefixStyle,
    this.suffixIcon,
    this.suffix,
    this.suffixText,
    this.suffixStyle,
    this.counter,
    this.counterText,
    this.counterStyle,
    this.filled = true,
    this.fillColor = ThemeColors.very_light_pink_two,
    this.focusColor = ThemeColors.theme_500,
    this.hoverColor  = ThemeColors.theme_500,
    this.errorBorder,
    this.focusedBorder = const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 4.0)),
    this.focusedErrorBorder,
    this.disabledBorder = const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 1.0)),
    this.enabledBorder = const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 1.0)),
    this.border,
    this.enabled = true,
    this.semanticCounterText,
    this.alignLabelWithHint,
  }) : super(
          icon: icon,
          labelText: labelText,
          labelStyle: labelStyle,
          helperText: helperText,
          helperStyle: helperStyle,
          hintText: hintText,
          hintStyle: hintStyle,
          hintMaxLines: hintMaxLines,
          errorText: errorText,
          errorStyle: errorStyle,
          errorMaxLines: errorMaxLines,
          // hasFloatingPlaceholder: hasFloatingPlaceholder,
          isDense: isDense,
          contentPadding: contentPadding,
          prefixIcon: prefixIcon,
          prefix: prefix,
          prefixText: prefixText,
          prefixStyle: prefixStyle,
          suffixIcon: suffixIcon,
          suffix: suffix,
          suffixText: suffixText,
          suffixStyle: suffixStyle,
          counter: counter,
          counterText: counterText,
          counterStyle: counterStyle,
          filled: filled,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedErrorBorder,
          disabledBorder: disabledBorder,
          enabledBorder: enabledBorder,
          border: border,
          enabled: enabled,
          semanticCounterText: semanticCounterText,
          alignLabelWithHint: alignLabelWithHint,
        );
}

class DefaultTextFormField extends StatelessWidget {
  double marginUnder;
  TextFormField base;
  String label;
  TextStyle labelStyle;

  //static const Text _label = Text("");

  DefaultTextFormField(
      {Key? key,
      this.label = "",
      this.labelStyle = ThemeTextStyles.bodyBlack26,
      TextEditingController? controller,
      String? initialValue,
      FocusNode? focusNode,
      InputDecoration decoration = const InputDecoration(),
      TextInputType? keyboardType,
      TextCapitalization textCapitalization = TextCapitalization.none,
      TextInputAction? textInputAction,
      TextStyle style = ThemeTextStyles.bodyBlack26,
      StrutStyle? strutStyle,
      TextDirection? textDirection,
      TextAlign textAlign = TextAlign.start,
      bool autofocus = false,
      bool obscureText = false,
      bool autocorrect = true,
      bool autovalidate = false,
      bool maxLengthEnforced = true,
      int maxLines = 1,
      int? minLines,
      bool expands = false,
      int? maxLength,
      VoidCallback? onEditingComplete,
      ValueChanged<String>? onFieldSubmitted,
      FormFieldSetter<String>? onSaved,
      FormFieldValidator<String>? validator,
      List<TextInputFormatter>? inputFormatters,
      bool enabled = true,
      double cursorWidth = 2.0,
      Radius? cursorRadius,
      Color? cursorColor,
      Brightness? keyboardAppearance,
      EdgeInsets scrollPadding = const EdgeInsets.all(4.0),
      bool enableInteractiveSelection = true,
      InputCounterWidgetBuilder? buildCounter,
      this.marginUnder = ThemeSizeStyle.textFieldUnderPadding})
      : base = TextFormField(
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          decoration: decoration.copyWith(
            filled: !enabled,
            contentPadding: EdgeInsets.only(top:3,bottom: 6),
            focusedBorder:
            const UnderlineInputBorder(  borderSide: BorderSide(color: Colors.transparent, width: 1.0)),
//
//              const OutlineInputBorder(
//              borderSide: BorderSide(color: ThemeColors.orange_400, width: 2))
  ),
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign,
          autofocus: autofocus,
          obscureText: obscureText,
          autocorrect: autocorrect,
          autovalidate: autovalidate,
          maxLengthEnforced: maxLengthEnforced,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          buildCounter: buildCounter,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: 0, left: 0.0, right: 0.0, bottom: this.marginUnder),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Padding(
//                padding: EdgeInsets.only(left: 0, bottom: 8, top: 8),
//                child: Text(
//                  AppLocalizations.of(context).getString(label),
//                  style: labelStyle,
//                )),
           AutoSizeText(
              AppLocalizations.of(context)!.getString(label), style: labelStyle,
            ),
            SizedBox(
              height: 5.0,
            ),
            base,
            Padding(
              padding: EdgeInsets.only(left: 0, bottom: 0, top: 6),
              child :  Divider(
              color: base.enabled?ThemeColors.slate:ThemeColors.very_light_pink_two,
              height: 2.0,
                thickness: ThemeSizeStyle.dividerThickness,
              )
            ),
          ],
        ));
  }
}

class DefaultTextFormFieldEmbeddedKeyPad extends StatefulWidget {
  final double marginUnder;
  final TextFormField base;
  final String label;
  final TextStyle labelStyle;
  final bool isAutoStartCallback;
  final TextEditingController? controller;
  final TenderKeypadFormManager? formManager;
  final bool enabled;
  final String? keypadInputMaximum;
  final bool isCurrency;

  DefaultTextFormFieldEmbeddedKeyPad(
    {Key? key,
      this.label = "",
      this.labelStyle = ThemeTextStyles.h5Gray33,
      this.controller,
      this.formManager,
      String? initialValue,
      FocusNode? focusNode,
      InputDecoration decoration = const InputDecoration(),
      TextInputType? keyboardType,
      TextCapitalization textCapitalization = TextCapitalization.none,
      TextInputAction? textInputAction,
      TextStyle style = ThemeTextStyles.bodyBlack26,
      StrutStyle? strutStyle,
      TextDirection? textDirection,
      TextAlign textAlign = TextAlign.start,
      bool autofocus = false,
      bool obscureText = false,
      bool autocorrect = true,
      bool autovalidate = false,
      bool maxLengthEnforced = true,
      int maxLines = 1,
      int? minLines,
      bool expands = false,
      int? maxLength,
      VoidCallback? onEditingComplete,
      ValueChanged<String>? onFieldSubmitted,
      FormFieldSetter<String>? onSaved,
      FormFieldValidator<String>? validator,
      List<TextInputFormatter>? inputFormatters,
      this.enabled = true,
      double cursorWidth = 2.0,
      Radius? cursorRadius,
      Color? cursorColor,
      Brightness? keyboardAppearance,
      EdgeInsets scrollPadding = const EdgeInsets.all(4.0),
      bool enableInteractiveSelection = true,
      InputCounterWidgetBuilder? buildCounter,
      this.marginUnder = ThemeSizeStyle.margin_underTitle,
      this.isAutoStartCallback = true,
      this.keypadInputMaximum,
      this.isCurrency = true
    })
    : base = TextFormField(
    key: key,
    controller: controller,
    initialValue: initialValue,
    focusNode: focusNode,
    decoration: decoration.copyWith(
      filled: !enabled,
      contentPadding: EdgeInsets.only(top:3, bottom: 6, left: 8, right: 8),
      hintStyle: TextStyle(color: ThemeColors.blue_grey)
    ),
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    textInputAction: textInputAction,
    style: style,
    strutStyle: strutStyle,
    textDirection: textDirection,
    textAlign: textAlign,
    autofocus: autofocus,
    obscureText: obscureText,
    autocorrect: autocorrect,
    autovalidate: autovalidate,
    maxLengthEnforced: maxLengthEnforced,
    maxLines: maxLines,
    minLines: minLines,
    expands: expands,
    maxLength: maxLength,
    onEditingComplete: onEditingComplete,
    onFieldSubmitted: onFieldSubmitted,
    onSaved: onSaved,
    validator: validator,
    inputFormatters: inputFormatters,
    enabled: false,//enabled,
    cursorWidth: cursorWidth,
    cursorRadius: cursorRadius,
    cursorColor: cursorColor,
    keyboardAppearance: keyboardAppearance,
    scrollPadding: scrollPadding,
    enableInteractiveSelection: enableInteractiveSelection,
    buildCounter: buildCounter,
  );

  @override
  DefaultTextFormFieldEmbeddedKeyPadState createState() => DefaultTextFormFieldEmbeddedKeyPadState();
}

class DefaultTextFormFieldEmbeddedKeyPadState extends State<DefaultTextFormFieldEmbeddedKeyPad> {
  bool isFocus=false;

  @override
  void initState() {
    super.initState();

    widget.formManager?.registerForm(this,
        autoFocus: widget.isAutoStartCallback,
        label: widget.label,
        max: widget.keypadInputMaximum,
        onFocus: (focus) {
          if (mounted) {
            setState(() {
              isFocus = focus;
            });
          }
        },
        onInput: (text) {
          if (widget.isCurrency) {
            text = CurrencyFormatter.noSymbolCurrency.format(num.parse(text));
          }

          widget.controller!.text = text;
        },
        isEnable: () => widget.enabled);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (widget.enabled) {
            widget.formManager?.focus(this);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(top: 0, left: 0.0, right: 0.0, bottom: widget.marginUnder),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             AutoSizeText(
                AppLocalizations.of(context)!.getString(widget.label),
                style: widget.labelStyle,
              ),
              SizedBox(height: 13),
              Container(
                  color: isFocus ? ThemeColors.light_blue_grey : Colors.transparent,
                  child: widget.base),
              Padding(
                padding: EdgeInsets.only(top: 7),
                child: Divider(
                  color: widget.enabled ? ThemeColors.slate : const Color(0xffe0e0e0),
                  height: 2.0,
                ),
              ),
            ],
          ),
        ));
  }
}

class DefaultTextFormFieldNoLabel extends StatelessWidget {
  double marginUnder;
  TextFormField base;

  //static const Text _label = Text("");

  DefaultTextFormFieldNoLabel(
    {Key? key,
      TextEditingController? controller,
      String? initialValue,
      FocusNode? focusNode,
      InputDecoration decoration = const InputDecoration(),
      TextInputType? keyboardType,
      TextCapitalization textCapitalization = TextCapitalization.none,
      TextInputAction? textInputAction,
      TextStyle style = ThemeTextStyles.bodyBlack26,
      StrutStyle? strutStyle,
      TextDirection? textDirection,
      TextAlign textAlign = TextAlign.start,
      bool autofocus = false,
      bool obscureText = false,
      bool autocorrect = true,
      bool autovalidate = false,
      bool maxLengthEnforced = true,
      int maxLines = 1,
      int? minLines,
      bool expands = false,
      int? maxLength,
      VoidCallback? onEditingComplete,
      ValueChanged<String>? onFieldSubmitted,
      FormFieldSetter<String>? onSaved,
      FormFieldValidator<String>? validator,
      List<TextInputFormatter>? inputFormatters,
      bool enabled = true,
      double cursorWidth = 2.0,
      Radius? cursorRadius,
      Color? cursorColor,
      Brightness? keyboardAppearance,
      EdgeInsets scrollPadding = const EdgeInsets.all(4.0),
      bool enableInteractiveSelection = true,
      InputCounterWidgetBuilder? buildCounter,
      this.marginUnder = ThemeSizeStyle.margin_underTitle})
    : base = TextFormField(
    key: key,
    controller: controller,
    initialValue: initialValue,
    focusNode: focusNode,
    decoration: decoration.copyWith(
      filled: !enabled,
      contentPadding: EdgeInsets.only(top:3,bottom: 6),
      focusedBorder:  const UnderlineInputBorder(  borderSide: BorderSide(color: Colors.transparent, width: 1.0))

//            OutlineInputBorder(
//              borderSide: BorderSide(color: ThemeColors.ReplyOrange900, width: 2))
    ),
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    textInputAction: textInputAction,
    style: style,
    strutStyle: strutStyle,
    textDirection: textDirection,
    textAlign: textAlign,
    autofocus: autofocus,
    obscureText: obscureText,
    autocorrect: autocorrect,
    autovalidate: autovalidate,
    maxLengthEnforced: maxLengthEnforced,
    maxLines: maxLines,
    minLines: minLines,
    expands: expands,
    maxLength: maxLength,
    onEditingComplete: onEditingComplete,
    onFieldSubmitted: onFieldSubmitted,
    onSaved: onSaved,
    validator: validator,
    inputFormatters: inputFormatters,
    enabled: enabled,
    cursorWidth: cursorWidth,
    cursorRadius: cursorRadius,
    cursorColor: cursorColor,
    keyboardAppearance: keyboardAppearance,
    scrollPadding: scrollPadding,
    enableInteractiveSelection: enableInteractiveSelection,
    buildCounter: buildCounter,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0, left: 0.0, right: 0.0, bottom: this.marginUnder),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          base,
          Padding(
            padding: EdgeInsets.only(left: 0, bottom: 0, top: 6.5),
            child :  Divider(
              color: base.enabled?ThemeColors.slate:ThemeColors.very_light_pink_two,
              height: 1.0,
            )
          ),
        ],
      ));
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {

  DecimalTextInputFormatter({int? decimalRange, bool activatedNegativeValues = false})
    : assert(decimalRange == null || decimalRange >= 0,
  'DecimalTextInputFormatter declaretion error')
  {
    SettingState settingState = appStore.state.settingState;
    String? currency = settingState.value("locale.currency");
    String dp = "";
    switch(currency){
      case "KRW":
        dp="";
        break;

      case "KZT":
      case "RUB":
        dp = (decimalRange != null && decimalRange > 0) ? "([,|.][0-9]{0,$decimalRange}){0,1}" : "";
        break;

      case "USD":
      default:
        dp = (decimalRange != null && decimalRange > 0) ? "([.][0-9]{0,$decimalRange}){0,1}" : "";
        break;

    }
    String num = "[0-9]*$dp";

    if(activatedNegativeValues) {
      _exp =  RegExp("^((((-){0,1})|((-){0,1}[0-9]$num))){0,1}\$");
    }
    else {
      _exp =  RegExp("^($num){0,1}\$");
    }
  }

  late RegExp _exp;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
    ) {
    if(_exp.hasMatch(newValue.text)){
      return convertText(newValue);
    }
    return oldValue;
  }
  TextEditingValue convertText(TextEditingValue value){
    SettingState settingState = appStore.state.settingState;
    String? currency = settingState.value("locale.currency");
    if(currency=="KZT" ||currency=="RUB"){
      String text = value.text;
      text=text.replaceAll(",", ".");
      value=TextEditingValue().copyWith(text: text,composing: value.composing,selection: value.selection);
    }
      return value;
  }
}


class MaxDecimalTextInputFormatter extends TextInputFormatter {
final num maxValue;
  MaxDecimalTextInputFormatter({required this.maxValue})
    : assert(maxValue >= 0,'MaxDecimalTextInputFormatter declaretion error');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
    ) {
    num _value;
    String text = newValue.text;
    if(text.isEmpty){
      text = "0";
    }
    try {
    _value= num.parse(text);
    } on Exception {
      _value= num.parse(text);
    }
    if(_value<maxValue){
      return newValue;
    }
    return oldValue;
  }
}
//
//
//class MaxDecimalTextInputFormatter extends TextInputFormatter {
//final num maxValue;
//  MaxDecimalTextInputFormatter({this.maxValue})
//    : assert(maxValue >= 0,'MaxDecimalTextInputFormatter declaretion error')
//  {}
//
//  @override
//  TextEditingValue formatEditUpdate(
//    TextEditingValue oldValue,
//    TextEditingValue Value,
//    ) {
//    num _value = CurrencyFormatter.noSymbolCurrency.parse(Value.text);
//
//    if(_value<maxValue){
//      return Value;
//    }
//    return oldValue;
//  }
//}

class AppBarTextFormField extends StatelessWidget {
  double marginUnder;
  TextFormField base;
  String label;
  TextStyle labelStyle;
  double labelWidth;
  bool? useLastPadding;

  //static const Text _label = Text("");

  AppBarTextFormField({
    Key? key,
    this.label = "",
    this.labelStyle = ThemeTextStyles.bodyBlack26,
    this.labelWidth = 110.0,
    TextEditingController? controller,
    String? initialValue,
    FocusNode? focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    bool autofocus = false,
    bool obscureText = false,
    bool autocorrect = true,
    bool autovalidate = false,
    bool maxLengthEnforced = true,
    int maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool enabled = true,
    double cursorWidth = 2.0,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder? buildCounter,
    this.marginUnder = ThemeSizeStyle.margin_underComponents,
  }) : base =  TextFormField(
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          decoration: decoration,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign,
          autofocus: autofocus,
          obscureText: obscureText,
          autocorrect: autocorrect,
          autovalidate: autovalidate,
          maxLengthEnforced: maxLengthEnforced,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          buildCounter: buildCounter,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: 0, left: 0.0, right: 16.0, bottom: this.marginUnder),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: labelWidth,
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
                child:AutoSizeText(
                  label,
                  maxLines: 2,
                  style: labelStyle,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(child: base)
          ],
        ));
  }
}

class HeaderSearchFormField {
  final Widget? iconWidget;
  final String? title;
  final TextEditingController? textController;
  final void Function()? onCallback;

  const HeaderSearchFormField(
      {this.iconWidget, this.title, this.textController, this.onCallback});
}

class HeaderSearchForm extends StatelessWidget {
  final List<HeaderSearchFormField>? fields;

  final Color inputColor = ThemeColors.white;

  const HeaderSearchForm({Key? key, this.fields}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: ThemeColors.slate,
        //padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: fields!.map((field) {
            return Padding(
              padding: const EdgeInsets.only(bottom: ThemeSizeStyle.headerSearchFormPaddingBottom),
              child: InkWell(
              onTap: field.onCallback,
              child:TextField(
                controller: field.textController,
                cursorColor: Theme.of(context).colorScheme.secondary,
                style: ThemeTextStyles.h5Black33,
                enabled: false,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    height: 32,
                    width: 64,
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: field.iconWidget,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: inputColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: inputColor)),
                  fillColor: inputColor,
                  filled: true,
                  labelText:
                      AppLocalizations.of(context)!.getString(field.title),
                  labelStyle: ThemeTextStyles.h5Gray33,
                  // hasFloatingPlaceholder: false,
                ),
              ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class DefaultDropdownButton<T> extends StatelessWidget {
  final Key? key;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final Widget? hint;
  final Widget? disabledHint;
  final ValueChanged<T?> onChanged;
  final int elevation;
  final TextStyle style;
  final Widget? underline;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;

  final double marginUnder;
  final String label;
  final TextStyle labelStyle;

  static Widget _defUnderline = Container(
    height: 2.0,
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: Colors.transparent, width: 2.0),
      ),
    ),
  );

  late Widget _child;

  DefaultDropdownButton({
    this.key,
    this.label = "",
    this.labelStyle = ThemeTextStyles.bodyBlack26,
    required this.items,
    this.value,
    this.hint,
    this.disabledHint,
    required this.onChanged,
    this.elevation = 8,
    this.style=ThemeTextStyles.h2Black47,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor = ThemeColors.black,
    this.iconSize = 48.0,
    this.isDense = false,
    this.isExpanded = true,
    this.marginUnder = ThemeSizeStyle.margin_underTitle,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      _child = Container(child:AutoSizeText(""));

    } else {
      _child = DropdownButton(
        key: key,
        items: items,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        onChanged: onChanged,
        elevation: elevation,
        style: style,
        underline: _defUnderline,
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        iconSize: iconSize,
        isDense: isDense,
        isExpanded: isExpanded,
      );
    }
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(
        top: 0, left: 0.0, right: 0.0, bottom: this.marginUnder),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 0, bottom: 0, top: 8),
            child:AutoSizeText(
              AppLocalizations.of(context)!.getString(label),
              style: labelStyle,
            ),
          ),
          _child,
          Padding(
            padding: EdgeInsets.only(left: 0, bottom: 0, top: ThemeSizeStyle.defaultDropdownButtonDividerSpace),
            child :  Divider(
              color: ThemeColors.very_light_pink_two,
              height: 2.0,
              thickness: ThemeSizeStyle.dividerThickness,
            )
          ),
        ],
      ),
    );
  }
}

class DefaultSwitch extends StatelessWidget {
  double marginUnder;
  String label;
  TextStyle labelStyle;
  TextStyle optionStyle;
  String left;
  String right;
  bool? groupValue;
  ValueChanged<bool>? onChanged;

  DefaultSwitch({
    this.label = "",
    this.labelStyle = ThemeTextStyles.h5Gray33,
    this.left = "",
    this.right = "",
    this.optionStyle = ThemeTextStyles.bodyBlack26,
    this.groupValue,
    this.onChanged,
    this.marginUnder = ThemeSizeStyle.margin_underTitle,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
        padding: EdgeInsets.only(bottom: this.marginUnder),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0, bottom: 21, top: 8),
              child:AutoSizeText(
                AppLocalizations.of(context)!.getString(label),
                style: labelStyle,
              ),
            ),
            Row(
              children: [
               AutoSizeText(
                  left.isEmpty ? '' : AppLocalizations.of(context)!.getString(left),
                  style: optionStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                CustomSwitch(
                  value: groupValue!,
                  onChanged: onChanged,
                  activeColor: ThemeColors.slate,
                  trackColor: ThemeColors.DividerLineColor,
                  trackHeight: ThemeSizeStyle.customSwitchTrackHeight,
                  trackWidth: ThemeSizeStyle.customSwitchTrackWidth,
                  switchHeight: ThemeSizeStyle.customSwitchHeight,
                  switchWidth: ThemeSizeStyle.customSwitchWidth,
                  inactiveThumbColor:ThemeColors.brownish_grey,
                  activeThumbColor:ThemeColors.white,
                ),
               AutoSizeText(
                  right.isEmpty ? '' : AppLocalizations.of(context)!.getString(right),
                  style: optionStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ],
        ));
  }
}
