part of bugeyedbettys;

final _log = new Logger('carousel_component');

@Component(
    selector: 'carousel',
    visibility: Directive.CHILDREN_VISIBILITY, 
    templateUrl: 'packages/bugeyedbettys/component/carousel.html',
    cssUrl: 'packages/bugeyedbettys/component/carousel.css',
    publishAs: 'cmp')
class CarouselComponent extends ShadowRootAware{
  //// Variables
  
  //// - Input/Bindings
  
  String jsonUrl = "carousel_slides.json";
  
  UListElement htmlSlides;
  
//  Duration _slideInterval;
//  @NgOneWay('slide-interval')
//    set slideInterval(int s) { _slideInterval = new Duration(milliseconds: s); }
  int _slideInterval = 3500;
  
  //// - Processing
  
  static const String LOADING_MESSAGE = "Folding table tents...";
  static const String ERROR_MESSAGE = "Sorry! The table tents are not folding well...";
  
  String message = LOADING_MESSAGE;
  
  bool carouselLoaded = false;
  
//  static const TIMEOUT = const Duration(seconds: 3);
  static const ms = const Duration(milliseconds: 1);
    
  Timer slideTimer;
  
  //// - Output
  
  List<Map<String, String>> _slides;
  List<Map<String, String>> get slides => _slides;
  void set slides(var s) { 
    _slides = JSON.decode(s);
  }
  
  //// Constructor
  
  CarouselComponent() {
    _log.fine("CarouselComponent");
    getSlides(jsonUrl);
    slideTimer = startTimeout();
  }
  
  //// Functions
  
  void getSlides(String slidesUrl) {
    HttpRequest.getString(slidesUrl)
      .then(slides)
      .catchError((_) { message = ERROR_MESSAGE; });
  }
  
  void toggleSlide(bool left) {
    _log.fine("Toggling slides");
    LIElement visibleItem = htmlSlides.querySelector(".show");
    _log.fine(visibleItem);
    visibleItem.classes.remove("show");
    int direction = left == true ? -1 : 1;
    LIElement makeVisible = htmlSlides.querySelector("#" + (int.parse(visibleElem.id) + direction).toString());
    makeVisible.classes.add("show");
  }
  
  void nextSlide() {
    toggleSlide(false);
  }
  
  void prevSlide() {
    toggleSlide(true);
  }
  
  Timer startTimeout() {
    Duration d = new Duration(milliseconds: _slideInterval);
    return new Timer(d, handleTimeout);
  }
    
  void handleTimeout() {
    nextSlide();
  }
  
  void play() {
    slideTimer = startTimeout();
  }
  
  void pause() {
    slideTimer.cancel();
  }
  
  // ShadowRootAware Implementation
  @override
  void onShadowRoot(ShadowRoot shadowRoot) {
    htmlSlides = shadowRoot.querySelector('.carousel'); 
  }
}


