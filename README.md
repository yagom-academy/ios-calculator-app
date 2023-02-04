# 계산기

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
LinkedList와 Queue를 활용한 사칙연산 계산기 앱

### Common
* [protocol] **CalculateItem**
    - 빈 프로토콜 정의를 통해 Generic Constraint로 활용하여 Generic에 들어갈 수 있는 데이터 타입을 한정시키는 기능

* [extension] **NumberFormatter**
    - String, Double 변환 및 decimal표현 기능

* [enum] **Sign**
    - 전역의 Magic Literal/Number 처리를 위한 NameSpace

<br/>

### Model
* [struct] **CalculatorItemQueue**
    - LinkedList를 활용한 queue 자료구조를 구현
    - 보편적인 queue의 기능 중 필요한 기능만을 메서드로 정의
    - 제네릭으로 정의하여 확장성 확보
    - TDD(Test-Driven Development)를 통해 메서드를 정의하여 안정성 확보

* [struct] **LinkedList**
    - Node 클래스 인스턴스들을 연결한 단방향 연결 리스트
    - 선입선출(FIFO)에 용이하도록 리스트의 처음과 마지막 데이터를 가리키는 head, tail 프로퍼티 정의
    - TDD(Test-Driven Development)를 통해 메서드를 정의하여 안정성 확보

* [enum] **Operator**
    * 사칙 연산을 case로 분류해 case별 연산 기능을 제공하는 타입

* [struct] **Formula**
    * Queue 내부 데이터를 추출하여 연산 결과를 얻는 기능

* [enum] **ExpressionParser**
    * 연산식을 숫자와 연산기호로 분리하여 Formula 타입을 반환하는 기능
    * 인스턴스 없이 전역에서 접근 가능하도록 case없는 열거형 static 메서드 정의

* [class]] **InputHandler**
    * ExpressionParser에 전달할 input을 관리하는 객체

<br/>

### View
* [UIScrollView] **CalculateItemScrollView**
    * 스크롤 화면을 넘어가는 데이터가 추가될 때마다 스크롤을 최하단으로 유지하는 기능

* [UIStackView] **CalculcateItemStackView**
    * 현재 입력중인 식을 새로운 StackView 인스턴스에 담아 자신의 subview로 추가하는 기능
<br/>

### ViewController
* [UIViewController] **MainViewController**
    * 계산기 User Event 처리를 담당하는 객체
    * 각 버튼 별 발생한 이벤트를 적절히 처리하는 기능
    * view의 초기 화면을 설정하는 기능

<br/>

## 2. 팀원

| Rowan | 
| :--------: | 
| <Img src = "https://i.imgur.com/S1hlffJ.jpg" width="200" height="200"/>      |
| [Github Profile](https://github.com/Kyeongjun2) |


<br/>

## 3. 타임라인
**프로젝트 진행 기간** 
- **23.01.24 (화) ~ 23.02.03 (금)** 

> 23.01.24 (화): **[TDD]** Queue 구현 (QueueList: Array) <br/>
> 23.01.25 (수): **[TDD]** QueueList LinkedList로 변경 / STEP 1 PR <br/>
> 23.01.26 (목): **[TDD]** PR 피드백 적용 - 접근제어, Test case 수정 <br/>
> 23.01.27 (금): Operator, Formula, ExpressionParser 구현 <br/>
> 23.01.28 (토): Formula 기능 추가 및 컨벤션 리팩토링 <br/>
> 23.01.29 (일): ExpressionParser - parse 메서드 내부 반복문을 고차함수로 refactor / STEP 2 PR <br/>
> 23.01.30 (월): MainViewController - UI 연결 <br/>
> 23.01.31 (화): PR 피드백 적용 / MainViewController - IBAction 정의 <br/>
> 23.02.01 (수): MainViewController - ScrollView 기능 추가, numberFormatter 적용 <br/>
> 23.02.02 (목): MainViewController Refactoring - SOLID 단일 책임 원칙 중심 기능 분리 / STEP 3 PR <br/>
> 23.02.03 (금): PR 피드백 적용

<br/>

## 4. 프로젝트 구조
#### UML
![calculator_UML](https://user-images.githubusercontent.com/114981173/216733908-e870f531-365a-4f14-8776-16cd22e2cbaa.jpeg)


#### 파일 구조
```
├── Calculator
│   ├── AppDelegate
│   ├── SceneDelegate
│   ├── Common
│   │   ├── Extention
│   │   ├── NameSpace
│   │   └── Protocol
│   ├── Model
│   │   ├── CalculatorItemQueue
│   │   ├── ExpressionParser
│   │   ├── Formula
│   │   ├── InputHandler
│   │   ├── LinkedList
│   │   └── Operator
│   ├── Controller
│   │   └── MainViewController
│   └── View
│       ├── Base
│       │   ├── LaunchScreen
│       │   └── Main
│       ├── CalculateItemScrollView
│       └── CalculateItemStackView
└── CalculatorTests
    ├── CalculatorItemQueueTests.swift
    ├── ExpressionParserTests.swift
    ├── FormulaTests.swift
    └── LinkedListTests.swift
```

<br/>

## 5. 실행 화면(기능 설명)
### 버튼 동작 
<details>
<summary>숫자, 연산자, 기능(AC,CE,+/-) 버튼 실행 화면</summary>
    
![버튼동작화면](https://i.imgur.com/AzufZVQ.gif) 
</details>

<details>
<summary>0, 00, . 버튼 실행 화면</summary>
    
![0,00,.](https://i.imgur.com/YBn1Ob5.gif) 
</details>




### 예외 처리
<details>
<summary>숫자가 0인 경우 연산자 변경, 0으로 나눈경우 NaN 예외처리</summary>
    
![예외처리1](https://i.imgur.com/OiLIDrE.gif)
</details>

### 스크롤 뷰 동작
<details>
<summary>스크롤뷰의 서브 뷰가 스크롤뷰 영역을 넘어가는 경우 항상 최하단으로 스크롤 이동</summary>
    
![](https://i.imgur.com/Vxp2MAD.gif)
</details>


<br/> 

## 6. 트러블 슈팅
### STEP 1.

<details>
<summary>LinkedList를 Queue에 활용하기</summary>

- Queue 구현 초기에 Array를 활용하여 Queue를 구현하려 했습니다.
    
```swift
// before
struct CalculatorItemQueue<Element> {
    var queue: Array<Element?> = []
    var head: Int = 0
}
```

<br/>
    
- Array를 활용해 Queue를 구현할 경우 `dequeue()` 메서드의 시간복잡도가 O(n)이 되는 문제점이 있었습니다.
- Index를 갖고 있는 Array는 Queue의 선입선출(FIFO)을 구현하려 하면 대부분 `dequeue` 과정에서 시간복잡도 O(n)을 갖습니다.
- `dequeue`는 가장 먼저 들어간 데이터를 반환하는데, Array의 가장 처음 데이터가 삭제된다면 이후 데이터들의 인덱스를 1씩 줄여주는 작업이 필요하기 때문입니다.
- 시간복잡도의 문제점을 해결하기 위해 FIFO 구현에 적합한 LinkedList를 Queue List로 활용하게 되었습니다.
    
```swift
// after
struct CalculatorItemQueue<Element: CalculateItem> {
    private var list: LinkedList<Element>

} 
```    
    
- LinkedList에 head, tail 프로퍼티를 정의하여 항상 가장 처음과 마지막 노드를 가리키게 했습니다.
- 이를 통해 `enqueue`, `dequeue` 과정 모두 시간복잡도를 O(1)로 가지도록 개선할 수 있었습니다.
</details>

<br/>
    
### STEP 2.
<details>
<summary>고차함수를 통한 반복문 줄이기</summary>    

- `parse`메서드에 `for-in` 반복문을 사용해서 분리된 input을 enqueue해주고 있었습니다.
- 반복문 사용을 줄이고 고차함수를 써야하는 조건에 맞추어 리팩토링을 진행해보았습니다.
    
```swift
// before
for member in components {
    if let operand = Double(member) {
        formula.operands.enqueue(operand)
    } else if let `operator` = Operator(rawValue: Character(member)) {
         formula.operators.enqueue(`operator`)
    }
}
```

```swift
// after
components.forEach {
    if let operand = Double($0) {
        formula.operands.enqueue(operand)
    } else if let `operator` = Operator(rawValue: Character($0)) {
        formula.operators.enqueue(`operator`)
    }
}
```

</details>
<br/>

### STEP 3.
<details>
<summary>ViewController 기능 분리</summary>
    
* STEP 3 초기, ViewController 내부에 모든 계산기 Event처리 관련 메서드가 정의되어 있어 코드를 파악하는 것에 어려움이 있었습니다.
* 객체지향프로그래밍 SOLID원칙 중 가장 중요한 단일 책임 원칙(SRP)를 중점적으로 생각해보며 기능을 분리하고 새로운 타입과 파일을 생성하여 ViewController의 크기를 줄였습니다.
* [초기 216줄의 ViewController 코드](https://github.com/Kyeongjun2/ios-calculator-app/commit/e820c838a6787cc9d0464fa31790b5ac66679168)를 refactoring 후 116줄까지 줄여 가독성과 코드 파악의 수월함을 확보할 수 있었다고 생각합니다. [(수정 후 코드)](https://github.com/Kyeongjun2/ios-calculator-app/blob/Step03/Calculator/Calculator/Controller/MainViewController.swift) 

</details>
    
<details>
<summary>ScrollView를 항상 최하단으로 유지하기</summary> 
    
<br/>
▪️ 수정 전 <br/>
   스크롤뷰 영역을 넘어가는 subView가 추가된 후 바로 최하단으로 스크롤이 유지되지 않았습니다. 한 칸씩 밀려서 스크롤이 올라가는 문제가 있었습니다.
    
```swift
// before
private func addCurrentItem(to stackView: UIStackView) {
    guard let subview = generateCurrentItemStackView() else { return }

    add(subview, to: stackView)
    calculateItemScrollView.setContentOffset(CGPoint(x: 0, y: calculateItemScrollView.contentSize.height - calculateItemScrollView.bounds.height), animated: true)
    initializeCurrentCalculateItem()
}
```

<br/>
    
▪️ 수정 후 <br/>
    스크롤뷰에 subView를 추가하는 메서드 내부에서 스크롤을 최하단으로 내리는 메서드를 호출했기 때문에, layout이 업데이트 되기 전에 스크롤이 아래로 내려가던 문제라는 것을 파악하였습니다. <br/>
    이를 해결하기 위해 호출 직후 layout을 업데이트하는 `layoutIfNeeded()` 메서드를 사용하였습니다.
```swift
private func addCurrentItem(to stackView: UIStackView) {
    guard let subview = generateCurrentItemStackView() else { return }

    add(subview, to: stackView)
    layoutIfNeeded()
    calculateItemScrollView.setContentOffset(CGPoint(x: 0, y: calculateItemScrollView.contentSize.height - calculateItemScrollView.bounds.height), animated: true)
    initializeCurrentCalculateItem()
}
```

</details>
    
    
    

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
