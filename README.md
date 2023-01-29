# 계산기 :calling: 

| <center>목 차</center> |
|---|
| [1. 프로젝트 소개](#1-프로젝트-소개) |
| [2. 팀원](#2-팀원) |
| [3. 타임라인](#3-타임라인) |
| [4. 시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조) |
| [5. 실행 화면](#5-실행-화면) |
| [6. 트러블 슈팅](#6-트러블-슈팅) |
| [7. 참고 링크](#7-참고-링크) |

# 1. 프로젝트 소개
계산기 앱에서 버튼을 통해 숫자와 연산자를 입력하고, 계산 결과를 확인할 수 있습니다.

<br>

# 2. 팀원

|kokkilE  |
|:----: |
| <img src="https://i.imgur.com/4I8bNFT.png" width="130" height="130"/> |
|[Github](https://github.com/kokkilE) |

<br>

# 3. 타임라인

- 23.01.25(수)
    - Class Diagram 작성
    - Node 클래스 구현 / 테스트 케이스 작성
    - LinkedList 구조체 구현 / 테스트 케이스 작성
    - CalculatorItemQueue 구조체 구현 / 테스트 케이스 작성
- 23.01.26(목)
    - 네이밍, 폴더 구조 리팩토링

<br>

# 4. 시각화된 프로젝트 구조
## 폴더 구조
``` swift
├── Model
|   ├── Node
|   ├── LinkedList
|   ├── CalculatorItemQueue
|   └── CalculateItem
├── Controller
|   └── ViewController
├── Test
|   ├── NodeTests
|   ├── LinkedListTests
|   ├── CalculatorItemQueueTests
|   └── ExtentionForTest
└── View
    ├── Main
    └── Assets
```

<br>

## 클래스 다이어그램
<img src="https://i.imgur.com/REOd9Ip.png" width=800>


<br>
<br>

# 5. 실행 화면

todo...

<br>

# 6. 트러블 슈팅
 
## :bulb: 제네릭 테스트 케이스
Node를 제네릭 데이터를 저장하도록 구현하였으므로 테스트도 제네릭으로 수행하고 싶었지만, 해당 타입의 인스턴스를 생성해야 시험이 가능하기 때문에 제네릭 자체로 테스트를 할 수는 없었다.
따라서 `String` 타입의 노드를 만들어 테스트를 진행했다.

``` swift
final class NodeTests: XCTestCase {
    var sut: Node<String>!

    ...
```

<br>

## :bulb: 테스트 케이스 작성 기준

### LinkedList add() 메서드
``` swift
    mutating func add(_ node: Node<T>) {
        if isEmpty {
            self.head = node
            self.tail = node
            return
        }
        
        node.next = head
        head = node
    }
```

위의 `add()`메서드는 리스트가 비어있는 경우와 비어있지 않은 경우 실행되는 코드가 다르다.
따라서 모든 코드가 정상적으로 수행되는지 확인하기 위해서는 최소 두 개 이상의 테스트 코드가 필요했다.

그런데 테스트 케이스의 네이밍에 명확한 기준이 없다보니 다소 모호한 네이밍이 되었다.

### 수정 전 테스트 메서드 명


``` swift
    func test_1회_add후_리스트의_head가_add된_Node이다() { ... }
    
    func test_2회_add후_리스트의_head가_두번째_add된_Node이다() { ... }
```

위 네이밍에 대해서 리뷰어의 의견을 받고 고민한 결과, 다음과 같은 문제가 있다고 생각했다.
- 1회, 2회와 같은 횟수의 의미가 불분명하다.
- 테스트하고자 하는 대상이 불분명하다. 

### 수정 후 테스트 메서드 명

``` swift
    func test_비어있는_리스트에서_add_호출시_head가_add된_Node이다() { ... }
    
    func test_비어있지_않은_리스트에서_add_호출시_head가_add된_Node이다() { ... }
```
네이밍의 문제점을 개선한 부분
- 1회, 2회와 같은 횟수의 의미가 불분명했던 점 
-> 횟수를 표기하는 대신 횟수가 나타내는 의미(비어있다, 비어있지 않다)를 명시했다.
- 테스트하고자 하는 대상이 불분명하다.
-> 테스트하고자 하는 메서드명 뒤 `호출시`를 명시하여 테스트하고자 하는 대상임을 나타내고자 했지만, 여전히 모호함이 있다고 생각한다. Node의 head를 테스트하고자 하는 건지, add 메서드를 테스트하고자 하는 건지 불분명하다고 생각한다. 테스트 케이스의 네이밍 기준에 대해 더 고민해야 할 것 같다.
<br>

# 7. 참고 링크
- [Swift Language Guide - Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
