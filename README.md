# 계산기 프로젝트 
## 팀원 및 리뷰어
- Judy(개인 프로젝트)
- 리뷰어: 제이슨(@ehgud0670)
## <br>프로젝트 기간
22.05.16 ~ ing
## <br> 프로젝트 내용
> 아이폰의 UI 기반의 계산기를 구현해보는 프로젝트

## <br> [STEP 1] 구현
### UML
![](https://i.imgur.com/qaIVnx3.png)

### <br> 코드 설명

#### 1. 제네릭 타입의 구조체
```swift
struct CalculatorItemQueue<Item>
```
- `private(set) var calulatorItems: [Item] = []`
: 큐의 요소들을 쌓아두는 배열 
-> Item은 `CalculatorItem` 프로토콜을 준수하는 타입
- `private var head = 0`
: `dequeue`할 요소의 인덱스를 저장하는 프로퍼티
- `func isEmpty() -> Bool`
: 큐가 비어있는지, 즉 `calulatorItems`가 비어있는 여부를 반환하는 메서드
- `mutating func enqueue(_ element: Item)`
: `calulatorItems` 맨 뒤에 새로운 요소를 추가하는 메서드 
- `mutating func dequeue() -> Item?`
: `head`가 가리키는 위치의 요소를 반환하는 메서드

#### <br>2. 연산자를 갖는 열거형
```swift
enum Operator: CalculatorItem 
```
- **case** - plus, minus, multiply, division
- `CalculatorItem` 프로토콜을 준수

#### <br>3. 그 외
```swift
protocol CalculatorItem
```
- `calulatorItems`의 요소가 되는 비어있는 프로토콜

```swift
class CalculatorItemQueueTest: XCTestCase
```
- `CalculatorItemQueue`의 메서드를 테스트하는 클래스

<br>

### 😅 어려웠던 점
#### 1. 빈 프로토콜을 준수하는 의미
요구사항을 읽으면서 이해하기 가장 어려웠던 점이 빈 프로토콜인 `CalculatorItem`이었습니다. 큐의 요소는 `CalculatorItem`를 준수하는 타입인데 프로토콜은 비어있고 무슨 타입 준수해야 하나 고민했습니다. 제이슨이 설명해주셨는데 아직 아무것도 없는 프로토콜이라도 준수하고 있으면 일종의 마킹 역할을 할 수 있어 요소의 타입을 제한할 수 있다고 알려주셔서 의미를 이해했습니다!

#### <br> 2. 프로토콜의 Equatable
구현하면서 가장 큰 문제는 `Equatable`입니다. 큐의 요소가 `CalculatorItem`을 준수한다고 해서 단순하게 요소 타입으로 지정했더니 TDD하면서 테스트할 때 값을 비교할 수 없는 문제가 있었습니다. `Equatable`은 값이 동일한지 비교할 수 있는 타입을 나타내는 프로토콜로 사용자가 정의한 프로토콜인 `CalculatorItem`은 `Equatable`을 준수하지 않아 `==` 메서드나 `XCTAssertEqual()`와 같은 비교 메서드를 이용할 수 없었습니다. 

### <br> 🧐 고민한 점
#### 1. private로 지정하기
제이슨이 조언해주신 대로 큐 내부의 배열인 `calulatorItems`은 테스트할 때 읽기만 가능하도록 `private(set)`으로 지정했습니다. dequeue의 현재 위치를 나타내는 `head`는 `private`로 설정해 접근 지정자에 유의했습니다.

#### <br> 2. 제네릭 타입
프로토콜이 `Equatable`를 준수하지 않아 테스트의 어려움을 겪어 피연산자는 `Double`로 연산자는 `Operator`로 각각 타입 캐스팅하여 테스트를 했습니다. 이후 제이슨이 제네릭 타입으로 하면 타입을 지정하여 타입 캐스팅이 필요 없다고 알려주셔서 `<Item>`을 가지는 제네릭 타입으로 정의하고 Item으로는 `CalculatorItem` 준수하는 타입을 사용했습니다.

#### <br> 3. 큐의 효율성
현재 구현한 큐 방식은 `enqueue`와 `dequeue`를 반복하면 계속 배열이 커지는 문제가 있습니다. 큐의 크기를 정해놓은 후 `dequeue`할 때마다 해당 요소를 `nil`로 변경하고 일정 비율이 넘으면 `head`를 다시 0으로 변경하는 방법이 있다고 알고 있습니다. 하지만 이후 연결 리스트로 구현해보고 싶어 지금은 그냥 두었습니다!
