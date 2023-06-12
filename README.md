# 계산기 🧮
입력한 숫자와 연산자를 이용해 연산 결과를 보여주는 앱

> 프로젝트 기간: 2023-05-29 ~ 2023-06-09

## 🕺 팀원
|비모|
|:-:|
|<img height="200px" src="https://avatars.githubusercontent.com/u/67216784?v=4">
|[Github Profile](https://github.com/hojun-jo)|[Github Profile](https://github.com/bubblecocoa)|

</br>

## 📝 목차
1. [타임라인](#-타임라인)
2. [다이어그램](#-다이어그램)
3. [트러블 슈팅](#-트러블-슈팅)
4. [참고 링크](#-참고-링크)

</br>

# 📆 타임라인  
|**날짜**|**진행 사항**|
|:-:|-|
|2023-05-30|- `CalculateItemQueueTests` 테스트 생성<br>- `CalculateItemQueueTests`에 테스트 케이스 추가<br>　- `isEmpty`, `dequeue`, `count`<br>- `CalculatorItemQueue` 클래스 생성<br>- `CalculatorItemQueue`에 프로퍼티 추가<br>　- `enqueue`, `dequeue`, `isEmpty`<br>- `CalculatorItemQueue`에 메서드 추가<br>　- `count`<br>- `CalculateItem` 프로토콜 생성<br>|
|2023-05-31|- `CalculateItemQueueTests`에 테스트 케이스 추가<br>　- `peek`, `dequeue`, `removeAll`<br>- `CalculatorItemQueue`에 메서드 추가<br>　- `peek`, `removeAll`|
|2023-06-05|- `String`에 `Extension`으로 메서드 추가<br>　- `split`<br>- `Formula` 구조체 생성<br>- `Operator` 열거형 생성|
|2023-06-06|- `ExpressionParser` 열거형 생성<br>- `ExpressionParser` 에 타입 메서드 생성<br>　- `parse`<br>　- `componentsByOperators`<br>- `Operator`에 메서드 생성<br>　- `calculate`<br>　- `add`<br>　- `subtract`<br>　- `divide`<br>　- `multiply`<br>- `Formula`에 프로퍼티 추가<br>　- `operands`<br>　- `operators`<br>- `Formula`에 메서드 추가<br>　- `result`<br>- `FormulaTests` 테스트 생성<br>- `FormulaTests`에 테스트 케이스 추가<br>　- `result`<br>- `ExpressionParserTests` 테스트 추가<br>- `ExpressionParserTests`에 테스트 케이스 추가<br>　- `parse`|
|2023-06-07|- `OperatorTests` 테스트 추가<br>- `OperatorTests`에 테스트 케이스 추가<br>　- `divide`|

</br>

# 💎 다이어그램
![step2_class_diagram](/step2_class_diagram.png)

</br>

# 🚀 트러블 슈팅
## 1️⃣ 시간 복잡도가 낮은 Queue의 구현

### 🔍 문제점
`Swift`에서 `Array`를 이용해 `Queue`작업을 하는 경우 사용하는 메서드와 시간 복잡도는 다음 표와 같다.
|Array|enqeue|dequeue|
|:-:|:-:|:-:|
|사용 메서드|[append(_:)](https://developer.apple.com/documentation/swift/array/append(_:)-1ytnt)|[removeFrist()](https://developer.apple.com/documentation/swift/array/removefirst())|
|시간 복잡도|O(1)|O(n)|

`dequeue`를 할 때마다 호출하는 `removeFirst`로 인해 `O(n)`의 작업이 일어나는 것을 줄여보고 싶었다.

### ⚒️ 해결방안
`Double Stack`이라는 방법을 이용해 `dequeue`의 시간 복잡도를 줄여보았다.
`Double Stack`은`Queue` 기능을 위해 두 개의 `Stack`을 이용하는 것이다. 하나는 `enqueueStack` 다른 하나는 `dequeueStack`으로, 각각의 이름에 맞게 `enqueue`, `dequeue`만을 위해 이용된다.
```swift
struct CalculatorItemQueue<Element: CalculateItem> {
    private var enqueueStack: [Element] = []
    private var dequeueStack: [Element] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    ...
    mutating func enqueue(_ element: Element) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.popLast()
    }
    ...
}
```
위 구현된 코드를 기반으로 `Queue`작업을 하는 경우 시간 복잡도는 다음과 같다.
|Double Stack|enqeue|dequeue<br>비어있지 않은 경우|dequeue<br>비어있는 경우|
|:-:|:-:|:-:|:-:|
|사용 메서드|[append(_:)](https://developer.apple.com/documentation/swift/array/append(_:)-1ytnt)|[popLast()](https://developer.apple.com/documentation/swift/array/poplast())|[reversed()](https://developer.apple.com/documentation/swift/array/reversed())<br>[removeAll()](https://developer.apple.com/documentation/swift/array/removeall(keepingcapacity:)-1er5)<br>[popLast()](https://developer.apple.com/documentation/swift/array/poplast())|
|시간 복잡도|O(1)|O(1)|O(n)|

`dequeue`의 시간 복잡도가 항상 `O(n)`인 `Array`와 다르게 `Double Stack`은 `dequeueStack`이 비어있지 않은 경우의 시간복잡도가 `O(1)`이기 때문에 `Double Stack`을 이용하는 것으로 결정했다.

## 2️⃣ 다양한 방법의 옵셔널 바인딩
### 🔍 문제점
```swift
while operands.peek() != nil {
    guard let rhs = operands.dequeue() else {
        return result
    }

    guard let `operator` = operators.dequeue() else {
        return result
    }

    result = `operator`.calculate(lhs: result, rhs: rhs)
}
```
`calculate` 메서드를 실행하기 위해 `nil`을 3번 확인해야 했다. 이 과정에서 발생한 `guard`문은 꼭 필요하지만, 코드가 복잡해보였다.

### ⚒️ 해결방안
```swift
while let `operator` = operators.dequeue(), let rhs = operands.dequeue() {
    result = try `operator`.calculate(lhs: result, rhs: rhs)
}
```
`while`문 안에서 `Optional Binding`을 사용했다. 기존에는 `if-let`과 `guard-let`으로만 옵셔널 바인딩이 되는줄 알았지만, 공식문서 확인 결과 `while`문 또한 옵셔널 바인딩이 가능했다. 추가로 `let`뿐만 아니라 `var`로도 옵셔널 바인딩이 가능하다는 것을 알게 되었다.
</br>

# 📚 참고 링크
* [🍎 Developer Apple - Array](https://developer.apple.com/documentation/swift/array)
* [🍎 Developer Apple - Optional Binding](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Optional-Binding)