# Calculator
## 목차
---


## iOS 커리어 스타터 캠프

### 계산기 프로젝트
---
- 프로젝트 기간: 2021.11.08 - 2021.11.19
- 커밋 기준: 기능 단위 (카르마 규칙 준수)
    - Step1: #1(Model), #2(Error), #3(Read Me), #4(Refactoring)
    - Step2: #5(Model), #6(Read Me), #7(Test), #8(Refactoring)
    - Step3:

### 🗝️ 키워드 
---
- `Array` `시간복잡도`
- `Queue`
- `Generic` `T` `Element`
- `TDD` `UnitTest`
- `UML`
- `map` `compactMap`
- `split` `components`

### 🖌️ UML 
![](https://i.imgur.com/YOL74g2.png)


## 1️⃣ Step 1
---
### 🤔 Step 1에서 고민했던 부분 
___
#### 1. 한 배열 안에 연산자와 숫자를 함께 넣어줘야할지 고민했습니다. 
Generic 타입으로 한꺼번에 CalculatorItemQueue를 생성해주고 난 후 연산자와 숫자 각각에 대한 타입을 생성해주었습니다. 
하나의 배열에 다양한 타입을 넣으려고 한다면 [Any]를 사용해야 하는데 이 경우 Equatable 프로토콜을 준수하고 있지 않아 Unit Test에도 어려움이 있었습니다. 또한 값을 빼낼 때에도 타입을 분리해서 빼내야 하는 어려움이 있어 각각 타입을 생성하는 방법을 선택했습니다. 


#### 2. 입력 값이 Int와 Double일 때 따로 처리를 해줄지 고민했습니다. 
전부 Double로 입력받아 숫자의 형식을 정해주는 방법을 선택했습니다. (아직 형식을 정해주는 부분은 구현하지 않음)

#### 3. 아래의 코드를 개선할 수 있는 방법을 고민했습니다. 
```swift 
struct CalculatorItemQueue: CalculateItem {
    var number = CalculatorQueue<Double>().queue
    var `operator` = CalculatorQueue<Character>().queue
    
    mutating func appendItem<T>(_ input: T) {
        if input is Double {
            number.append(input as! Double)
        } else if input is Character {
            `operator`.append(input as! Character)
        } else if input is Int {
            let input = input as! Double   
        }
    }
}

struct CalculatorQueue<Element>: CalculateItem {
    var queue: [Element] = []
}
```
 
**위 코드의 문제점**
- 배열에 값을 추가해줄 때 Generic을 사용했는데, 여기서 배열의 타입이 두 종류라 타입을 확인하고 타입에 맞는 배열에 넣어줘야 했습니다. 이 경우 input이 기본적으로 Generic 타입이기 때문에 강제로 다운캐스팅을 해줘야 하는 문제가 있었습니다. 
- Unit Test를 진행할 때 input에 `1`이나 `"+"`를 넣어준다면 Double이나 Character로 인식하지 않고 Int나 String으로 인식하는 문제가 있었습니다. 이를 위해 extension을 활용해 불필요한 코드를 작성해야 하는 문제가 있었습니다. 
```swift
extension Int {
    var doubleValue: Double {
        return round(Double(self))
    }
}
```

이런 문제를 해결해주기 위해 일단 `CalculatorItemQueue`를 제너릭으로 구현을 해준 뒤 연산자는 `CalculatorItemQueue<Character>`로, 피연산자는 `CalculatorItemQueue<Double>`로 각각 생성해주었습니다. 

#### 4. Generic을 표시할 때 `T`로 표시할지 `Element`로 표현할지 고민했습니다. 
[Generic 공식문서](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)를 보면 배열에 대한 Generic을 생성할 때에는 `T`가 아닌 `Element`를 사용해서 `Element`를 사용하도록 했습니다. 

#### 5. Array를 사용할 때 시간복잡도에서 단점을 갖고 있다는 점을 알고, 이를 어떻게 해소시킬 수 있을지 고민했습니다. 
Array를 Queue 방식을 통해 값을 빼준다면 제일 처음 들어온 값부터 빠지게 됩니다. 따라서 첫 번째 배열 값이 비워지고 차례로 하나씩 당겨지게 됩니다. 이 때 시간복잡도에서 단점(O(n))을 가지게 됩니다. 
(단순히 검색 및 접근을 할 때에는 O(1)의 시간 복잡도를 갖게 된다.)

배열을 `reversed()`하게 되면 O(1)의 시간 복잡도를 가지게 되고 마지막 값을 뺀다면 값을 당길 필요도 없다고 생각하여 `reversed()`를 한 후 배열의 마지막 값을 빼고 다시 `reversed()`를 해줘서 원래대로 바꾸는 방법을 선택했습니다. 

(이 과정에서 Linked List에 대해 알게 되었는데 이에 대해 추가적인 학습이 필요함을 느꼈습니다)

---
### ⭐️ Step 1에서 보완한 부분 및 새롭게 안 내용
---
#### 1. 프로젝트 미니멈 타겟이 iOS 14.1로 되어있는데 현재 아이폰 사용자의 OS 점유율은 어떨까?
현재 85%의 기기가 iOS 14를 사용하고 있으며, 4년 동안 도입된 기기의 90%가 iOS 14를 사용 중입니다.
이는 해당 [링크](https://developer.apple.com/kr/support/app-store/)에서 확인할 수 있습니다. 
버전에 따라 제공되는 기능에 차이가 있기 때문에 버전을 수정할 때는 항상 side effect를 고려해야 합니다. 

#### 2. Queue를 담는 배열의 네이밍 수정 
기존에는 단순히 array라는 이름을 사용했습니다. 
하지만 Swift의 [API design Guidelines](https://www.swift.org/documentation/api-design-guidelines/#naming)를 보면 `Name variables, parameters, and associated types according to their roles, rather than their type constraints.` 이런 문장이 있습니다. 

즉, 타입 명을 직접 언급하는 것보단 역할에 대해 작성해야 한다고 판단했습니다. 

그래서 연산자와 피연산자의 items라는 네이밍으로 수정했습니다. 특히 배열의 경우 공식문서에서 복수로 표현하고있어 `items`로 정했습니다.

#### 3. Unit Test의 네이밍에 대해 고민했습니다. 
테스트가 하나의 코드의 스펙 정의 문서가 될 수 있다고 생각하기 때문에 그 코드를 많이 볼 사람들에 맞춰 네이밍을 하는 것이 가장 좋지 않을까 생각했습니다. 
(정말 글로벌하게 협업을 한다면 영어로 네이밍하는 것이 더 적합하다고 판단했습니다. 다만 협업 대상이 한국인에 한정된 경우 한글로 사용하는 것이 오히려 나을 수 있다고 생각합니다)

테스트 명의 경우 Naming을 하면서 간략한 것보다 구체적이 좋다는 Guideline을 보고 '최대한 구체적으로 적어서 네이밍만 보더라도 어떤 테스트인지 알 수 있는 것이 좋지 않을까?'' 라고 생각해서 최대한 구체적으로 표현하려고 했습니다.

#### 4. removeAllItem의 함수명 수정 
all 뒤에는 복수형이 붙는 것이 영어 문법 상 맞는 표현이라 removeAllItems로 수정했습니다. 

<br/>


## 2️⃣ Step 2
---
### 🤔 Step 2에서 고민했던 부분 
___
#### 1. `CalculateItem` 프로토콜을 어디에 채택하면 좋을지 고민했습니다. 
`CalculatorItemQueue`의 제네릭 타입에 프로토콜을 채택하는 것이 가장 적합하다고 생각했습니다. 타입에 채택을 하게 되면 타입에는 `Operator` 열거형과 `Double`만 들어올 수 있게 되고 다른 타입의 인스턴스를 생성할 수 없어 가장 타당하다고 판단했습니다. 

#### 2. `ExpressionParser`가 왜 케이스가 없이 구현된 것인지 고민했습니다. 
열거형을 싱글톤처럼 사용하기 위함이라 생각합니다. 열거형의 경우 따로 인스턴스를 생성할 수 없습니다. 
따라서 함수를 `static`으로 타입 메서드를 생성하면 파일 전체에서 연산자와 피연산자를 분리하는 `parse` 메서드를 싱글톤처럼 호출할 수 있기 때문에 타입 메서드로 구현했습니다. 
```swift=
static func parse(from input: String) -> Formula {
    var formula = Formula()
    let operandsItems = componentsByOperators(from: input).compactMap { Double($0) }
    let operatorsItems = input.compactMap { Operator(rawValue: $0) }
        
    formula.operands.items = operandsItems
    formula.operators.items = operatorsItems
        
    return formula
}
```

#### 3. 연산자 배열과 피연산자 배열을 어떻게 분리할 지 고민했습니다. 
피연산자 배열의 경우 `Double` 배열, 연산자 배열의 경우 `Operator` 타입의 배열로 생성해야했습니다.
또한 음수의 경우 마이너스를 연산자가 아닌 피연산자로 인식해야 했습니다. 

먼저 operandsItems의 경우 `String`을 `Double`로 변환해야 했습니다. 이 때 `map`을 사용하게 되면 변환이 되면서 옵셔널 Double 타입으로 변환이 되기 때문에 `compactMap`을 사용했습니다. 

또한 operatorsItems의 경우 `String`을 `Operator`로 변환해야 했습니다. 또한 Operator 열거형의 rawValue에 해당하는 값만 꺼내와야 했기에 `let operatorsItems = input.compactMap { Operator(rawValue: $0) }` 이렇게 구현했습니다. 
변환이 되지 않아 nil로 된 값은 제거해줘야 했기에 `compactMap`을 사용했습니다. 


또한 음수와 연산자를 구분하기 위해 연산 가능한 minus와 연산이 불가능한 minus를 나눠서 String으로 값을 받도록 했습니다.
먼저 `.replacingOccurrences`메서드를 활용해 연산자를 `" "`로 수정해줬고 이를 토대로 extension으로 구현한 `split` 메서드를 활용해 쪼갠 뒤 map을 활용해 연산이 안되는 minus를 연산 가능한 minus로 수정했습니다. 

`let convertOperands = operands.map { $0.replacingOccurrences(of: "−", with: "-") }`

---
### ⭐️ Step 2에서 보완한 부분 및 새롭게 안 내용
---
