# 계산기 II

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)

<br/>

## 1. 소개
각자 작성한 계산기 앱 코드를 병합하여 리팩토링한 프로젝트

### Common
* [protocol] **CalculateItem**
    - 빈 프로토콜 정의를 통해 Generic Constraint로 활용하여 Generic에 들어갈 수 있는 데이터 타입을 한정시키는 기능

* [extension] **NumberFormatter**
    - String, Double 변환 및 decimal표현 기능

* [enum] **Sign**
    - 전역의 Magic Literal/Number 처리를 위한 NameSpace
* [typealias] **CurrentItem**
    - 코드의 가독성을 높이기 위한 `(operatorText: String, operandText: String)` 튜플 타입의 별칭

<br/>

### Model
* [struct] **CalculatorItemQueue**
    - Array DoubleStack을 활용한 queue 자료구조를 구현
    - 제네릭으로 정의하여 확장성 확보
    - TDD(Test-Driven Development)를 통해 메서드를 정의하여 안정성 확보

* [enum] **Operator**
    * 사칙 연산을 case로 분류해 case별 연산 기능을 제공하는 타입

* [struct] **Formula**
    * Queue 내부 데이터를 추출하여 연산 결과를 얻는 기능

* [enum] **ExpressionParser**
    * 연산식을 숫자와 연산기호로 분리하여 Formula 타입을 반환하는 기능
    * 인스턴스 없이 전역에서 접근 가능하도록 case없는 열거형 static 메서드 정의

* [class]] **InputManager**
    * ExpressionParser에 전달할 input을 관리하는 객체

<br/>

### View
* [UIScrollView] **CalculateItemScrollView**
    * 스크롤 화면을 넘어가는 데이터가 추가될 때마다 스크롤을 최하단으로 유지하는 기능

* [UIStackView] **CalculcateItemStackView**
    * subview의 추가/제거 기능
<br/>

### Controller
* [UIViewController] **MainViewController**
    * 계산기 User Event 처리를 담당하는 객체
    * 각 버튼 별 발생한 이벤트를 적절히 처리하는 기능
    * view의 초기 화면을 설정하는 기능

<br/>

## 2. 팀원

| Rowan | sehong |
| :--------: |  :--------: | 
| <Img src = "https://i.imgur.com/S1hlffJ.jpg" width="200" height="200"/>      |<Img src ="https://i.imgur.com/64dvDJl.jpg" width="200" height="200"/>
| [Github Profile](https://github.com/Kyeongjun2) |[Github Profile](https://github.com/sehoong0429)


<br/>

## 3. 타임라인
**프로젝트 진행 기간** 
- **23.02.06 (월) ~ 23.02.10 (금)** 

> 23.02.06 (월): 각자의 계산기 프로젝트 Merge, 리팩토링 및 STEP1 PR 작성 <br/>
> 23.02.07 (화): STEP1 PR 피드백 반영, 계산기 작동 실험 후 리팩토링(1회 계산 이후 IBAction 조건 추가) <br/>
> 23.02.09 (목): 리팩토링 및 STEP2 PR 작성 <br/>
> 23.02.10 (금): PR 피드백 반영, README 작성 

<br/>

## 4. 프로젝트 구조
#### UML
![calculator_UML최종](https://user-images.githubusercontent.com/114981173/218041561-c0dca7b3-a41d-4581-a667-6954ecbaf55b.jpeg)

#### 파일 구조
```

├── Calculator
│   ├── App
│   │   ├── AppDelegate
│   │   └── SceneDelegate
│   ├── Common
│   │   ├── Extension
│   │   ├── Protocol
│   │   ├── Sign
│   │   └── Typealias
│   ├── Controller
│   │   └── MainViewController
│   ├── Models
│   │   ├── CalculatorItemQueue
│   │   ├── ExpressionParser
│   │   ├── Formula
│   │   ├── InputManager
│   │   ├── Operator
│   │   └── ViewGenerator
│   ├── Views
│   │   ├── CalculateItemScrollView
│   │   └── CalculateItemStackView
│   ├── Info.plist
│   ├── Assets
│   └── Base
│       ├── LaunchScreen
│       └── Main
└── CalculatorTests
    ├── CalculatorTests.swift
    ├── ExpressionParserTests.swift
    └── FormulaTests.swift

```

<br/>

## 5. 실행 화면(기능 설명)


| 숫자, 기능 버튼 동작 | 0, 00, . 버튼 실행 화면 | 
| :--------: | :--------: |
| <Img src = "https://i.imgur.com/AzufZVQ.gif" width="275">  | <Img src = "https://i.imgur.com/YBn1Ob5.gif" width="275"> | 


| 예외처리 | 스크롤 뷰 동작 | 
| :--------: | :--------: |
| <Img src = "https://i.imgur.com/OiLIDrE.gif" width="275"> | <Img src = "https://i.imgur.com/Vxp2MAD.gif" width="275"> | 

* 숫자가 0인 경우 연산자 변경, 0으로 나눈경우 NaN 예외처리
* 스크롤뷰의 서브 뷰가 스크롤뷰 영역을 넘어가는 경우 항상 최하단으로 스크롤 이동


<br/> 

## 6. 트러블 슈팅
### Merge Conflict
프로젝트 초기 Merge 과정에서 PR을 통한 코드 병합 중, 계속 Conflict가 발생했습니다.

서로의 프로젝트 파일 구조, 이름이 다르기 때문에 발생한 문제였다고 생각하여 conflict가 발생하지 않도록 팀원의 레포지토리를 로컬에 클론하여 Merge를 진행하였습니다.

또한 Terminal과 Xcode를 이용하여 직접 Conflict를 처리하기에 어려움을 느꼈습니다. 조금 더 수월한 Conflict 처리를 위해 Git 관리 Tool인 Git Fork를 사용하였습니다.

<br/>

### operand button IBAction 기능 추가
저희는 리팩토링을 하면서 휴대폰에 계산기 기본 어플과 비슷하게 구현하려고 했습니다.
계산기 앱에서는 계산 결과를 받은 뒤에 숫자만 입력하면 새로운 계산이 시작되고, 계산 결과를 받은 뒤에 연산자 기호를 입력하면 결과 값을 가지고 계산이 시작되는 부분을 확인했습니다.
기존에는 결과 값을 받은 뒤에 숫자만 입력하면 숫자가 결과에 붙는 방식이었는데 이를 휴대폰 계산기앱 방식 그대로 수정하여 기능을 추가하게 되었습니다.

```swift
// before
@IBAction private func touchOperandButton(_ sender: UIButton) {
    guard let inputOperand = sender.currentTitle else { return }
    ...
}
```
```swift
// after
@IBAction private func touchOperandButton(_ sender: UIButton) {
    guard let inputOperand = sender.currentTitle else { return }
    guard isFinishedCalculation == false else {
        resetAll()
        operandLabel.text = inputOperand
        isFirstItem = false
        return
    }
    ...
}
```

<br/>

### Typealias
기존에 선언되어있는 타입에 새로운 별칭을 붙여 반복되어 사용되는 코드의 길이를 줄이고 가독성을 높이려고 사용했습니다. 
```swift
//before
calculateItemStackView.addCurrentItem(operator: currentOperator,
                                      operand: currentOperand)
inputHandler.addInput(about: currentOperator, and: currentOperand)
````
```swift
// after
calculateItemStackView.add(currentItem)
inputHandler.addInput(about: currentItem)
```




    
    

## 7. 참고 링크
- [Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [야곰닷넷 - 오토레이아웃 정복하기](https://yagom.net/courses/autolayout/)
- [야곰닷넷 - UnitTest 작성하기](https://yagom.net/courses/unit-test-%EC%9E%91%EC%84%B1%ED%95%98%EA%B8%B0/)
- [NumberFormatter - Apple Devoloper Documentation](https://developer.apple.com/documentation/foundation/numberformatter)
- [UIStackView - Apple Devoloper Documentation](https://developer.apple.com/documentation/uikit/uistackview)
- [arrangedSubviews - Apple Devoloper Documentation](https://developer.apple.com/documentation/uikit/uistackview/1616232-arrangedsubviews)
- [UIView - Apple Devoloper Documentation](https://developer.apple.com/documentation/uikit/uiview)
- [layoutIfNeeded - Apple Devoloper Documentation](https://developer.apple.com/documentation/uikit/uiview/1622507-layoutifneeded)
- [UIScrollView - Apple Devoloper Documentation](https://developer.apple.com/documentation/uikit/uiscrollview)
- [UILabel - Apple Devoloper Documentation](https://developer.apple.com/documentation/uikit/uilabel)
- [Benoit Pasquier; Data Structure - How to implement a Queue in Swift](https://benoitpasquier.com/data-structure-implement-queue-swift/)
- [Kodeco - Swift Algorithm: Linked List Data Structure](https://www.kodeco.com/947-swift-algorithm-club-swift-linked-list-data-structure)
- [Swift Language Guide - Types](https://docs.swift.org/swift-book/ReferenceManual/Types.html)
