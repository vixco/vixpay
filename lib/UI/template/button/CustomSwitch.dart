// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Examples can assume:
// bool _lights;
// void setState(VoidCallback fn) { }

/// An iOS-style switch.
///
/// Used to toggle the on/off state of a single setting.
///
/// The switch itself does not maintain any state. Instead, when the state of
/// the switch changes, the widget calls the [onChanged] callback. Most widgets
/// that use a switch will listen for the [onChanged] callback and rebuild the
/// switch with a new [value] to update the visual appearance of the switch.
///
/// {@tool snippet}
///
/// This sample shows how to use a [CustomSwitch] in a [ListTile]. The
/// [MergeSemantics] is used to turn the entire [ListTile] into a single item
/// for accessibility tools.
///
/// ```dart
/// MergeSemantics(
///   child: ListTile(
///     title: Text('Lights'),
///     trailing: CupertinoSwitch(
///       value: _lights,
///       onChanged: (bool value) { setState(() { _lights = value; }); },
///     ),
///     onTap: () { setState(() { _lights = !_lights; }); },
///   ),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Switch], the material design equivalent.
///  * <https://developer.apple.com/ios/human-interface-guidelines/controls/switches/>
class CustomSwitch extends StatefulWidget {
  /// Creates an iOS-style switch.
  ///
  /// The [value] parameter must not be null.
  /// The [dragStartBehavior] parameter defaults to [DragStartBehavior.start] and must not be null.

  final double trackWidth;
  final double trackHeight;
  final double switchWidth;
  final double switchHeight;
  final Color inactiveThumbColor;
  final Color activeThumbColor;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.trackColor,
    this.dragStartBehavior = DragStartBehavior.start,
    this.trackWidth = 51.0,
    this.trackHeight =  31.0,
    this.switchWidth = 59.0,
    this.switchHeight = 39.0,
    this.inactiveThumbColor =Colors.white,
    this.activeThumbColor =Colors.white,
  }) : super(key: key);

  /// Whether this switch is on or off.
  ///
  /// Must not be null.
  final bool value;

  /// Called when the user toggles with switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch with the new
  /// value.
  ///
  /// If null, the switch will be displayed as disabled, which has a reduced opacity.
  ///
  /// The callback provided to onChanged should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// CupertinoSwitch(
  ///   value: _giveVerse,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _giveVerse = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool>? onChanged;

  /// The color to use when this switch is on.
  ///
  /// Defaults to [CupertinoColors.systemGreen] when null and ignores
  /// the [CupertinoTheme] in accordance to native iOS behavior.
  final Color? activeColor;

  /// The color to use for the background when the switch is off.
  ///
  /// Defaults to [CupertinoColors.secondarySystemFill] when null.
  final Color? trackColor;

  /// {@template flutter.cupertino.switch.dragStartBehavior}
  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], the drag behavior used to move the
  /// switch from on to off will begin upon the detection of a drag gesture. If
  /// set to [DragStartBehavior.down] it will begin when a down event is first
  /// detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// See also:
  ///
  ///  * [DragGestureRecognizer.dragStartBehavior], which gives an example for
  ///    the different behaviors.
  ///
  /// {@endtemplate}
  final DragStartBehavior dragStartBehavior;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty('value', value: value, ifTrue: 'on', ifFalse: 'off', showName: true));
    properties.add(ObjectFlagProperty<ValueChanged<bool>>('onChanged', onChanged, ifNull: 'disabled'));
  }
}

class _CustomSwitchState extends State<CustomSwitch> with TickerProviderStateMixin {
  late TapGestureRecognizer _tap;
  late HorizontalDragGestureRecognizer _drag;

  late AnimationController _positionController;
  CurvedAnimation? position;

  late AnimationController _reactionController;
  late Animation<double> _reaction;

  bool get isInteractive => widget.onChanged != null;

  // A non-null boolean value that changes to true at the end of a drag if the
  // switch must be animated to the position indicated by the widget's value.
  bool needsPositionAnimation = false;

  late double _kTrackInnerStart;// = _kTrackHeight / 2.0;
late double _kTrackInnerEnd;// = _kTrackWidth - _kTrackInnerStart;
late double _kTrackInnerLength;// = _kTrackInnerEnd - _kTrackInnerStart;

  @override
  void initState() {
    super.initState();
    _kTrackInnerStart=widget.trackHeight / 2.0;
    _kTrackInnerEnd=widget.trackWidth - _kTrackInnerStart;
    _kTrackInnerLength = _kTrackInnerEnd - _kTrackInnerStart;

    _tap = TapGestureRecognizer()
      ..onTapDown = _handleTapDown
      ..onTapUp = _handleTapUp
      ..onTap = _handleTap
      ..onTapCancel = _handleTapCancel;
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = _handleDragStart
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd
      ..dragStartBehavior = widget.dragStartBehavior;

    _positionController = AnimationController(
      duration: _kToggleDuration,
      value: widget.value ? 1.0 : 0.0,
      vsync: this,
    );
    position = CurvedAnimation(
      parent: _positionController,
      curve: Curves.linear,
    );
    _reactionController = AnimationController(
      duration: _kReactionDuration,
      vsync: this,
    );
    _reaction = CurvedAnimation(
      parent: _reactionController,
      curve: Curves.ease,
    );
  }

  @override
  void didUpdateWidget(CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    _drag.dragStartBehavior = widget.dragStartBehavior;

    if (needsPositionAnimation || oldWidget.value != widget.value)
      _resumePositionAnimation(isLinear: needsPositionAnimation);
  }

  // `isLinear` must be true if the position animation is trying to move the
  // thumb to the closest end after the most recent drag animation, so the curve
  // does not change when the controller's value is not 0 or 1.
  //
  // It can be set to false when it's an implicit animation triggered by
  // widget.value changes.
  void _resumePositionAnimation({ bool isLinear = true }) {
    needsPositionAnimation = false;
    // position
    //   ..curve = isLinear ? null : Curves.ease
    //   ..reverseCurve = isLinear ? null : Curves.ease.flipped;
    if (widget.value)
      _positionController.forward();
    else
      _positionController.reverse();
  }

  void _handleTapDown(TapDownDetails details) {
    if (isInteractive)
      needsPositionAnimation = false;
      _reactionController.forward();
  }

  void _handleTap() {
    if (isInteractive) {
      widget.onChanged!(!widget.value);
      _emitVibration();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (isInteractive) {
      needsPositionAnimation = false;
      _reactionController.reverse();
    }
  }

  void _handleTapCancel() {
    if (isInteractive)
      _reactionController.reverse();
  }

  void _handleDragStart(DragStartDetails details) {
    if (isInteractive) {
      needsPositionAnimation = false;
      _reactionController.forward();
      _emitVibration();
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (isInteractive) {
      // position
      //   ..curve = null
      //   ..reverseCurve = null;
      final double delta = details.primaryDelta! / _kTrackInnerLength;
      switch (Directionality.of(context)) {
        case TextDirection.rtl:
          _positionController.value -= delta;
          break;
        case TextDirection.ltr:
          _positionController.value += delta;
          break;
      }
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    // Deferring the animation to the next build phase.
    setState(() { needsPositionAnimation = true; });
    // Call onChanged when the user's intent to change value is clear.
    if (position!.value >= 0.5 != widget.value)
      widget.onChanged!(!widget.value);
    _reactionController.reverse();
  }

  void _emitVibration() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        HapticFeedback.lightImpact();
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (needsPositionAnimation)
      _resumePositionAnimation();
    return Opacity(
      opacity: widget.onChanged == null ? _kCupertinoSwitchDisabledOpacity : 1.0,
      child: _CustomSwitchRenderObjectWidget(
        value: widget.value,
        activeColor: widget.activeColor,
        trackColor: widget.trackColor,
        onChanged: widget.onChanged,
        textDirection: Directionality.of(context),
        state: this,
        trackWidth: widget.trackWidth,
        trackHeight: widget.trackHeight,
        switchWidth: widget.switchWidth,
        switchHeight: widget.switchHeight,
        inactiveThumbColor: widget.inactiveThumbColor,
        activeThumbColor: widget.activeThumbColor,
      ),
    );
  }

  @override
  void dispose() {
    _tap.dispose();
    _drag.dispose();

    _positionController.dispose();
    _reactionController.dispose();
    super.dispose();
  }
}

class _CustomSwitchRenderObjectWidget extends LeafRenderObjectWidget {
  const _CustomSwitchRenderObjectWidget({
    Key? key,
    this.value,
    this.activeColor,
    this.trackColor,
    this.onChanged,
    this.textDirection,
    this.state,
    this.trackWidth,
    this.trackHeight,
    this.switchWidth,
    this.switchHeight,
    this.inactiveThumbColor,
    this.activeThumbColor,
  }) : super(key: key);

  final bool? value;
  final Color? activeColor;
  final Color? trackColor;
  final ValueChanged<bool>? onChanged;
  final _CustomSwitchState? state;
  final TextDirection? textDirection;
  final double? trackWidth;
  final double? trackHeight;
  final double? switchWidth;
  final double? switchHeight;
  final Color? inactiveThumbColor;
  final Color? activeThumbColor;

  @override
  _RenderCustomSwitch createRenderObject(BuildContext context) {
    return _RenderCustomSwitch(
      value: value!,
      activeColor: activeColor!,
      trackColor: trackColor,
      onChanged: onChanged,
      textDirection: textDirection,
      state: state!,
      trackWidth: trackWidth,
      trackHeight: trackHeight,
      switchWidth: switchWidth,
      switchHeight: switchHeight,
      inactiveThumbColor: inactiveThumbColor,
      activeThumbColor: activeThumbColor,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderCustomSwitch renderObject) {
    renderObject
      ..value = value!
      ..activeColor = activeColor!
      ..trackColor = trackColor!
      ..onChanged = onChanged
      ..textDirection = textDirection!;
  }
}

//const double _kTrackWidth = 51.0;
//const double _kTrackHeight = 31.0;
//const double _kTrackRadius = _kTrackHeight / 2.0;
//const double _kTrackInnerStart = _kTrackHeight / 2.0;
//const double _kTrackInnerEnd = _kTrackWidth - _kTrackInnerStart;
//const double _kTrackInnerLength = _kTrackInnerEnd - _kTrackInnerStart;
//const double _kSwitchWidth = 59.0;
//const double _kSwitchHeight = 39.0;
// Opacity of a disabled switch, as eye-balled from iOS Simulator on Mac.
const double _kCupertinoSwitchDisabledOpacity = 0.5;

const Duration _kReactionDuration = Duration(milliseconds: 300);
const Duration _kToggleDuration = Duration(milliseconds: 200);

class _RenderCustomSwitch extends RenderConstrainedBox {
  _RenderCustomSwitch({
    required bool value,
    required Color activeColor,
    required Color? trackColor,
    ValueChanged<bool>? onChanged,
    required TextDirection? textDirection,
    required _CustomSwitchState state,
    double? trackWidth,
    double? trackHeight,
    double? switchWidth,
    double? switchHeight,
    this.inactiveThumbColor,
    this.activeThumbColor,
  }) : _value = value,
       _activeColor = activeColor,
       _trackColor = trackColor,
       _onChanged = onChanged,
       _textDirection = textDirection,
       _state = state,
      _kTrackWidth=trackWidth,
      _kTrackHeight=trackHeight,
      _kSwitchWidth=switchWidth,
      _kSwitchHeight=switchHeight,
       super(additionalConstraints: BoxConstraints.tightFor(width: switchWidth, height: switchHeight)) {
         state.position!.addListener(markNeedsPaint);
         state._reaction.addListener(markNeedsPaint);
  }
 double? _kTrackWidth = 51.0;
 double? _kTrackHeight = 31.0;
 double get _kTrackRadius => _kTrackHeight! / 2.0;
 double get _kTrackInnerStart => _kTrackHeight! / 2.0;
 double get _kTrackInnerEnd => _kTrackWidth! - _kTrackInnerStart;
 double get _kTrackInnerLength => _kTrackInnerEnd - _kTrackInnerStart;
 double? _kSwitchWidth = 59.0;
 double? _kSwitchHeight = 39.0;

  Color? inactiveThumbColor;
  Color? activeThumbColor;

  final _CustomSwitchState _state;

  bool get value => _value;
  bool _value;
  set value(bool value) {
    if (value == _value)
      return;
    _value = value;
    markNeedsSemanticsUpdate();
  }

  Color get activeColor => _activeColor;
  Color _activeColor;
  set activeColor(Color value) {
    if (value == _activeColor)
      return;
    _activeColor = value;
    markNeedsPaint();
  }

  Color get trackColor => _trackColor!;
  Color? _trackColor;
  set trackColor(Color value) {
    if (value == _trackColor)
      return;
    _trackColor = value;
    markNeedsPaint();
  }

  ValueChanged<bool>? get onChanged => _onChanged;
  ValueChanged<bool>? _onChanged;
  set onChanged(ValueChanged<bool>? value) {
    if (value == _onChanged)
      return;
    final bool wasInteractive = isInteractive;
    _onChanged = value;
    if (wasInteractive != isInteractive) {
      markNeedsPaint();
      markNeedsSemanticsUpdate();
    }
  }

  TextDirection get textDirection => _textDirection!;
  TextDirection? _textDirection;
  set textDirection(TextDirection value) {
    if (_textDirection == value)
      return;
    _textDirection = value;
    markNeedsPaint();
  }

  bool get isInteractive => onChanged != null;

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent && isInteractive) {
      _state._drag.addPointer(event);
      _state._tap.addPointer(event);
    }
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);

    if (isInteractive)
      config.onTap = _state._handleTap;

    config.isEnabled = isInteractive;
    config.isToggled = _value;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    final double currentValue = _state.position!.value;
    final double currentReactionValue = _state._reaction.value;

    late double visualPosition;
    switch (textDirection) {
      case TextDirection.rtl:
        visualPosition = 1.0 - currentValue;
        break;
      case TextDirection.ltr:
        visualPosition = currentValue;
        break;
    }

    final Paint paint = Paint()
      ..color = Color.lerp(trackColor, activeColor, currentValue)!;

    final Rect trackRect = Rect.fromLTWH(
        offset.dx + (size.width - _kTrackWidth!) / 2.0,
        offset.dy + (size.height - _kTrackHeight!) / 2.0,
        _kTrackWidth!,
        _kTrackHeight!,
    );
    final RRect trackRRect = RRect.fromRectAndRadius(trackRect, Radius.circular(_kTrackRadius));
    canvas.drawRRect(trackRRect, paint);

    final double currentThumbExtension = CustomThumbPainter.extension * currentReactionValue;
    final double thumbLeft = lerpDouble(
      trackRect.left + _kTrackInnerStart - CustomThumbPainter.radius,
      trackRect.left + _kTrackInnerEnd - CustomThumbPainter.radius - currentThumbExtension,
      visualPosition,
    )!;
    final double thumbRight = lerpDouble(
      trackRect.left + _kTrackInnerStart + CustomThumbPainter.radius + currentThumbExtension,
      trackRect.left + _kTrackInnerEnd + CustomThumbPainter.radius,
      visualPosition,
    )!;
    final double thumbCenterY = offset.dy + size.height / 2.0;
    final Rect thumbBounds = Rect.fromLTRB(
      thumbLeft,
      thumbCenterY - CustomThumbPainter.radius,
      thumbRight,
      thumbCenterY + CustomThumbPainter.radius,
    );

    context.pushClipRRect(needsCompositing, Offset.zero, thumbBounds, trackRRect, (PaintingContext innerContext, Offset offset) {
      const CustomThumbPainter.switchThumb().paint(innerContext.canvas,thumbBounds,inactiveThumbColor,activeThumbColor,currentValue);
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(FlagProperty('value', value: value, ifTrue: 'checked', ifFalse: 'unchecked', showName: true));
    description.add(FlagProperty('isInteractive', value: isInteractive, ifTrue: 'enabled', ifFalse: 'disabled', showName: true, defaultValue: true));
  }
}

const Color _kThumbBorderColor = Color(0x0A000000);

const List<BoxShadow> _kSwitchBoxShadows = <BoxShadow> [
  BoxShadow(
    color: Color(0x26000000),
    offset: Offset(0, 3),
    blurRadius: 8.0,
  ),
  BoxShadow(
    color: Color(0x0F000000),
    offset: Offset(0, 3),
    blurRadius: 1.0,
  ),
];
const List<BoxShadow> _kSliderBoxShadows = <BoxShadow> [
  BoxShadow(
    color: Color(0x26000000),
    offset: Offset(0, 3),
    blurRadius: 8.0,
  ),
  BoxShadow(
    color: Color(0x29000000),
    offset: Offset(0, 1),
    blurRadius: 1.0,
  ),
  BoxShadow(
    color: Color(0x1A000000),
    offset: Offset(0, 3),
    blurRadius: 1.0,
  ),
];


/// Paints an iOS-style slider thumb or switch thumb.
///
/// Used by [CupertinoSwitch] and [CupertinoSlider].
class CustomThumbPainter {
  /// Creates an object that paints an iOS-style slider thumb.
  const CustomThumbPainter({
    this.color = Colors.white,
    this.shadows = _kSliderBoxShadows,
  });

  /// Creates an object that paints an iOS-style switch thumb.
  const CustomThumbPainter.switchThumb({
    Color color = Colors.white,
    List<BoxShadow> shadows = _kSwitchBoxShadows,
  }) : this(color: color, shadows: shadows);

  /// The color of the interior of the thumb.
  final Color color;

  /// The list of [BoxShadow] to paint below the thumb.
  ///
  /// Must not be null.
  final List<BoxShadow> shadows;

  /// Half the default diameter of the thumb.
  static const double radius = 14.0;

  /// The default amount the thumb should be extended horizontally when pressed.
  static const double extension = 7.0;

  /// Paints the thumb onto the given canvas in the given rectangle.
  ///
  /// Consider using [radius] and [extension] when deciding how large a
  /// rectangle to use for the thumb.
  void paint(Canvas canvas, Rect rect,Color? inactiveThumbColor,Color? activeThumbColor, double currentValue) {
    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(rect.shortestSide / 2.0),
    );

    for (final BoxShadow shadow in shadows)
      canvas.drawRRect(rrect.shift(shadow.offset), shadow.toPaint());

    canvas.drawRRect(
      rrect.inflate(0.5),
      Paint()..color = _kThumbBorderColor,
    );
    canvas.drawRRect(rrect, Paint()..color = Color.lerp(inactiveThumbColor, activeThumbColor, currentValue)!);
  }
}
