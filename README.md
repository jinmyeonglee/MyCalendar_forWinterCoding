# MyCalendar_iOS
### JinMyeongLee, Hanyang Univ. CSE

## How to Use
1. git clone or download "MyCalendar" repository
2. pod install
3. click "MyCalendar.xcworkspace"
4. Build and Run

## Details
1. delay launch screen
In AppDelegate.swift, func application
``` swift
Thread.sleep(forTimeInterval: 1.3)
```
2. There are 3 tab (Monthly, Weekly, Daily)
3. In Monthly and Weekly tab, you can move previous or next scope using swiping the calendar.
4. In Daily tab, you can move previous or next day using two arrow image buttons.
5. You can keep your last tab using UserDefaults, in AppDelegate.swift.
``` swift
if let tabBarController = self.window!.rootViewController as? UITabBarController {
    tabBarController.selectedIndex = UserDefaults.standard.integer(forKey: "tabIndex")
}
```
6. In Daily tab, you can check the existence of schedules per each day.
7. In Weekly and Daily tab, you can check the details schedule.
8. The internal database is implemented by Realm.
9. Wil be loaded by today' date
10. You can register a new schedule with datePicker using "Add" button in Monthly, Weekly, Daily tab.

### Contact
jinious1111@hanyang.ac.kr
