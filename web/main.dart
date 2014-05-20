library bugeyedbettys;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular_ui/angular_ui.dart';

import 'package:bugeyedbettys/controller/carousel.dart';

void main() {
  applicationFactory()
    .addModule(new MainModule())
    .run();
}

class MainModule extends Module {
  
  MainModule() {
    install(new AngularUIModule());
    bind(CarouselController);
  }
  
}

