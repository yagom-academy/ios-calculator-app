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
계산기 앱에서 버튼을 통해 숫자와 연산자를 입력하고, 계산 결과를 확인할 수 있다.

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
    - Node class 구현 / 테스트 케이스 작성
    - LinkedList struct 구현 / 테스트 케이스 작성
    - CalculatorItemQueue struct 구현 / 테스트 케이스 작성
- 23.01.26(목)
    - 네이밍, 폴더 구조 리팩토링
- 23.01.27(금)
    - Node 클래스 내 불필요한 프로퍼티 제거
- 23.01.30(월)
    - 에러 처리를 위한 OperatorError enum 구현
    - 에러 처리 구현
    - ExpressionParser enum 구현 / 테스트 케이스 작성
    - Formula struct 구현 / 테스트 케이스 작성
- 23.01.31(화)
    - Formula struct 수정
- 23.02.01(수)
    - Formula struct 수정
    - ExpressionParser enum 수정
    - 컨벤션 리팩토링
- 23.02.02(목)
    - ViewController 구현

<br>

# 4. 시각화된 프로젝트 구조
## 폴더 구조
``` swift
├── Model
|   ├── Node
|   ├── LinkedList
|   ├── CalculatorItemQueue
|   ├── CalculateItem
|   ├── Formula
|   ├── ExpressionParser
|   ├── Operator
|   ├── OperatorError
|   ├── ExtensionString
|   └── ExtensionDouble
├── Controller
|   └── ViewController
├── Test
|   ├── NodeTests
|   ├── LinkedListTests
|   ├── CalculatorItemQueueTests
|   ├── FormulaTests
|   ├── ExpressionParserTests
|   ├── OperatorTests
|   ├── ExtentionStringAndDoubleTests
|   └── ExtentionForTest
└── View
    ├── Main
    └── Assets
```

<br>

## 클래스 다이어그램
<img src="https://i.imgur.com/S2h2f8i.png" width=800>

<br>
<br>

# 5. 실행 화면

| 기능 | <center>기능 설명 | 실행 화면 |
| :-----: | ----- | :-----: |
| AC | AC는 모든 연산내역을 <br> 초기화한다.| <img src="https://i.imgur.com/3WsvKEv.gif" width=180> |
| CE | CE는 현재 입력하던 숫자 <br> 혹은 연산결과만 삭제한다.| <img src="https://i.imgur.com/jvbM4fN.gif" width=180>|
| ⁺⁄₋ | ⁺⁄₋ 버튼은 현재 입력한 <br> 숫자의 부호를 변환한다. | <img src="https://i.imgur.com/ipFm98u.gif" width=180>|
| 연산자 | 숫자입력 중에 연산자(÷, ×, -, +)를 <br> 누르면 숫자입력을 중지하고 <br> 다음 숫자를 입력받는다.| <img src="https://i.imgur.com/FHFhdCh.gif" width=180>|
| 연산자 | 현재 숫자입력이 없는 상태인 <br> 0에서는 연산자를 반복해서 <br> 누르더라도 연산이 이루어지지 <br> 않고 연산자의 종류만 변경한다. | <img src="https://i.imgur.com/6AAGQ4w.gif" width=180>|
| = | = 버튼을 누르면 입력된 연산을 <br> 한 번에 수행한다. 연산자 우선순위는 <br> 무시되고 순차적으로 연산한다.| <img src="https://i.imgur.com/QsGq0zZ.gif" width=180>|
| 출력 형식 | 사용자에게 표시하는 숫자는 뒤에 <br> 0000 등 불필요한 숫자가 <br> 나타나지 않는다. <br> 숫자는 3자리마다 쉼표(,)를 표기한다.| <img src="https://i.imgur.com/UlnmLf6.gif" width=180>|
| 예외처리 | 0으로 나누기에 대해서는 결과를 <br> NaN으로 표기한다. | <img src="https://i.imgur.com/Zq2N3FW.gif" width=180>|

<br>

# 6. 트러블 슈팅
 
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
    
### 테스트 메서드 명의 언더바 사용
모든 띄어쓰기마다 언더바(_)를 사용하는 것은 테스트 메서드 명이 지나치게 길어질 수 있다고 생각했다. 따라서 테스트 케이스의 given, when, then을 구분하여 `test_given_when_then` 형식으로 통일하였다. 위의 테스트 케이스는 최종적으로 아래의 형태가 되었다.


``` swift
    func test_비어있는리스트에서_add호출시_head가add된Node이다() { ... }
    
    func test_비어있지않은리스트에서_add호출시_head가add된Node이다() { ... }
```

<br>

# 7. 참고 링크
- [Swift Language Guide - Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
- [오토레이아웃 정복하기 - 야곰닷넷](https://yagom.net/courses/autolayout/)
- [NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
