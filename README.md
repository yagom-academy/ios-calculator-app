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

</br>

# 💎 다이어그램
![step1_class_diagram](/step1_class_diagram.png)

</br>

# 🚀 트러블 슈팅
## 1️⃣ Queue를 어떻게 구현할까?

### 🔍 문제점
일반 `Array`를 `Queue`처럼 이용하기 위해서 사용해야 하는 메서드는 [append(_:)](https://developer.apple.com/documentation/swift/array/append(_:)-1ytnt)와 [removeFrist()](https://developer.apple.com/documentation/swift/array/removefirst())이다. `append`는 배열의 맨 뒤에 항목을 추가하는 것으로 시간 복잡도가 `O(1)`이다.`removeFirst`는 배열의 맨 앞의 항목을 제거하고 그 뒤의 항목을 하나씩 앞으로 당겨오는 작업을 수행한다. 이런 작업으로 인해 시간 복잡도가 `O(n)`이 된다. 나는 `dequeue`를 할 때마다 호출하는 `removeFirst`로 인해 `O(n)`의 작업이 일어나는 것을 줄여보고 싶었다.

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
이 코드에서 집중해서 볼 것은 `dequeue` 메서드다. 메서드 안의 `if`문의 조건은 `dequeueStack` 배열이 비어있는지 확인한다. 배열이 비어있는 경우 [reversed()](https://developer.apple.com/documentation/swift/array/reversed()), [removeAll()](https://developer.apple.com/documentation/swift/array/removeall(keepingcapacity:)-1er5)을 호출한다. 두 메서드 모두 시간 복잡도가 `O(n)`이기 때문에 `O(2n)`으로 볼 수 있지만 이 경우 `2`가 의미있는 값이 아니기 때문에 `O(n)`으로 볼 수 있다. 시간 복잡도는 최악의 상황을 산정하기 때문에 이미 이 상태가 `O(n)`으로 기본 `Array`를 사용했을 때와 달라보이지 않을 수 있다. 하지만 `dequeue`의 조건문이 `false`인 경우(`dequeueStack`에 값이 있을 때)에는 시간 복잡도가 `O(1)`인 [popLast()](https://developer.apple.com/documentation/swift/array/poplast())만 호출하기 때문에 경우에 따라서는 시간 복잡도가 더 단순할 수 있다. 그렇기 때문에 시간 복잡도가 항상 `O(n)`인 기본 `Array`를 이용한 `Queue`보다 `Double Stack`을 이용한 `Queue`를 사용하기로 결정했다.

</br>

# 📚 참고 링크
* [🍎 Developer Apple - Array](https://developer.apple.com/documentation/swift/array)
