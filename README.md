# 계산기 ➕➖✖️➗
연산자 우선순위와 상관없이 입력 순서대로 계산해 주는 계산기 앱

> 프로젝트 기간: 2023-05-29 ~ 2023-06-09

## 🕺 팀원
|EtialMoon|
|:-:|
|<img src="https://i.imgur.com/hSdYobS.jpg" width="200"/>|
|[Github Profile](https://github.com/hojun-jo)|

</br>

## 📝 목차
1. [타임라인](#📆-타임라인)
2. [실행화면](#🖥️-실행-화면)
3. [다이어그램](#💎-다이어그램)
4. [트러블 슈팅](#🚀-트러블-슈팅)
5. [참고 링크](#📚-참고-링크)

</br>

# 📆 타임라인  
|**날짜**|**진행 사항**|
|:-:|-|
|2023-05-30|- CalculatorItemQueue 생성 및 단위 테스트 타깃 추가<br>- CalculatorItemQueue의 init 테스트 및 구현<br>- CalculatorItemQueue의 enqueue 테스트 및 구현<br>- CalculatorItemQueue의 dequeue 테스트 및 구현<br>- CalculatorItemQueue에서 제네릭 대신 any CalculateItem 사용|
|2023-05-31|- enqueue, dequeue 테스트에 문자열 테스트 케이스 추가<br>- dequeue 테스트 조건을 명확하게 수정|


</br>

# 🖥️ 실행 화면
![Simulator Screenshot - iPhone 14 Pro - 2023-06-02 at 14 51 27](https://github.com/hojun-jo/ios-calculator-app/assets/86751964/5843fe6b-6116-40a2-ab75-c9fb4649b13b)


</br>

# 💎 다이어그램
![class diagram](https://github.com/yagom-academy/ios-calculator-app/assets/86751964/9078c62c-14d4-43c5-a1b1-4e7ea6913a6d)




</br>

# 🚀 트러블 슈팅
## 1️⃣ CalculatorItemQueue의 자료구조

### 🔍 문제점

처음에는 배열만 이용해 큐를 만들려 시도했습니다. 이 경우 `dequeue`를 `removeFirst`를 이용해 구현하게 되는데 시간 복잡도가 `O(n)`이기 때문에 비효율적이라 생각했습니다. 그래서 `dequeue`를 하면 일단 배열의 값을 `nil`로 만들고 `nil`이 많이 쌓이게 되면 그때 지우려고 했습니다. 보통 계산기를 사용할 때 몇 십 번의 연산을 한 번에 하게 되는 일이 없을 것이라 생각해 이렇게 구현했습니다. 하지만 이 방법도 기준을 명확하게 정할 수 없다고 생각했습니다.
```swift
// 수정 전
struct CalculatorItemQueue {
    private(set) var queue: [String?] = []
    private var head: Int = 0
    
    mutating func enqueue(_ element: String) {
        queue.append(element)
    }
    
    mutating func dequeue() -> String? {
        guard head <= queue.count,
              !queue.isEmpty,
              let element = queue[head] else {
            return nil
        }
        
        queue[head] = nil
        head += 1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        
        return element
    }
}
```

### ⚒️ 해결방안
`DoubleStack`이라는 자료구조를 발견했습니다. 이렇게 구현하면 `dequeue`를 할 때 처음 배열을 뒤집을 때는 `O(n)`이지만 그 뒤로는 `O(1)`이기 때문에 더 효율적인 것 같다고 생각했습니다.
```swift
// 수정 후
struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var enqueuedCalculatorItems: [Element] = []
    private(set) var dequeueCalculatorItems: [Element] = []
    
    init() {}
    
    init(_ enqueuedCalculatorItems: [Element]) {
        self.enqueuedCalculatorItems = enqueuedCalculatorItems
    }
    
    mutating func enqueue(_ element: Element) {
        enqueuedCalculatorItems.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if dequeueCalculatorItems.isEmpty {
            dequeueCalculatorItems = enqueuedCalculatorItems.reversed()
            enqueuedCalculatorItems.removeAll()
        }
        
        return dequeueCalculatorItems.popLast()
    }
}
```

## 2️⃣ 제네릭 타입 사용 시 발생했던 오류

### 🔍 문제점
처음에는 `String`만 사용해 테스트를 진행하다가 제네릭을 사용하면 한 배열 안에 `Int`, `String` 모두 넣을 수 있을 것 같아 제네릭을 시도했습니다. 하지만 `Type 'any CalculateItem' cannot conform to 'CalculateItem'`이라는 오류를 만나 고민하게 되었습니다.
```swift
// 수정 전(CalculatorItemQueue는 위의 수정 후와 같습니다.)
final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<CalculateItem>! // 오류 발생

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_init에1_2_3을넣으면_enqueuedCalculatorItems에1_2_3이있다() {
        let input = ["1", "2", "3"]
        
        sut = CalculatorItemQueue(input)
        let result = sut.enqueuedCalculatorItems
        
        XCTAssertEqual(input, result)
    }
    ...
}
```

### ⚒️ 해결방안
제네릭 대신 프로퍼티와 파라미터의 타입을 `any CalculateItem`로 바꾸는 것으로 수정하게 되었습니다.

```swift
// 수정 후
struct CalculatorItemQueue {
    private(set) var enqueuedCalculatorItems: [any CalculateItem] = []
    ...
}

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_init에1_2_3을넣으면_enqueuedCalculatorItems에1_2_3이있다() {
        let input = [1, 2, 3]
        
        sut = CalculatorItemQueue(input)
        let result = sut.enqueuedCalculatorItems as? [Int]
        
        XCTAssertEqual(input, result)
    }
    ...
}
```

</br>

# 📚 참고 링크

* [🍎 Apple Docs - Any Type](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/types/#Any-Type)
* [🌐 stackoverflow - Type any Protocol cannot conform to Protocol](https://stackoverflow.com/questions/75062360/type-any-protocol-cannot-conform-to-protocol)

</br>

