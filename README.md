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
6. In Daily tab, you can check the existence of schedules per each day.
7. In Weekly and Daily tab, you can check the details schedule.
3. The internal database is implemented by Realm.

### Contact: jinious1111@hanyang.ac.kr
