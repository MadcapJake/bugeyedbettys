library bugeyedbettys.carousel_controller;

import 'package:angular/angular.dart';
import 'dart:html';
import 'dart:convert';

@Controller(
    selector: '[main-carousel]',
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
  
  void processString(String jsonString) {
      slides = JSON.decode(jsonString);
  }
}
