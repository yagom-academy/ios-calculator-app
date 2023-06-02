# 🧮 계산기

## 🎙️ 소개
`Dasan`이 만든 Queue 타입을 활용한 계산기입니다. 

<br>

## 📖 목차
1. [개발자](#-개발자)
2. [타임라인](#-타임라인)
3. [다이어그램](#-다이어그램)
4. [트러블 슈팅](#-트러블-슈팅)
5. [참고 링크](#-참고-링크)
6. [회고](#-회고)

<br>

## 👨‍💻 개발자
| Dasan |
|:-----:|
|<Img src="https://i.imgur.com/EU67fox.jpg" width="200"> |
|[Github Profile](https://github.com/DasanKim)|

<br>

## ⏰ 타임라인
|날짜|내용|
|:--:|:--|
|2023.05.29.(월)| - `Unit Test`공부<br> - 프로젝트를 시작하기 위한 git 셋업|
|2023.05.30.(화)| - `MVC모델`에 맞게 파일 구조 변경<br> - `Array queue` 구현<br> - `Array queue`에 대한 Unit Test<br> - LinkedList 자료구조 공부<br> - 계산기를 위한 queue class diagram 작성|
|2023.05.31.(수)| - `LinkedList queue`에 대한 Unit Test<br> - `LinkedList queue` 구현<br> - 자료구조와 상관없이(array, linkedList) queue 구조가 바뀌지 않도록 두 자료구조 내 property 통일<br> - class diagram 수정|
|2023.06.01.(목)| - `CalculateItem` 파일 분리<br> - test 네이밍 수정 및 test 상황 추가<br> - 피드백 요청사항 반영 및 전체적인 리펙토링 진행|
|2023.06.02.(금)| - queue의 맨 앞과 맨 뒤 값을 알 수 있는 `front`, `rear`프로퍼티 추가<br> - README 작성<br> |

<br>
  
## 📊 다이어그램
<p>
<img src ="https://github.com/DasanKim/ios-calculator-app/blob/step1/CalculateClassDiagram.png?raw=true" width="800">
</p>
  
<br>
  
## 🧨 트러블 슈팅

### 1️⃣ **삽입/삭제시 시간복잡도가 O(1)인 Queue 구현**

⚠️ **문제점** <br>
- `queue`를 구현하는 자료구조로 `Array`와 `LinkedList` 중 `LinkedList`를 선택하였습니다.
    - 그 이유는 `queue`는 `선입선출(FIFO)`의 자료구조로써 데이터가 **삽입되고 삭제되는 것**이 중요하기 때문에
    - 삽입/삭제시 시간 복잡도가 `O(n)`인 `Array` 대신
    - 삽입/삭제시 시간 복잡도가 `O(1)`인 `LinkedList`를 선택하였습니다.

- 노드를 추가해주는 `append` 메서드 부분을 `head` 프로퍼티만을 이용하여 작성하였더니, **노드의 next가 nil일 때까지 순회**하므로 Array의 시간복잡도 O(n)과 다를바가 없었습니다.

```swift
// head만 있을 경우
if isEmpty {
   head = Node(data: data)
   tail = head
}

var node = head
while node?.next != nil {
   node = node?.next
}
node?.next = Node(data: data)
```

✅ **해결방법** <br>
- `단일 LinkedList`지만 `LinkedList`의 처음과 마지막 노드인 `head`와 `tail` 프로퍼티를 추가하였습니다.
- `queue`는 `삽입`할 때는 `마지막 노드(tail)`를, `삭제`할 때는 `첫 노드(head)`만 알고 있으면 되기 때문입니다.
- `tail` 프로퍼티 덕분에, 노드를 추가할 때 끝까지 순회하지 않고 **바로 마지막 노드를 찾아갈 수 있었습니다.**

```swift
// head와 tail이 있을 경우
if isEmpty {
    head = Node(data: data)
    tail = head
} else {
    let node = Node(data: data)
    tail?.next = node
    tail = node
}
```

### 2️⃣ **Unit Test 활용하기**

⚠️ **문제점** <br>
- unit test에 익숙하지 못한 것도 있지만 이해를 잘 못했던 탓에 test를 하다보니 아래와 같은 문제가 발생했습니다.
  - mothod 이름에서 어떤 로직이 **이럴 때 어떻게 작동한다는 것**을 정확하게 알 수 없습니다.
  - mothod 이름 `test_뒤`에 어떤 기능 또는 어떤 mothod를 test하고 있는지 표기하지 않았습니다.
  - test mothod **위치가 논리적으로 어색**했습니다.
  - test가 **다양한 상황**에서 진행되고 있지 않았습니다.

```swift
    func test_노드의갯수를_올바르게_출력한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        sut.append(4)
        sut.append("+")
        sut.append("-")
        let expectation = 6

        // when
        let result = sut.count

        // then
        XCTAssertEqual(result, expectation)
    }
```

✅ **해결방법** <br>
- 리뷰어의 조언에 따라 문제점이었던 것들을 아래와 같이 수정하였습니다.
  - 로직이 **이럴 때 어떻게 작동한다는 것**을 method 이름에 나타내기
  - mothod 이름 `test_뒤`에 어떤 기능 또는 어떤 mothod를 test하고 있는지 표기하기
  - test mothod **위치를 논리적으로** 배치하기
  - test가 **다양한 상황**에서 진행하기

  
```swift
    func test_count_조건없이_queue의_count를호출할때_count는_0이다() {
        (내부구현 생략)
    }

    func test_count_queue_초기화시_head에_nil이들어갔을때_count는_0이다() {
        (내부구현 생략)
    }

    func test_count_queue_초기화시_head에_Node를넣었을때_count는_1이다() {
        (내부구현 생략)
    }

    // 이후 enqueue test 이후 아래 count test 실행

    func test_count_enqueue_1_2_3을했을때_count는_3이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let expectation = 3

        // when
        let result = sut.count

        // then
        XCTAssertEqual(result, expectation)
    }

    func test_count_enqueue_1_2_3을하고_dequeue를했을때_count는_2이다() {
        (내부 구현 생략)
    }
```

  <br>
  
## 📚 참고 링크

- [🍎 Apple Docs: Array](https://developer.apple.com/documentation/swift/array)
- [🍎 Apple Docs: Set Up and Tear Down State in Your Tests](https://developer.apple.com/documentation/xctest/xctestcase/set_up_and_tear_down_state_in_your_tests)
- [📄 WebPage: LinkedList](https://www.kodeco.com/books/data-structures-algorithms-in-swift/v3.0/chapters/6-linked-list)

<br>
  
## 💭 회고
### 👏 칭찬할 부분
- 규칙적인 생활을 하였습니다.

### 💪 개선해야할 부분
- 구현 전에 이유있는 코드를 위해 고민해야겠습니다.
- 공식문서를 읽을 시간을 확보해야겠습니다.
