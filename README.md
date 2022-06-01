## 계산기 프로젝트 저장소

#### 프로젝트 핵심경험
- [X]  TDD 시작하기
- [X]  기존의 프로젝트에 Test Target 추가
- [X]  Queue 자료구조의 이해와 구현
- [X]  List 자료구조 직접 구현해보기(선택)
- [X]  리스트를 활용하여 Queue 구현(선택)
- [X]  UML을 기반으로 한 코드구현
- [X]  숫자와 연산자 입력에 큐 활용
- [X]  TDD를 기반으로 코드 작성하기(선택)
- [X]  IBOutlet / IBAction의 활용
- [X]  스택뷰의 활용
- [X]  스크롤뷰의 활용

#### 프로젝트를 수행함에 있어 읽고 참고한 문서
야곰의 재미난 컴퓨터 이야기 PART II : 캠핑사이트 Course - Common
- [X]  [Swift Language Guide - Protocols](https://quick-face-098.notion.site/Protocols-85a55d35639046e4a015e92bc187be84)
- [X]  [Swift Language Guide - Extentions](https://quick-face-098.notion.site/Extension-adbb6b346d5e4839ad358d64dfdaa49f)
- [X]  [Swift Language Guide - Error Handling](https://quick-face-098.notion.site/Error-Handling-61708e145ddd449485b8ba188a59380f)
- [X]  [Swift Language Guide - Closures ](https://quick-face-098.notion.site/Closures-d041ee09871446adae42516d70fe9a5c)
- [X]  [Swift Language Guide - Advanced Operators ](https://quick-face-098.notion.site/Advanced-Operators-24a9576ba94142fe8f3aeece4528b96a)
- [X]  [Swift Language Guide - ARC ](https://quick-face-098.notion.site/ARC-Automatic-Reference-Counting-dde282829d5847cd91ec6595a22977d1)

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
> 2차원 배열을 1차원 배열로 flatten하게 만들때 flatMap을 사용.

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

### Operator
```swift
func calculate(lhs: Double, rhs: Double) -> Double 
```
- 사칙연산 계산을 위한 함수 입니다.

```swift
static func contains(_ value: Character) -> Bool
```
- enum case를 포함 하고 있는지 확인을 위한 함수입니다.

```swift
func add(_ lhs: Double, _ rhs: Double) -> Double
```
- 더하기 함수

```swift
func substract(_ lhs: Double, _ rhs: Double) -> Double
```
- 빼기 함수

```swift
func multiply (_ lhs: Double, _ rhs: Double) -> Double
```
- 곱하기 함수

```swift
func divide(_ lhs: Double, _ rhs: Double) -> Double
```
- 나누기 함수

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

---
# [Step 03]

# 공부한 내용
> ARC, Advanced Operators, Closures, LLDB, 고차함수, 오토레이아웃, StackView, ScrollView, NumberFomatter

### ARC
> 문서위주로 참조 카운팅에 대해서 공부해 보았고 아직 진행중에 있습니다. 

### Advanced Operators
> 문서에서 우선순위를 가지는 연산자, post, prefix, infix 등이 가지는 우선순위 혹은 사용자 정의 연산자와의 차이점에 대해서 공부하였지만 현재 프로젝트에서 어떠한 적용을 하진 못하였습니다. 

### Closures
> 클로저의 기본적인 개념에 대해서 공부하였습니다.

### LLDB & 오토레이아웃
> 에러가 발생한 부분, 혹은 '-' 텍스트가 제가 작성한 것과 출력되서 들어오는 결과값이 다른 경우를 비교하기 위해 유용하게 사용하였습니다.
> UI 상의 에러 부분을 주소값을 통해서 확인하였습니다.
> LLDB를 활용하면 autolayout의 현 설정에 대해서 상세하게 파악해 볼 수 있고 어디서 문제가 발생하는지에 대해서도 찾아볼 수 있었습니다.

### 고차함수
> map, filter, reduce를 만들기 위해서 상상력을 발휘 해봤으나 rethrows, throws, closure 에 대해서 조금더 공부가 필요할 것 같습니다. 

### StackView
> MainStoryboard 에서 StackView를 코드로 작성하여 만들어 보았습니다.

### NumberFomatter
> 출력값에 , 를 3자리수 마다 주기 위해, 소수점 자리 설정을 위해 사용하였습니다.

### ScrollView
> 포커스를 아래로 주기 위해서 설정을 하였습니다.

# ⚒️ 기능 소개

<br>

> - 연산자를 반복해서 누르더라도 연산이 이뤄지지 않습니다
> - 버튼을 누르면 입력된 연산을 한 번에 수행합니다
> - = 버튼을 누르기 전에는 실제 연산을 수행하지 않습니다
> - 연산은 연산자 우선순위를 무시하고 앞에서부터 순서대로 계산합니다
> -  프로젝트에서는 연산자 우선순위를 무시합니다
> - 2+3*3-1 의 연산결과는 14입니다
> - 3/3+2-1 의 연산결과는 2입니다
> - 1+2-3*2-3/6 의 연산결과는 -0.5입니다
> - = 버튼을 눌러 연산을 마친 후 다시 =을 눌러도 이전 연산을 다시 연산하지 않습니다


|AC|CE|⁺⁄₋|
|:-:|:-:|:-:|
|![operators](https://user-images.githubusercontent.com/59466342/170876184-54a617d9-5d20-4405-a98f-f21c489ab052.gif)|![ceGif](https://user-images.githubusercontent.com/59466342/170876181-dbe765ad-829e-49db-a210-7592a06f4a29.gif)|![+-gif](https://user-images.githubusercontent.com/59466342/170876188-46967e21-da6f-4c86-8918-9698a4989d0d.gif)|
|AC는 모든 연산내역을 <br> 초기화합니다.| 현재 입력하던 숫자 혹은 <br>연산결과만 삭제합니다.|현재 입력한 숫자의 <br> 부호를 변환합니다.<br>입력된 숫자가 0인경우 부호를 표시하지 않고 변경하지도 않습니다|






|(÷, ×, -, +)|NaN|
|:-:|:-:|
|![operators](https://user-images.githubusercontent.com/59466342/170876184-54a617d9-5d20-4405-a98f-f21c489ab052.gif)|![nanGif](https://user-images.githubusercontent.com/59466342/170876159-298e57fb-3057-42ef-a3d9-27ecc13dde30.gif)|
|숫자입력 중에 연산자를 누르게 <br>되면 숫자입력을 중지하고 다음 숫자를 입력받습니다.|푸시 알림을 통해 승차 알람을<br> 받을 수 있습니다.|현재 숫자입력이 없는 상태인 0에서는 <br> 연산자를 반복해서 누르더라도 연산이 이뤄지지 않습니다.|

