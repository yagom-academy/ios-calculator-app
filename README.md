# 계산기 프로젝트 🔢

---
## 목차 📋
1. [팀원 소개](#1-팀원-소개)
2. [타임 라인](#2-타임라인-230124--230203)
3. [프로젝트 순서도](#3-프로젝트-순서도)
4. [실행화면](#4-실행화면)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [참고 링크](#6-참고-링크)

---
## 1. 팀원 소개
|[혜모리](https://github.com/hyemory)|
|---|
|<img src="https://github.com/Andrew-0411/ios-juice-maker/blob/step1/images/hyemory.png" width="200">|

## 2. 타임라인 (23.01.24. ~ 23.02.03.)
|날짜|진행 내용|
|---|---|
|2023-01-24|프로젝트 시작 / Queue 학습|
|2023-01-25|STEP1 진행 시작 및 완료|
|2023-01-26|Generic 학습, 리뷰 내용 검토|
|2023-01-27|코드 리팩토링 진행(네이밍, Unit test, UML 수정, 제네릭 추가)|

## 3. 프로젝트 순서도

<details>
<summary> Class Diagram 보기 </summary> <br/>
<img src="https://github.com/hyemory/ios-calculator-app/blob/step1/Class_Diagram.png?raw=true">
</details>
<br/>

## 4. 실행화면
- *UI 부분 작업 진행 시 추가예정*
![fruitStore](https://user-images.githubusercontent.com/45560895/212246572-87854fb2-1b59-4c61-9c41-3e5d6802f328.gif)

## 5. 트러블 슈팅
#### 🔒 **오버헤드 및 시간 복잡도 줄이기** <br/> 
- Queue를 구현할 때 그냥 Array를 사용하게되면 front 제거 시 남은 요소의 인덱스를 하나하나 옮겨야하여 오버헤드가 발생된다고 합니다.
- 이를 개선하기 위해 단방향 연결리스트 방식을 채택하였으나 enqueue 시 `O(n)` 시간 복잡도로 탐색한다는 사실을 알게되었습니다.
- 💡 `head`와 `tail` 사용하기
    - head: dequeue 시 그 다음 노드로 head를 옮기기만 하면 됩니다 (오버헤드 방지)
    - tail: 맨 마지막에 추가된 rear의 정보를 바로 알 수 있어서 front부터 탐색할 필요가 없어집니다. (시간 복잡도 : `O(1)`)

#### 🔒 **TDD 작성 시 반환 값을 갖는 함수를 그냥 호출해도 될까?** <br/> 
- TDD 작성 중 반환타입이 있는 메서드를 그냥 호출할 때,
`Result of call to 'methodName()' is unused` 라는 경고 문구가 나타납
니다. 처음엔 아래와 같이 와일드카드 상수에 담았습니다.
``` swift
func test_removeLast호출시_List에1_2_3이있는경우_3이삭제되고_tail은2가된다() {
    // given ...

    // when
    let _ = sut.removeLast()

    // then ...
}
```

- 💡`@discardableResult`라는 Attribute가 있는데 결과를 사용하지 않아도 된다는 뜻입니다.
이를 removeLast 메서드 이전 행에 적용하니 반환값을 상수에 담지 않아도 경고 문구가 표시되지 않았습니다. 

#### 🔒 **Node끼리 비교할 수 없을까?** <br/> 
- 서로 다른 위치에 있는 두 개의 Node를 비교하려고하니 다음과 같은 컴파일 에러를 만났습니다.
- `Operator function '!=' requires that 'Node' conform to 'Equatable'`
- 💡 컴파일 오류 문구에 명시된대로 Node 타입에 Equatable 프로토콜을 채택하니 다른 타입간의 비교가 가능해졌습니다. (현재 코드에서는 삭제되었습니다.)

#### 🔒 **Node의 Value를 사용한 타입들에도 동일하게 타입 제약을 줘야한다!** <br/> 
- Queue의 요소인 Node의 value에만 CalculateItem 프로토콜을 채택하려고 타입 제약을 걸었습니다. 그러나 value를 사용하고있는 LinkedList, CalculatorItemQueue 타입에는 타입 제약을 걸지 않아 다음과 같은 컴파일 오류를 만났습니다.
- `Type 'T' does noe confrom to protocol 'CalculatorItem'`
- 💡 Node타입을 사용하는 LinkedList, CalculatorItemQueue 전부 T가 CalculateItem 채택하도록 수정하니 해결되었습니다. 모든 타입이 아닌 CalculateItem 프로토콜로 타입 제약을 준 value와 같이 사용해야하기 때문에 발생한 오류였습니다.

## 6. 참고 링크
1. [INSWAG님 블로그 - Linked List](https://atelier-chez-moi.tistory.com/90)
2. [애플 개발자 공식문서 : Equatable](https://developer.apple.com/documentation/swift/equatable)
3. [소들이님 블로그 - 단방향 연결리스트 구현](https://babbab2.tistory.com/86)
2. [스위프트 공식문서 : Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
