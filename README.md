# 계산기 프로젝트 🧮
## 팀원 및 리뷰어
- **Judy**(개인 프로젝트)
- 리뷰어: **제이슨**(@ehgud0670)
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
현재 구현한 큐 방식은 `enqueue`와 `dequeue`를 반복하면 계속 배열이 커지는 문제가 있습니다. 큐의 크기를 정해놓은 후 `dequeue`할 때마다 해당 요소를 `nil`로 변경하고 일정 비율이 넘으면 `head`를 다시 0으로 변경하는 방법이 있다고 알고 있습니다. 하지만 이후 연결 리스트나 더블 스택으로 구현해보고 싶어 지금은 그냥 두었습니다!

### <br> 🤔 궁금한 점
#### 1. 테스트 범위
제이슨이 Swift에서 이미 만들어진 타입은 테스트할 필요가 없다고 하셨는데 사실상 `enqueue` 메서드는 배열의 `append` 메서드만, `isEmpty`메서드는 배열의 `isEmpty` 메서드만 사용합니다. 이럴 경우 제가 작성한 메서드긴 하지만 배열의 함수만 이용하는 것이니 따로 테스트할 필요가 없는 것인가요?

#### 2. mutating
현재 `CalculatorItemQueue`은 구조체로 되어있어 프로퍼티인 `calulatorItems`를 변경하는 `enqueue`와 `dequeue` 메서드는 `mutating`으로 되어있습니다. 구조체는 immutable 값을 지향한다고 알고 있어 클래스로 변경할까 했지만 이후 STEP을 모르지만 상속이 필요하지 않을 것 같고, 가지고 있는 프로퍼티 역시 값 타입이라 구조체로 두었는데 혹시 클래스가 좋을지 궁금합니다! 

#### 3. private 테스트
큐의 배열을 `private`로 지정했더니 테스트할 때 원하는 배열로 지정할 수 없는 문제가 있었습니다. 그래서 `dequeue` 메서드를 테스트할 때 `enqueue`를 반복한 후 테스트 했는데 괜찮은 방법인지 궁금합니다.

### STEP 2 전에 추가적으로 적용한 내용
- 더블 스택 방식으로 큐를 구현
- 연결 리스트 방식으로 큐를 구현
- 연결 리스트를 원형리스트로 구현
<br><br>

## STEP 2
### UML
![](https://i.imgur.com/99jbOlm.png)

### <br>UML 이해하기
STEP 2를 진행하면서 가장 먼저 한 활동이자 가장 어려웠던 작업이 UML을 분석하는 것이었습니다. 배웠던 UML 그리기 방법으로 타입들 간의 관계는 이해할 수 있었지만 본질적으로 어떤 의미의 타입이고, 어떤 기능을 하는 메서드인지 분석하는데 오랜 시간을 들였습니다. 물론 완전히 일치하진 않을 수 있지만 제 나름대로 해석한 내용입니다!

#### 1. Operator
> 연산자 큐에 들어가는 타입, 각 연산자마다 계산을 함
- case로 더하기, 빼기, 곱하기, 나누기를 가짐
- `calculate(lhs: Double, rhs: Double) -> Double`
: 모든 연산을 수행하고 결과를 반환하는 메서드
- `add(lhs: Double, rhs: Double) -> Double` 외 3가지
: 케이스 별로 연산을 수행하는 메서드 

#### 2. extension String
> String에 연산자와 피연산자를 분리하는데 이용할 함수를 추가
- `split(with target: Character) -> [String]`
: 문자열을 `Character`(연산자)를 기준으로 분리해서 문자열 배열로 반환하는 함수(기준이 되는 `Character`를 포함해서)

#### 3. Formula
> 큐를 이용해 연산 결과를 계산하는 타입
- 연산자 큐와 피연산자 큐를 가짐
- `result() throws -> Double` 
: 연산자 큐와 피연산자 큐의 들어있는 값을 이용해 연산 결과를 반환

#### 4. ExpressionParser
> String을 연산자와 피연산자를 분리해서 큐에 넣어 Formula를 만드는 타입
- `parse(from input: String) -> Formula`
: 연산자 큐와 피연산자 큐에 값을 넣은 `Formula`을 반환
- `componentByOperators(from input: String) -> [String]`
: `input`을 연산자와 피연산자로 분리해서 문자열 배열로 반환(`split`을 이용)

### <br>😅 어려웠던 점
#### 1. String의 split 잘못된 해석
`String`에 이미 `split`이 존재하는데 왜 `extension`을 하는건지 무척 고민했습니다. 처음엔 파라미터 타입과 반환 타입을 맞추기 위해서라 생각해서 단순히 `Character`를 기준으로 분리하는 함수로 만들었습니다. 이후 **ExpressionParser**의 `parse` 메서드를 구현하면서 _"그럼 연산자는 대채 어떻게 채우는거지..?_ 고민하다가 분리하는 기준이 되는 `Character` 즉 연산자 역시 반환되는 배열에 포함되어야 하는걸 깨닫고 수정했습니다.

#### <br>2. 만들었던 연결 리스트의 오류
**Formula**의 `result`를 구현하면서 분명이 로직이 맞는데 계속 테스트가 실패하는 문제가 있었습니다. 비슷한 여러 로직으로 바꿔봤지만 계속 실패하였고 원인을 찾아보니 큐에서 사용한 연결 리스트의 구현이 잘못되어 있었습니다.. 노드를 모두 `takeOut`해도 연결 리스트가 빈 상태 즉 `isEmpty`가 `True`가 되지 못하는 상태임을 알았고 수정을 통해 `result`의 테스트를 통과했습니다. 연결 리스트를 테스트 할 때 더 꼼꼼했다면 미리 알았을 텐데 다시금 테스트의 중요성을 알았습니다!

#### <br>3. ExpressionParser
구현에서 가장 오랜 시간이 걸린 타입은 **ExpressionParser**입니다. 머리로는 어떤 작업인지 이해가 되는데 어떤 로직을 해야할지 계속 고민했습니다. 어디서 반복이 돼야하고, 어떤 변화를 주어야하는지 직접 손으로 예시를 쓰면서 로직을 구성했고 많은 시행착오 끝에 구현에 성공했습니다.

### <br> 🧐 고민한 점
#### 1. 에러처리
0으로 나누는 경우와 **Formula**에서 `result`를 구할 때 빈 큐인 경우 에러를 처리하도록 했습니다. 0으로 나누는 에러인 `divideByZero`는 아직 다음 스텝에서 연산을 어떤 순서로 처리하는지 몰라 우선 **Operator**의 `calculate`에서 처리하도록 했습니다. 처리 결과 역시 임시로 숫자가 아니라는 의미인 `nan`을 반환하도록 했습니다. 

빈 큐 연산의 오류인 `emptyFormula` 에러를 던지게 했더니 테스트에서도 `try`를 해야했습니다. 아직 별도의 에러 처리 구문을 만들지 않아 에러 발생 시 `nil`을 반환하는 `trt?`를 이용해 테스트했습니다.


#### <br>2. 타입 메서드
UML을 분석하면서 들었던 의문이 `ExpressionParser`는 왜 열거형인데 `case`가 없는지였습니다. 이후 `ExpressionParser`를 구현하면서 테스트를 하니 초기화를 할 수 없다는 에러가 떴습니다. 테스트를 할 수 없는건가 고민했는데 바로 타입으로 접근하면 가능했습니다. 타입을 통해 메서드를 사용하려면 타입 메서드로 선언해야 했습니다. `static`으로 메서드를 변경해서 테스트도 성공하고 왜 케이스가 없는 열거형인지 이해했습니다.

#### <br>3. 고차함수
STEP 2에서 반복문이나 조건문보다는 고차함수를 권장하는 것을 보고 고차함수를 공부한 후 최대한 적용시켜봤습니다. 그 결과 다양한 고차함수를 알고 `forEach`, `flatMap`, `compactMap`, `filter`를 적용시켜 단순하게 표현할 수 있었습니다. 더불어 고차함수는 아니지만 배열이나 문자열에서 (인덱스, 값) 튜플 형태의 시퀀스로 나타내주는 함수인 `enumerated`도 공부하고 이용했습니다!
