# 🧮 계산기

## 목차
1. [소개](#1-소개)
2. [타임라인](#2-타임라인)
3. [프로젝트 구조](#3-프로젝트-구조)
4. [실행화면(기능 설명)](#4-실행-화면기능-설명)
5. [트러블슈팅](#5-트러블-슈팅)
6. [참고링크](#6-참고-링크)

<br/>

## 1. 소개
> 프로젝트 기간: 2023.1.24.(화) ~ 2023.2.3.(금)

* 덧셈, 뺄셈, 곱셈, 나눗셈등 기본 연산을 도와주는 계산기
* Queue와 Queue 내부 리스트를 LinkedList로 구현하였습니다
* 스크롤뷰를 이용하여 이전 계산내역을 볼 수 있습니다


|팀원|
|:--:|
|⭐️레옹아범⭐️|
|<img height="180px" src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/leonFather.jpeg">|

---

## 2. 타임라인

|날짜|타임라인|
|:--:|:--:|
|2023.1.24.(화)|UML생성, LinkedList Node 테스트 코드 작성 및 구현, Queue테스트 코드 작성 및 구현|
|2023.1.26.(목)|LinkedList구현, 자료구조 제너릭타입으로 변경, 리팩토링|
|2023.1.27.(금)|연산자Operator타입 구현, 연산을 수행하는 Formula타입 구현|
|2023.1.28.(토)|수식 문자열을 Formula로 변환하는 ExpressionParser 구현|
|2023.1.30.(월)|Model(ExpressionParser, Operator, Formula) 리팩토링|
|2023.1.31.(화)|Model(ExpressionParser, Operator, Formula) 리팩토링, UI버튼 메소드 구현|
|2023.2.1.(수)|스크롤뷰의 스택뷰 추가 메소드 및 자동 스크롤 메소드 구현|
|2023.2.2.(목)|각종 오류("."이 여러개 들어가거나, 스크롤 뷰가 하나 이상 보이지 않는 문제 등) 수정|
|2023.2.3.(금)|컨트롤러 리팩토링|

---

## 3. 프로젝트 구조

<img src="https://raw.githubusercontent.com/fatherLeon/ios-calculator-app/step3/image/UML.png">

---

## 4. 실행 화면(기능 설명)

> 해당 프로젝트는 연산자 우선순위를 고려하지 않습니다

#### 1️⃣일반적인 연산

<img src="https://raw.githubusercontent.com/fatherLeon/ios-calculator-app/step3/image/동작1.gif" height="450px">

#### 2️⃣"AC"버튼 시 이전의 연산들을 초기화

<img src="https://raw.githubusercontent.com/fatherLeon/ios-calculator-app/step3/image/동작2.gif" height="450px">

#### 3️⃣"CE"를 누를 시 현재 숫자를 지움

<img src="https://raw.githubusercontent.com/fatherLeon/ios-calculator-app/step3/image/동작3.gif" height="450px">

#### 4️⃣숫자입력이 없는 상태에서 연산자를 누를 경우 연산자만 바뀜

<img src="https://raw.githubusercontent.com/fatherLeon/ios-calculator-app/step3/image/동작4.gif" height="450px">

#### 5️⃣x / 0을 할 경우 NaN이 출력된다

<img src="https://raw.githubusercontent.com/fatherLeon/ios-calculator-app/step3/image/동작5.gif" height="450px">

---

## 5. 트러블 슈팅

### 1️⃣ LinkedList Node 구현
#### 수정 전
```swift
final class Node {
    weak var prev: Node?
    weak var next: Node?
    var value: String
}
```

* 원형 연결리스트에 이전 Node와 다음 Node를 가리킬 수 있는 prev와 next를 사용함으로 원형연결이중리스트를 구현하였습니다
* 특히, head값 혹은 tail값을 삭제할 경우에 강한참조로 인해 해당 값이 메모리에 남아 있는 상황이 발생하여 weak 약한 참조를 사용하여 구현하였습니다
* 그러나, weak 약한 참조를 통해 구현할 경우 LinkedList의 head나 tail이 순간적으로 Node를 참조하지 않는 상황이 발생하면 다른 Node들이 메모리에서 deallocated되는 현상이 발생하였으며, Queue의 배열 대신 LinkedList가 들어가기 때문에 굳이 원형이중연결리스트를 사용할 필요가 없어져 단순한 연결리스트로 구현하였습니다
    
#### 수정 후
```swift
final class Node<Element: CalculateItem> {
    var next: Node?
    var value: Element
}
```
* 기존 String값만을 받는 Node에서 CalculateItem프로토콜을 채택한 모든 타입이 가능하도록 제너릭타입을 사용했습니다
* 이중연결리스트에서 단일연결리스트로 바꿈으로 메모리에서 남아있는 상황을 탈피할 수 있었고 약한참조를 사용하지않기 때문에 LinkedList의 head나 tail값이 nil상황이어도 Node가 사라지지 않도록 구현하였습니다
    
### 2️⃣ 테스트 코드의 모호함
#### 수정 전    
```swift
func test_Queue에_node를_하나씩_넣는다면_tail에_들어간다() {
    let firstNode = Node(value: "1")
    let secondNode = Node(value: "2")

    enqueueNodes(firstNode, secondNode)

    XCTAssertEqual(secondNode.value, sut!.tail!.value)
}
```
    
* 기존 테스트코드는 모호한 설명과 정확한 결과값을 명시해주지 않았습니다
    
#### 수정 후
```swift
func test_a와_b를_enqueue한다면_back은_b다() {
    // given
    let firstValue = "a"
    let secondValue = "b"
    let exception = "b"
    // when
    sut.enqueue(firstValue)
    sut.enqueue(secondValue)
    let backValue = sut.back!
    // then
    XCTAssertEqual(backValue, exception)
}
```
    
* 수정 후 정확한 메소드와 프로퍼티 이름, given-when-then(준비-실행-검증)단계를 테스트코드에 정확하게 명시해주었습니다
    
### 3️⃣ 모든 Node를 dequeue 시 tail에 Node가 남아있는 상황 해결
#### 수정 전
```swift
mutating func removeFirst() -> Element? {
    if isEmpty {
        return nil
    }
        
    let value = self.head?.value
    self.head = self.head?.next
        
    return value
} 
```
* 수정 전 head의 값만 빼줌으로 인해 마지막 하나 남은 tail값은 반환은 되지만 LinkedList의 tail에 남아 있는 문제가 있었습니다
    
#### 수정 후
```swift
func test_a와_b_두개의_Node를_가진_LinkedList에서_removeFirst를_두번한다면_head와_tail은_nil이다() {
    // given
    let firstValue = "a"
    let secondValue = "b"
    // when
    sut.append(firstValue)
    sut.append(secondValue)
    _ = sut.removeFirst()
    _ = sut.removeFirst()

    let headValue = sut.head
    let tailValue = sut.tail
    // then
    XCTAssertNil(headValue)
    XCTAssertNil(tailValue)
} 
```
* head와 tail이 nil이 되는 상황을 확인하기 위한 테스트코드를 작성했습니다
    
```swift
mutating func removeFirst() -> Element? {
    let value = self.head?.value
        
    if self.head?.next == nil {
        self.tail = nil
    }
        
    self.head = self.head?.next
        
    return value
}
```
* 기존 코드에서 옵셔널 체이닝만을 사용하여도 Nil값을 반환할 수 있었기 때문에 isEmpty 프로퍼티를 사용하지 않고 현재 head의 값을 확인하게 만들었습니다
* 또한 현재 head의 next가 nil일 경우 LinkedList에는 Node가 하나만 있다는 뜻이며 이 Node는 삭제가 dequeue될 예정이므로 tail을 nil로 바꿔주는 작업을 추가로 구현하였습니다

### 4️⃣ String타입을 Double로 바꿔주기
#### 수정 전
```swift
operandValues.forEach { component in
    if let operand = component as? Double {    //Cast from 'String' to unrelated type 'Double' always fails
        operands.append(operand)
    }
}
```
* `[String]`타입을 가진 operandValues를 `Double`타입으로 만들기 위해서 forEach를 통해 타입변화를 시도했지만 `String`과 `Double`은 서로 관련이 없는 타입이므로 타입캐스팅이 되지 않았습니다

```swift
operandValues.forEach { component in
    if let operand = Double(component) {
        operands.append(operand)
    }
}
```
* 다음과 같이 Double로 변환을 시도할 시 옵셔널 타입이 되므로 옵셔널바인딩을 하여 해당 값을 넣어주는 식으로 구성하였습니다
* 다만 해당 구문은 `operands`를 변수타입으로 만들어야하며, 가독성을 해치는 문제가 있다고 생각했습니다

#### 수정 후
```swift
let operands: [Double] = operandValues.compactMap { Double($0) }
```
* compactMap의 경우 nil타입은 반환하지 않으며, 옵셔널 바인딩이 되어 반환해주므로 위와 같이 작성하여 변수가 생기는 문제와 가독성을 해치는 문제를 해결하였습니다

### 5️⃣ StackView내의 StackView가 온전히 지워지지 않던 문제 해결

#### 수정 전
```swift
func removeAllStackView() {
    let allSubViewsInStackVIew = self.stackViewInScrollView.arrangedSubviews
    for stackView in allSubViewsInStackVIew {
        self.stackViewInScrollView.removeArrangedSubview(stackView)
    }
}
```
* 스택 뷰안의 서브 스택뷰가 있을 경우 해당 서브뷰를 지우기 위해 `removeArrangedSubview`메소드를 사용하여 서브뷰를 지웠으나, 새로운 수식이 추가 될 경우 이전 뷰가 표시되는 오류가 있었습니다

<img height = "450px" src="https://raw.githubusercontent.com/fatherLeon/ios-calculator-app/step3/image/error1.png">

#### 수정 후
```swift
func removeAllStackView() {
    let allSubViewsInStackVIew = self.stackViewInScrollView.arrangedSubviews
    for stackView in allSubViewsInStackVIew {
        self.stackViewInScrollView.removeArrangedSubview(stackView)
        stackView.removeFromSuperview()
    }
}
```
* removeArrangedSubView의 경우 스택뷰가 서브뷰의 위치나 사이즈를 더 이상 관리하지 않게 하는 메소드일 뿐이고 뷰 계층 안에는 남아 있으므로 removeFromSuperview를 추가적으로 명시해주었습니다
* removeFromSuperview는 뷰 계층에 남아있는 해당 뷰를 완전히 삭제시켜주는 메소드로 현재 서브뷰가 위치나 사이즈를 관리하지 않게하고, 슈퍼뷰안에서 해당 서브뷰를 완전히 삭제하도록 메소드를 구현하였습니다


### 6️⃣ 스크롤뷰 자동스크롤 구현 시 한타임 늦게 스크롤 되는 문제 해결
#### 수정 전
```swift
func scrollToBottom() {
    if self.scrollView.contentSize.height < self.scrollView.bounds.size.height { return }
    self.scrollView.layoutIfNeeded()
    let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
    self.scrollView.setContentOffset(bottomOffset, animated: true)
}
```
* 스크롤뷰의 경우 스크롤이 가능한 시점이 될 경우 스크롤뷰의 사이즈보다 스크롤뷰의 컨텐츠 사이즈가 커집니다
* 다만 수식 추가 후 곧바로 해당 수식을 보여주는 것이 아닌 이전에 입력된 수식쪽으로 스크롤이 되는 문제가 있었습니다

#### 수정 후
```swift
func scrollToBottom() {
    if self.scrollView.contentSize.height < self.scrollView.bounds.size.height { return }
    self.scrollView.layoutIfNeeded()
    self.stackViewInScrollView.layoutIfNeeded()
    let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
    self.scrollView.setContentOffset(bottomOffset, animated: true)
}
```
* 해당 함수를 디버깅한 결과 스크롤뷰 안의 스택뷰에 항목을 추가한다면 곧바로 높이가 업데이트 되는 것이 아니라 이후에 업데이트 된다는 것을 확인했습니다
* 이를 해결하기 위해 해당 스택뷰에 `layoutIfNeeded`메소드를 사용하여 스택뷰를 바로 업데이트 시켜주도록 만들었습니다

---

## 6. 참고 링크
* [Given-When-Then 참고자료](https://brunch.co.kr/@springboot/292)
* [Swift-Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
* [UML 참고자료](https://zdodev.github.io/uml/swift/UML-Class-Diagram/)
* [자동 scroll](https://stackoverflow.com/questions/952412/uiscrollview-scroll-to-bottom-programmatically)
