# 계산기 프로젝트 🔢
- 덧셈, 뺄셈, 곱셈, 나눗셈이 가능한 계산기를 제작하는 프로젝트 
- 버튼 설명
    - `AC` : 모든 연산을 초기화 해주는 버튼
    - `CE` : 현재 입력중인 피연산자를 초기화 해주는 버튼
    - `+/-` : 현재 입력중인 피연산자의 부호를 변경해주는 버튼 (`+` ↔︎ `-`)
    - `=` : 입력된 연산 내용을 실행해주는 버튼
- 사칙연산은 적용되어있지 않습니다.

---
## 목차 📋
1. [팀원 소개](#1-팀원-소개)
2. [타임 라인](#2-타임라인-230124--230203)
3. [프로젝트 순서도](#3-uml)
4. [실행화면](#4-실행화면)
5. [트러블 슈팅](#5-트러블-슈팅)
6. [참고 링크](#6-참고-링크)
7. [프로젝트 회고](#7-프로젝트-회고)

---
## 1. 팀원 소개
|[혜모리](https://github.com/hyemory)|
|---|
|<img src="https://github.com/hyemory/ios-calculator-app/blob/step3/images/hyemory.png?raw=true" width="200">|

## 2. 타임라인 (23.01.24. ~ 23.02.03.)
|날짜|진행 내용|
|---|---|
|2023-01-24|프로젝트 시작 / Queue 학습|
|2023-01-25|STEP1 진행 시작 및 완료|
|2023-01-26|Generic 학습, 리뷰 내용 검토|
|2023-01-27|코드 리팩토링 진행(네이밍, Unit test, UML 수정, 제네릭 추가)|
|2023-01-30|주말 간 STEP2 진행 및 완료|
|2023-01-31|UI 연결 및 연산 기능 구현|
|2023-02-01|Stack View, Scroll View 구현|
|2023-02-02|bug 수정 및 코드 보완하여 STEP3 PR완료|
|2023-02-03|코드 보완|

## 3. UML

<details>
<summary> Class Diagram 보기 </summary> <br/>
<img src="https://github.com/hyemory/ios-calculator-app/blob/step3/images/Class_Diagram.png?raw=true">
</details>
<br/>

## 4. 실행화면

|연산 실행(=)|CE버튼으로 취소 <br/> +/- 버튼으로 부호변경|AC버튼으로 초기화|
|---|---|---|
|![normal](https://github.com/hyemory/ios-calculator-app/blob/step3/images/operation_normal.gif?raw=true)|![CE & negative Button](https://github.com/hyemory/ios-calculator-app/blob/step3/images/operation_ce_negative.gif?raw=true)|![AC Button](https://github.com/hyemory/ios-calculator-app/blob/step3/images/operation_ac.gif?raw=true)|

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

#### 🔒 **0으로 나누기를 시도하는 경우** <br/> 
- 0으로 나누면 `NaN`으로 표시되는 기능을 구현하기 위해 고민하다가 `.nan` 이라는 타입 프로퍼티의 존재를 알게되었습니다.
- FloatingPoint 프로토콜을 채택하는 부동 소수점 타입인 Double에서 사용할 수 있는 타입 프로퍼티입니다 NaN(“not a number”)
- 0으로 나눌 경우 .nan으로 리턴하도록 구현해 보았습니다.
``` swift
func divide(lhs: Double, rhs: Double) -> Double {
    guard rhs != 0 else { return .nan }
    return lhs / rhs
}
```

#### 🔒 **연산식을 분리하여 큐에 담는 방법 고민** <br/> 
- 처음에는 ["`+`", "`-`", "`/`", "`*`"]으로 `split`해버리면 간단하겠다고 생각했습니다.
- 위의 방법은 매직 리터럴 같아 Operator의 case의 rawValue를 쓰기위해 이것저것 조사하며 코드를 구현하다보니 마지막 쯤 음수의 존재를 떠올리게 됐습니다.
값이 1+-3*4+2*-3 이런 식으로 전달되면 음수도 양수로 분리되어버리는 상황이 발생하였습니다.
- 인수를 차례대로 확인해서 +-, --, *-, /- 등 연산자가 중복되는 요소를 찾아 그 다음 숫자를 음수로 바꿔야할지 그렇다면 어떻게 구현을 할지 이런저런 많은 고민을 해봤지만,
View에서 연산자, 피연산자를 붙일 때 특정 문자를 구분 용도로 붙여주는 것을 생각하고 `" "`으로 split하기로 결정하였습니다.
- 이런저런 조건이 들어가 코드가 복잡해지는 것보다는 단순하게 빈칸만으로도 원하는 결과를 가져올 수 있으니 그 편이 더 경제적이라고 판단했습니다.
``` swift
private static func componentsByOperators(from input: String) -> [String] {
    let operatorValues = Operator.allCases.map { String($0.rawValue) }
    var inputs: [String] = []
    let result: [String]
    let delimiter: Character = " "

    inputs = input.split(with: delimiter)
    result = inputs.filter { operatorValues.contains($0) == false }
    return result
}
```

#### 🔒 **뷰 컨트롤러 예외처리 내용** <br/> 

1. 피연산자 입력
- 예외처리 사항
    1. 연산 완료(isCalculatedStatus - true) 상태인지 : 연산중인 false 상태로 변경하고 입력한 숫자를 바로 적용합니다.
    2. 현재 피연산자 값이 0인지 : 0이라면 0과 00을 입력할 수 없습니다.
    3. 값에 `.`이 포함되어있으면 이후로는 넘버포맷터를 적용하지 않습니다.
    (111.0과 같은 상황이면 넘버포맷터가 소수점 뒷 내용을 다 지워버리기 때문)
- `.`의 경우 한 번만 입력 가능하도록 구현하였습니다.
- 숫자는 20자까지만 입력 가능하도록 구현하였습니다.

2. 연산자 입력
expression에는 쉼표가 들어가면 계산이 제대로되지 않는 관계로, `,`를 빼주는 작업을 추가했습니다.

- 예외처리 사항
    1. expression 빈값인지 : 새로운 연산이므로 expression에 숫자만 추가, 스택 뷰에는 피연산자만 추가합니다.
    2. 현재 피연산자 값이 0인지 : 0이라면 " + "으로 저장되는 연산자를 바꾸기 위해 연산자 등록(3글자) 후 뒤에서 3글자 삭제했습니다.

3. 부호 변경 및 연산 결과
- 예외처리 사항
    1. 현재 피연산자 값이 0인지 : 0이라면 실행되지 않습니다.
    2. 현재 피연산자 첫번째 글자가 `-`인지 : `-`라면 `-`를 삭제하고, 아니면 추가해줍니다. 
- Equal 버튼 클릭 시 연산자가 공백일 때 =을 누를 수 없습니다.

4. NumberFormatter
코드를 정리하기 위해 String의 extension으로 구현하였습니다.
이미 쉼표가(`,`) 적용되어있는 피연산자에 적용하려고하면 제대로 적용되지 않아
문자열에서 쉼표를 빼주는 작업을 진행했습니다.

5. StackView, ScollView 
> iOS의 View는 업데이트할 컨텐츠가 생기면 즉각 그리지 않고 다음 drawing cycle에 그린다

- 스크롤이 최하단까지 내려가지 않는 현상이 있어 캠퍼분에게 질문하여 `layoutIfNeeded()`을 사용하게됐습니다.  `드로잉 사이클`로 인해 마지막 컨텐츠가 나타나지 않는 것이란 것을 알게 되었습니다.

## 6. 참고 링크
1. [INSWAG님 블로그 - Linked List](https://atelier-chez-moi.tistory.com/90)
2. [애플 개발자 공식문서 : Equatable](https://developer.apple.com/documentation/swift/equatable)
3. [소들이님 블로그 - 단방향 연결리스트 구현](https://babbab2.tistory.com/86)
4. [스위프트 공식문서 : Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
5. [Ellie Kim님 블로그 - compactMap](https://hyerios.tistory.com/77)
6. [애플 개발자 공식문서 : append(contentsOf:)](https://developer.apple.com/documentation/swift/array/append(contentsof:)-21slv)
7. [Beepeach님 블로그 - CharacterSet](https://beepeach.tistory.com/194)
8. [haze5959님 블로그 - Unicode Scalar](https://velog.io/@haze5959/Swift-Unicode-Scalar-%EA%B7%B8%EB%A6%AC%EA%B3%A0-%EB%AC%B8%EC%9E%90%EC%97%B4-count-%EC%8B%9C%EA%B0%84-%EB%B3%B5%EC%9E%A1%EB%8F%84-%EA%B4%80%EA%B3%84)
9. [애플 개발자 공식문서 : replacingOccurrences(of:with:)](https://developer.apple.com/documentation/foundation/nsstring/1412937-replacingoccurrences)

## 7. 프로젝트 회고

<details>
<summary> 회고 내용 보기 </summary> <br/>
    
1. 잘한 점
- 많은 시간을 투자하여 끝까지 해내려고 노력했다
- 일정 관리를 잘하여 원하는 날짜에 프로젝트를 마쳤다
    
2. 개선할 점
- 요구사항을 먼저 전부 파악하여 효율적으로 코드를 작성하도록하는 노력이 필요하다
- 문제를 해결하는 능력을 더 발전시켜야 한다
- 코드 컨벤션, 네이밍을 좀 더 가다듬어야 한다 
- 접근 제어를 적절하게 적용해야 한다
    
</details>
