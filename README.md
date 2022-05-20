# 계산기 프로젝트 (Finnn)

# 목차 📚
* [프로젝트 소개](#프로젝트-소개-📝)
* [UML](#UML)
* [[STEP 1] 기능구현 및 코드설명](#[STEP-1]-기능구현-및-코드설명-🧑‍🏫)
    * [[STEP 1] 고민한점 및 해결방안](#[STEP-1]-고민한점-및-해결방안-🤔)
    * [[STEP 1] 배운개념](#STEP-1-배운개념-💡)
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
- `LinkedList` : 이중 연결리스트 형태의 구조체
-> `pushBeforeHead` : head의 앞쪽으로 데이터를 추가하는 메서드
-> `pushAfterTail` : tail의 뒷쪽으로 데이터를 추가하는 메서드
-> `popHead` : head 위치의 데이터를 꺼내는 메서드
-> `popTail` : tail 위치의 데이터를 꺼내는 메서드
-> `peekHead` : head 위치의 데이터를 꺼내지 않고, 보여주기만 하는 메서드
-> `peekTail` : tail 위치의 데이터를 꺼내지 않고, 보여주기만 하는 메서드
-> `isEmpty` : 리스트가 비어있는지 확인하는 메서드
-> `remove(ofIndex:)` : 원하는 위치의 데이터를 제거하는 메서드
- `CalculatorItemQueue` : 선입선출 방식의 일반적인 큐 구조체
-> `push` : 큐에 데이터를 추가하는 메서드
-> `pop` : 선입선출 형태로 데이터를 꺼내는 메서드
-> `peek` : 데이터를 꺼내지 않고, 가장 먼저넣은 데이터를 보여주기만 하는 메서드
-> `isEmpty` : 리스트가 비어있는지 확인하는 메서드

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
- `Formula` : 식을 숫자와 연산자로 분리해서 갖는 구조체
-> `operands` : 수를 저장할 큐
-> `operators` : 연산자를 저장할 큐
-> `result()` : `operands` 큐와 `operators` 큐에 있는 값들로 결과를 계산해 리턴하는 메서드
- `ExpressionParser` : `String` 형태의 식을 `Formula` 형태로 바꿔주는 열거형
-> `parse(from:)` : `String` 타입의 값을 파라미터로 받아 `Formula` 형태로 반환해주는 타입 메서드
-> `componentsByOperators(from:)` : `String` 형태의 식을 연산자와 숫자로 분리해서 `[String]` 타입으로 반환해주는 메서드
- `Operator` : 연산자의 역할을 하는 열거형
-> `calculate(lhs:rhs:)` : 현재 열거형 case를 기준으로 결과를 계산해준다.
-> `add(lhs:rhs:)` : 두 값을 더하는 메서드
-> `substract(lhs:rhs:)` : 두 값을 빼는 메서드
-> `divide(lhs:rhs:)` : 두 값을 나누는 메서드
-> `multiply(lhs:rhs:)` : 두 값을 곱하는 메서드
- `String` : 스트링 타입을 확장하여 기능 추가
-> `split(with:)` : 현재 열거형 `case`를 기준으로 결과를 계산해준다.
- `LinkedListError` : `LinkedList` 타입에서 발생할 수 있는 에러
-> `listIsEmpty` : 값에 접근할 때 리스트가 비었을 경우 발생시킬 수 있다.
-> `indexOutOfRange` : 값에 접근할 때 인덱스가 범위를 초과할 경우 발생시킬 수 있다.
- `FormulaError` : `Formula` 타입에서 발생할 수 있는 에러
-> `notANumber` : 숫자를 0으로 나누려고 시도할 경우 발생시킬 수 있다.


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
