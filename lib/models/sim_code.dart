import 'package:flutter/foundation.dart';

class SimCode {
  final String id;
  final String serviceName;
  final String serviceCode;
  SimCode({
    @required this.id,
    @required this.serviceName,
    @required this.serviceCode,
  });
}

class Services {
  final String name;
  final String image;
  final String id;
  Services({
    @required this.name,
    @required this.image,
    @required this.id,
  });
}
