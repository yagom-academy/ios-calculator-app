# README 계산기 [STEP 1]

### 1. 프로젝트 소개

- TDD를 기반으로 `CalculatorItem` 프로토콜을 준수하는 요소를 다루는 큐 구현하기

---

### 2. 팀원

|SummerCat|
|------|
|<img width="180px" src="https://i.imgur.com/TVKv7PD.png">|



--- 


### 3. 프로젝트 구조
<img width="300" src="https://i.imgur.com/cfZClMi.png">


---

### 4. 실행 화면


---

### 5. 고민한 내용

#### Linked List를 사용할 경우

1. add하거나 remove할 때, 각각 어떤 정보를 줘야 할까?
(스택이나 큐가 아니면 위치 정보를 따로 줘야 할텐데?)
- add: 추가할 노드 객체를 넘겨준다
  - head에 추가
  - 주어진 노드 다음에 추가
  - tail에 추가
- remove: 삭제할 노드 객체 자체를 넘겨준다고 가정하면
  - head를 삭제
  - 가운데 있는 노드 삭제
  - tail 삭제
- 큐 구현에만 집중하면 add는 tail에 추가하는 경우만, remove는 front에서 빼는 경우만 고려해서 작성하면 된다.


#### Double Stack Queue를 사용할 경우

`inputStack`와 `outputStack`를 각각 만들어 준 후, dequeue할 때
- `outputStack`가 비어있으면 `outputStack = inputStack.reversed()`하고 `inputStack.removeAll()`을 먼저 수행한다. (`outputStack`에 원소가 있는 경우 생략)
- 그 다음 `outputStack.removeLast()`을 통해 큐의 첫 번째 원소를 제거한다.

#### 연결 리스트의 `Node`는 왜 클래스로 작성해야 할까?
한 줄로 요약하자면, 값 타입은 자기 자신의 타입을 프로퍼티로 가질 수 없기 때문이다. (Bidirectional Association이 불가능)

왜 값 타입은 자기 자신의 타입을 프로퍼티로 재귀적으로 갖는 것이 불가능할까?
값 타입은 (대부분의 경우) 컴파일 타임에 스택 메모리에 넣어주게 되는데, 이 때 들어갈 영역의 크기를 미리 계산할 수 있어야 한다. 그런데 이렇게 재귀적(또는 순환적)인 구조를 가진 entity의 경우 컴파일 타임에 그 크기를 결정할 수가 없어, 메모리 영역을 할당할 수가 없는 것이다.

하지만 다음과 같은 경우는 컴파일 오류가 발생하지 않는다.

```swift!
struct Node {
    var value: Int
    var siblings: [Node?]
}
```

Swift에는 배열도 구조체로 구현되어 있고, 배열은 계속 원소를 추가하거나 삭제하면서 크기가 변할 수 있는데 왜 위의 경우는 가능한 것일까?

Swift에서 구조체로 구현된 것 중 크기가 변할 수 있는 것들(Array, Dictionary, String 등)은 실제로 구조체 안에 자기가 담고 있는 것들의 실체를 가지고 있지 않다. 대신, 실체는 힙 영역에 존재하고 구조체 안에는 그 힙 영역을 가리키는 주소값을 가지고 있는 것이다. 그래서 배열 안의 원소가 바뀔 경우, 구조체는 자기가 가지고 있는 주소값만을 새로운 주소값으로 바꿔주기 때문에 스택 영역 내에서 배열이 차지하는 메모리의 크기는 일정하다.
요거에 관련해서 공부한 자세한 내용은 블로그에 정리해 두었다.
https://dev-summer.tistory.com/24

---

### 6. 트러블 슈팅

#### 6-1 `CalculateItem`을 어디에 적용할 것인가? - Double Stack Queue의 경우

```swift
protocol CalculateItem {
    
}

struct CalculatorItemQueue {
	var inItems: [CalculateItem] = []
	var outItems: [CalculateItem] = []
    
	mutating func enqueue(item: CalculateItem) {
		inItems.append(item)
	}   
}
```

`CalculateItem`을 갖는 배열을 `CalculatorItemQueue` 내에 선언할 경우, 테스트 코드에서 아래와 같은 오류가 발생한다.
<img width = "500" src = "https://i.imgur.com/4z91jpT.png">

위의 오류를 해결하기 위해 `CalculateItem`이 `Equatable`을 준수하게 해주려고 하면 아래와 같은 오류가 발생한다.
<img width = "500" src = "https://i.imgur.com/D7B1NMw.png">

프로토콜 상속은 프로토콜 본체에서만 가능하고 extension에서는 불가능하기 때문이다.

```swift
protocol CalculateItem: Equatable {
	static func ==(_ lhs: _ rhs: ) -> Bool {
		...
	}
}
```

이런 식으로 구현해주면 되는데, 과제 요구사항에 `CalculateItem`을 빈 프로토콜로 남겨두라고 해서 아래와 같이 제네릭을 활용해 `CalculatorItemQueue<Item: CalculateItem>`의 형태로 수정했다.

```swift
protocol CalculateItem {
    
}

struct CalculatorItemQueue<Item: CalculateItem> {
    var inputStack: [Item] = []
    var outputStack: [Item] = []
    
    mutating func enqueue(item: Item) {
        inputStack.append(item)
    }
    
    mutating func dequeue() -> Item? {
        if inputStack.isEmpty, outputStack.isEmpty { return nil }
        
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        
        return outputStack.removeLast()
    }
}
```

그리고 이제 `CalulateItem`을 준수하는 무언가를 활용해서 테스트를 해야 하는데, 처음에는 아래와 같이 `CalculateItem`을 준수하는 `String`의 extension을 생성해서 테스트를 했다.

```swift
extension String: CalculateItem {

}
```

하지만 테스트 하고 싶은 타입마다 extension을 만들어 줘야 한다는 점이 찝찝해서 테스트 코드 내에 테스트를 위한 `Item` 구조체를 새로 만들어 주었다.

```swift
struct Item: CalculateItem, Equatable {
	var data: String
}
```
<img width = "500" src = "https://i.imgur.com/wZtCaTZ.png">

---

### 6-2 `CalculateItem`을 어디 적용할 것인가? - Double Linked List

`CalculatorItemQueue`의 요소가 `CalculateItem`을 준수한다고 할 때의 요소가 `Node`라고 생각해서 `Node<T: CalculateItem>`와 같이 적용해 보았다.

```swift
class Node<Item: CalculateItem> {
    var value: CalculateItem
    var prev: Node?
    var next: Node?

    init(value: CalculateItem) {
        self.value = value
    }
}

struct List<Item: CalculateItem> {
    var front: Node<Item>?
    var rear: Node<Item>?

    mutating func add(node: Node<Item>) {
        if rear == nil {
            self.front = node
            self.rear = node
            return
        }

        rear?.next = node
        node.prev = rear
        self.rear = node
    }
}

struct CalculatorItemQueue<Item: CalculateItem> {
    var list = List<Item>()

    mutating func enqueue(node: Node<Item>) {
        list.add(node: node)
    }
}
```

위와 같이 작성 시, 테스트 코드에서 `==`로 비교할수가 없다.`Node`가 `Equatable`을 준수하지 않기 때문이다.

```swift
func test_enqueue_inputStack에_들어갔는지() {
	// given
	let item: Item = Item(data: "item data")
	let node: Node = Node<Item>(value: item)
	let expectedFront = node
	let expectedRear = node
        
	// when
	sut.enqueue(node: Node(value: item))
        
	// then
	XCTAssertEqual(sut.list.front, expectedFront)
}
```
<img width = "500" src = "https://i.imgur.com/dMv28y4.png">


그래서 아래와 같이 `Node`가 `Equatable`을 준수하도록 `==`를 구현하면 `value`의 값 타입인 `CalculateItem`끼리 비교할수가 없다. 이걸 비교하려면 결국 또 `CalculateItem`에 `Equatable`을 채택해야 한다. 
<img width = "500" src = "https://i.imgur.com/Qv4NQzo.png">

→ 결론: `Node<T: CalculateItem>` 말고 다른 방법을 찾아보자!

---

`List<T: CalculateItem>`에서 처음으로 `CalculateItem`을 채택하는 경우를 고려해보면, 
`List`는 프로퍼티로 `front`랑 `rear`만 가지고 있는데, 리스트 전체가 동일한지를 검증하려면 `front`부터 `rear`까지 하나하나 노드를 검증해가는 코드로 `==`를 구현해야 한다고 생각했다.

`CalculatorItemQueue<T: CalculateItem>`에서 처음으로 `CalculateItem`을 채택해도 마찬가지로 `list` 끼리 비교할수가 없다.

---

미니가 익스텐션을 활용하는 방법을 제안해주셨는데 (`value`가 `Int`인 경우, `String`인 경우 등을 나눠서 `Equatable`에 대한 conformance를 extension으로 구현),
하나의 프로토콜을 복수의 익스텐션에서 채택할 수는 없다고 한다 (프로토콜 요구사항을 각 익스텐션마다 다르게 구현하더라도 안됨).
<img width="500" src="https://i.imgur.com/NiVpmFO.png">

---

최종적으로 서로 같은지 확인하고 싶은 것은 `Node`라고 생각했기 때문에, 아래와 같이 수정했다

```swift
class Node<Item>: Equatable {
    static func == (lhs: Node<Item>, rhs: Node<Item>) -> Bool {
        if lhs.value as? String == rhs.value as? String,
           lhs.prev == rhs.prev,
           lhs.next == rhs.next {
            return true
        }
        
        return false
    }
    
    
    var value: Item
    var prev: Node?
    var next: Node?

    init(value: Item) {
        self.value = value
    }
}

struct List<Item> {
    var front: Node<Item>?
    var rear: Node<Item>?

    mutating func add(node: Node<Item>) {
        if rear == nil {
            self.front = node
            self.rear = node
            return
        }

        rear?.next = node
        node.prev = rear
        self.rear = node
    }
}

struct CalculatorItemQueue2<Item: CalculateItem> {
    var list = List<Item>()

    mutating func enqueue(node: Node<Item>) {
        list.add(node: node)
    }
}
```

위에서 구현한 노드와 연결 리스트로 2개의 노드를 넣은 후 하나의 노드를 뺀 다음 front 노드가 2번째로 삽입된 노드로 변경되었는지 확인하는 테스트를 진행하는 과정에서 오류가 생겼다.
노드를 빼는 과정에서 `BAD ACCESS`가 발생한 것이다.
`List`의 `front`와 `rear` 노드를 각각 `nil`값을 가지고 있는 노드로 설정한 후, 이후 삽입되는 노드를 각각 `front`의 뒤, `rear`의 앞에 연결하는 방식으로 수정하면 위의 오류를 수정할 수 있다.

---

### 7. 참고 링크
https://medium.com/@leandromperez/bidirectional-associations-using-value-types-in-swift-548840734047
https://medium.com/@itchyankles/memory-management-in-rust-and-swift-8ecda3cdf5b7#.vxuxwzr2l
https://www.mikeash.com/pyblog/friday-qa-2015-04-17-lets-build-swiftarray.html
https://sujinnaljin.medium.com/ios-swift의-type과-메모리-저장-공간-25555c69ccff
https://www.freecodecamp.org/news/the-story-of-one-mother-two-sons-value-type-vs-reference-type-in-swift-6e125af2d5d0/
https://github.com/apple/swift/blob/main/stdlib/public/core/Array.swift
