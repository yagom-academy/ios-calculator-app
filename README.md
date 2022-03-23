# iOS-calculator-app

> 프로젝트 기간 2022.03.14~03.25
> 팀원: @westeastyear / 리뷰어: @AppleCEO

# 📍 UML
<img src="https://user-images.githubusercontent.com/74251593/159279325-54f4c081-724c-4be1-acd7-458b5f053b10.png" width="80%" height="80%">

---

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

> ### 리뷰어 코멘트(by.도미닉)
> - 어쩔 수 없는 부분이라는 생각도 드네요! 어떤 타입이든 동작하도록 유연한 타입으로 잘 만드신 것 같다고 저는 생각합니다~

## ⁉️ WHY Class? Struct?
현재 코드는 `Queue`가 `Structure`, `LinkedList`와 `Node`는 `Class`로 구현되어 있습니다. 아직도 너무나 헷갈리는데 왜 이렇게 사용하는지에 대한 명확한 이유를 확인 받고 싶습니다!

제가 생각한 이유는 아래와 같습니다. 도미닉의 의견 부탁드립니다.
- `Node`와 `LinkedList`는 참조가 필요하기 때문에`Class`로 구현되어야 한다?
- `Queue`는 참조가 상관없기 때문에 `Structure`여도 상관이 없다?

> ### PR후 자체 정리
> - Queue를 구조체로 만든이유!
>    * 프로젝트에서 Queue를 사용할때, 원본값을 참조해서 사용할 일이 없기 때문에 구조체를 선택하였습니다.
>    * 또 상속이 필요없고, 참조 타입의 프로퍼티를 가지고 있지 않기 때문에 구조체로 선택하였습니다.
> - Node, LinkedList를 Class로 만든이유!
>    * LinkedList의 특성상 참조타입의 프로퍼티를 가져야 하고, 초기값을 가져야 하기 때문에 Class로 구현하였습니다.

---

# [STEP 2]

## ⁉️ extension String 구문 고민한점
```swift
// before
extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { character in
            String(character)
        }
    }
}
```
```swift
// after
extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
```
- 기존에는 `split()`과 `map`을 사용하여 구현을 했었습니다. `split()`과 `map`의 시간복잡도는 `O(n)`이고, 이 둘을 같이 쓰게 되면 `O(2n)`이 된다는걸 알게 되었습니다. 
- 우연히 `components(separatedBy:_)`를 알게 되고, 코드에 반영하여 `O(n)`의 시간복잡도를 가지게 되는 코드를 작성하게 되었습니다. 
- 또 `split()`은 반환하는 타입이 `[String]`인게 없어서 `map`을 사용했었는데, `components(separatedBy:_)`는 자체적으로 `[String]`을 반환해주어 더욱 깔끔한 코드를 작성할 수 있었습니다.

## ⁉️ guard문을 쓸지, if문을 쓸지 고민한점
```swift
// before
func dequeue() -> T? {
        guard !linkedList.isEmpty else { return nil }
        return linkedList.removeFirst()
    }
```
```swift
// after
func dequeue() -> T? {
        if linkedList.isEmpty {
            return nil
        } else {
            return linkedList.removeFirst()
        }
    }
```
- `guard`의 가장 큰 특징을 꼽자면 `early return`입니다. 제일 먼저 조건들을 판단, `true`인 경우에만 코드를 진행시키고, `false`인 경우에는 `return`을 하게 됩니다. 그래서 코드가 길지 않다면 `guard`를 할 필요가 없음을 깨닫게 되었습니다. 
- 전의 코드는 `guard`를 사용하여 역의 역의 생각을 해서 코드를 작성하였는데, 읽기가 어렵다고 느껴졌습니다. 코드가 길지 않기도 하고, 가독성을 위해 `if`문을 사용하여 코드수정을 하게 되었습니다.

## ⁉️ Charactor타입으로 형변환중에 생긴 오류처리를 위해 고민한점
```swift
componentsByOperators(from: input)
            .filter { $0.count == 1 }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach{ operatorQueue.enqueue($0)}
```
- `Thread 1: Fatal error: Can't form a Character from a String containing more than one extended grapheme cluster`
- 한자리의 `String`은 `Charactor`타입으로 형변환이 되지만, `String`이 두자리 이상이 되게 되면 위와같은 오류를 발생시키는것을 알게 되었습니다. 다른 캠퍼에게 물어봐서 이 상황을 해결할 수 있었습니다. 
- 코드상에서는 연산자(+, -, *, / )만 들어오게만 하면 되기에 `filter`함수를 사용하여 문자의 갯수가 1개가 아닌 값들은 걸러지도록 코드를 추가하여 마무리 할 수 있었습니다.

## 💬 궁금한점
`enum ExpressionParser`가 왜 `enum`으로 만들어졌는지 궁금합니다. `struct`로도 충분하다고 생각이 되어지는데, 아카데미에서 이렇게 설정을 해놓은 이유가 궁금합니다.
> ### 리뷰어 코멘트(by.도미닉)
> - 아마 enum 으로 struct와 비슷한 동작을 처리할 수 있다는 것을 알려주려고 한게 아닐까 싶습니다! 조금 더 자세한 내용은 크루에게 질문해주시면 의도를 알려주실 것 같아요~

`struct Formula`에서 `operator`란 이름을 사용하고자 앞뒤로 따옴표를 붙여서 사용하고 있는데, 이렇게 사용해도 괜찮은지 도미닉의 조언 부탁드립니다!! 
> ### 리뷰어 코멘트(by.도미닉)
> - 저는 빼는 것이 좋다라는 의견입니다. 보통 자주 쓰는 단어는 예약어로 정해져있을 수 있고 그런 것들은 문제를 일으킬 수 있습니다. 더 길고 명확한 이름이 좋지 않을까 싶네요~
