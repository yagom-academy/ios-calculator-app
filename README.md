# 계산기

###### tags: `README`

## 프로젝트 저장소
> 프로젝트 기간 2022-05-16 ~ 2022-05-27
> 팀원: [@borysarang](https://github.com/yusw10) 
리뷰어: [@Cory]()

---------------------------------------------------------------

# 목차
- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [그라운드 룰](#그라운드-룰)
    - [활동시간](##활동시간)
    - [참고문서](##참고문서)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)
- [핵심경험](#핵심경험)
- [기능설명](#기능설명)
- [STEP 1](#STEP-1)
    - [고민한점](#STEP-1-고민한점)
    - [배운 개념](#STEP-1-배운개념)
    - [Review](#STEP-1-Review)
    - [Update](#STEP-1-Update)
- [STEP 2](#STEP-2)
    - [고민한점](#STEP-2-고민한점)
    - [배운 개념](#STEP-2-배운개념)
    - [Review](#STEP-2-Review)
    - [Update](#STEP-2-Update)
---------------------------------------------------------------


# 프로젝트 소개
계산기 어플리케이션의 제작

# UML  
**[ClassDiagram]**
![](https://i.imgur.com/NqTrS4C.png)


</br>
**[Seauqence Diagram]**
![]()
</br>
**[Flowchart]**
![]()


---------------------------------------------------------------


# 키워드
- Queue
- List
- TDD
- LinkedList
- GenericType
- @Equatable
- filter
- map


---------------------------------------------------------------

# 그라운드 룰

## 활동 시간
- 10시에는 일어나기
- 작성 단위별로 커밋 하기
- 몰랏던 것, 고민했던 것 정리해두기


## 프로젝트 진행 장소
+ 내 방
+ 카페


## 컨벤션
1. Swift 코드 스타일 : [스위프트 API 가이드라인](https://gist.github.com/godrm/d07ae33973bf71c5324058406dfe42dd) 
2. 커밋 메시지 : Karma Code Convention 준수
3. 커밋 단위 : function별 Commit

---------------------------------------------------------------

# 프로젝트 참고 사항
## 참고 문서
[Equatable](https://developer.apple.com/documentation/swift/equatable/)
[Generic 활용하여 커스텀 클래스 구현](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

## 참고 웹페이지

---------------------------------------------------------------

# 핵심경험
- [x] Swift API Design Guide에 따른 이름짓기
- [x] queue 구현 및 활용
- [x] LinkedList 구현 및 활용
- [x] TDD로 개발
- [x] Error Handling

---------------------------------------------------------------

# 기능설명

---------------------------------------------------------------

# [STEP 1]

## STEP 1 고민한점

### TDD의 커밋
지난 활동학습 및 야곰닷넷의 Unit Test강좌를 들으며 테스트 주도 개발이라는 개발론을 공부할 수 있었습니다. [실패하는 테스트 -> 리팩토링 -> 테스트성공]의 루틴으로 정확한 단위 기능들을 구현해나간다는 취지도 이해했습니다. 다만 이번에 실제로 TDD를 따르며 Queue를 구현해보았는데 TDD시에 어떻게 커밋을 해야하는지 막막했습니다.(테스트, 리팩토링, 성공 마다 커밋인지 / 아니면 기능별로 한루틴마다 커밋인지)
특히 큐를 구현할 때 느낀점이, 기능끼리 연관이 되어있을 경우 다른 테스트를 할 수가 없어서 어떻게 진행하는지 감이 잘 안왔습니다(enqueue를 구현하지 않으면 내부 queue를 직접 대입해서 하는것인지.)

### Equtable
 자료구조를 구현하는과정중에 linkedList의 poplast, 또는 head나 tail에 정상적으로 인스턴스가 삽입되었는지 확인을 하려고 했습니다. 확인하던 중 XCTAssertEqual은 값타입만 비교가 가능하고 인스턴스를 비교하려면 Equtable 프로토콜을 상속받고 `==` 메서드를 오버라이딩 해야한다고 이해했습니다. 하지만 실제 더 큰 규모의 테스트에서는 같은 인스턴스인지를 비교할 경우가 많을것 같은데 이부분은 전부 Equtable을 상속받고 하는건지, 아니면 인스턴스 반환값을 테스팅할때 다른 기법이 있는건지 궁금합니다(현재 코드에서는 각 Node의 value로 비교하였습니다)

### Queue
다른 언어와 다르게 swift는 언어차원에서 queue를 구현해주지 않음을 이번에 처음 알았습니다. 후에 알고리즘 등 사용할 요소가 무궁무진하기에 이번에 공부를하게 되었습니다. 
 저는 두가지 배열을 사용하여 큐를 구현한 DoubleStackQueue를 구현해보았습니다. 그 이유로는, removeFirst()라는 배열의 메서드를 사용하여 간편하게 구현할 수 있었지만 복잡도가 n이라 좀 더 나은 방법이라고 많은 글에서 소개를하는 방법을 채택했습니다.
 다만 궁금한 점이 복잡도가 O(1)인 경우와 O(n)인 경우를 놓고 본다면 당연히 O(1)이 되도록 하는게 옳겠지만 이런 수준의 리팩토링이 **실제 어플리케이션에서 유의미한 성능 향상을 낼 수 있는지** 궁금했습니다. 

## STEP 1 배운개념
- Queue
- LinkedList
- TDD 

## STEP 1 Review
### TDD의 커밋
➡️ 저는 커밋은 유의미한 코드의 작성, 수정을 읽기 좋은 단위라고 생각합니다! 조금 애매하긴 한데, 남겨준 커밋들을 커밋단위로 확인했을 때, 읽기 좋은지 한번 확인해보면서 감을 잡아보면 좋을 것 같아요!

### Equtable
➡️ 저는 최소한의 Equatable 채택으로 하고 있습니다. Equatable을 채택하지 않고도 처리할 수 있다면 사용하지 않고 있습니다!

### Queue
➡️ 해당 코드가 사용되는 환경에 따라서 다를 것 같아요. 현업에서는 컬렉션의 크기가 정말 커질 수 있기 때문에 복잡도도 영향을 줍니다!


## STEP 1 Update
### 프로토콜 상속 수정 및 queue 타입 재정의
[코멘트](https://github.com/yagom-academy/ios-calculator-app/pull/235#pullrequestreview-976286140)

### 타입명시 제거, 테스트 케이스 수정, 은닉화, 파일분리, 
[코멘트](https://github.com/yagom-academy/ios-calculator-app/pull/235#pullrequestreview-975407522)


---------------------------------------------------------------

# [STEP 2]

## STEP 2 고민한점

### Class diagram을 보고 구현
이번 STEP을 구현하면서 가장 고민을 했던 부분은 **"이 메서드, 타입은 왜 있는거지...?"** 였습니다. 특히 `ExpressionParser`의 `componentsByOperater` 메서드가 가장 고민이 많이 되었습니다. formula가 실제 피연산자와 연산자를 각 큐에 배정하고 실제 수식을 연산을 한다면, `formula의 각 queue에 할당해주는 parse만 있으면 해결되는것 아닌가? 라고 생각했습니다.`

우선 UML그대로 구현하기 위해 
1. parse에서는 연산자와 피연산자 queue에 값을 삽입해준뒤 formula 인스턴스를 반환 formula 인스턴스를 반환
2. componentsByOperator에서는 operator별로 분할해주기 위해 operator를 추출

이렇게 두가지로 기능을 분리해보았습니다. 

**UML을 보고도 이해가 잘 되지 않는경우 Cory는 어떤식으로 해결하셨는지 궁금합니다.** 저는 제 나름대로 해석해서 작성하긴 했는데 이렇게 하는게 맞는 방법이라고는(맞는지를 떠나서 의도를 제 마음대로 해석했다 생각해서...)생각이 들지 않아 질문드립니다.

### character를 Operator 타입으로
Formula의 result() 메소드에서는 연산자와 피연산자를 순서대로 꺼내와 연산을 합니다. 각 요소는 LinkedList로 구현된 `Node<CalculatorItem>`타입이며 `Double`과 `Operator` 모두 CalculatorItem 프로토콜을 준수하고 있습니다.

저는 테스트를 위해 테스트코드를 아래와 같이 작성했습니다.
```swift
sut.operands.enQueue(15.0)
sut.operators.enQueue("+")
sut.operands.enQueue(9.0)
let result = sut.result()
XCTAssertEqual(result, 24.0)
```
Character타입을 가지고 Operator의 enum case를 유추해야하는 모순이 생겨서 이 부분을 어떻게 변경해야하나 고민했습니다. 

이 부분을 해결하려고 캐스팅을 여러가지로 시도하거나 CalculatorItemQueue를 수정해야하나 고민했는데 생각해보니 코드자체의 문제는 없었습니다. 
```swift
//given
sut.operands.enQueue(15.0)
sut.operators.enQueue(Operator.add)
sut.operands.enQueue(9.0)
//when
let result = sut.result()
//then
XCTAssertEqual(result, 24.0)****
```

애당초 연산자를 enQueue하는과정에서 Operator타입을 삽입하지 않고 Character를 삽입하고 있었습니다. 위의 코드대로라면 다시 매핑해주는 메서드가 필요했을것이라고 생각했습니다. 이 코드를 작성하면서 enQueue 파라미터에 대해 생각해 볼 수 있어서 Formula를 구현할 때 헤매지 않고 바로 작성할 수 있었던것 같습니다. 

자문자답을 해버린 내용이었지만 함수 파라미터로 프로토콜을 처음 사용해보느라 고민을 많이 해서 작성해보았습니다. 


### Error handling의 test
0으로 나누는 케이스를 테스트해주기 위해서 현재는 그냥 `debugPrint`를 사용했는데 에러 핸들링에 관련된 이렇게 하는게 맞는지, 아니면 throw를 상위개체로 전파하도록 구현해서 테스트코드에서 직접 do-try-catch로 해야하는지 아직 잘 모르겠습니다. 

추가로 명세서의 UML 대로라면 Error에 대한 enum을 사용하지 못하는건데(class상에서 관계가 없기 때문에 이렇게 생각했습니다), 그렇다면 이 부분은 UML에 없더라도 사용해도 되는건지, 아니면 제가 미리 변경한다고 말씀을 드렸어야 했을까요...?

## STEP 2 배운개념
- caseIterable 
- filter
- map
## STEP 2 Review

## STEP 2 Update
