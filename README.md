## 목차
---
[계산기 프로젝트](#계산기_프로젝트)
[Step 1] (#Step_1)

## iOS 커리어 스타터 캠프

### 계산기 프로젝트
---
- 프로젝트 기간: 2021.11.08 - 2021.11.19
- 커밋 기준: 기능 단위 (카르마 규칙 준수)
    - Step1: #1(Model), #2(Error), #3(Read Me), #4(Refactoring)
    - Step2: 
    - Step3:

### 키워드 
---
- `Array` `시간복잡도`
- `Queue`
- `Generic` `T` `Element`
- `TDD` `UnitTest`'
- `UML`

### UML 
![](https://i.imgur.com/6O4ojGl.png)

## Step 1
---
### Step 1에서 고민했던 부분 
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

### Step 1에서 보완한 부분 
___
