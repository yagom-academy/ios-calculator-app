# 🧮 계산기 프로젝트
>프로젝트 기간: 2022-09-19 ~ 2022-09-30

## 📑 프로젝트 소개
- 기존의 사칙연산 법칙을 배제하고 계산기 앱을 제작해보는 개인 프로젝트 입니다.
- UML, Unit Test, TDD, 자료구조의 개념을 기반으로 제작했습니다.

<img height = 21px, src = "https://img.shields.io/badge/swift-5.6-green">
<img height = 21px, src = "https://img.shields.io/badge/Xcode-13.4-blue">  

## 🔖 1. 순서도
- **Step1**
<img width = 800px, src = "https://i.imgur.com/Z4Tvo3W.jpg">

- **Step2**
<img width = 900px, src = "https://i.imgur.com/pR4mLKv.png">


---

## ⏱ 2. 타임라인
- **2022.09.19**
  - STEP1 요구사항에 따른 UML 작성

- **2022.09.20**
  - STEP1 UML 기반의 타입 정의
  - TDD 테스트 진행
  - 타입 내 프로퍼티 및 메서드 정의
  - PR 발송

- **2022.09.21**
  - 리뷰 대기 및 STEP2 UML 기반의 타입 정의

- **2022.09.22**
  - STEP2 UML기반의 타입 내 메서드 및 프로퍼티 선언부 작성

- **2022.09.23**
  - STEP1 README.md</b> 작성

- **2022.09.26**
  - STEP2 기능 수행을 위한 메서드 구현부 작성
   ![](https://i.imgur.com/IuM2kiR.png)

- **2022.09.27**
  - STEP2 기능 수행을 위한 메서드 구현부 작성
  - TDD 테스트 진행
   ![](https://i.imgur.com/anRBT2p.png)

- **2022.09.28**
  - STEP2 코드 리팩토링
   ![](https://i.imgur.com/1JRRTg2.png)
  - PR 발송

- **2022.09.29**
  - STEP3 기능 구현을 위한 ViewController 프로퍼티 및 메서드 선언부 작성

- **2022.09.30**
  - STEP2 README.md</b> 작성
---

## 💻 3. 기능 설명(실행 화면)
#### [STEP 1]
- 이번 프로젝트에서는 모든 연산 데이터가 지워지거나, 경우에 따라 마지막 연산 데이터가 지워지는 형식으로 구현됩니다.
- 이를 연결리스트로 작성하면 모든 연산 데이터가 지워지는 경우에는 head만 삭제해주면 되기때문에 O(1)의 시간복잡도를 가지게 됩니다.
- 하지만,  마지막 연산 데이터가 지워지는 경우 역시 존재하게 됩니다. 이 경우에는 연결리스트의 마지막 데이터인 tail 데이터를 수정하면 완료될 수 있도록 구현하여 시간복잡도 O(1)의 용이함을 가질 수 있도록 하였습니다.

#### [STEP 2]
- UML에 따라 연산 기능을 제공하기 위한 타입들을 구현하였습니다.
- `ExpressionParser`
  - `parse(from:)`: input을 받아 `operands`와 `operators`를 구분해 `Formula` 타입의 인스턴스를 생성하는 메서드
  - `componentsByOperators(from:)`: input에서 연산자를 필터링하여 `operands`를 반환하는 메서드
- `Formula`: `operands`와 `operators` 프로퍼티의 연산 결과를 반환하는 `result()` 메서드를 가집니다.
- `CalculateItemQueue`: 연결리스트 타입을 프로퍼티로 가지며, `enqueue`, `dequeue`, `removeAll`의 메서드를 가집니다.
- `LinkedList`: `value`와 `next`(다음 노드의 주소값) 프로퍼티를 포함한 노드를 가지며, 명확한 개념 확립을 위해 tail을 가지지 않는 기본적인 단방향 연결 리스트로 리팩토링하였습니다.
- `Operator`: case 별 연산 결과를 반환할 수 있도록 구현하였습니다.

---

## 🚀 4. 트러블 슈팅
#### [STEP 1]
- **문제 👻**
 : `LinkedList` 타입에 외부에서 직접적으로 접근하는 상황을 방지하고자 은닉화를 위해 `CalculatorItemQueue` 타입의 `list` 프로퍼티와 `LinkedList` 타입에 접근제어를 하려고 하였습니다. 
 하지만 TDD 테스트 시에도 `LinkedList` 타입에 접근이 불가능한 문제가 발생하였습니다. 
 이로 인해 TDD 테스트가 끝난 후, 타입을 다시 은닉화 하는 방식으로 리팩토링하였습니다.
- **해결 🔫**
: `CalculatorItemQueue` 타입은 `LinkedList` 타입의 `list` 프로퍼티를 가지고 있고, `CalculatorItemQueue` 타입의 메서드는 `list` 프로퍼티로 실행가능한 메서드(`LinkedList` 타입 안에 정의된 인스턴스 메서드)를 호출하고 있었습니다.
이런 경우, `CalculatorItemQueue` 타입의 메서드만을 테스트 해도 그 메서드가 호출하는 메서드까지 test coverege가 채워진다는 것을 알게 되었습니다. 
결국, `CalculatorItemQueue` 타입만을 테스트 해도 coverege에는 문제가 없기 때문에 `LinkedList` 타입은 다시 접근제어 하는 것으로 해결하였습니다.

#### [STEP 2]
- **문제 👻**
  : UML로만 메서드 별 기능을 파악하여 구현하는데에 어려움이 있었습니다. 특히 `ExpressionParser` 타입의 기능을 이해하는데에 고민이 있었습니다.
- **해결 🔫**
  : `componentsByOperators(from:)` 는 폐쇄적인 메서드이기에 동일한 타입(혹은 소스파일) 내에서만 사용하는 것으로 `parse(from:)` 메서드 내부에서 사용한다고 이해하였습니다. 
  따라서 아래와 같이 메서드 기능을 구현해 해결하였습니다.
  - `parse(from:)`: 매개변수로 받아온 input에서 연산자를 필터링하고, `componentsByOperators(from:)` 메서드의 반환값으로 연산될 수를 확인하여 `Formula` 타입의 인스턴스를 반환하는 메서드
  - `componentsByOperators(from:)`: 매개변수로 받아온 input을 연산자 기준으로 구분하여 연산될 수만 `[String]` 타입으로 반환하는 메서드
#####
- **문제 👻**
  : 기존에는 `Formula`타입의 `result()`메서드에서 `Operator` case 별로 `calculate()` 메서드가 수행될 수 있도록 `switch` 문으로 분기처리를 해주었습니다.
하지만, Before 코드는 코드의 중복도가 높고 가독성이 좋지않을 뿐만 아니라 의미없는 `default`문까지 사용하게 되어 개선 방법을 고민하게 되었습니다.
- **해결 🔫**
  : 0으로 나누는 경우는 따로 에러를 던질 수 있게 `if` 문으로 분기처리를 하였고, 그 외의 경우에는 `OperatorCase` 상수에 담긴 `Operator` 타입의 case 값에 따라 `calculate()`가 실행될 수 있도록 수정하였습니다.
  ```swift
  // Before
  switch Character(calculatedOperator.value) {
    case Operator.add.rawValue:
        result = Operator.add.calculate(lhs: result, rhs: nextOperand.value)
    case Operator.subtract.rawValue:
        result = Operator.subtract.calculate(lhs: result, rhs: nextOperand.value)
    case Operator.divide.rawValue:
        guard nextOperand.value != 0 else {
            throw CalculationError.dividedZero
        }
        result = Operator.divide.calculate(lhs: result, rhs: nextOperand.value)
    case Operator.multiply.rawValue:
        result = Operator.multiply.calculate(lhs: result, rhs: nextOperand.value)
    default:
        print("잘못된 연산자")
  }

  // After
   if operatorCase == Operator.divide, nextOperand.value == 0 {
    throw CalculationError.dividedZero
   } else {
    result = operatorCase.calculate(lhs: result, rhs: nextOperand.value)
    calculationCount += 1
    currentOperand = currentOperand?.next
    currentOperator = currentOperator?.next
   }
  ```
---

## 📎 5. 참고 링크
- [Swift Language Guide - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [야곰 닷넷 - Unit Test 작성하기](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/)
- [UML: 클래스 다이어그램과 소스코드 매핑](https://www.nextree.co.kr/p6753/)
