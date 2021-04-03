## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

## 1주차 (21.03.22(월) ~ 21.03.27(토))

### 초기 설계

<img width="828" alt="2021-03-24_5 00 46" src="https://user-images.githubusercontent.com/55218398/112719014-d8509680-8f39-11eb-92a4-c239d3c5a2c4.png">

#### [Step 1]

계산기를 먼저 구현하기 전에 계산기모델을 설계하는 것이 중요하다는 생각이 들어서 위와 같이 간단한 UML을 만들어보았습니다.<br>
저희가 생각한 모델은 Calculator프로토콜을 만든 뒤 모든 Calculator의 공통기능을 가진 메서드를 구현한 다음 2진법계산기클래스와 10진법계산기클래스가 해당 프로토콜을 채택하여 계산기로서의 기능을 부여받도록 설계하였습니다. <br>
그 후, 각각의 계산기가 가져야만 하는 고유기능을 각각의 클래스에 추가해주었습니다.<br>
계산기에 대한 전반적인 설계가 끝난 뒤, 어떤 데이터구조가 유저입력을 받고 그 연산을 하기에 효율적인 그릇일지 고민해 보았고 고심끝에 저희는 Stack을 채택하였습니다.<br>

- `Stack`을 채택한 이유 : 연산자와 피연산자를 입력 받고 연산을 한 뒤 불필요한 요소를 제거해야 하는데 Stack이 일반 배열에 비해 추가,삭제가 좀 더 효율적이기 때문에 



### 구현 내용
- 중위표기법을 후위표기법으로 변환하는 기능 구현
- 10진계산기 기능 중 +, -, 초기화 기능 구현
- 2진 계산기 기능 중 AND, NAND, OR, NOR, XOR, NOT, Left Shift, Right Shift, +, - 



### 계산기 알고리즘

```swift
   func convertToPostfixNotation() {
        if operatorPriority.keys.contains(medianNotation.last!) {
            medianNotation.removeLast()
        }
        for element in medianNotation {
            distinguishOperatorFromOperand(element)
        }
        appendRemainingOperators()
        calculatePostfixNotation()
    }
    
    private func distinguishOperatorFromOperand(_ element: String) {
        if operatorPriority.keys.contains(element) {
            pushPriorOperator(element)
        } else {
            postfixNotation.append(element)
        }
    }
    
    private func pushPriorOperator(_ element: String) {
        if operatorStack.isEmpty() {
            operatorStack.push(element)
        } else {
            guard let peeked = operatorStack.peek() else { return }
            while operatorPriority[peeked.value]! >= operatorPriority[element]! {
                guard let popped = operatorStack.pop() else { break }
                postfixNotation.append(popped.value)
            }
            operatorStack.push(element)
        }
    }
```

컴퓨터가 다항식계산을 할 수 있도록 차례차례로 입력받은 식을 중위표기법에서 후위표기법으로 변환한 뒤 계산을 진행하는 코드를 작성하였습니다.<br>
중위표기법 순서에 따라 담긴 데이터를 순회하면서 각각의 요소가 피연산자일경우에는 postfixNotation에 담아주고 연산자일 경우에는 operateStack에 push를 해줍니다.<br>
연산자를 operatorStack에 push해줄 때는 우선순위를 비교한 뒤, 현재 Stack에 존재하는 연산자가 새로 들어올 연산자의 우선순위와 같거나 높을 경우 Stack에 존재하는 연산자를 pop해준 뒤 postfixNotation에 담아줍니다. 데이터 순회가 끝난 뒤, 만약 그 Stack에 연산자가 남아있다면 차례로 pop해서 postfixNotation에 넣어줍니다.<br>
후위표기법으로 변환한 다음 calculatePostfixNotation메소드를 통해 순서대로 후위표기법에 따른 계산을 진행합니다.<br>

### Trouble Shooting

10진법계산에 사용했던 알고리즘에 큰 변화를 주지 않고 재사용을 하면 좋다고 생각했기에 Int타입으로 입력을 받고 연산을 한 뒤 UInt8타입으로 변환을 하여 2진법계산을 구현하려 하였습니다. 
후위표기법 변환까지는 문제가 없었는데 변환 한 뒤 연산을 하려니 NOT연산, NOR연산, NAND연산이 제대로 작동하지 않았습니다. 고심 끝에 아래와 같은 방법으로 이 문제를 해결하였습니다.

CustomOperator(사용자 정의 연산자)

```swift
  // MARK: NAND, NOR Operator
  
  infix operator ~& : MultiplicationPrecedence
  infix operator ~| : AdditionPrecedence

  func ~& (lhs: UInt8, rhs: UInt8) -> UInt8 {
      return ~lhs | ~rhs
  }

  func ~| (lhs: UInt8, rhs: UInt8) -> UInt8 {
      return ~lhs & ~rhs
  }
```

NAND와 NOR연산을 하기위해 직접 해당 연산자를 구현한 뒤, 2진법연산에 사용하였습니다.<br> 
하지만 제대로 작동하지 않아 문서를 찾아보니 ~연산자는 UInt타입에서 밖에 사용할 수 없다는 것을 알게 되었습니다. 그렇기 때문에 해당연산을 할 경우 연산을 하기 전 UInt8로 변환을 한 뒤, 연산을 하도록 코드를 작성하여 문제를 해결하였습니다.<br>

### 해결되지 않은 부분

- 2진법계산부분이 비효율적이여서 로직을 수정하고 리팩토링이 필요합니다. 
- Primitive Type(원시타입)의 많은 사용이 있어서 해당 부분에 대한 개선이 필요합니다.



## 2주차 (21.03.29(월) ~ 21.04.03(토))

#### [Step1] 1주차에 받은 피드백: 

- 우선순위를 비교를 프로토콜을 활용하여 개선
- 중복되는 코드 제거 및 타입 분리
- 상위 타입 그리고 하위 타입 명령체계 확립 [객체지향적으로 설계 수정]



이와 같은 피드백을 받고 저희가 수정한 계산기 모델 설계도는 아래와 같습니다.

<img width="926" alt="2021-04-01_2 46 14" src="https://user-images.githubusercontent.com/69072471/113469196-bea5d680-9486-11eb-9a2a-8bbff3d5ba98.png">

해당 설계도에 따른 동작방법은 아래와 같습니다.

- `InputDatavalidation` 클래스를 통해 유저입력을 받아 중위표현식으로 만든 뒤 `Data`에 저장합니다.

- `GeneralCalculator`에서 해당 데이터를 받아 중위표현식을 후위표현식으로 변환한 뒤 `Data`의 `postfixNotation`에 저장합니다.
- `GeneralCalculator`는 `executeDecimalCalculation()` 또는 `executeBinaryCalculation()`메서드를 통해 10진법 계산기 또는 2진법 계산기의 `calculatePostFixNotation()`메서드를 실행시킵니다.
- 각 계산기는 2진연산 그리고 10진 연산을 실행하여 결과값을 반환합니다.



**계산기를 좀 더 체계적이게 구현하기 위해 몇 가지 수정을 거쳤습니다.**

### 개선 내용

1. `Comparable` 프로토콜을 채택하였습니다.

```swift
enum Precedence {
  case bitwisePrecedence
  case multiplicationPrecedence
  case additionPrecedence
}

extension Precedence: Comparable {
  static func < (lhs: Precedence, rhs: Precedence) -> Bool {
    switch (lhs, rhs) {
      case (.bitwisePrecedence, .multiplicationPrecedence), (.bitwisePrecedence, .additionPrecedence), (.multiplicationPrecedence, .additionPrecedence):
      return false
      default:
      return true
    }
  }

  static func == (lhs: Precedence, rhs: Precedence) -> Bool {
    switch (lhs, rhs) {
      case (.bitwisePrecedence, .bitwisePrecedence), (.multiplicationPrecedence, .multiplicationPrecedence), (.additionPrecedence, .additionPrecedence):
      return true
      default:
      return false
    }
  }
}
```

기존에는 우선순위가 높은 연산자에게 더 높은 `Int`타입의 값을 원시값을 할당하는 방식으로 연산자의 우선순위를 비교하였습니다. 그런데 이 방법은 코드만 봤을 때 각 연산자의 우선순위를 정확하게 파악하기 어려웠습니다. 피드백을 반영하여 저희는 `Comparable` 프로토콜을 채택하였습니다. 각각의 연산자의 우선순위를 [애플공식문서](https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations)에서 파악한 뒤 임의로 각각의 우선순위를 지정 해 주었습니다.



2. 데이터를 타입 프로퍼티로 선언

```swift
class Data {
	static var medianNotation: [String] = []
  static var postfixNotation: [String] = []
}
```

연산자와 피연산자를 담을 배열을 타입프로퍼티로 생성하였습니다. 표기 변환이 끝나면 해당 타입프로퍼티에 데이터를 담도록 설정하였고 담긴 값을 활용하여 연산을 진행할 수 있게 하였습니다. 타입프로퍼티를 사용하니 각각의 클래스내에 별도의 인스턴스 생성을 하지 않아도 되어서 매우 편리하다는 점이 가장 큰 장점이라고 생각됩니다.



3. 일반계산기와 계산기 모듈의 명령체계 확립

```swift
class GeneralCalculator {
  var decimalCalcualtion = DecimalCalculation()
  .
  .
  .
  func executeDecimalCalculation() {
  	if Operators.list.contains(Data.medianNotation.last!) {
      Data.medianNotation.removeLast()
    }
    for element in Data.medianNotation {
      distinguishOperatorFromOperand(element)
    }
    appendRemainingOperators()
    decimalCalcualtion.calculatePostfixNotation()
  }
}
```

기존 `DecimalCalculation` 클래스와 `BinaryCalculation`클래스 내에 존재하는 프로퍼티와 메서드는 많이 중복되었습니다. 이를 개선하기 위해 중복되는 부분을 일반계산기의 메서드로 통합한 뒤 위와 같이 2진계산 그리고 10계산에 꼭 필요한 기능을 일반계산기의 메서드를 통해 호출하도록 설계를 하였습니다. 위와 같은 방식으로 상위 타입과 하위 타입을 분리하였습니다.



### Trouble Shooting

```swift
let operatorPriority: [String : precedence] = ["*" : 3, "/" : 3, "+" : 2, "-" : 2, "(" : 1]
```

유저입력값으로 받는 것이 연산자인지 피연산자인지 비교하기 위해 기존에는  `dictionary`를 활용하였습니다. 연산자를 입력 받을 경우 우선순위`dictionary`를 for문 돌려서 입력받은 모든 연산자의 우선순위를 확인한 뒤 순서에 맞게 후위연산이 진행되도록 Stack에 넣어주었습니다.

그런데 이렇게 원시값으로 비교하는 것은 코드의 의미가 제대로 전달되지 않는다는 것을 인지하였습니다. 따라서 열거형으로 연산자와 각 연산자의 우선순위를 나열한 뒤 `Comparable`프로토콜을 채택하여 우선순위를 더 명확하게 설정하였습니다. 그런데 막상 입력값으로 받은 값이 연산자인지 피연산자인지 어떻게 구분지을 수 있는지 마땅한 방법을 못찾아서 고민을 하였고 마침내 해결하였습니다 😂

```swift
enum Operators: String, CaseIterable {
    case multiplication = "*"
    case division = "/"
    case addition = "+"
    case subtraction = "-"
    case leftShift = "<<"
    case rightShift = ">>"
    case AND = "&"
    case NAND = "~&"
    case OR = "|"
    case NOR = "~|"
    case XOR = "^"
    case NOT = "~"
  	var precedence: Precedence {
      switch self {
        case .leftShift, .rightShift, .NOT:
        	return .bitwisePrecedence
        case .AND, .NAND, .multiplication, .division:
        	return .multiplicationPrecedence
        case .addition, .subtraction, .OR, .NOR, .XOR:
        	return .additionPrecedence
        }
    }
    
    	static var list: [String] {
      	return Operators.allCases.map { $0.rawValue }
    }
}
```

`CaseIterable`프로토콜을 채택하여 Operators 내에 있는 case를 배열로 사용할 수 있게 하였습니다. 그런 다음 `static var list`라는 타입프로퍼티를 선언한 뒤 각 case의 원시값을 배열로 사용하도록 만들어주었습니다. 이렇게 코드를 작성하니 모든 클래스 내에서 `Operators.list.contains(element)` 이런식으로  타입프로퍼티를 활용하여 입력값이 연산자인지 피연산자인지 구분지어줄 수 있게 되었습니다 💪

### 해결되지 않은 부분

- 2진수는 8자리 밖에 없는데 계산기프로젝트는 9자리를 요구합니다....