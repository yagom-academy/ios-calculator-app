# 계산기 프로젝트 (Finnn)

# 목차 📚
* [프로젝트 소개](#프로젝트-소개-📝)
* [UML](#UML)
* [[STEP 1] 기능구현 및 코드설명](#[STEP-1]-기능구현-및-코드설명-🧑‍🏫)
    * [[STEP 1] 고민한점 및 해결방안](#[STEP-1]-고민한점-및-해결방안-🤔)
    * [[STEP 1] 배운개념](#[STEP-1]-배운개념-💡)
* [[STEP 2] 기능구현 및 코드설명](#[STEP-2]-기능구현-및-코드설명-🧑‍🏫)
    * [[STEP 2] 고민한점 및 해결방안](#[STEP-2]-고민한점-및-해결방안-🤔)
    * [[STEP 2] 배운개념](#[STEP-2]-배운개념-💡)
* [[STEP 3] 기능구현 및 코드설명](#[STEP-3]-기능구현-및-코드설명-🧑‍🏫)
    * [[STEP 3] 고민한점 및 해결방안](#[STEP-3]-고민한점-및-해결방안-🤔)
    * [[STEP 3] 배운개념](#[STEP-3]-배운개념-💡)
<br/>

# 프로젝트 소개 📝
> 언제나 사용하던 계산기를 직접 구현해보는 프로젝트입니다.

<br/>

# UML 📊
### [STEP 1]
<img width="80%" src="https://user-images.githubusercontent.com/87175392/168752068-44c4ee85-e427-4444-ba51-5603cb869289.jpg"/>

<br/>
<br/>

---

### [STEP 2]
![Untitled Diagram-15](https://user-images.githubusercontent.com/87175392/169507676-dfba1e8b-b496-42d4-b893-75b15ee8571f.jpg)

<br/>

---

# [STEP 1] 기능구현 및 코드설명 🧑‍🏫
* `LinkedList` : 이중 연결리스트 형태의 구조체
    * `pushBeforeHead` : head의 앞쪽으로 데이터를 추가하는 메서드
    * `pushAfterTail` : tail의 뒷쪽으로 데이터를 추가하는 메서드
    * `popHead` : head 위치의 데이터를 꺼내는 메서드
    * `popTail` : tail 위치의 데이터를 꺼내는 메서드
    * `peekHead` : head 위치의 데이터를 꺼내지 않고, 보여주기만 하는 메서드
    * `peekTail` : tail 위치의 데이터를 꺼내지 않고, 보여주기만 하는 메서드
    * `isEmpty` : 리스트가 비어있는지 확인하는 메서드
    * `remove(ofIndex:)` : 원하는 위치의 데이터를 제거하는 메서드
* `CalculatorItemQueue` : 선입선출 방식의 일반적인 큐 구조체
    * `push` : 큐에 데이터를 추가하는 메서드
    * `pop` : 선입선출 형태로 데이터를 꺼내는 메서드
    * `peek` : 데이터를 꺼내지 않고, 가장 먼저넣은 데이터를 보여주기만 하는 메서드
    * `isEmpty` : 리스트가 비어있는지 확인하는 메서드

<br/>

# [STEP 1] 고민한점 및 해결방안 🤔
## 고민한점
### 1. Unit Test의 단위
TDD 방식을 이번에 처음 경험해봐서, 테스트 케이스를 어느 정도로 세분해야 되는지 고민했습니다. 고민 끝에 UML을 먼저 작성한 후, 해당 UML에 맞춰 테스트 케이스를 작성하는 방법으로 결정했습니다.
<br/>

### 2. 리스트의 기능구현
요구사항에 이번 스탭에서 리스트와 큐의 내부구현이 자율로 되어있어, 어느정도의 기능까지 구현해야할지 고민이 되었습니다. UML을 작성하며, 기능들을 추리는 방법으로 구현했습니다.
<br/>

# [STEP 1] 배운개념 💡

- `Sequence, IteratorProtocol` : 일반적인 컬렉션타입 처럼 반복문과 같은 기능들을 사용할 수 있도록 해준다.
- `ExpressibleByArrayLiteral` : [1, 2, 3] 과 같은 배열리터럴 형태를 사용할 수 있도록 해준다.
- `CustomStringConvertible, CustomDebugStringConvertible` : print() 및 dump() 등 디버그 상황에서 출력되는 데이터를 설정할 수 있다.

<br/><br/>

# [STEP 2] 기능구현 및 코드설명 🧑‍🏫
* `Formula` : 식을 숫자와 연산자로 분리해서 갖는 구조체
    * `operands` : 수를 저장할 큐
    * `operators` : 연산자를 저장할 큐
    * `result()` : `operands` 큐와 `operators` 큐에 있는 값들로 결과를 계산해 리턴하는 메서드
* `ExpressionParser` : `String` 형태의 식을 `Formula` 형태로 바꿔주는 열거형
    * `parse(from:)` : `String` 타입의 값을 파라미터로 받아 `Formula` 형태로 반환해주는 타입 메서드
    * `componentsByOperators(from:)` : `String` 형태의 식을 연산자와 숫자로 분리해서 `[String]` 타입으로 반환해주는 메서드
* `Operator` : 연산자의 역할을 하는 열거형
    * `calculate(lhs:rhs:)` : 현재 열거형 case를 기준으로 결과를 계산해준다.
    * `add(lhs:rhs:)` : 두 값을 더하는 메서드
    * `substract(lhs:rhs:)` : 두 값을 빼는 메서드
    * `divide(lhs:rhs:)` : 두 값을 나누는 메서드
    * `multiply(lhs:rhs:)` : 두 값을 곱하는 메서드
* `String` : 스트링 타입을 확장하여 기능 추가
    * `split(with:)` : 현재 열거형 `case`를 기준으로 결과를 계산해준다.
* `LinkedListError` : `LinkedList` 타입에서 발생할 수 있는 에러
    * `listIsEmpty` : 값에 접근할 때 리스트가 비었을 경우 발생시킬 수 있다.
    * `indexOutOfRange` : 값에 접근할 때 인덱스가 범위를 초과할 경우 발생시킬 수 있다.
* `FormulaError` : `Formula` 타입에서 발생할 수 있는 에러
    * `notANumber` : 숫자를 0으로 나누려고 시도할 경우 발생시킬 수 있다.


<br/>

# [STEP 2] 고민한점 및 해결방안 🤔
## 고민한점
### 1. Operator 열거형의 메서드의 필요성
`Operator` 열거형의 `add(lhs:rhs:)`, `substract(lhs:rhs:)`, `divide(lhs:rhs:)`, `multiply(lhs:rhs:)` 메서드를 보고 기능이 굉장히 한정적인데 왜 필요한 것인지 고민했었습니다. 리뷰어인 하리보와 이야기한 결과 추후에 기능이 많아질 경우 역할을 메서드 단위로 나누어서 가독성 및 유연성을 향상시키기 위한 것이라는 것을 알게되었습니다.
<br/>

### 2. 메서드만 존재하는 ExpressionParser 열거형에 대한 고민
요구사항에는 `ExpressionParser` 타입은 열거형임에도 불구하고 별도의 `case`가 존재하지 않고 메서드만 존재했습니다. 해당 타입 안에 있는 메서드를 외부에서 어떻게 사용할 수 있을지 고민한 끝에, 해당 메서드 들을 타입 메서드로 정의하는 방식으로 해결했습니다.
<br/>

# [STEP 2] 배운개념 💡

- `replacingOccurrences(of:with:)` : 문자열을 특정한 문자가 존재할 경우 해당 문자를 원하는 문자로 바꾸어 준다.
- `components(separatedBy:)` : 문자열을 원하는 문자를 기준으로 나누어 배열형태로 반환해 준다.

<br/><br/>

<br/><br/>

# [STEP 3] 기능구현 및 코드설명 🧑‍🏫
### ViewController
> **Properties**
> - operandLabel : 
> 피연산자(숫자)가 표시될 `Label`입니다.
> - operandLabel : 
> 연산자가 표시될 `Label`입니다.
> - calculatingScrollView :
> 연산들이 쌓일 `ScrollView` 입니다.
> - formula :
> 식을 저장할 변수입니다.
> - mainStackViewInCalculatingScrollView :
> 연산들이 쌓일 `ScrollView` 를 보니 안에 `StackView`가 하나 있고, 그 안에 또 `StackView`를 만들어서 연산자와 피연산자 `Label`을 넣어둔 형식이었습니다. 이 때문에 `ScrollView` 바로 안에 있는 `StackView`에 빠르게 접근하기 위해서 변수로 따로 만들어서 할당해 두었습니다.

> **Helpers**
> - resetUI() :
> `viewDidLoad()` 메서드에서 호출되어 UI를 세팅할 때 사용할 메서드입니다. All-Clear 버튼을 눌러도 호출이 되도록 해놓았습니다.
> - scrollToBottom(of:) :
> `calculatingScrollView` 에 연산 결과가 많이 쌓일 경우, 가장 아래로 스크롤 해주기 위한 메서드입니다.

### StackViewManager
> - makeNewCalculateLabels(of:operandText:) : 
> `calculatingScrollView` 안에 쌓을 `Label` `StackView`를 만들어주는 메서드입니다.
> - addCalculateLabels(to:operatorText:operandText:) : 
> `makeNewCalculateLabels(of:operandText:)` 에서 만들어진 `StackView`를 `ScrollView` 에 넣어주는 역할을 하는 메서드입니다.

### Double+Extension
> - removeTrailingZero() : 
> `Double` 타입 인스턴스 값에서 뒤에 0을 제거한 후, `String` 타입으로 반환해주는 메서드입니다.


<br/>

# [STEP 3] 고민한점 및 해결방안 🤔
### 1. parse 메서드를 호출하는 시점...
프로젝트 요구사항에 대한 이해도가 부족하여 `ExpressionParser` 열거형 안에 있는 `parse` 메서드를 언제 호출할지 많은 시간을 고민했습니다. 처음에는 눌린 버튼들을 `String` 형태로 `append` 해서 계산버튼(`=`) 이 눌렸을 때 한번에 전달해주는 방식으로 고민했었습니다. 하지만 이렇게 구현했을 때 부호버튼(`+/-`) 및 버튼이 눌릴때 마다 `ScrollView에` 값들을 쌓아주는 과정에서 어려움을 겪어, 연산자 버튼이 눌릴때마다 `parse` 메서드를 호출하는 방식으로 바꾸어보았습니다 ☺️
<br/>

### 2. Double Extension 을 어디에 활용하면 좋을지...
프로젝트의 요구사항에 보면 UML에 `Double` 타입을 확장하라고 적혀있었지만, 구현 내용에 대해서는 자세히 적혀있지 않아서 이 부분을 어떻게 활용하면 좋을지 고민했었습니다. 고민 끝에 계산 결과를 출력해줄 때 `Double` 타입의 값을 `formatting` 해주는 메서드를 확장으로 구현해서 활용해보았습니다 😊

<br/>

# [STEP 3] 배운개념 💡

- `setContentOffset(_:animated:)` : 콘텐츠를 위치를 원하는 `Offset`으로 세팅할 수 있다. `ScrollView` 에서 사용하면 스크롤이 되는 느낌으로 사용할 수 있다고 함.

<br/><br/>
