# README - 계산기

---
### 목차
1. [개요](#1.개요)
2. [타임라인](#2.타임라인)
3. [프로젝트 구조](#3.프로젝트구조)
4. [실행화면](#4.실행화면)
5. [트러블 슈팅](#5.트러블슈팅)
6. [참고 링크](#6.참고링크)


---
# 1. 개요
### 계산기 프로젝트
- TDD기반으로 구현한 계산기 프로젝트입니다.
- 팀원: @lj-7-77 @yuvinrho

# 2.타임라인
221003
- 각자의 코드 설명
- UML에 따른 코드 병합

221004
- 구현방법 고민
- 버튼 타입 열거형으로 정의

221005
- 뷰컨트롤러 부분 구현
- 버튼에 따른 액션함수 구현
- 계산 실행할 계산기 class 구현

221006
- 스크롤 하단 자동이동 기능 구현, 숫자 표시형식 수정
- 예외상황에 적절한 에러 처리
- STEP-1 PR 요청

# 3.프로젝트 구조
### 디렉토리
```
├── Controller
│   ├── AppDelegate.swift
│   ├── CalculatorViewController.swift
│   └── SceneDelegate.swift
├── Enums
│   ├── CalculatorKeypad.swift
│   ├── ExpressionParser.swift
│   ├── MathSymbol.swift
│   └── Operator.swift
├── Error
│   └── CalculatorError.swift
├── Extensions
│   ├── Double+CalculateItem.swift
│   ├── ScrollView+Extension.swift
│   └── String+Extension.swift
├── Info.plist
├── Model
│   ├── CalculateItemQueue.swift
│   ├── Calculator.swift
│   └── Formula.swift
├── Protocol
│   └── CalculateItem.swift
└── View
    ├── Assets.xcassets
    │   ├── AccentColor.colorset
    │   │   └── Contents.json
    │   ├── AppIcon.appiconset
    │   │   └── Contents.json
    │   └── Contents.json
    └── Base.lproj
        ├── LaunchScreen.storyboard
        └── Main.storyboard
```
### UML
![](https://i.imgur.com/kAaLRXo.jpg)



# 4.실행화면
![](https://i.imgur.com/dHMbh89.gif)



---
# 5.트러블슈팅
## 고민한 점
### 1. CalculatorItemQueue의 제네릭 파라미터명 T, Type 두 가지 중 어떤이름으로 사용할지
파라미터명을 T로 정할지 아니면 Type과 같이 이름을 정해줄지 고민했습니다. 
스위프트 공식 문서에는 T라고 나와있는데, 보다 명확히 타입임을 표현할 의도로 Type이라는 이름으로 주었습니다.

```swift
struct CalculatorItemQueue<Type: CalculateItem> {
    private var enqueueStack: [Type] = []
    private var dequeueStack: [Type] = []
    (...중략...)
```

### 2. 더블스택큐에 요소를 추가하는 방법
요소 하나씩 메서드를 이용하여 추가 할지 / 배열로 만들어진 큐를 한번에 추가할지
compactMap이 배열로 리턴, 옵셔널언래핑 두 가지 작업을 모두 해주기때문에 배열로 한번에 추가하는 방법이 더 낫다고 판단하였습니다.

### 3. 스크롤뷰 아래로 이동하기 위해 view.layoutIfNeeded() 사용
- 계산 히스토리가 쌓일때 스크롤뷰가 자동으로 내려가기 위해서 아래와 같은 익스텐션을 추가하였습니다.
```swift
extension UIScrollView {
    func moveToBottomScroll() {
        self.setContentOffset(CGPoint(x: 0.0, y: self.contentSize.height - self.bounds.height),
                              animated: true)
    }
}
```
- 히스토리를 추가할 때, 스크롤뷰가 한줄씩 덜 내려가는 문제가 발생하였습니다.
- 이 문제를 해결하기 위해 `view.layoutIfNeeded()` 메소드를 실행하였습니다.

### 4. 함수 기능분리와 네이밍
함수가 한가지 기능만 하도록 나름대로 기능을 분리해보았고 네이밍도 의도를 명확하게 파악할 수 있게 고민해서 지어보았습니다.

# 6.참고링크
[Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

[Naming](https://www.swift.org/documentation/api-design-guidelines/#naming)

[CGRect](https://developer.apple.com/documentation/corefoundation/cgrect/)

[setContentOffset](https://developer.apple.com/documentation/uikit/uiscrollview/1619400-setcontentoffset/)

[UIStackView](https://developer.apple.com/documentation/uikit/uistackview/)

[UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview/)

[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)

[compactMap](https://developer.apple.com/documentation/applearchive/archiveheader/3589154-compactmap/)

야곰닷넷 오토레이아웃 강의

야곰닷넷 스위프트 기초강의
