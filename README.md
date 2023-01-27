# iOS 커리어 스타터 캠프
# 🧮 계산기 

> 프로젝트 기간: 2023.01.24 ~
> 
> 팀원: 👨🏻‍💻[kaki](https://github.com/kak1x) | 리뷰어: 👨🏻‍💻[그루트](https://github.com/Groot-94)
>


## 목차
1. [프로젝트 소개](#프로젝트-소개)
2. [타임라인](#타임라인)
3. [폴더구조](#폴더구조)
4. [UML](#uml)
5. [트러블 슈팅](#트러블-슈팅)
6. [참고 링크](#참고-링크)


# 프로젝트 소개

계산기 앱 구현

<br/>

# 타임라인 
- 23.01.24 (화): 알고리즘 학습, CalculateItem 프로토콜 생성 및 채택
- 23.01.25 (수): STEP1 Node, CalculaterItemQueue 구현 및 테스트
- 22.01.26 (목): STEP1 리뷰 내용 수정 (Generic 수정 및 refactor)
- 22.01.27 (금): STEP2 extension 추가, split 메서드 구현, Operater 및 Formula 구현, 테스트
<br>

# 폴더구조
```
├── Calculator
|   ├── Model
|       ├── Extension
|           ├── Double
|           ├── String
|       ├── CalculateItem
|       ├── Node
|       ├── CalculatorItemQueue
|       ├── Operator
|       ├── Formula
|   ├── View
|       ├── Main
|       ├── Assets
|       ├── LaunchScreen
|       └── Info
|   └── Controller
|       ├── AppDelegate
|       ├── SceneDelegate
|       └── ViewController
├── CalculatorItemQueueTests
|   └── CalculatorItemQueueTests
├── OperatorTests
|   └── OperatorTests
├── StringTest
|   └── StringTest
├── StringTest
└── └── StringTest
```

# UML
<details>
    <summary><big>UML</big></summary>
<img src = "https://i.imgur.com/qisRy98.png">
    </details>

# 트러블 슈팅 

### 1. Double LinkedList ARC
```swift
final class Node {
    var prev: Node?
    var data: CalculateItem?
    var next: Node?
    
    init(_ data: CalculateItem?) {
        self.data = data
    }
}

struct CalculatorItemQueue<Element: CalculateItem> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    mutating func enqueue(_ data: Element) {
        if head == nil || tail == nil {
            head = Node.init(data)
            tail = head
            return
        }
        
        let newNode = Node.init(data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    mutating func dequeue() -> Element? {
        if head == nil || tail == nil { return nil }
        
        let dequeue = head
        head = head?.next
        dequeue?.next = nil
        
        return dequeue?.data
    }
    
    mutating func removeLast() {
        if head == nil || tail == nil { return }
        
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        tail?.prev?.next = tail?.next
        tail = tail?.prev
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
```

![](https://i.imgur.com/v5yB6ev.png)

- Node에서 강한 참조를 사용하여 CalculatorItemQueue의 dequeue, clear 메서드를 실행해줄 경우 메모리 누수가 발생할 수 있는 현상을 발견하였습니다.

### ⚒️ 해결방법
```swift
final class Node {
    weak var prev: Node? // weak 선언
    var data: CalculateItem?
    var next: Node?
    
    init(_ data: CalculateItem?) {
        self.data = data
    }
}

// CalculatorItemQueue는 동일
```

![](https://i.imgur.com/Zqc1tH4.png)

- Node의 prev 프로퍼티에 weak 키워드를 사용해주어 ARC의 문제를 해결할 수 있었습니다.

### 2. 테스트 코드의 가독성
```swift
func test_dequeue_됐을경우_처음에_enqueue_해준_데이터가_반환된다() {
         sut.enqueue(data: "111")
         sut.enqueue(data: "222")
         sut.enqueue(data: "333")
         let result = sut.dequeue()!
         let expectation = "111"

         XCTAssertEqual(result, expectation)
     }
```

- 기존 테스트 코드는 아무런 구분 없이 작성하여 가독성이 떨어졌습니다.

### ⚒️ 해결방법
```swift
func test_dequeue_됐을경우_처음에_enqueue_해준_데이터가_반환된다() {
        // given
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        let expectation: Double = 111
        // when
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }
```

- given, when, then으로 명확하게 구분해주어 테스트 코드의 가독성을 높일 수 있었습니다.

# 참고 링크
* [Swift 공식문서](https://www.swift.org/)
* [Swift) 큐(Queue) 구현 해보기](https://babbab2.tistory.com/84)
* [Swift로 구현한 Queue와 더블스택](https://apple-apeach.tistory.com/8)
* [Swift) 단방향 연결 리스트(LinkedList) 구현 해보기](https://babbab2.tistory.com/86)
* [Swift) 양방향 연결 리스트(Doubly LinkedList) 구현 해보기](https://babbab2.tistory.com/87)
