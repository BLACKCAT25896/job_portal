import 'dart:async';
import 'package:ecommerce/common/widget/custom_button.dart';
import 'package:ecommerce/common/widget/custom_snackbar.dart';
import 'package:ecommerce/feature/pos/logic/pos_controller.dart';
import 'package:ecommerce/feature/pos/presentation/widgets/invoice_dialog_widget.dart';
import 'package:ecommerce/helper/app_color_helper.dart';
import 'package:ecommerce/localization/localization_controller.dart';
import 'package:ecommerce/util/dimensions.dart';
import 'package:ecommerce/util/styles.dart';
import 'package:esc_pos_printer_plus/esc_pos_printer_plus.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:screenshot/screenshot.dart';

    class InVoicePrintScreen extends StatefulWidget {
      const InVoicePrintScreen({super.key,});

      @override
      State<InVoicePrintScreen> createState() => _InVoicePrintScreenState();
    }

    class _InVoicePrintScreenState extends State<InVoicePrintScreen> {
      bool connected = false;
      List<BluetoothInfo>? availableBluetoothDevices;
      bool _isLoading = false;
      final List<int> _paperSizeList = [80, 58];
      int _selectedSize = 58;
      ScreenshotController screenshotController = ScreenshotController();
      String? _warningMessage;
      bool _printLoading = false;

      Future<void> getBluetooth() async {
        setState(() {
          _isLoading = true;
        });

        final List<BluetoothInfo> bluetoothDevices = await PrintBluetoothThermal.pairedBluetooths;
        if (kDebugMode) {
          print("Bluetooth list: $bluetoothDevices");
        }
        connected = await PrintBluetoothThermal.connectionStatus;

        if (!connected) {
          _warningMessage = null;
          Get.find<PosController>().setBluetoothMacAddress('');
        } else {
          _warningMessage = 'please_enable_your_location_and_bluetooth_in_your_system'.tr;
        }

        setState(() {
          availableBluetoothDevices = bluetoothDevices;
          _isLoading = false;
        });
      }

      Future<void> setConnect(String mac) async {
        final bool result = await PrintBluetoothThermal.connect(macPrinterAddress: mac);

        if (result) {
          setState(() {
            connected = true;
          });
        }
      }

      @override
      void initState() {
        super.initState();
        getBluetooth();
      }

      @override
      void dispose() {
        super.dispose();
      }

      Future<void> _printReceipt(Uint8List screenshot) async {
        bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
        if (connectionStatus) {
          List<int> ticket = await testTicket(screenshot);
          final result = await PrintBluetoothThermal.writeBytes(ticket);
          if (kDebugMode) {
            print("print result: $result");
          }
        } else {
          showCustomSnackBar('no_thermal_printer_connected'.tr);
        }
        setState(() {
          _printLoading = false;
        });
      }

      Future<List<int>> testTicket(Uint8List screenshot) async {
        List<int> bytes = [];
        final img.Image? image = img.decodeImage(screenshot);
        img.Image resized = img.copyResize(image!, width: _selectedSize == 80 ? 500 : 365);
        final profile = await CapabilityProfile.load();
        final generator = Generator(_selectedSize == 80 ? PaperSize.mm80 : PaperSize.mm58, profile);

        // Using `ESC *`
        bytes += generator.image(resized);

        bytes += generator.feed(2);
        bytes += generator.cut();
        return bytes;
      }

      Future<void> _printUsbReceipt(Uint8List screenshot) async {
        final profile = await CapabilityProfile.load();
        final printer = NetworkPrinter(PaperSize.mm80, profile);

        final res = await printer.connect('192.168.0.100', port: 9100);
        if (res == PosPrintResult.success) {
          final img.Image? image = img.decodeImage(screenshot);
          img.Image resized = img.copyResize(image!, width: 500);
          printer.image(resized);
          printer.feed(2);
          printer.cut();
          printer.disconnect();
        } else {
          showCustomSnackBar('no_usb_printer_connected'.tr);
        }
      }

      @override
      Widget build(BuildContext context) {
        return Column(children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,
                vertical: Dimensions.paddingSizeDefault),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(children: [
                      Text('paired_bluetooth'.tr, style: textMedium.copyWith(
                          fontSize: Dimensions.fontSizeLarge)),
                      const SizedBox(width: Dimensions.paddingSizeSmall),
                      SizedBox(height: 20, width: 20, child: _isLoading ?

                      CircularProgressIndicator(
                          color: systemPrimaryColor()) :
                      InkWell(onTap: () => getBluetooth(),
                        child: Icon(Icons.refresh, color: systemPrimaryColor()),),),
                    ]),

                  SizedBox(width: 100,
                    child: DropdownButton<int>(hint: Text('select'.tr), value: _selectedSize,
                      items: _paperSizeList.map((int? value) {
                        return DropdownMenuItem<int>(value: value, child: Text('$value''mm'));
                      }).toList(),
                      onChanged: (int? value) {setState(() {
                          _selectedSize = value!;
                        });},
                      isExpanded: true,
                      underline: const SizedBox())),
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: Column(children: [
                availableBluetoothDevices != null && (availableBluetoothDevices?.length ?? 0) > 0
                    ? ListView.builder(
                  itemCount: availableBluetoothDevices?.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GetBuilder<PosController>(builder: (orderController) {
                      bool isConnected = connected && availableBluetoothDevices![index].macAdress == orderController.getBluetoothMacAddress();

                      return Stack(children: [
                        ListTile(selected: isConnected,
                          onTap: () {
                          if (availableBluetoothDevices?[index].macAdress.isNotEmpty ?? false) {
                            if (!connected) {
                              orderController.setBluetoothMacAddress(availableBluetoothDevices?[index].macAdress);
                            }
                            setConnect(availableBluetoothDevices?[index].macAdress ?? '');
                          }},
                          title: Text(availableBluetoothDevices?[index].name ?? ''),
                          subtitle: Text(isConnected ? 'connected'.tr : "click_to_connect".tr,
                            style: textRegular.copyWith(color: isConnected ? null :
                            systemPrimaryColor()),
                          )),
                        if (availableBluetoothDevices?[index].macAdress == orderController.getBluetoothMacAddress())
                          Positioned.fill(child: Align(
                            alignment: Get.find<LocalizationController>().isLtr ?
                            Alignment.centerRight : Alignment.centerLeft,
                            child: Padding(padding: const EdgeInsets.symmetric(
                              vertical: Dimensions.paddingSizeExtraSmall,
                              horizontal: Dimensions.paddingSizeLarge),
                              child: Icon(Icons.check_circle_outline_outlined,
                                color: systemPrimaryColor())),
                          )),
                      ]);
                    });
                    }) :
                Padding(padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeSmall),
                  child: Text(_warningMessage ?? '',
                    style: textRegular.copyWith(color: Colors.redAccent))),

                InvoiceDialogWidget(screenshotController: screenshotController),
              ]))),

            CustomButton(text: _printLoading ? 'printing'.tr : 'print_invoice'.tr,
              height: 40, onTap: _printLoading ? null : () {
              setState(() {
                _printLoading = true;
              });
              screenshotController.capture(delay:
              const Duration(milliseconds: 10)).then((Uint8List? capturedImage) {
                if (kDebugMode) {
                  print('its calling :  $capturedImage');
                }
                _printReceipt(capturedImage!);
                _printUsbReceipt(capturedImage);
              }).catchError((onError) {
                if (kDebugMode) {
                  print(onError);
                }
              });
              },
            ),
          ],
        );
      }
    }