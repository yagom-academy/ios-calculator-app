## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

## UML
![CalculatorUML](https://user-images.githubusercontent.com/74251593/158520059-d1b1d709-2042-49ea-bc3f-0e6940780f74.png)

# [STEP 1]

## ⁉️ Queue를 구현하기 위해 고민한 점 (Array, Singly Linked List, Doubly Linked List)
> - `Queue`라는 자료구조를 구현하기 위해 `Array`와 `List`에 대해 먼저 공부하고 진행하였습니다. 
> - 물론 `Array`로도 충분히 구현가능하지만 `Array`로 구현할때, `Queue`에서 값이 `dequeue`되는 경우, 그 뒤의 값들이 앞으로 옮겨져야 하는 오버헤드가 발생하게 됩니다. 
> - `List`에서는 앞의 단점을 충분히 보완하는걸 알게 되었습니다.  또 기능요구사항에 `List`라는 키워드가 있어 사용해보자는 마음이 생겼습니다.
> - `Singly Linked List` VS `Doubly Linked List`
>   * `List`중에서 단일 연결리스트와 이중 연결리스트중에서 고민을 하게 되었습니다.
단일 연결리스트에서는 탐색을 해야 할때 앞의 `head`부터 `nil`이 나올때까지 순회하여 탐색을 시작한다고 하여서 값이 많은 경우 비효율적으로 느껴졌습니다. 
>    * 이중 연결리스트는 `head`와 `tail`를 변수로 두어 탐색을 더 쉽게 할 수 있고, 값을 `append`하거나 `removeFirst`와 같은 메서드 작성시에 쉽게 접근 할 수 있을거란 생각에 이중 연결 리스트로 구현하게 되었습니다.

## ⁉️ CalculateItem로 타입을 제한하는 유연한 타입을 만들기 위해선?
```swift
protocol CalculateItem {
    
}

extension Int: CalculateItem {}
extension String: CalculateItem {}
extension Double: CalculateItem {}
```
계산기에서 사용될 법한 타입들을 `extension`하여 `CalculateItem`을 채택해 주고 기능요구사항 **"`CalculatorItemQueue`에서 다루는 요소는 `CalculateItem` 프로토콜을 준수합니다."** 을 따라 아래와 같이 프로토콜을 채택시켜주었습니다. 
```swift
struct CalculatorItemQueue<T: CalculateItem> { *** }
```
하지만 여기서 아쉬운 점이 Unit Test를 할때 타입을 한번에 처리하지 못하는 점이 아쉬운 부분입니다. 아래의 코드처럼 `String, Int, Double`을 따로따로 처리해야하는 번거로움을 알게 되었습니다.
```swift
var sut1: CalculatorItemQueue<String>!
var sut2: CalculatorItemQueue<Int>!
var sut3: CalculatorItemQueue<Double>!
```
**"유연한 타입을 만들어야겠다!"** 라는 생각까지는 들었지만 아직 실력이 부족하여 어떤 방식으로 만들어야 할지 잘 모르겠어서 조언을 구해봅니다.

## ⁉️ WHY Class? Struct?
현재 코드는 `Queue`가 `Structure`, `LinkedList`와 `Node`는 `Class`로 구현되어 있습니다. 아직도 너무나 헷갈리는데 왜 이렇게 사용하는지에 대한 명확한 이유를 확인 받고 싶습니다!

제가 생각한 이유는 아래와 같습니다. 도미닉의 의견 부탁드립니다.
- `Node`와 `LinkedList`는 참조가 필요하기 때문에`Class`로 구현되어야 한다?
- `Queue`는 참조가 상관없기 때문에 `Structure`여도 상관이 없다?
