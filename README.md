# README - 계산기

# 계산기 프로젝트
- TDD기반으로 구현한 계산기 프로젝트입니다.
- 팀원: @LJ

---
### 목차
1. [STEP 1](#1.STEP-1)
    - 고민한점
    - 배운개념
2. [STEP 2](#2.STEP-2)
    - 고민한점
    - 배운개념
3. [타임라인](#3.타임라인)
4. [참고](#4.참고)

---
# 1.STEP 1

## 고민한점
- ### 배열과 리스트 중 어떤 방법으로 구현해야 하는지
리스트의 장점은 리스트에 포함된 여러개의 데이터 중 중간에 있는 값을 삭제하거나 특정 위치에 삽입할 때 속도가 빠른점인데, 계산기의 경우에는 그런 상황의 가능성이 적을 것이라 예상하였습니다.
또한 요구사항명세서 명시된 내용중 하나인 맨 마지막에 입력받는 값만 지우는 기능인 CE버튼을 사용하는 경우 리스트는 처음부터 맨 마지막까지 찾아가서 확인 후 지워야해서 비효율적이기 때문에 배열로 구현하였습니다.

- ### 입력받는 숫자와 연산자를 열거형으로 구현한 이유
사용자로부터 입력받은 숫자와 연산자가 계산기의 버튼으로 한정되어있기 때문에 한정된 값 이외에는 입력받지 않을 수 있는 타입인 열거형으로 사용하였습니다.

- ### 제네릭 사용
`CalculatorItemQueue`에서 `CalculateItem프로토콜`을 채택하였습니다.
▶️ 문제점 1
그 후 테스트파일에서 제네릭 매개변수로 받은 T를 추론할 수 없다는 에러메세지가 떴습니다.
    > Generic parameter 'T' could not be inferred

    ▶️ 문제점 2
    > Type 'Double' does not conform to protocol 'CalculateItem’ 
    
    `Double` 타입이 `CalculateItem프로토콜`을 채택하지 않았다는 에러메세지가 떴습니다.
▶️ 해결방법
 `CalculateItem프로토콜`에서 `extension`기능을 이용하여 `Double`타입도 이 프로토콜을 채택하도록 해주어 해결하였습니다.
```swift
extension Double: CalculateItem {
}
```
`extension`은 타입(구조체, 클래스, 열거형, 프로토콜, 제네릭)에 새로운 기능을 추가할 수 있는 기능입니다. 재정의하여 사용하는 것은 불가합니다.

```swift
extension 확장할타입이름: 프로토콜1이름, 프로토콜2이름 {
    //프로토콜 요구사항 구현
}
```


## 배운개념
queue(선형,원형), List(노드,단방향,양방향), TDD, enum, UML, extension, Generic, 빈프로토콜의 역할


# 2.STEP 2

## 고민한점
- ### TDD 기반으로 수행할 때 실패테스트 작성
반환값이 있는 메서드의 경우에는 반환값을 실패하도록 주어 수월했으나 반환값이 없는 메서드의 경우에는 실패하게 할 반환값이 없었습니다. 
▶️ 해결방법 : 조건이 필요한 메서드의 경우 조건문 없이 특정 상황을 그대로 마주하여 실패하도록 테스트한 후 리팩토링 하였습니다.

- ### 열거형 연산프로퍼티 초기화를 해야하는지
열거형타입이면서 저장프로퍼티를 갖지 않고, 메서드인 연산프로퍼티만 갖는 경우, 테스트파일에서 초기화를 하지 않았다는 오류가 생겼습니다.
![](https://i.imgur.com/xJbAgeW.png)
▶️ 해결방법 : static 키워드를 enum에 있는 메서드에 붙여주어 해결하였습니다. static 키워드를 붙이면 연산프로퍼티가 연산 타입 프로퍼티가 되어 초기화할 필요 없이 테스트파일에서도 접근할 수 있기 때문에 해결할 수 있었습니다.

## 배운개념
UML표기규칙(관계화살표,접근제어자+/-,static밑줄 등), 연산프로퍼티와 연산타입프로퍼티의 차이  

# 3.타임라인
220919    
- 프로젝트에 필요한 개념 익히기(공식문서, 야곰닷넷UnitTest강의)

220920
- UML 그리기
- 프로토콜과 큐를 배열로 구현한 CalculateItemQueue파일 추가
- 더블스택큐 방식으로 수정, PR 요청

220921
- 더블스택큐 방식으로 수정, PR 피드백 이해 및 리팩토링
- re-PR 요청, merge완료

220922
- 제시받은 UML 해석
- 실제 계산해주는 Formula 테스트 작성 및 수행

220923
- 숫자와 연산자를 적절히 분리, 저장하는 ExpressionParser 구현

---
# 4.참고
[Generic Functions](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
[Extension Syntax](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
[UML참고1](https://www.nextree.co.kr/p6753/)
[UML참고2](https://rldd.tistory.com/m/365)
[프로토콜 extension 참고](https://blog.yagom.net/529/)
