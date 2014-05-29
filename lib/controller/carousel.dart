library carousel_controller;

import 'package:angular/angular.dart';
import 'dart:html';
import 'dart:convert';
import 'dart:async';

@Controller(
    selector: '[carousel]',
    publishAs: 'ctrl')
class CarouselController {
  
  // Variables
  
  // Carousel Processing
  
  const TIMEOUT = const Duration(seconds: 3);
  const ms = const Duration(milliseconds: 1);
  
  Timer nextSlide;
  
  // Query Processing
  
  static const String LOADING_MESSAGE = "Folding table tents...";
  static const String ERROR_MESSAGE = "Sorry! The table tents are not folding well...";
  
  final Http _http;
  
  String message = LOADING_MESSAGE;
  bool carouselLoaded = false;
  
  // Query Return
  
  List<Map<String, String>> carouselSlides;
  
  // Functions
  
  // Constructor
  
  CarouselController() {
    String url = "carousel_slides.json";
    _http.get(url)
      .then(processString);
    
    nextSlide = startTimeout();
    
  }
  
  // Query Function
  
  void makeSlideRequest() {
    var url = 
    HttpRequest.getString(url)
      .then(processString);
//      .catchError(handleError);
    
  }
  
  void processString(String jsonString) {
      carouselSlides = JSON.decode(jsonString);
  }
  
  // Carousel Functions
  
  Timer startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? TIMEOUT : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }
  
  void handleTimeout() {
    showNext();
  }
    
}
