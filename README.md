# 🧮 계산기

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
* 덧셈, 뺄셈, 곱셈, 나눗셈등 기본 연산을 도와주는 계산기
* Queue와 Queue 내부 리스트를 LinkedList로 구현하였습니다

## 2. 팀원

|팀원|
|:--:|
|⭐️레옹아범⭐️|
|<img height="180px" src="https://raw.githubusercontent.com/Rhode-park/ios-rock-paper-scissors/step02/image/leonFather.jpeg">|


## 3. 타임라인

|날짜|타임라인|
|:--:|:--:|
|2023.1.24.(화)|UML생성, LinkedList Node 테스트 코드 작성 및 구현, Queue테스트 코드 작성 및 구현|
|2023.1.26.(목)|LinkedList구현, 자료구조 제너릭타입으로 변경, 리팩토링|

## 4. 프로젝트 구조

<details open>
    <summary><big>1️⃣ Step1</big></summary>
    </br>
        <img src="https://github.com/fatherLeon/ios-calculator-app/blob/step1/Step1UML.png?raw=true">
</details>

## 5. 실행 화면(기능 설명)

* 추후 UI기능 후 추가 예정

## 6. 트러블 슈팅

<details open>
    <summary><big>STEP1</big></summary>
    
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
    
</details>

## 7. 참고 링크
* [Given-When-Then 참고자료](https://brunch.co.kr/@springboot/292)
* [Swift-Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
* [UML 참고자료](https://zdodev.github.io/uml/swift/UML-Class-Diagram/)
