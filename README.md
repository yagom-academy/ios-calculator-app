# 🏦계산기

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [회고](#-회고)

</br>

## 🍀 소개
민트가 만든 계산기. 정수와 실수의 사칙연산을 할 수 있습니다. 

* 주요 개념: `Queue`, `Double Stack`, `Linked_List`, `UML`, `자료구조`

</br>

## 👨‍💻 팀원
| MINT |
| :--------: |
| <Img src = "https://hackmd.io/_uploads/SyW7zfDUn.jpg"  width="200" height="200"> |
|[Github Profile](https://github.com/mint3382) |


</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.05.29.| - Unit Test 공부 |
|2023.05.30.| - enqueue, dequeue, popLastStack 함수 구현 <br> - TDD 사용 |
|2023.05.31.| - count, isEmpty, first, last 연산 프로퍼티 구현 <br> - enqueue, dequeue 함수 리펙토링 <br> - popLastStack 함수 삭제 <br> - test 리펙토링 |
|2023.06.01.| - enqueue, dequeue 함수 리펙토링 <br> - test 리펙토링 <br> - first, last 연산 프로퍼티 리펙토링 |


</br>

## 👀 시각화된 프로젝트 구조
### Class Diagram
<p align="center">
<img width="800" src= "https://github.com/mint3382/ios-calculator-app/blob/step1/CalculatorClassDiagram1.png?raw=true" >
</p>

</br>

## 💻 실행 화면 

추후 추가 예정

</br>

## 🧨 트러블 슈팅

1️⃣ **Queue 구현 자료구조 선택: Double Stack vs Linked_List** <br>
-
🔒 **문제점** <br>
`Queue`를 구현하는 방법들은 여러가지가 있습니다.

본인 이전의 정보와 다음의 정보를 알고 있는 `linked list`라는 구조의 방법이 있습니다. `enqueue`시 마지막 `node`인 `TAIL`에 새로 추가된 `node`를 잇고, `dequeue`시 맨 처음의 `node`인 `HEAD`의 정보를 반환하면서 `HEAD`의 위치를 다음 `node`로 전환하는 방법을 사용합니다.

`stack` 2개를 사용해 구현하는 `Double Stack`이라는 구조의 방법 또한 있습니다. 두 개의 스택용 배열을 만들어서 `enqueueStack`에서는 요소의 추가(`enqueue`의 기능)만, `dequeueStack`에서는 선입선출을 맞춰 요소 반환(`dequeue`의 기능)만을 담당하게 하여 사용합니다.

이 중 계산기의 기능을 위해 `Queue`를 구현할 때, 어떤 방법을 선택할지에 대한 고민이 있었습니다.


🔑 **해결방법** <br>
계산기의 기능을 위함에는 `Double Stack`이 더 맞는 것 같아 `Double Stack`으로 구현하였습니다. 

`linked list`는 `node`라는 곳에 단순한 본인의 `data` 뿐만 아니라 다음 차례의 `node`의 주소값을 알고 있는 구조입니다. 끊임없이 연결되어 있는 구조이고 `HEAD`와 `TAIL`을 설정해주면 손쉽게 처음과 끝을 알 수 있고, 내용을 변경할 수 있습니다. 때문에 `array`에서 구현되는 `removeFirst()`와는 다르게 `HEAD`만 옮겨서 1번 자리를 가리키는 것이 바뀔 뿐 배열의 내용을 앞으로 당길 필요가 없기에 시간복잡도가 O(n)이 되는 경우가 없어서 빠릅니다. 또한 중간에 데이터A를 넣고 싶을 때 넣고 싶은 부분의 앞의 노드의 다음 노드에 대한 정보를 A에 대한 노드로 바꾸고, A 노드에서 다음 노드에 대한 정보를 기존에 넣고 싶었던 부분의 뒤의 노드로 변경해주면 됩니다. 이처럼 데이터를 중간에 삽입하는 것에 큰 장점이 있습니다.

`Double stack`은 `dequeueStack`이 비어있는 경우 `enqueueStack`을 뒤집어주어야 하는 일이 있어서 시간 복잡도는 조금 더 높을 수 있지만 배열을 이용한 구현이기에 원한다면 인덱스를 통한 접근을 빠르게 할 수 있습니다.

계산기의 경우 큐의 구현이기에 중간에 데이터를 추가해 줄 필요가 없습니다. `linked-list`를 사용한다면 `enqueue`를 할 때마다 매번 `node`를 생성하고 할당하여 `TAIL`과 연결짓는 작업을 해주어야 하는데 `double stack`은 단순히 `enqueueStack`에 `append`만 해주면 되고, `dequeue`를 할 때도 `linked-list`는 기존 HEAD에서 데이터를 저장하여 반환한 후 `HEAD`가 가리키고 있는 `node`를 다음 `node`로 변경하는 작업을 해주어야 하는데 `double stack`에서는 이미 `dequeueStack`에 있다면 단순히 배열의 마지막 요소를 꺼내기만 하는 것이기에 해야하는 작업이 더 적고 구조가 간단하다는 생각이 들어 `double stack`으로 구현한 것을 남겼습니다.


<br>

2️⃣ **Double Stack: enqueue와 dequeue시 시간 복잡도** <br>
-
🔒 **문제점** <br>
초반 `dequeue`를 할 때 항상 `enqueueStack`을 `dequeueStack`에 `reversed()` 해준 후 `popLast()`를 하고 다시 `enqueueStack`에 `reversed()` 해주는 방법을 사용했습니다. 그러자 매번 시간복잡도가 O(n)으로 `array`의 `removeFirst()`를 사용해주는 것과 다를 바 없는 결과가 나왔습니다. 
```swift
    dequeueStack = reversedStack(enqueueStack)
    let output = backwardStack.popLast()
    enqueueStack = reversedStack(dequeueStack)
```

🔑 **해결방법** <br>
한번 `enqueueStack`을 `reversed()`하여 `dequeueStack`에 넣게 되면 기존의 `enqueueStack`의 내용은 지우고 `dequeueStack`에만 남겨, `dequeueStack`이 비어서 꺼낼 요소가 없을 때까지 `reversed()`할 필요 없이 마지막 요소를 꺼내는 작업만 할 수 있도록 변경하였습니다. 매번 `reversed()` 해주는 것이 아니라 필요한 순간에만, 한번씩 해주기에 시간 복잡도를 줄일 수 있었습니다. 
```swift
mutating func dequeue() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.removeLast()
    }
```


<br>

3️⃣ **TDD_private** <br>
-
🔒 **문제점** <br>
`private` 키워드를 사용하면 `Unit Test`에서도 해당 프로퍼티나 메서드를 사용할 수 없습니다. 때문에 테스트를 할 때는 `private`를 제거하고, 테스트가 끝난 후에 다시 `private`을 붙여주었습니다. 그러니 최종적인 `test문`들에 빨간 에러가 뜨는 일들이 발생하였는데 특히 `enqueue` 메서드가 제대로 동작하였는지를 알아보기 위해 `private enqueueStack`의 내용을 비교하는 과정에서 문제들이 생겼습니다.

```swift
 XCTAssertEqual(sut.enqueueStack, [10, 20])
```

🔑 **해결방법** <br>
테스트는 은닉화를 하였음에도 오류 없이 잘 돌아가야합니다. 때문에 `private` 키워드를 붙이더라도 해당 프로퍼티나 메서드를 확인할 수 있는 다른 방법을 생각해야 했습니다. `count` 프로퍼티를 활용하여 `enqueue` 메서드가 동작하였을 때 `count`의 값이 올라갔는지 확인하는 방법으로 변경하여 해결하였습니다.

```swift
//when
let result = sut.count
        
//then
XCTAssertEqual(result, 2)
```

<br>

## 📚 참고 링크
- [🍎Apple Docs: reversed](https://developer.apple.com/documentation/swift/array/reversed())
- [🍎Apple Docs: popLast](https://developer.apple.com/documentation/swift/array/poplast())
- [🍎Apple Docs: removeLast](https://developer.apple.com/documentation/swift/array/removelast())
- 
</br>

## 👥 회고
추후 추가 예정
