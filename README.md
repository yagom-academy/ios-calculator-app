## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

# [Step 01] 

# 공부한 내용
> UML, LinkedList, DoublyLinkedList, Array, Queue, Protocol, 
> Unit Test, TDD
### UML
![Calculator drawio (1)](https://user-images.githubusercontent.com/59466342/168809563-525214ba-d4a1-4607-bd9e-ec41b20b5185.png)


### LinkedList || Array || DoublyLinkedList
- Array 
    - 한 메모리 공간 안에 데이터들이 "나란히" 저장되어있다
    - 마지막 index가 아닌 element를 삭제하거나 삽입할 경우,
    - 이런 식으로 element를 재배치하는 작업 때문에
    - 오버헤드가 발생하는 단점이 있다.
- LinkedList 
    - 각각 떨어진 공간에 존재하는 데이터를 연결해 놓은 것임
    - 삽입, 삭제 시 재배치에 발생하는 오버헤드도 발생하지 않음 (vs array)
    - 매번 순차적으로 탐색 해야함
    
- DoublyLinkedList 
    - LinkedList는 노드를 삽입하거나 삭제할 경우 매번 순차적으로 찾아야 하는데 head, tail값으로 그부분을 보완할 수 있다.

### Queue
> FIFO (First-In First-Out)으로 먼저 들어간 데이터가 먼저 나오도록 하는 자료구조입니다. 

> enqueue를 통해 데이터를 쌓습니다.
> dequeue 일시 처음 들어온 데이터가 제거될 수 있도록 하였습니다. 
> peek을 통해 first 값을 찾을 수 있습니다.
> isEmpty를 통해 Queue의 데이터가 비어있는지 확인합니다. 
> removeAll을 통해 모든 데이터를 제거합니다.

### Protocol
> Protocol을 통해 Queue의 기능을 추상화 하였습니다. 

### Unit Test
> Node, DoublyLinkedList, CalculateItemQueue 각각의 기능들을 
> 유닛테스트 하였습니다.

### TDD
> 처음에 Node클래스를 구현 하기 위해서 최소한의 단위에 대해서 고민해 보았으나 그 후에 진행 되야할 부분들은 어떻게 하는게 좋을지 잘 생각이 나질 않아 끝까지 진행하지 못하였습니다. 

# [Step 02]

# 공부한 내용
> split vs components, Unit Test, TDD, Protocol, 고차함수(map, compactMap, flatMap, reduce), static method - 타입 메소드, Closure

### UML
![Calculator](https://i.imgur.com/b871kCe.png)

### split vs components
> 둘의 차이점
- parameter의 개수
  - split: 3개 separator, maxSplit, omittingEmptySubsequeneces
  - components: 1개 separator

- return 타입
  - split : [Substring]
  - components : [String]

- Foundation 프레임워크의 import 여부
  - split: X
  - components: O

- 성능의 차이
  - split > component
      - "" empty subsequence의 처리에 있음
  - split은 omittingEmptySubsequence의 bool 값에 따라서 변함 
      - components는 항상 empty subsequence를 돌려주게 됨
     
- 만약 ' '(space)를 separator로 가졌을 때 쪼개려는 문자열에 빈 공간이 많다면 그만큼 "" empty subsequence를 반환하게 되므로 성능적으로 느리다고 함

### static method
> static 키워드를 사용하는 경우는 해당 메소드나 프로퍼티가 instance보다는 type 자체와 연관될 때 사용

### Unit Test && TDD
> 이번 Step에서는 조금 더 TDD에 중점을 두기 위해서 노력했습니다. 

### Protocol
> 문서를 통해 Protocol의 확장성에 대해서 공부하였습니다. 

### 고차함수
> map, compactMap, flatMap, reduce, filter

#### map
> 형 변환을 위해서 사용 하였습니다. 

#### compactMap
> 형 변환 처리를 위해서 사용 하였고 변환이 되지 않는 데이터는 할당되지 않도록 하기 위할때 유용하게 사용 하였습니다.

#### flatMap
> 플랫맵은 체인 형식으로 사용 가능하나 맵은 불가능하다는 차이가 있지만 기본으로 map과 유사합니다.

> (optionals.flatMap{ $0 }.flatMap{ $0 })

```swift
let optionals: [Int?] = [0, 1, 2, nil, 4]

let map = optionals.map { $0 }

let flatMap = optionals.flatMap { $0 }



print(map) // [Optional(0), Optional(1), Optional(2), nil, Optional(4)]
print(flatMap) //[0, 1, 2, 4]

```

#### reduce
> 매개변수로 전달받은 함수의 연산 결과로 각 배열의 모든 값을 합치는 기능이나 이번 Step에서는 사용하지 않았습니다. 

#### filter
> 클로저 내의 인자 값 $0에 대한 조건문 처리를 통해 Bool을 반환하는 부분으로 nil처리에도 유용하게 사용하였습니다.

### Closure 
> 고차함수의 활용을 위해 closure에 대한 기본적인 지식을 문서를 통해 공부하였습니다. 

--- 

# 기능 구현
### ExpressionParser
```swift
static func parse(from input: String) -> Formula 
```

- 들어오는 String 값을 operator & operand 로 나눠서 Formula 타입으로 반환될 수 있도록 하였습니다. 
 
#### componentsByOperators
```swift
static func componentsByOperators(from input: String) ->[Character]
```
- Operator만을 분류하여 반환할 수 있도록한 함수입니다. 반환 타입을 조금더 편리하게 사용하기 위해 Character로 변경하였습니다.

#### componentsByOperands
```swift
static func componentsByOperands(from input: String) ->[String] 
```
- - Operand만을 분류하여 반환할 수 있도록한 함수입니다. Operator처럼 반환타입을 변경하지는 않았습니다.

### Formula
```swift
var operands: CalculatorItemQueue<Double>
var operators: CalculatorItemQueue<Operator>

func result() -> Double {}

```
- operand, operator로 계산하여 값을 반환하도록 하는 함수입니다.

```swift
private var isCalculatedValue: Double {}
```

- 계산을 위한 로직을 처리하는 computed property입니다.

---