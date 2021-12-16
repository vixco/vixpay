import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:yollet/UI/template.dart';
import 'package:yollet/Util/localization/localizations.dart';
import 'package:yollet/themeStyle.dart';

class QRViewPage extends StatefulWidget {
  final Color? cornerColor;
  final Widget? scanWidget;
  final Size? screenCamSize;
  final Size? positionCam;
  final Function(String)? afterScan;
  final Widget? bottomContent;
  final String? noPermissionMessage;
  final String? scanMessage;
  final String? ratioErrMessage;

  QRViewPage(
      {Key? key,
      this.cornerColor,
      this.scanWidget,
      this.screenCamSize,
      this.positionCam,
      this.afterScan,
      this.bottomContent,
      this.noPermissionMessage,
      this.scanMessage,
      this.ratioErrMessage})
      : super(key: key);

  @override
  _QRViewPageState createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  GlobalKey<QrcodeReaderViewState> _key = GlobalKey();

//Exit button for AppBar to close the QR Camera
  Widget exitButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.h, right: 24.w),
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5.w,
          color: ThemeColors.gray_200,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        child:
            Icon(YolletIcons.close, size: 17, color: ThemeColors.white,),

        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: QrcodeReaderView(
        key: _key,
        onScan: onScan,
        headerWidget: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 64.h,
          actions: [exitButton(context)],
        ),
        cornerColor: widget.cornerColor ?? Colors.white,
        scanBoxRatio: 0.70,

        noCameraPermissionMessage: widget.noPermissionMessage,
        scanInfoMessage: widget.scanMessage ??
            AppLocalizations.of(context)!.getString('qr_scan'),
        ratioSuggestErrorMessage: widget.ratioErrMessage,
        //scanBoxRatio:1,
        // scanWidget: Center(
        //   child: Container(
        //     // padding: EdgeInsets.all(),
        //     decoration: BoxDecoration(
        //       // color: Colors.red,
        //       border: Border.all(width: 5.0, color: Colors.green, style: BorderStyle.solid),
        //     ),
        //     width: MediaQuery.of(context).size.width * (0.9),
        //     height: MediaQuery.of(context).size.width * (0.9),
        //   ),
        // ),
      ),
    );
  }

  Future onScan(String data) async {
    if (widget.afterScan != null) {
      widget.afterScan!(data);
    } else {
      Navigator.of(context).pop(data);
    }
  }
}

class QrcodeReaderView extends StatefulWidget {
  final Future Function(String) onScan;
  final Widget? headerWidget;
  final double scanBoxRatio;
  final Color? boxLineColor;
  final Widget? helpWidget;
  final Color? cornerColor;
  final Widget? scanWidget;
  final Size? screenCamSize;
  final Size? positionCam;
  final Size? closePositionButton;
  final Widget? bottomContent;
  final String? noCameraPermissionMessage;
  final String? ratioSuggestErrorMessage;
  final String? scanInfoMessage;

  QrcodeReaderView(
      {Key? key,
      required this.onScan,
      this.headerWidget,
      this.boxLineColor = Colors.cyanAccent,
      this.helpWidget,
      this.scanBoxRatio = 0.80,
      this.cornerColor,
      this.scanWidget,
      this.screenCamSize,
      this.positionCam,
      this.closePositionButton,
      this.bottomContent,
      this.noCameraPermissionMessage,
      this.ratioSuggestErrorMessage,
      this.scanInfoMessage})
      : super(key: key);

  @override
  QrcodeReaderViewState createState() => QrcodeReaderViewState();
}

/// Follow-up operations after scanning the code
/// ```dart
/// GlobalKey<QrcodeReaderViewState> qrViewKey = GlobalKey();
/// qrViewKey.currentState.startScan();
/// ```
class QrcodeReaderViewState extends State<QrcodeReaderView> {
  late bool openFlashlight;
  late bool backCamera;
  bool hasCameraPermission = false;
  bool hasGalleryPermission = false;

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    openFlashlight = false;
    backCamera = false;

    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await setPermissionOfCamera();
    });
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // var scanArea = (MediaQuery.of(context).size.width < 400.w ||
    //     MediaQuery.of(context).size.height < 400.h)
    //     ? 150.0
    //     : 300.0;
    var scanArea = MediaQuery.of(context).size.height;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.transparent,
        borderRadius: 10.r,

        // borderLength: 30,
        // borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((Barcode scanData) {
      if (scanData != null &&
          scanData.code != null &&
          scanData.code.isNotEmpty) {
        Future.delayed(Duration.zero, () async {
          debugPrint("Scan :[${scanData.format.formatName}] ${scanData.code}");
          await this.controller?.pauseCamera();
          if (result == null) {
            result = scanData;
            widget.onScan(scanData.code);
            // Navigator.of(context).pop(scanData.code);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> setPermissionOfCamera() async {
    final cameraPermission = await Permission.camera.isGranted;
    var isCameraOk = !cameraPermission ? await getPermissionOfCamera() : true;

    if (isCameraOk) {
      setState(() {
        hasCameraPermission = true;
      });
    } else {
      Navigator.of(context).pop('Sem permissões para acessar a câmera');
    }
  }

  Future<bool> getPermissionOfCamera() async {
    var status = await Permission.camera.request();
    return status == PermissionStatus.granted;
  }

  Future<bool> getPermissionOfGallery() async {
    var status = await Permission.storage.request();
    return status == PermissionStatus.granted;
  }

  Future<bool> setFlashlight() async {
    // openFlashlight = await _controller.setFlashlight();
    await controller?.toggleFlash();
    setState(() {});

    return openFlashlight;
  }

  Future<bool> setFlipCamera() async {
    await controller?.flipCamera();

    if (openFlashlight) {
      await controller?.toggleFlash();
    }

    // print(
    //     "------------------------Back Camera is $backCamera -------------------------");
    // print(
    //     "------------------------Flashlight is $openFlashlight -------------------------");
    setState(() {});
    return backCamera;
  }

  Widget flashOpen(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 2),
      ),
      child: Icon(
        YolletIcons.flash_on,
        size: 32,
        color: ThemeColors.white.withOpacity(0.9),
      ),
    );
  }

  Widget flashClose(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 2),
      ),
      child: Icon(
        YolletIcons.flash_off,
        size: 32,
        color: ThemeColors.white.withOpacity(0.9),
      ),
    );
  }

  Widget cameraFlip(BuildContext context) {
    return Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width / 2),
        ),
        child: Icon(
          Icons.swap_horiz_rounded,
          size: 32,
          color: ThemeColors.white.withOpacity(0.9),
        ),
        // Image.asset(
        //   "assets/icon/icon_switch.png",
        //   // package: "super_qr_reader",
        //   width: 32,
        //   height: 32,
        //   color: ThemeColors.white.withOpacity(0.9),
        // ),
        );
  }

  // final flashClose = Image.asset(
  //   "assets/icon/carbon_flash-off-filled.png",
  //   // package: "super_qr_reader",
  //   width: 35,
  //   height: 35,
  //   color: Colors.white,
  // );

  @override
  Widget build(BuildContext context) {
    return !hasCameraPermission
        ? Material(
            color: Colors.black,
            child: Container(
              color: Colors.black,
            ),
          )
        : Material(
            color: Colors.black,
            child: LayoutBuilder(builder: (context, constraints) {
              final qrScanSize = constraints.maxWidth * widget.scanBoxRatio;
              final mediaQuery = MediaQuery.of(context);
              if (constraints.maxHeight < qrScanSize * 1.5) {
                print(widget.ratioSuggestErrorMessage);
              }
              return Stack(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: constraints.maxWidth * 0.7,
                      height: constraints.maxWidth * 0.7,
                      child: _buildQrView(context),
                    ),
                  ),
                  widget.headerWidget ?? SizedBox(),
                  widget.scanWidget ??
                      Positioned(
                        left: (constraints.maxWidth - qrScanSize) / 2,
                        top: (constraints.maxHeight - qrScanSize) / 2,
                        child: CustomPaint(
                          painter: QrScanBoxPainter(
                            boxLineColor: widget.boxLineColor,
                            cornerColor: widget.cornerColor,
                          ),
                          child: SizedBox(
                            width: qrScanSize,
                            height: qrScanSize,
                          ),
                        ),
                      ),
                  Positioned(
                    top: (constraints.maxHeight - qrScanSize) * (1 / 2) +
                        qrScanSize +
                        24,
                    width: constraints.maxWidth,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 40.h,
                          ),
                          child: SizedText(
                            text: AppLocalizations.of(context)!
                                .getString('scan_qr_code'),
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 36.h,
                            horizontal: 36.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: setFlashlight,
                                  child: FutureBuilder(
                                    future: controller?.getFlashStatus(),
                                    builder: (context, snapshot) {
                                      bool on =
                                          (snapshot.data ?? false) as bool;
                                      openFlashlight = on;
                                      if (!backCamera) {
                                        return flashClose(context);
                                      }
                                      return openFlashlight
                                          ? flashOpen(context)
                                          : flashClose(context);
                                    },
                                  )),
                              GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setFlipCamera();
                                  },
                                  child: FutureBuilder(
                                    future: controller?.getCameraInfo(),
                                    builder: (context, snapshot) {
                                      bool back = snapshot.data.toString() ==
                                              "CameraFacing.back"
                                          ? true
                                          : false;
                                      backCamera = back;

                                      return cameraFlip(context);
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Material(
      color: !hasCameraPermission ? Colors.black : null,
      child: !hasCameraPermission
          ? Container(
        color: Colors.black,
      )
          : LayoutBuilder(
        builder: (context, constraints) {
          final qrScanSize =
              constraints.maxWidth * (widget.scanBoxRatio ?? 1);
          // final mediaQuery = MediaQuery.of(context);
          if (constraints.maxHeight < qrScanSize * 1.5) {
            debugPrint(
              'It is recommended that the height to scan area height ratio be greater than 1.5',
            );
          }
          return Stack(
            children: <Widget>[
              //ImagePreview
              Positioned(
                left: widget.positionCam?.width ??
                    (constraints.maxWidth - qrScanSize) / 2,
                top: widget.positionCam?.height ??
                    (constraints.maxHeight - qrScanSize) / 2,
                child: SizedBox(
                  width: widget.screenCamSize?.width ??
                      constraints.maxWidth * 0.84,
                  height: widget.screenCamSize?.height ??
                      constraints.maxWidth * 0.84,
                  child: _buildQrView(context),
                ),
              ),
              widget.headerWidget ?? SizedBox(),
              //Mask Position
              //
              widget.scanWidget ??
                  Positioned(
                    left: (constraints.maxWidth - qrScanSize) / 2,
                    top: (constraints.maxHeight - qrScanSize) / 2,
                    child: CustomPaint(
                      painter: QrScanBoxPainter(
                        boxLineColor: widget.boxLineColor ?? Colors.red,
                        cornerColor: widget.cornerColor ?? Colors.green,
                      ),
                      child: SizedBox(
                        width: qrScanSize,
                        height: qrScanSize,
                      ),
                    ),
                  ),

              Positioned(
                top: (constraints.maxHeight - qrScanSize) * (1 / 2) +
                    qrScanSize +
                    24,
                width: constraints.maxWidth,
                child: Align(
                  alignment: Alignment.center,
                  child: widget.bottomContent,
                ),
              ),

              Positioned(
                top: widget.closePositionButton?.height ??
                    MediaQuery.of(context).size.width * .1,
                left: widget.closePositionButton?.width ??
                    MediaQuery.of(context).size.width * .085,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: const Color(0xff969696),
                  ),
                ),
              ),

              Positioned(
                top: widget.closePositionButton?.height ??
                    MediaQuery.of(context).size.width * .1,
                right: widget.closePositionButton?.width ??
                    MediaQuery.of(context).size.width * .085,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: setFlashlight,
                  child:
                  FutureBuilder(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                      bool on = (snapshot.data ?? false) as bool;
                      openFlashlight = on;
                      return Icon(
                        on
                            ? Icons.wb_sunny_outlined
                            : Icons.wb_sunny,
                        color: const Color(0xff969696),
                      );
                    },
                  )

                  ,
                ),
              ),
            ],
          );
        },
      ),
    );
  }*/
}

class QrScanBoxPainter extends CustomPainter {
  final double animationValue;
  final bool isForward;
  final Color? boxLineColor;
  final Color? cornerColor;

  QrScanBoxPainter({
    this.cornerColor,
    this.animationValue = 0,
    this.isForward = false,
    this.boxLineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final borderRadius = BorderRadius.all(Radius.circular(12)).toRRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
    canvas.drawRRect(
      borderRadius,
      Paint()
        ..color = Colors.transparent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10.w,
    );
    final borderPaint = Paint()
      ..color = cornerColor ?? Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9.w;
    final path = Path();

    // leftTop
    path.moveTo(0, 50);
    path.lineTo(0, 12);
    path.quadraticBezierTo(0, 0, 12, 0);
    path.lineTo(50, 0);
    // rightTop
    path.moveTo(size.width - 50, 0);
    path.lineTo(size.width - 12, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 12);
    path.lineTo(size.width, 50);
    // rightBottom
    path.moveTo(size.width, size.height - 50);
    path.lineTo(size.width, size.height - 12);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 12, size.height);
    path.lineTo(size.width - 50, size.height);
    // leftBottom
    path.moveTo(50, size.height);
    path.lineTo(12, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 12);
    path.lineTo(0, size.height - 50);

    canvas.drawPath(path, borderPaint);

    canvas.clipRRect(
        BorderRadius.all(Radius.circular(12)).toRRect(Offset.zero & size));
  }

  @override
  bool shouldRepaint(QrScanBoxPainter oldDelegate) =>
      animationValue != oldDelegate.animationValue;

  @override
  bool shouldRebuildSemantics(QrScanBoxPainter oldDelegate) =>
      animationValue != oldDelegate.animationValue;
}
