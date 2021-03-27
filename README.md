## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

## 1주차 (21.03.22(월) ~ 21.03.27(토))

### 설계

<img width="828" alt="2021-03-24_5 00 46" src="https://user-images.githubusercontent.com/55218398/112719014-d8509680-8f39-11eb-92a4-c239d3c5a2c4.png">

계산기를 먼저 구현하기 전에 계산기모델을 설계하는 것이 중요하다는 생각이 들어서 위와 같이 간단한 UML을 만들어보았습니다.<br>
저희가 생각한 모델은 Calculator프로토콜을 만든 뒤 모든 Calculator의 공통기능을 가진 메서드를 구현한 다음 2진법계산기클래스와 10진법계산기클래스가 해당 프로토콜을 채택하여 계산기로서의 기능을 부여받도록 설계하였습니다. <br>
그 후, 각각의 계산기가 가져야만 하는 고유기능을 각각의 클래스에 추가해주었습니다.<br>
계산기에 대한 전반적인 설계가 끝난 뒤, 어떤 데이터구조가 유저입력을 받고 그 연산을 하기에 효율적인 그릇일지 고민해 보았고 고심끝에 저희는 Stack을 채택하였습니다.<br>

- `Stack`을 채택한 이유 : 연산자와 피연산자를 입력 받고 연산을 한 뒤 불필요한 요소를 제거해야 하는데 Stack이 일반 배열에 비해 추가,삭제가 좀 더 효율적이기 때문에 

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
하지만 제대로 작동하지 않아 문서를 찾아보니 ~연산자는 UInt8타입에서 밖에 사용할 수 없다는 것을 알게 되었습니다. 그렇기 때문에 해당연산을 할 경우 연산을 하기 전 UInt8로 변환을 한 뒤, 연산을 하도록 코드를 작성하여 문제를 해결하였습니다.<br>

### 해결되지 않은 부분

- 2진법계산부분이 비효율적이여서 로직을 수정하고 리팩토링이 필요합니다. 
- Primitive Type(원시타입)의 많은 사용이 있어서 해당 부분에 대한 개선이 필요합니다.
