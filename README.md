# 계산기 I
> 프로젝트 기간 2022.03.14 ~ 2022.03.25 </br>

## 프로젝트 소개

계산기를 만듭니다.

## 키워드
- TDD 시작하기
- Queue 자료구조의 이해와 구현
- UML을 기반으로 한 코드구현
- 숫자와 연산자 입력에 큐 활용
- IBOutlet / IBAction의 활용
- 스택뷰의 활용
- 스크롤뷰의 활용
---
## [STEP 1]

## UML

![Class Diagram-6](https://user-images.githubusercontent.com/70807352/158533031-c41acf4d-19f3-4650-a556-c4ed11d0aa31.png)



### 구현한 내용

- **class** CalculatorItemQueue : 계산기에서 사용되는 큐
    - queue: LinkedList<CalculatorItem> : 큐
    - isEmpty() -> Bool : 큐가 비어있는가?
    - enqueue(_ node: Node<CalculatorItem>) : 큐에 값 넣기
    - dequeue() -> CalculatorItem? : 큐에서 값 빼기
    - clear() : 큐 전체 비우기
- **class** Node<T>: Equatable
    - data: T : 노드 데이터
    - next: Node? : 다음 노드 가리킨다.
- **class** LinkedList<T>: Sequence
    - head: Node<T>? : 연결 리스트의 첫 노드
    - tail: Node<T>? : 연결 리스트의 마지막 노드
    - isEmpty() -> Bool : 연결 리스트가 비었는가?
    - append(node: Node<T>) : 연결 리스트에 맨 뒤에 노드 추가
    - removeFirst() -> T? : 연결 리스트에 맨 앞 노드 제거
    - clear() : 연결 리스트 전체 비우기
    - makeIterator() -> LinkedListIterator<T>
- **class** LinkedListIterator<T>: IteratorProtocol
    - **typealias** Element = Node<T>
    - current: Element
    - next() -> Element?
- **enum** Operator : 연산자
- **enum** CalculatorItem : 연산자와 정수, 실수
- **protocol** CalculateItem : 빈 프로토콜

---
### 고민 사항

1. 네이밍
2. 연결 리스트
    - 처음에는 큐를 배열로 만들었지만 리스트를 직접 만들고 싶어서 큐와 비슷하게 선입선출이 가능한 연결 리스트를 정의했습니다.
    - 정의한 연결 리스트 타입에서 고차함수를 사용하고 싶어서 프로토콜을 채택했습니다. ~~테스트를 해본 결과 무한루프에 빠지는데요. 프로토콜 채택 시 구현한 메서드의 내용이 잘못된 것 같습니다. 어떤 부분에서 잘못되었는지 알 수 있을까요?~~😭
        
        current  값 갱신을 안했더라구요. 아래처럼 구현하면 정의된 타입에서 고차함수를 사용할 수 있습니다.
        
        ```swift
        func test_sequence채택_고차함수사용가능한지() {
                sut.enqueue(MockNode.mockOperator)
                sut.enqueue(MockNode.mockDouble)
        
                let result: [CalculatorItem] = sut.map { $0.data }
                let expectation = [CalculatorItem.integer(10), CalculatorItem.operator(.devision), CalculatorItem.double(3.5)]
        
                XCTAssertEqual(result, expectation)
        }
        ```
        
    
    ```swift
    extension CalculatorItemQueue: Sequence {
        func makeIterator() -> queueIterator<T> {
            return queueIterator(current: self.queue.head)
        }
    }
    
    struct queueIterator<T>: IteratorProtocol {
        typealias Element = Node<T>
        
        var current: Element?
        
        mutating func next() -> Element? {
            if let node = current {
                current = node.next
                return node
            } else {
                return nil
            }
        }
    }
    ```
    
    ```swift
    func test_sequence채택_고차함수사용가능한지() {
            sut?.append(node: Node(data: 2))
    
            let result: [Int] = sut!.map {test in test.data}
    
            XCTAssertEqual(result, [1, 2])
    }
    ```
    
    ```swift
    extension LinkedList: Sequence {
        func makeIterator() -> LinkedListIterator<T> {
            return LinkedListIterator(current: self.head)
        }
    }
    
    struct LinkedListIterator<T>: IteratorProtocol {
        var current: Node<T>?
        
        mutating func next() -> Node<T>? {
            if let node = current {
                current = node.next
                return node
            } else {
                return nil
            }
        }
    }
    ```
    
    - 기존에 시도했던 배열과 달리 인덱스를 통한 값 찾기가 불가능하고 next로 하나씩 찾아가서 search의 성능은 좋지 않은 것 같습니다.
    - 배열의 경우 값 변경이 발생하면 전체 요소들의 이동이 발생하지만 연결 리스트의 경우는 삽입과 삭제에서 유리합니다. 그러니까 제일 앞의 값을 삭제할 때 유리할 것 같습니다.
3. 연산자와 숫자를 타입으로 묶기
    - 제너릭을 사용하면 하나의 타입만 넣을 수 있습니다.
    - 계산기에서 입력될 값이 연산자와 숫자일 것 같아 다른 타입을 하나의 리스트에 넣고 싶었습니다.
4. 파일 분리
    - extension끼리 묶는 것이 좋을지 고민입니다. 파일을 구분하는 기준이 명확하지 않아 어떤 기준으로 나누는 것이 좋을지 궁금합니다.
    - 지금 기준은 중요하다 생각되는 타입은 개별적인 파일에 두고 그 타입과 관련되는 것들을 같은 파일 내에 위치시켰습니다. 만약 extension이라는 group을 생성한다면 extension한 타입별로 파일을 나눠야 할까요? 그렇다면 확인을 위해 파일 이동을 해야하는데 코드 수정 시 가독성은 괜찮을까요?
5. TDD
    - 처음에 배열로 리스트를 만들고 테스트 코드를 작성했습니다. 이후 리스트를 연결리스트로 바꾸면서 테스트 코드를 전체적으로 다 수정했는데요. 테스트가 타입에 의존해서 발생한 문제일까요?
    - 프로토콜로 진행하게 되어도 채택한 타입에서 정의한 프로퍼티나 메서드를 사용하려면 다운 캐스팅을 진행해야 할 것 같은데요. 테스트 케이스는 타입을 수정할 때마다 변경하는 것이 맞을까요?
    - 테스트 시 @testable 해도 private으로 선언된 것은 타입 외부이므로 접근이 불가능하다고 알고 있습니다. 그렇다면 테스트용 타입을 따로 만들어야 할까요? 아니면 테스트할 때만 기존 코드의 접근제어자를 수정했다가 다시 private을 붙여야 할까요?
6. commit 작게 하기

---
