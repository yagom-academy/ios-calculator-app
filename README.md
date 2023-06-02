# 🧮 계산기
> 사용자에게 연산을 입력받아 계산 결과를 보여주는 프로그램

**프로젝트 진행 기간** | 23.05.29.(월) ~ 23.06.09.(금)

## 📚 목차
- [팀원소개](#-팀원-소개)
- [타임라인](#-타임라인)
- [시각화 구조](#-시각화-구조)
- [트러블 슈팅](#-트러블-슈팅)
- [팀 회고](#-팀-회고)
- [참고자료](#-참고자료)


## 🧑‍💻 팀원 소개

| <img src="https://i.imgur.com/8mg0oKy.jpg" width="100" height="130"/> |
| :-: |
| [<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="20"/> **Mary**](https://github.com/MaryJo-github) |

## ⏰ 타임라인
###### 날짜와 중요한 커밋 위주로 작성되었습니다.

- **23/05/30 (화)**
    - TDD기반 CalculatorItemQueue 기능 구현
- **23/05/31 (수)** 
    - Linked List를 이용한 Queue 구조로 변경
- **23/06/01 (목)**
    - Node, Linked List, Queue에 Generic 활용


## 🔍 시각화 구조
**UML 클래스 다이어그램**

<img width="612" alt="스크린샷 2023-06-02 오후 2 47 43" src="https://github.com/MaryJo-github/ios-calculator-app/assets/42026766/b0b41931-f1a2-473e-b2aa-7e332f495bfb">

## 🔨 트러블 슈팅 

### 1️⃣ **다양한 큐 구현 방법**
사용자가 입력한 연산을 저장하기 위해 큐를 만들고자하였고, 다양한 구현방법 중 어떤 것을 활용할지 고민하였습니다. 먼저 각 방법을 직접 구현해보고 장단점을 비교해보았습니다.

🔑 **첫번째 방안 - Array (dequeue: removeFirst())**
```swift
var itemQueue: [String] = []

mutating func enqueue(_ element: String) {
    itemQueue.append(element)
}

mutating func dequeue() -> String? {
    return itemQueue.isEmpty ? nil : itemQueue.removeFirst()
}
```

- **장점**
  - 가장 간결하게 구현할 수 있습니다.

- **단점**
  - dequeue 호출시 뒷 쪽의 값들을 앞으로 당겨오는 작업이 필요하기때문에 시간 복잡도는 O(n)입니다.
    
<br>
    
🔑 **두번째 방안 - Array (dequeue: Pointer)**
```swift
var itemQueue: [String?] = []
private var head = 0
private var size: Int {
    return itemQueue.count
}

mutating func enqueue(_ element: String) {
    itemQueue.append(element)
}

mutating func dequeue() -> String? {
    guard head <= size,
          let element = itemQueue[head] else { return nil }
    itemQueue[head] = nil
    head += 1
    return element
}
```
- **장점**
  - dequeue 호출시 배열은 그대로 두고 head라는 포인터만 변경해주기 때문에 시간복잡도가 낮습니다.

- **단점**
  - dequeue된 요소들이 배열에 nil로 남기때문에 메모리가 낭비됩니다.

🔑 **세번째 방안 - Double Stack Queue**
```swift
var leftStack: [String] = []
var rightStack: [String] = []

mutating func enqueue(_ element: String) {
    itemQueue.append(element)
}

mutating func dequeue() -> String? {
    if leftStack.isEmpty {
        leftStack = rightStack.reversed()
        rightStack = []
    }
    return leftStack.popLast()
}
```
- **장점**
  - reversed 메소드를 이용하여 큐를 뒤집은 프로퍼티를 생성해줌으로써 dequeue 호출 시 시간복잡도는 O(1) 입니다. (LeftStack이 비어있지 않을 때에만 적용됩니다.)

- **단점**
  - LeftStack이 비어있을 때에는 reversed 메소드를 호출하여 leftStack에 넣는 작업을 진행합니다. 이 때의 시간복잡도는 O(n)이 됩니다.

🔑 **네번째 방안 - Linked List**
```swift
private var front: Node?
private var tail: Node?
private(set) var size: Int = 0
var isEmpty: Bool { size == 0 }

mutating func enqueue(_ element: String) {
    let newNode = Node(element: element)

    if isEmpty {
        front = newNode
        tail = front
    } else {
        tail?.next = newNode
        tail = newNode
    }
    size += 1
}

mutating func dequeue() -> String? {
    guard let firstElement = front?.element else { return nil }

    front = front?.next
    size -= 1

    if isEmpty {
        front = nil
        tail = nil
    }

    return firstElement
}
```
- **장점**
  - dequeue 호출시 노드의 연결만 끊으면 되기 때문에 시간복잡도는 항상 O(1) 입니다.

- **단점**
  - 초기 구현이 비교적 복잡합니다.

→ 첫번째, 세번째 방안은 시간복잡도가 항상 O(1)이 아니며, 두번째 방안은 메모리 사용이 비효율적이라는 단점이 있어 마지막 방법인 Linked List 방법을 채택하였습니다. 

    

## 👥 팀 회고
(추가 예정입니다)
    
## 📑 참고자료
(추가 예정입니다)
