part of bugeyedbettys;

final _log = new Logger('carousel_component');

@Controller(
    selector: '[carousel]',
    publishAs: 'ctrl')
class CarouselController {
  
  // Variables
  
  String jsonUrl = "carousel_slides.json";
  
  int _slideInterval = 3500;
  
  String enabled = "show";
  
  // Carousel Processing
  
  static const TIMEOUT = const Duration(seconds: 3);
  static const ms = const Duration(milliseconds: 1);
  
  Timer slideTimer;
  
  // Query Processing
  
  static const String LOADING_MESSAGE = "Folding table tents...";
  static const String ERROR_MESSAGE = "Sorry! The table tents are not folding well...";
  
  String message = LOADING_MESSAGE;
  bool loading = true;
  bool loaded = false;
  
  // Query Return
  
  List<Map<String, String>> _slides;
  List<Map<String, String>> get slides => _slides;
  void set slides(var s) { 
    _slides = JSON.decode(s);
    _log.fine("JSON decoded and slides set");
    _log.fine(s.toString());
  }
  
  //// Functions
  
  // Constructor
  
  CarouselController() {
    _log.fine("CarouselController initializing...");
    makeSlideRequest();
    slideTimer = startTimeout();
  }
  
//// Query Function
  
  void makeSlideRequest() {
    var url = "carousel_slides.json";
    _log.fine("Getting slides...");
    HttpRequest.getString(url)
      .then((slds) {
        slides = slds;
        _log.fine("Slides set");
        loading = false;
        loaded = true;
      })
      .catchError((_) {
        message = ERROR_MESSAGE; 
        loading = false;
        loaded = false;
      });
  }
  
//// Carousel Functions
  
  void toggleSlide(bool left) {
      _log.fine("-Toggling slides...");
      LIElement visibleItem = querySelector(".show");
      _log.fine("-visibleItem nodeName is: " + visibleItem.nodeName);
      visibleItem.classes.remove("show");
      visibleItem.hidden = true;
      _log.fine("-visibleItem's classes after removal: " + visibleItem.className);
      
      int direction = left == true ? -1 : 1;
      LIElement makeVisible = 
          querySelector( idRotate(visibleItem.id, direction) );
      _log.fine("-makeVisible's nodeName is: " + makeVisible.nodeName);
      makeVisible.classes.add("show");
      makeVisible.hidden = false;
    }
  
  String idRotate(String id, int direction) {
    _log.fine("--Rotating id number...");
    _log.fine("--String id param is: " + id);
    int idNum = int.parse( id.substring(5) );
    _log.fine("--Current idNum is: " + idNum.toString());
    int nextNum = idNum + direction;
    if (nextNum > slides.length) {
      return "#slide1";
    } else if (nextNum < 1) {
      return "#slide" + slides.length.toString();
    } else {
      return "#slide" + nextNum.toString();
    }
  }
  
  void nextslide() {
    toggleSlide(false);
  }
  
  void prevslide() {
    toggleSlide(true);
  }
  
  Timer startTimeout() {
    Duration d = new Duration(milliseconds: _slideInterval);
    return new Timer(d, handleTimeout);
  }
    
  void handleTimeout() {
    nextslide();
  }
  
  void playslides() {
    slideTimer = startTimeout();
  }
  
  void pauseslides() {
    slideTimer.cancel();
  }
  
  bool isfirstslide(slide) => slides.indexOf(slide) == 0;
}
