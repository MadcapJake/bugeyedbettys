part of bugeyedbettys;

@Controller(
    selector: '[specials]',
    publishAs: 'ctrl')
class SpecialsController {
  DateTime today;
  
  SpecialsController() {
    today = new DateTime.now();    
//    applyTodayStyle();
  }
  
//  void applyTodayStyle() {
//    _log.fine("Applying styling to today's specials");
//    Map<int, String> codeDay = {1: "monday", 2: "tuesday", 3: "wednesday", 
//                                4: "thursday", 5: "friday", 6: "saturday", 
//                                7: "sunday"};
//    for (Element column in querySelectorAll(".specials col")) {
//      if (column.className.contains(codeDay[today.weekday])) {
//        column.style.background = "#a9c8ff";
//      }
//    }
//  }
  
  bool todayis(String dayAbbrev) {
    _log.fine("Checking today's date");
    Map<String, int> dayCode = { "mon": 1,
                                 "tue": 2,
                                 "wed": 3,
                                 "thu": 4,
                                 "fri": 5,
                                 "sat": 6,
                                 "sun": 7};
    return today.weekday == dayCode[dayAbbrev];
  }
}