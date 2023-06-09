# 🧮 고래서 얼만데요? 🧮

> 프로젝트 기간 : 2023-05-29 ~ 2023-06-09

<br>

## 목차

🧮 [소개](#1.) <br>
🙋🏻‍♀️ [팀원](#2.) <br>
📆 [타임라인](#3.) <br>
📐 [클래스 다이어그램](#4.) <br>
📲 [실행 화면(기능 설명)](#5.) <br>
💡 [고민한 점](#6.) <br>
📝 [트러블 슈팅](#7.) <br>
🔗 [참고 링크](#8.) <br>
📮 [팀 회고](#9.) <br>

<br>

<a id="1."></a>
## 🧮 소개 
입력한 순서대로 연산해주는 계산기 앱

<br>

<a id="2."></a>
## 🙋🏻‍♀️ 팀원
| Whales 🐋|
| :--------: |
| <Img src = "https://i.imgur.com/wnhhCv9.jpg" width = "200"/> |
| [Github](https://github.com/WhalesJin) |

<br>

<a id="3."></a>
## 📆 타임라인
|**날짜**|**진행 사항**|
|:-:|-|
|2023-05-31 (수)|- 계산 아이템 프로토콜 생성 <br>- 계산기 아이템 큐 생성  후 메서드들 `test` 및 구현 <br> 　- 큐는 배열로 구현 <br> 　- 원소를 추가하는 `enqueue` 함수 <br> 　- 배열의 첫번째 원소를 삭제하는 `dequeue` 함수 <br> 　- 배열의 모든 원소를 삭제하는 `clearQueue` 함수 <br> 　- 계산기 아이템 큐를 읽어오는 함수 생성 |
|2023-06-01 (목)|- 계산기 아이템 큐의 선형 구조 변경 및 그에 따른 전체 코드 수정|
|2023-06-02 (금)|- 연결 리스트 구현을 위한 Node 클래스와 연결리스트 구조체 생성 <br>- 연결 리스트 클래스 생성 <br> 　- `head`, `tail`, `count`, `isEmpty` 생성 <br> - 연결 리스트의 테스트 클래스 생성 <br> - 연결 리스트의 메서드들 `test` 및 구현 <br> 　- `node`를 추가하는 `append` 함수 구현 및 수정  <br> 　- 특정한 자리에 `node`를 추가하는 `insert` 함수 구현 및 수정 |
|2023-06-03 (토)|- 연결 리스트의 메서드들 `test` 및 구현 <br> 　- 첫번째 `node`를 삭제하는 `removeFirst` 함수 구현  <br> 　- 마지막 `node`를 삭제하는 `removeLase` 함수 구현 <br> 　- 특정한 자리에 `node`를 삭제하는 `delete` 함수 구현 <br> - 연결 리스트 클래스를 구조체로 수정 <br> - 계산기 아이템 큐 구조체의 list 타입을 연결 리스트로 수정 <br> 　- 변경에 따른 테스트 함수 수정 |
|2023-06-04 (일)|- 계산기 아이템 큐의 선형 구조 변경 및 그에 따른 전체 코드 수정|
|2023-06-06 (화)|- 컨벤션 등 간단한 수정 <br>- `String` 타입에 `split(with:)` 메서드 구현 <br> - 연산자 열거형 타입 생성 <br> 　- `+, -, /, *` 프로퍼티 구현 <br> 　- 연산 메서드 구현 <br> 　- 계산 메서드 구현 |
|2023-06-07 (수)|- `Formula(공식)` 구조체 타입 생성 <br> 　- `operands(피연산자)`, `operators(연산자)` 프로퍼티를 `Queue` 타입으로 구현  <br> - `ExpressionParser` 열거형 타입 생성 |
|2023-06-08 (목)|- `ExpressionParser` 열거형 <br> 　- `componentsByOperator` 메서드 구현 <br> 　- `parse` 메서드 구현 및 수정 <br> - `CalculatorError` 열거형 타입 및 파일 생성 <br> - 계산기 아이템 큐 구조체의 `dequeue` 메서드가 `data`를 반환하도록 수정  <br> - `Formula` 구조체의 `result` 메서드 구현 및 수정 |

<br>

<a id="4."></a>
## 📐 클래스 다이어그램 📏

<Img src = "https://hackmd.io/_uploads/S14Rm31v3.png" width="800"/>

<br>

<a id="5."></a>
## 📲 실행 화면(기능 설명)
(다음 step 진행 후 작성 예정)

<br>

<a id="6."></a>
## 💡 고민한 점
#### 1. `Queue` 타입 구현을 위한 List 타입 선택 과정 고민
> 여러가지 방법 중 배열과 연결리스트를 비교
- 배열
        <img src = "https://hackmd.io/_uploads/rkVqvlVI3.png" width = "300"/>
        - 여러가지 데이터를 하나의 줄 모양으로 저장
        - 크기가 고정
        - 메모리를 항상 차지하고 있다는 단점
        - 크기가 똑같은 걸 아니까 100번째가 궁금하면 점프  -> 속도가 빠르다.
        (index를 통해)
        - 새로운 요소 삽입이 빠르다.
- 단방향 연결리스트
        <img src = "https://hackmd.io/_uploads/rym7veNIn.png" width = "400"/>
        - 각각 떨어진 공간에 존재하는 데이터를 연결해 놓은 것
        - 실질적인 부분과 다음 주소값의 정보를 가지는 부분으로 이루어져있다.
        - 한 방향만 보고 있기 때문에 다음만 안다.
        - 주소값 정보만 바꿔주면 되어서 추가 / 삭제가 용이하다.
        - 추가/삭제가 자유로워 메모리 할당이 안된다. 한 번에 찾을 수 없다.
        - 저장 공간 효율이 높지 않다.
- 단방향 연결리스트의 가장 장점은 리스트 중간에서의 추가 / 삭제가 자유롭다는 부분인데 계산기 프로젝트에서는 중간 수정이 없어서 단방향 연결리스트보다는 크기가 정해져있고 새로운 요소 삽입이 빠른 배열이 더 효율적이라고 생각해서 배열로 선택.

> 수정
- 구현하는 동안 배열의 메서드들을 쓰면서 큐의 구현의 필요성이 안 느껴지고 뭔가 이상하다라는 생각을 했고, 제대로 배우기 위해서 다시 찾아보고 공부. 배열이랑 연결리스트는 시간복잡도면에서 차이가 있다는 것을 알게되었다.
- 배열
    - removeFirst : 앞으로 한 칸씩 땡겨져서 O(n)
    - append도 새로운 공간을 할당하고 그 전 데이터를 복사해와야해서 O(n)이 될 수도 있다.
    - 원소 접근 O(1)
- 연결리스트 
    - 요소와 요소를 노드로 연결.
    - append나 removeFirst가 O(1)
    - 단점 : 접근 시간. 포인트를 거쳐가면서 접근하기 때문에 오래 걸린다.
- 이러한 차이점들을 보고 계산기 프로젝트는 큐로 구현하기 때문에 중간 삽입이나 삭제가 없어서 배열의 장점이자 연결리스트의 단점인 접근면에서 문제가 되지 않고, `dequeue` 메서드를 구현할 때 쓰게 될 `removeFirst` 부분에서 시간복잡도가 낮은 연결리스트가 더 효율적일 것 같아서 연결리스트로 코드를 수정
- `양방향 연결 리스트(Doubly Linked List)`로 코드를 구현해보고 계산기에는 `단방향 연결 리스트(Singly Linked List)`가 적합할 것 같아서 단방향 연결 리스트로 코드를 작성하였다.
    <details>
    <summary>양방향 연결 리스트</summary>

    ```swift
    class Node<T> {
        var data: T?
        var next: Node?
        var prev: Node?

        init(data: T? = nil, next: Node? = nil, prev: Node? = nil) {
            self.data = data
            self.next = next
            self.prev = prev
        }
    }

    class DoublyLinkedList<T> {
        private var head: Node<T>?
        private var tail: Node<T>?

        func append(data: T?) { // 맨 뒤에 추가
            if tail == nil {
                head = Node(data: data)
                tail = head
                return
            }
            // tail의 next가 새 data, tail이 새 data의 prev가 되고, 새 data가 tail이 된다.
            var newNode = Node(data: data)
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
        }

        func insert(data: T?, at index: Int) { // index==0이면 head에 추가, 중간에 추가, index가 너무 크면 tail에
            if tail == nil {
                head = Node(data: data)
                tail = head
                return
            }

            if index < 0 {
                return
            } else if index == 0 {
                var newNode = Node(data: data)
                head?.prev = newNode
                newNode.next = head
                head = newNode
                return
            }

            // 2번에 넣는다고 치면, 1번의 next가 new, 2번의 Prev가 new, new의 prev가 1번, new의 next가 2번
            var node = head
            for _ in 0..<(index - 1) {
                if node?.next == nil { break }
                node = node?.next
            }

            let nextNode = node?.next
            let newNode = Node(data: data)
            node?.next = newNode
            node?.next?.next = nextNode
            nextNode?.prev = newNode
            newNode.prev = node
        }

        func removeFirst() {
            if head == nil {
                return
            }

            head = head?.next
            head?.prev = nil
        }

        func removeLast() {
            if head == nil {
                return
            }

            tail = tail?.prev
            tail?.next = nil
        }

        func delete(at index: Int) {
            if tail == nil {
                return
            }

            if index < 0 {
                return
            } else if index == 0 {
                head = head?.next
                head?.prev = nil
                return
            }

            var node = head
            for _ in 0..<(index - 1) {
                if node?.next == nil { return }
                node = node?.next
            }

            var temp = node?.next
            node?.next = node?.next?.next
            node?.next?.next?.prev = node
            temp = nil
        }
    }
    ```
    </details>
<br/>

#### 2. `CalculatorItemQueue`에 구현할 메서드
- `Queue`을 구현할 때 있어야 하는 메서드들인 큐에 넣어주는 `enqueue()` 와 큐에 넣은 걸 다시 삭제하는 `dequeue()`를 구현
- 추가적으로 계산기를 실행하다보면 초기화하는 경우도 있어서 데이터들을 다 삭제하는 `clearQueue()`라는 메서드도 구현
- 또한, `test`를 진행하던 중 배열을 가지고 직접 비교해야하는 경우가 있어서 은닉화되어있는 배열을 볼 수 있도록 `readCalculatorItemQueue()`라는 함수도 구현
<br/>


#### 3. UML 이해하기

주어진 UML에 충실하기 위해서 고민을 많이 했다.
- `Operator`의 메서드
<img src = "https://github.com/yagom-academy/ios-calculator-app/assets/124643545/e8f4c68e-d9f8-4aa0-bc2e-bb909cf18cb8" width = "400"> <br>
    - `enum`의 `case`들은 접근할 수 있어야 하므로 상대적으로 `+`를 개방으로 `-`를 폐쇄로 생각하고 진행
    - 같은 맥락으로 메서드들 중 `calculate`만 개방으로, 나머지 연산 메서드들은 `private func`로 구현
    - 열거형에 대한 공부를 하던 중 'Enum은 switch문과 같이 사용할 때 강력하다'라는 내용을 보고 '아, 그래서 `calculate`만 개방이구나!!'' 하고 깨달아서 `switch` 문으로 메서드 내용을 구현
    ```swift
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add :
            return add(lhs: lhs, rhs: rhs)
                  ⋮
        }
    }
    ```
    ([참고 블로그 - Enum](https://labs.brandi.co.kr//2021/09/01/kimjh3.html))
    - 나중에 rawValue를 이용해서 연산을 끄집어 낼 수 있겠다고 생각
- `Formula`, `ExpressionParser` 타입 구현
    - `Formula` 타입은 피연산자, 연산자 두 개의 큐가 있고, `result` 메서드의 반환타입이 `Double`인 걸로 보아 두 개의 큐로 여기서 계산을 하겠구나 라고 생각하고 `ExpressionParser` 타입은 `parse`는 개방이고, `componentsByOperator`는 폐쇄여서 `parse`에서 `componentsByOperator`를 호출해서 쓰겠구나 라고 생각
    - 생각은 이렇게 했지만 문제는 계산기 대체 어디서 이 친구들이 어떻게 쓰이는지가 너무너무 감이 오지 않았다. (이미 여기서부터 잘못된 방향) 계산기 앱에서 연산자 버튼을 터치하면 큐에 올라가는 시스템인 것 같은데 그러면 한 번에 각자 하나씩 올라가면 `Formula` 인스턴스를 계속 생성하는 의미가 있나, 큐를 쓰는 의미가 있나 너무 혼란. (답답한 마음에 메모장에 그림도 열심히 그려보다.🎨🖌️)
    - 사실 메서드를 메서드 자체로 봐야하는데 계산기 앱 UI랑 연결하려고 한 거에서부터 왔던 혼란임을 캐치. 앱 상에서 보여지는 것과 데이터로 받아오는 것은 또 다르게 할 수 있고 지금 현재는 `"1 + 2 + 3 * 5"` 이런 종류의 `String`을 연산으로 바꾸는 문제에 초점을 둬야한다는 걸 깨닫게 되었다.



<br>

<a id="7."></a>
## 📝 트러블 슈팅
#### `componentsByOperator` 메서드
- 이름을 보니 연산자를 기준으로 쪼개는 메서드 같아서 확장한 split 메서드를 여기서 쓰겠구나 생각을 했고, `"+", "-", "*", "/"` 네 가지 연산자를 전부 기준으로 잡아줘야겠다고 생각
- 문제점
    - `Operator`타입이 `CaseIterable` 프로토콜을 준수하기에 `allCases` 키워드를 이용해서 `split(with:)`메서드로 네 가지 연산자를 기준으로 쪼개주려 했지만 그렇게 되면 `2 - (-3)` 과 같은 `-` 부호 문제가 발생
- 해결
    - 연산자 앞 뒤로 공백이 있으므로 공백을 기준으로 쪼개면 자연스럽게 연산자와 피연산자가 분리된다. `[ 피연산자, 연산자, 피연산자, 연산자, 피연산자 ... ]` 형태로 반환
<br/>
    
#### `result` 메서드

#### 에러처리
    
#### `parse` 메서드

<br>

<a id="8."></a> 
## 🔗 참고 링크!!

<Img src = "https://hackmd.io/_uploads/Syg8LubwUn.png" width="20"/> [재미난 CS - PART II](https://camp.yagom-academy.kr/auth)

<Img src = "https://hackmd.io/_uploads/Syg8LubwUn.png" width="20"/> [야곰닷넷 - Unit Test](https://yagom.net/courses/unit-test-작성하기/)

<Img src = "https://github.com/WhalesJin/ios-juice-maker-yagom/assets/124643545/ad865807-d3a4-4345-9c55-d7a2c23761d5" width="20"/> [블로그 - 단방향 연결 리스트](https://babbab2.tistory.com/86)

<Img src = "https://github.com/WhalesJin/ios-juice-maker-yagom/assets/124643545/ad865807-d3a4-4345-9c55-d7a2c23761d5" width="20"/> [블로그 - 연결리스트로 큐 구현하기](https://velog.io/@kottal/linkedlist-queue)

<Img src = "https://github.com/WhalesJin/ios-juice-maker-yagom/assets/124643545/ad865807-d3a4-4345-9c55-d7a2c23761d5" width="20"/> [블로그 - 배열로 큐 구현하기](https://one10004.tistory.com/247)

<Img src = "https://github.com/WhalesJin/ios-juice-maker-yagom/assets/124643545/ad865807-d3a4-4345-9c55-d7a2c23761d5" width="20"/> [블로그 - split vs components](https://velog.io/@folw159/Swift-components와-split의-차이)

<Img src = "https://github.com/WhalesJin/ios-juice-maker-yagom/assets/124643545/ad865807-d3a4-4345-9c55-d7a2c23761d5" width="20"/> [블로그 - CaseIterable](https://0urtrees.tistory.com/197)

<Img src = "https://github.com/WhalesJin/ios-juice-maker-yagom/assets/124643545/ad865807-d3a4-4345-9c55-d7a2c23761d5" width="20"/> [블로그 - enum](https://labs.brandi.co.kr//2021/09/01/kimjh3.html)

<Img src = "https://github.com/WhalesJin/ios-juice-maker-yagom/assets/124643545/ad865807-d3a4-4345-9c55-d7a2c23761d5" width="20"/> [블로그 - struct vs enum](https://sujinnaljin.medium.com/namespace-지정하기-struct-vs-enum-ce86d5717d95)

<Img src = "https://github.com/WhalesJin/ios-juice-maker-yagom/assets/124643545/ad865807-d3a4-4345-9c55-d7a2c23761d5" width="20"/> [블로그 - NameSpace](https://bicycleforthemind.tistory.com/26)

<Img src = "https://github.com/WhalesJin/ios-juice-maker-yagom/assets/124643545/ad865807-d3a4-4345-9c55-d7a2c23761d5" width="20"/> [블로그 - static, class 메서드](https://babbab2.tistory.com/122)


<br>

<a id="9."></a> 
## 📮 팀 회고
🗣️ [일일 스크럼](https://github.com/WhalesJin/ios-calculator-app/wiki/일일-스크럼)
👏🏻 칭찬해

