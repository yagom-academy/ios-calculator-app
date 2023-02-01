# 계산기

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)

<br/>

## 1. 소개
LinkedList와 Queue를 활용해 사칙연산이 가능한 계산기 앱

### Model
* [struct] **CalculatorItemQueue**
    - LinkedList를 활용한 queue 자료구조를 구현
    - 보편적인 queue의 기능 중 필요한 기능만을 메서드로 정의
    - 제네릭으로 정의하여 확장성 확보
    - TDD(Test-Driven Development)를 통해 메서드를 정의하여 안정성 확보

* [struct] **LinkedList**
    - Node 클래스 인스턴스들을 연결한 단방향 연결 리스트
    - 선입선출(FIFO)에 용이하도록 리스트의 처음과 마지막 데이터를 가리키는 head, tail 프로퍼티 정의
    - TDD(Test-Driven Development)를 통해 메서드를 정의하여 안정성 확보

* [protocol] **CalculateItem**
    - 빈 프로토콜을 정의하고 Generic Constraint로 활용하여 Generic에 들어갈 수 있는 데이터 타입을 한정시켜 줌


<br/>

## 2. 팀원

| Rowan | 
| :--------: | 
| <Img src = "https://i.imgur.com/S1hlffJ.jpg" width="200" height="200"/>      |
| Driver, Navigator     |
| [Github Profile](https://github.com/Kyeongjun2) |


<br/>

## 3. 타임라인
**프로젝트 진행 기간** 
- **23.01.24 (화) ~ 23.01.27 (금)** 


> 23.01.24 (화): **[TDD]** Queue 구현 (QueueList: Array) <br/>
> 23.01.25 (수): **[TDD]** QueueList LinkedList로 변경 / STEP 1 PR <br/>
> 23.01.26 (목): **[TDD]** PR 피드백 적용 - 접근제어, Test case 수정 <br/>

<br/>

## 4. 프로젝트 구조
#### UML
![](https://i.imgur.com/OyqP83M.png)


#### 파일 구조
~~프로젝트 완료 후 추가 예정~~

<br/>

## 5. 실행 화면(기능 설명)
~~UI 연결 후 추가 예정~~

<br/> 

## 6. 트러블 슈팅
### STEP 1.

<details>
<summary>LinkedList를 Queue에 활용하기</summary>

- Queue 구현 초기에 Array를 활용하여 Queue를 구현하려 했습니다.
    
```swift
// before
struct CalculatorItemQueue<Element> {
    var queue: Array<Element?> = []
    var head: Int = 0
    var result: Double = 0
    
    mutating func enqueue(_ element: Element) {
        queue.append(element)
    }

    mutating func dequeue() -> Element? {
        guard queue.count != 0 else {
            return nil
        }

        let element = queue.removeFirst()

        return element
    }
}
```

<br/>
    
- Array를 활용해 Queue를 구현할 경우 `dequeue()` 메서드의 시간복잡도가 O(n)이 되는 문제점이 있었습니다.
- Index를 갖고 있는 Array는 Queue의 선입선출(FIFO)을 구현하려 하면 대부분 `dequeue` 과정에서 시간복잡도 O(n)을 갖습니다.
- `dequeue`는 가장 먼저 들어간 데이터를 반환하는데, Array의 가장 처음 데이터가 삭제된다면 이후 데이터들의 인덱스를 1씩 줄여주는 작업이 필요하기 때문입니다.
- 시간복잡도의 문제점을 해결하기 위해 FIFO 구현에 적합한 LinkedList를 Queue List로 활용하게 되었습니다.
    
```swift
// after
struct CalculatorItemQueue<Element: CalculateItem> {
    var queue: LinkedList<Element>
    private var queue: LinkedList<Element>

    var itemCount: Int {
        return self.queue.count
    }

    func isEmpty() -> Bool {
        let result = self.queue.isEmpty

        return result
    }

    mutating func enqueue(_ element: Element) {
        queue.appendLast(element)
    }

    @discardableResult
    mutating func dequeue() -> Element? {
        guard let element = queue.removeFirst() else { return nil }

        return element
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }

    init(queueList: LinkedList<Element>) {
        self.queue = queueList
    }
} 
```    
    
- LinkedList에 head, tail 프로퍼티를 정의하여 항상 가장 처음과 마지막 노드를 가리키게 했습니다.
- 이를 통해 `enqueue`, `dequeue` 과정 모두 시간복잡도를 O(1)로 가지도록 개선할 수 있었습니다.
</details>

<br/>

## 7. 참고 링크
- [Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [야곰닷넷 - UnitTest 작성하기](https://yagom.net/courses/unit-test-%EC%9E%91%EC%84%B1%ED%95%98%EA%B8%B0/)
- [Benoit Pasquier; Data Structure - How to implement a Queue in Swift](https://benoitpasquier.com/data-structure-implement-queue-swift/)
- [Kodeco - Swift Algorithm: Linked List Data Structure](https://www.kodeco.com/947-swift-algorithm-club-swift-linked-list-data-structure)


