import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrplatform/app/config/localStore/dataStorage.dart';
import 'package:hrplatform/app/config/widgets/alert_dialog.dart';
import 'package:hrplatform/app/config/widgets/waiting_process.dart';
import 'package:hrplatform/app/routes/app_pages.dart';

import 'package:unique_identifier/unique_identifier.dart';


class MainServices extends GetxService {


  static void dialogInternetChecker() {
    Waiting.hide();
    return DialogHelper.showWarningDialog(
        message:
            'There is a problem with your internet connection. Please check and try again'
                .tr);
  }

  static getDeviceInfo() async {
    final deviceID = await getDeviceID();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final resultDevice = await deviceInfo.iosInfo;
      return DeviceInfoData(
        identifierForVendor: deviceID,
        name: resultDevice.name,
        utsname: Utsname(
          nodename: resultDevice.name,
          sysname: 'IOS',
        ),
      );
    } else if (Platform.isAndroid) {
      final resultDevice = await deviceInfo.androidInfo;
      return DeviceInfoData(
        identifierForVendor: deviceID,
        name: resultDevice.device,
        utsname: Utsname(
          nodename: resultDevice.display,
          sysname: 'Android',
        ),
      );
    }
  }
    static void errorHandler() {
    //Get.to(() => const ApiFalseView());
  }

  static Future<String?> getDeviceID() async {
    String identifier;
    try {
      identifier = (await UniqueIdentifier.serial)!;
    } on PlatformException {
      identifier = 'null data';
    }
    return identifier;
  }
}

void forceLogOut() {
  Storage.removeToken();
  Get.offAllNamed(Routes.AUTH);
}

class DeviceInfoData {
  String? systemName;
  String? isPhysicalDevice;
  Utsname? utsname;
  String? model;
  String? localizedModel;
  String? systemVersion;
  String? name;
  String? identifierForVendor;

  DeviceInfoData(
      {this.systemName,
      this.isPhysicalDevice,
      this.utsname,
      this.model,
      this.localizedModel,
      this.systemVersion,
      this.name,
      this.identifierForVendor});

  DeviceInfoData.fromJson(Map<String, dynamic> json) {
    systemName = json['systemName'];
    isPhysicalDevice = json['isPhysicalDevice'];
    utsname =
        json['utsname'] != null ? Utsname.fromJson(json['utsname']) : null;
    model = json['model'];
    localizedModel = json['localizedModel'];
    systemVersion = json['systemVersion'];
    name = json['name'];
    identifierForVendor = json['identifierForVendor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['systemName'] = systemName;
    data['isPhysicalDevice'] = isPhysicalDevice;
    if (utsname != null) {
      data['utsname'] = utsname!.toJson();
    }
    data['model'] = model;
    data['localizedModel'] = localizedModel;
    data['systemVersion'] = systemVersion;
    data['name'] = name;
    data['identifierForVendor'] = identifierForVendor;
    return data;
  }
}

class Utsname {
  String? release;
  String? sysname;
  String? nodename;
  String? machine;
  String? version;

  Utsname(
      {this.release, this.sysname, this.nodename, this.machine, this.version});

  Utsname.fromJson(Map<String, dynamic> json) {
    release = json['release'];
    sysname = json['sysname'];
    nodename = json['nodename'];
    machine = json['machine'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['release'] = release;
    data['sysname'] = sysname;
    data['nodename'] = nodename;
    data['machine'] = machine;
    data['version'] = version;
    return data;
  }
}
