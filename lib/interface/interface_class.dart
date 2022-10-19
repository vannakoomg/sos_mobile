import 'package:flutter/material.dart';
import 'package:get/get.dart';

class A {
  subA() {}
}

class B {
  subB() {}
}

class ImplementsA extends GetxController implements A {
  @override
  subA() {
    debugPrint("hello world");
  }
}

class C implements A, B {
  @override
  subA() {}
  @override
  subB() {}
}
