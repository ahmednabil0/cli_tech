import 'package:flutter/material.dart';

navigate({required context, required String route, dynamic args}) {
  Navigator.of(context).pushNamed(
    route,
    arguments: args,
  );
}

navigateReplace({required context, required String route, dynamic args}) {
  Navigator.of(context).pushReplacementNamed(
    route,
    arguments: args,
  );
}

navigateReplaceAll({required context, required String route, dynamic args}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    route,
    (route) => true,
    arguments: args,
  );
}

navigatePop({required context}) {
  Navigator.of(context).pop();
}
