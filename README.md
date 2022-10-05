## iOS 커리어 스타터 캠프

### 계산기

# 목차
  
1. [제목](#제목)
2. [소개](#소개)
3. [팀원](#팀원)
4. [타임라인](#타임라인)
5. [프로젝트 구조](#프로젝트-구조)
6. [실행화면](#실행화면)
7. [트러블 슈팅](#트러블-슈팅)
8. [참고 링크](#참고-링크)

## 제목

- 계산기

## 소개

- 사용자가 숫자패드와 기호를 통해 입력한 값의 연산 결과를 출력하는 앱입니다.

## 팀원

| [Ayaan](https://github.com/oneStar92) |
|:---:|
|![](https://i.imgur.com/Unq1bdd.png)|

## 타임라인

- Step 1
    - `CalculatorItemQueue` Type 구현
    - Linked List 자료구조 구현
<details>
<summary>Details</summary>
    <div markdown="1">
        
- 2022.09.19
    - `CalculateItem`
    - `Node`
        - Linked List 구현.
    - `CalculateItemQueue`
        - `enqueue()`, `dequeue()` 자료 입출력 메소드 구현.
        - `peek()`, `clear()` 부가기능 구현.
    - Unit Test를 이용하여 TDD를 기반으로 코드 작성.
- 2022.09.20
    - `CalculateItemQueue`
        - 사용 요소가 `CalculateItem`프로토콜 준수하도록 구현.
- 2022.09.21
    - Unit Test 수정.
        - given, when, then가 명확하게 메소드에 표현되도록 수정.
        - `sut`, `setUpWithError`, `tearDownWithError`를 사용하여 좀더 깔끔한 코드 작성.
    </div>
</details>

- Step 2
    - `Operator` Type 구현.
    - `Formula` Type 구현.
    - `ExpressionPaser` Type 구현.
<details>
<summary>Details</summary>
    <div markdown="1">
        
- 2022.09.22
    - `Operator`
        - Case 구현.
        - `CaseIterable` 프로토콜 채택
        - 사칙연사을 수행하는 `calculate`메소드 구현
    - `Double`
        - `CalculateItem` 프로토콜 채택
- 2022.09.23
    - `String`
        - `split`메소드 오버로딩
- 2022.09.24
    - `Formula`
        - `result()` 메소드 구현.
    - `ExpressionParser`
        - `parse()` 메소드 구현.
        - `componentsByOperators()` 메소드 구현.
- 2022.09.27
    - `String`
        - `split`메소드 기능 수정
    - `Operator`
        - `rawValue` 수정.
    - `ExpressionParser`
        - `componentsByOperators()` 메소드 기능 수정.
- 2022.09.28
    - Test Case Method Naming 수정.
    - ExpressionParser Test Case 추가.

    </div>
</details>

- Step 3
    - `OperandButton` Type 구현
    - `OperatorButton` Type 구현
    - `CommandButton` Type 구현
    - `NumberLabel` Type 구현
    - `OperatorLabel` Type 구현
    - `FormulaStackView` Type 구현
    - `CalculatorNumberFormatter` Type 구현
    - `InitializationProtocol` 구현
    - `IBOutlet`, `IBAction`을 통한 VC기능 구현
<details>
<summary>Details</summary>
    <div markdown="1">
        
- 2022.09.30
    - `OperandButton` Type 구현
        - `UIButton`을 상속
        - `number` 연산 프로퍼티 구현.
    - `OperatorButton` Type 구현
        - `UIButton`을 상속
        - `operatorSign` 연산 프로퍼티 구현.
    - `CommandButton` Type 구현
        - `UIButton`을 상속
        - `command` 연산 프로퍼티 구현.
    - `NumberLabel` Type 구현
        - `InitializationProtocol`을 채택
        - `append()`, `appendDecimalPoints()`, `swapNumberSign()` 메소드 구현.
    - `OperatorLabel` Type 구현
        - `InitializationProtocol`을 채택
    - `FormulaStackView` Type 구현
        - `InitializationProtocol`을 채택
        - `appendFormula()` 메소드 구현
    - `CalculatorNumberFormatter` Type 구현
        - `NumberFormatter`를 사용하기 위한 Singleton Patten 구현.
    - `InitializationProtocol` 구현
        - View의 초기화를 일괄 처리하기 위환 프로토콜
    - `IBOutlet`, `IBAction`을 통한 VC기능 구현
        - 버튼, 레이블, 스택뷰의 기능 구현.
    </div>
</details>
  
## 프로젝트 구조

- 자료 구조.

![](https://raw.githubusercontent.com/oneStar92/ios-calculator-app/Step_2/CalculateItemQueue_ClassDiagram.png)


## 실행화면

|1번|2번|3번|
|---|---|---|
|![](https://i.imgur.com/TCo5oVw.gif)|![](https://i.imgur.com/HOw8Uka.gif)|![](https://i.imgur.com/aWDMBmc.gif)|



  

## 트러블 슈팅

### List 자료구조 선택.

- Queue: FIFO 방식으로 데이터를 입출력하는 자료구조.
- Queue를 어떤 List를 통하여 구현할지에 대한 많은 고민을 했습니다.
    - Array: 연속된 메모리 공간에 요소를 순차적으로 저장하는 자료 구조입니다.
        - index를 통해 요소에 접근가능합니다.
    - Linked List: 각각의 요소가 다음 요소의 주소를 가지고 있는 자료 구조입니다.
    - Doubly Linked List: 양방향으로 연결된 Linked List로 각각의 요소는 이전/다음 요소의 주소를 가지고 있는 자료 구조입니다.
    - 시간 복잡도
        - Array: FIFO 방식으로 추가는 O(1), 삭제는 O(n)
        - Linked List: FIFO 방식으로 추가는 O(1), 삭제는 O(1)
        - Doubly Linked List: FIFO 방식으로 추가는 O(1), 삭제는 O(1)

- **결론**
: Array의 경우 삭제가 O(n)의 시간 복잡도를 나타냄으로 후보에서 제외하였습니다. Linked List와 Doubly Linked List는 단방향과 양방향 연결의 차이를 나타내고 있고 이러한 차이점에 의해 검색 및 요소에 접근성은 Doubly Linked List가 더 유리합니다. 하지만 본 프로젝트에서는 요소에 접근하는 경우가 없다고 판단하여 더 가벼운 Linked List를 선택하였습니다.
    
### TDD.

- TDD: 테스트 주도 개발로 Unit Test를 진행하면서 개발을 하는 방식입니다. Red -> Green -> Blue 단계로 진행하여야 합니다.
    - Red: 테스트가 실패하는 단계
    - Green: 테스트를 통과하기 위해 최소한의 구현
    - Blue: Retactoring을 통해 코드를 정리.

- TDD를 사용해서 개발을 하는 것이 생각보다 까다로웠습니다. 어떠한 테스트 케이스를 테스트 해야되는지도 감을 잡지 못했고, Red 단계에선 어느정도 수준의 코드를 작성하고 해야 되는지도 햇갈렸습니다.
- 여러 캠퍼들과 토론한 끝에 아무것도 없는 상황에서 테스트 케이스를 먼저 작성한 후 테스트를 통과하기 위한 최소한의 코드를 작성하는 방법으로 TDD를 수행했습니다.

### NumberFormatter 사용시 중복된 코드.

- `NumberFormatter`는 필요한 View마다 생성한 후 원하는 Formatte으로 설정해야 합니다. 그럼으로 많은 중복된 코드를 작성해야 됐습니다.
- 위와 같은 문제를 해결하고자 NumberFormatter를 소유한 Singleton Patten의 객체를 생성하여 이를 이용하여서 중복된 코드 없이 `NumberFormatter`를 사용하도록 했습니다.


### NumberFormatter 사용시 발생하는 문제.

- `NumberFormatter`: 숫자와 텍스트를 서로 변환하는 지정한 조건에 맞게 변환해주는 포맷터입니다.
    - `numberStyle`: `.decimal` 3자리 마다 ','를 표시해주는 스타일 입니다.
    - `roundingMode`: `.halfUp` 지정한 소수점 자리 밑은 반올림 합니다.
    - `usesSignificantDigits`: 유효 자릿수 지정을 사용할 지 여부를 나타냅니다.
    - `maximumSignificantDigits`: 최대 유효 자릿수를 지정합니다.
- `NumberFormatter`의`String(for: )`메소드를 사용하여 숫자를 위에 조건에 맞는 문자열로 반환해 주는 메소드 입니다. 해당 메소드를 사용하여 ','가 포함된 숫자를 사용해게 되면 `Double`형으로 타입 캐스팅이 불가능하는 문제가 발생하였습니다.
- 해당 문제를 해결하고자`Double`형으로 타입 캐스팅이 필요한 경우엔 타입 캐스팅을 하기전에 `filter()`메소드를 이용하여서 해당 문자열에서 ','를 제거하여 `Double`타입으로 타입 캐스팅을 했습니다.


### 초기화

- AC와 CE등 각종 초기화를 수행할때마다 해당 기능을 하는 메소드를 뷰마다 호출해야되는 현상이 발생했습니다. 
- 이러한 중복된 코드를 해결하고자 초기화가 필요한 타입은 `InitializationProtocol`을 채택한 후 `Initialization()` 메소드를 정의했습니다. 이를 바탕으로 Main VC에서 해당 프로토콜을 채택한 타입을 Array로 저장하였고 `forEach`문을 사용해 간단하게 초기화를 하도록 했습니다.


## 참고 링크
https://developer.apple.com/documentation/swift/caseiterable
https://ko.wikipedia.org/wiki/%ED%85%8C%EC%8A%A4%ED%8A%B8_%EC%A3%BC%EB%8F%84_%EA%B0%9C%EB%B0%9C
https://en.wikipedia.org/wiki/Queue
https://ko.wikipedia.org/wiki/%EC%97%B0%EA%B2%B0_%EB%A6%AC%EC%8A%A4%ED%8A%B8
https://en.wikipedia.org/wiki/Doubly_linked_list
https://developer.apple.com/documentation/uikit/uibutton
https://developer.apple.com/documentation/uikit/uilabel
https://developer.apple.com/documentation/uikit/uistackview
https://developer.apple.com/documentation/uikit/uiscrollview
https://developer.apple.com/documentation/foundation/numberformatter
