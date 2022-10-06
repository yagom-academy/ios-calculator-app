# 계산기 README
프로젝트 기간: 2022/09/19 ~ 2022/09/30(2주) <br>
팀원: [rhovin](https://github.com/yuvinrho) / 리뷰어: [라자냐](https://github.com/wonhee009)


## 🪧 목차
- [프로젝트 소개](#프로젝트-소개)
- [개발환경](#개발환경)
- [타임라인](#타임라인)
- [프로젝트 구조](#UML)
- [실행 화면](#실행-화면)
- [트러블 슈팅](#트러블-슈팅)
- [레퍼런스](#레퍼런스)

## 💻 프로젝트 소개
계산기 앱

## 🛠 개발환경
[![swift](https://img.shields.io/badge/swift-5.7-orange)]() [![xcode](https://img.shields.io/badge/Xcode-14.0-blue)]()

## 📆 타임라인
- 1주차 : 계산기 관련 타입정의
    - CalculatorItemQeueue 정의
    - Operator 정의
    - Formula 정의
    - ExpressionParser 정의
    - CalculatorError 정의
    - 구현한 타입 테스트 진행

- 2주차 : 계산기UI 연동
    - NumberKeypad 정의
    - 계산기 버튼 입력에 따른 메소드 정의
    - 계산기 히스토리 구현
    - 계산기 숫자 포맷설정
 
## 🏗 프로젝트 구조
### 1. 디렉토리 구조
```
 ├── AppDelegate.swift
 ├── Controllers
 │   └── CalculatorViewController.swift
 ├── Enums
 │   ├── CalculatorError.swift
 │   ├── ExpressionParser.swift
 │   ├── NumericKeypad.swift
 │   └── Operator+CalculateItem.swift
 ├── Extensions
 │   ├── Double+CalculateItem.swift
 │   ├── String+Extension.swift
 │   └── UIStrollView+Extension.swift
 ├── Info.plist
 ├── Models
 │   ├── Calculator.swift
 │   ├── CalculatorItemQueue.swift
 │   └── Formula.swift
 ├── Protocols
 │   └── CalculateItem.swift
 ├── Resource
 │   ├── Assets.xcassets
 │   │   ├── AccentColor.colorset
 │   │   ├── AppIcon.appiconset
 │   │   └── Contents.json
 │   └── Base.lproj
 │       └── LaunchScreen.storyboard
 ├── SceneDelegate.swift
 └── Views
     └── Base.lproj
         └── Main.storyboard
```
 
### 2. 클래스 다이어그램
![](https://i.imgur.com/qDTkJIh.png)

## 📱 실행화면
계산기 숫자 포맷까지 구현후 넣을 예정

## 🎯 트러블 슈팅
1. CalculatorItemQueue에 Double과 Operator 타입만 들어오게 하기 
    - Double, Operator타입이 CalculateItem 프로토콜을 채택하도록 함
    - 제네릭을 사용하여 CalculateItem 프로토콜을 채택한 타입만 들어오게 설정
    ```swift
    struct CalculatorItemQueue<CalculateItem> {}
    ```
    
2. 계산기 피연산자가 음수일 경우 계산결과가 제대로 안나오는 문제
    - string 형태 수식을 연산자와 피연산자로 파싱할 때, 음수 피연산자의 -기호가 사라지는 문제발생
    - 음수기호 -와, 연산기호 -를 구분
    - 음수기호 -는 Double로 타입변환이 불가능하여 아래와 같이 다시 연산기호 -로 치환하여 해결
```swift
input.components(separatedBy: operators).map { $0.replacingOccurrences(of: "−", with: "-")    
```

## 📚 레퍼런스
[Swift Programming Language - Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html#ID186) <br>
[replacingoccurrences](https://developer.apple.com/documentation/foundation/nsstring/1412937-replacingoccurrences) <br>
[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)