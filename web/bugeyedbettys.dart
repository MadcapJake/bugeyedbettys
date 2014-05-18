import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angular_ui/angular_ui.dart';
import 'dart:convert';

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

@Controller(
    selector: '[ng-controller=main-carousel]',
    publishAs: 'ctrl')
class CarouselController {
  
  List<Map<String, dynamic>> slides = [];
  
  CarouselController() {
    
    makeSlideRequest();
    
  }
  
  void makeSlideRequest() {
    var url = "../lib/carousel_slides.json";
    HttpRequest.getString(url)
      .then(processString);
//      .catchError(handleError);
    
  }
  
  void processString(String jsonString) =>
      slides = JSON.decode(jsonString);
  
}