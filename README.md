## iOS 커리어 스타터 캠프

# 🧮 계산기 프로젝트 저장소


## STEP 1
### 진행 과정
1. TDD를 활용해 **Red - Green - Refactor** 과정을 반복하여 `CalculatorItemQueue` 타입을 구현한다.
	- 큐 타입을 배열을 통해 구현하면 `dequeue`할 때 시간복잡도 이슈가 있지만, 우선 구현 가능한 가장 간단한 방법인 배열을 통해 큐타입을 구현한다.
	- 배열을 활용한 큐 타입을 UML로 아래와 같이 표현해 보았다.<br/><br/>
<img src="/image/ArrayQueueUML.png" width="250" height="200"> <br/><br/>
	- 구현 후, 예외가 될 수 있는 test case를 추가로 작성하여 Unit Test를 진행한다.<br/><br/>

2. 큐 타입에서 **배열 대신 Linked List**를 사용하기 위해서 TDD를 활용해 `LinkedList` 타입을 구현
	- 이 때 연결리스트에 필요한 메서드 및 연산 프로퍼티는 위에서 구현한 **큐 타입이 필요로 하는** 기능만을 최소한으로 구현함. 연결리스트의 기능은 구현할수록 얼마든지 많아질 수 있지만, 그걸 모두 구현하기 보다 현재 프로젝트에서 필요로 하는 기능만을 구현하고자 한다.
	- 구현 후, 예외가 될 수 있는 test case를 추가로 작성하여 Unit Test를 진행한다.<br/><br/>

3. `LinkedList` 타입 구현이 끝났다면 기존의 `CalculatorItemQueue` 타입에서 배열로 구현된 부분을 **2** 에서 만든 `LinkedList`로 대체한다. 
	- 큐 타입에서 기존 배열에다가 요구하던 기능을 `LinkedList`에서 그대로 구현했기 때문에, 이 과정은 **단 한 줄만 고치면 될 것**이다. 
	- Linked List를 활용한 큐 타입을 UML로 아래와 같이 표현해 보았다.<br/><br/>
<img src="/image/LinkedListQueueUML_Revised.png" width="430" height="300"> <br/>
**!!LinkedList타입은 UML 작성 이후에 class타입으로 변경하였고, 그로 인해 메서드는 mutating이 아니게 변경 되었음**
<br/><br/>

4. `Linked List`로의 대체가 끝났다면 성공적으로 리팩토링 되었는지 확인하기 위해 **1** 에서 만들어 놓은 `CalculatorItemQueue`에 대한 Unit Test 를 다시 한 번 실행한다.<br/><br/>


> 위 과정을 거치며 TDD 방식의 코드 작성을 경험해 보고, TDD와 Unit Test의 이점을 느낄 수 있었다. 
> 특히, **4** 에서 기존 코드를 리팩토링하였을 때 테스트만 다시 돌려보면 정상 작동 여부를 바로 파악할 수 있었기에 **Unit Test가 코드의 유지보수에 큰 도움이 된다는 것을 경험했다.**
<br/>

<br/>
<br/>

### 고민한 점

1. `CalculatorItemQueue` 는 `struct`, `LinkedList`는 `class`로 구현한 이유
	- **`LinkedList`와 같은 자료형이 값 타입이라면** 여기에 추가된 item(`Node`)이 무지막지하게 많아진다면 list를 주고받을 때 부피가 큰 값이 계속 **복사** 되는것이 비효율적이라고 생각했습니다.
그렇기에 참조 타입으로 만들어, 이동이 일어나도 **주소값만** 가볍게 주고받을 수 있는 것이 바람직하다고 생각했습니다.
	- 반면 `CalculatorItemQueue` 타입의 저장 프로퍼티는 참조 타입의 `list: LinkedList` 하나 뿐입니다. 때문에 위 문제를 고려하지 않아도 된다고 생각했습니다. 그 외에 특별히 `class`를 채택해야 하는 이유(상속, objc 활용 등)가 없으므로 `struct`를 채택했습니다.
<br/><br/>

### 의문점

1. `LinkedList`의 `rear`와 `count`를 연산 프로퍼티로 구현할지, 저장 프로퍼티로 구현할지
	- `LinkedList`가 배열에서 `removeFirst()` 했을 때의 시간복잡도 O(n)이 발생하는 단점을 보완할 수는 있지만, 가장 처음에 추가한 item을 찾아갈 때(`rear`), item의 갯수를 셀 때(`count`)의 시간복잡도가 O(n)이라는 단점이 생기는 것 같습니다. 따라서 이 두 프로퍼티를 저장 프로퍼티로 구현하고 `append`와 `remove`될 때마다 `count`, `rear` 저장프로퍼티를 적절히 변경해 주는 식으로 구현할까도 생각해 보았습니다. 하지만 이또한 `append`와 `remove`할 때마다 매번 추가 연산이 발생하며 시간적 비용을 증가시키는 것이기에, 무엇이 더 바람직한지 더 공부와 고민이 필요할 것 같습니다. 프로젝트에서는 `rear`, `count`보다 `append(_ item:)`와 `removeFirst()`가 더 빈번하게 발생할 것이라고 예측되기에 일단은 연산 프로퍼티인 상태로 남겨놓았습니다.
<br/>
<br/>

2. TDD와 접근제어가 상충하는 문제
	- 전반적인 구현을 끝마친 후, LinkedList와 Node가 CalculatorItemQueue에서만 사용되기를 원해 한 파일로 합치고 fileprivate 접근제어자를 걸어줄까 했지만, 이 경우 추후 Unit Test에서도 접근이 불가하다는 것을 알게 되었습니다. TDD와 Unit Test 때문에 프로덕션 코드를 원하는대로 수정하지 못하게 되는 것은 주객전도라는 생각도 드는데, 이 문제를 해결할 방법은 없을지 궁금합니다.
<br/>
<br/>

3. TDD를 진행할 때 Commit 컨벤션
	- TDD는 Red-Green-Refactor 과정을 거치게 됩니다. 이 때, 실패하는 Red상태에서도 커밋을 남겨야 할지, Green까지 구현한 후에야 커밋하는게 좋을지가 고민이 되었고, Karma스타일 커밋 컨벤션에서 제한하는 제목 글자 수 제한 50자를 너무 쉽게 넘기게 된다거나, 기능 단위 commit들 사이사이에 test를 위한 커밋이 있어 작업 진행 흐름을 파악하는데 있어 가독성을 해치는 등 전체적으로 상충되는 부분이 있었던 것 같습니다. 그래서 이번 Step1의 커밋 기록은 다소 어지럽게 남게 되었는데, 이를 개선할 아이디어가 있을지 궁금합니다. StackOverflow 등의 의견들도 사람마다 각기 다른 것 같아서 더욱 혼란스럽네요.

<br/>
<br/>
<br/>

### Trouble Shooting

1. `count` 로직을 잘못 구현한 것을 Unit Test를 통해 쉽게 잡아내어 fix할 수 있었습니다.

```swift
var count: Int {
        var nodeCount = 0
        guard var node = head else {
            return nodeCount
        }
        while let currentNode = node.next {
            nodeCount += 1
            node = currentNode
        }
        return nodeCount
    }
```
    
linked list 타입의 `count`를 위와 같은 로직의 연산 프로퍼티로 구현해 보았는데, 아래와 같이 두 개의 test에서 실패했다는 결과가 나왔습니다.
   
```swift
   // MARK:- count tests
    func test_빈List에_count를요청하면_0반환() {   
        //given
        guard sut.isEmpty else { return }
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 0)               // GREEN
    }
    func test_4가있는List에_count요청하면_1반환() {
        //given
        sut.append(4)
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 1)               // RED, result = 0
    }
    func test_4와9가있는List에_count요청하면_2반환() {
        //given
        sut.append(4)
        sut.append(9)
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 2)              // RED, result = 1
    }
```
    
  `head` 노드가 `nil`이 아니면 `nodeCount`를 올려줘야 한다는 것을 빼먹은 비교적 단순한 실수였긴 하지만, Unit Test가 아니었다면 잘못 작성했는지도 모르고 넘어갈 뻔 했고, XCTAssertEqual에서 어떤 값이 들어와서 불일치하게 되었는지 보여줬기에 원인을 알아내기도 훨씬 수월했습니다.
  
<br/><br/><br/>
2. 참조 타입의 인스턴스가 언제 메모리에서 해제되는지 몰라서 `LinkedList`의 `removeFirst()` 구현의 갈피를 잡지 못했는데, 실험을 통해 해결해 보았습니다.

```swift
class Node<Value> {
    var value: Value
    var next: Node?
    
    init(_ value: Value) {
        print(value, "init")
        self.value = value
    }
    
    deinit {
        print(value, "deinit")
    }
}
```

이렇게 노드 타입의 `init`과 `deinit`에서 `print()`를 찍어주게 하고,

```swift
struct LinkedList <Element> {
	var head: Node<Element>?
	...
	mutating func removeFirst() -> Element? {
       	let removedNodeValue = head?.value
        let nextHeadNode = head?.next
 
 	head = nil
  	print("헤드에 새노드할당 이전")
  	head = nextHeadNode
  	print("헤드에 새노드할당 이후")
 	return removedNodeValue
 	}
 }
```

노드를 사용하는 `LinkedList`에서 `head`를 끊어내고 그 다음 노드를 `head`에 할당하는 과정에서 `nil`을 할당해 주는 코드를 먼저 작성했는데, 이게 꼭 필요한지 궁금했다.

```swift
var sut = LinkedList(head: Node(1))
sut.append(4)
sut.removeFirst()
```

이와 같은 시나리오로 테스트를 진행했을 때, `removeFirst()`호출 시 기존 `head` 인스턴스가 메모리에서 해제되고 그 다음 노드가 원래의 `head` 변수에 할당되는 과정에서 <br/>
1. 원래 `head`에 할당되었던 인스턴스가 정상적으로 `deinit`되는지<br/>
2. 된다면 `nil`을 할당해줘야만 `deinit`되는건지, 아니면 `head`에 다른 인스턴스를 할당해주기만 해도 되는지<br/>
를 알아보고자 한다.

먼저, `head`에 `nil`을 할당한 출력 결과는 다음과 같았다.<br/><br/>
<img src="/image/nil.png" width="250" height="200">
<br/><br/>
처음 `head`에 있던 노드에 `nil`을 할당해주자 곧바로 `deinit`이 된 것을 확인할 수 있다.

그리고 `nil`을 따로 할당해주지 않고(`head = nil`을 주석처리함) 
곧바로 새로운 인스턴스를 할당해 주었을 때의 출력 결과는 <br/><br/>
<img src="/image/newNode.png" width="250" height="200">
<br/><br/>
이와 같았다. 새로운 인스턴스를 할당만 해 주어도 메모리에서 해제된 것을 확인할 수 있었다.

> #### 결론
> 참조 타입의 변수가 인스턴스의 주소를 갖고 있는 상황에서 굳이 `nil`을 할당해주지 않아도, 새로운 인스턴스의 주소를 할당해주면 기존 인스턴스는 Reference Count가 줄어들어 메모리에서 해제되는 것 같다. <br/>
> 추가로, `let removedNodeValue = head?.value` 와 같이 인스턴스의 프로퍼티를 변수에 할당해줬을 때는 (`head`가 가리키던)인스턴스의 Reference Count가 올라가지 않았다는 것을 유추해볼 수 있었다.

---

# STEP2

## 진행 과정

이번 스텝은 미리 주어진 UML을 토대로 코드를 구현해야 했는데요, 타인이 작성한 UML을 분석하여 의도를 파악하고, 각 타입 및 메서드의 기능과 역할, 서로간의 관계에 대해서 더 깊이 생각해 볼 수 있는 과정이었습니다.

STEP1에서 구현한 리스트와 큐를 활용하여 input 문자열로부터 연산자와 피연산자들을 분리하고 순서대로 적절한 연산을 수행하여 결과를 도출하는 계산기의 개념적인 기능을 전부 구현하는 것이 이번 STEP2의 구현내용입니다. 

TDD를 엄격하게 적용하지는 못했지만, 각 메서드 구현 이전에 Test Case부터 작성하고 실제 구현을 진행하는 원칙을 지켰으며, 아직 뷰가 없기 때문에 Unit Test를 통해서 코드를 실행하고 결과에 대해 검토하는 방식을 적극 활용했습니다. 실제로 이를 통해 잡아낸 오류가 많았기에 테스트의 중요성과 효용을 다시한번 느끼게 되었습니다.

## Step2 구현 내용에 대한 UML
![스크린샷 2021-11-12 오후 11 38 53](https://user-images.githubusercontent.com/72993238/141484377-df3362d4-e13d-410b-b4a3-ba14a1f2ed5b.png)

### 고민한 점

- 주어진 UML을 통해 전체 UML 중 가장 핵심이라고 생각하는 ExpressionParser와 Formula에 대해 그림으로 표현해 보았습니다.
- 메서드들이 담당하는 역할과, 그들이 호출되며 최초의입력이 가공되어가는 과정을 나타냅니다. 
![스크린샷 2021-11-12 오후 9 55 34](https://user-images.githubusercontent.com/72993238/141472383-260a1a97-da8c-4f6d-a7e8-75f2d2d284db.png)

ExpressionParser의 Parse 메서드가 작동하는 과정입니다.
- 최초의 문자열이 contains를 활용한 filter 고차함수로 연산자 String 배열로 분리되고, componentsByOperators(from: input)를 통해 숫자 String 배열로 분리됩니다.
- 연산자 String 배열은 forEach로 순회하며 operatorQueue에 Operator 인스턴스로 만들어 enqueue 시켜줍니다.
- 연산자 String 배열은 forEach로 순회하며 operandQueue에 Doubel 인스턴스로 만들어 enqueue 시켜줍니다.
- 이 두 개의 queue를 프로퍼티로 가지는 Formula 타입을 반환합니다.

반환된 Formula 인스턴스는 result()라는 기능을 가집니다.
- 현재 자신이 가진 operators와 operands 큐에서 순차적으로 숫자와 연산자를 dequeue하여 계산을 수행하고 Double 타입의 결괏값을 반환하는 기능입니다.


### 스텝을 진행하며 생각한 점
- 코드에 대한 의문은 아니지만, 구현시 따라야 했던 UML이 내 생각과는 다른 방식으로 설계되어있는 지점이 많았습니다. 그 중 가장 크다고 생각되는 부분은, 이 모든 로직이 "입력이 String일 것이라는 전제" 위에서 짜여졌다는 것. 콘솔 앱도 아니고, UI로 이벤트를 받을텐데 이 이벤트를 굳이 문자열로 붙여 전달할 이유는 전혀 없으며 이로 인해 추가적인 가공 과정들이 발생하기 때문에 비효율적이라고 생각했습니다. 입력을 받는 즉시 String 이 아닌, 연산자와 피연산자 타입의 인스턴스로 갖고 있다가 =가 눌렸을 때 큐에 넣어 연산을 처리해주는 방식으로 구현하면 String - [String] - Double, Operator로 이어지는 가공 과정이 많이 생략되었을 것이라는 아쉬움이 있었어요.

- 하지만 이런 파싱 과정에서 효율적으로 자료를 변형하기 위해 여러 방법을 써보다가 고차함수 여러개와 직접 구현한 함수를 조합하여 사용해 볼 수 있었고, 좋은 학습 기회가 되었던 것 같습니다.
특히 [String] 은 그 내부의 String도 Character의 집합이라는 점에서 2차원 배열이라고 볼 수도 있는데, 이를 다루는 과정이 골치아프지만 재밌었습니다.

### 아쉬운 점
- 이번 스텝을 유닛 테스트와 함께 구현하며 가장 필요성을 느낀 것이 가짜 객체를 활용하는 것입니다. 메서드 테스트 시 매개변수로 특정 원소를 가진 큐가 전달되었음을 전제하고 싶은데, 가짜 객체가 없기에 메서드 //given에서 일일이 enqueue해 줘야 하는 불편함을 크게 느꼈습니다. 하지만 테스트 더블과 객체 주입 등 방법이 아직 잘 이해하기에는 어렵게 느껴져서 추후에 꼭 공부해서 적용해보고 싶다고 생각합니다. 

### 의문점
- 위에 첨부한 Step2 구현 내용에 대한 UML을 보시면 요구사항과는 달리 Formula -> Operator의 의존관계가 생겼습니다. 이는 result() 내부에서 CalculatorItem을 Operator로 다운캐스팅을 하지 않으면 Operator에 정의된 연산 메서드를 실행할 수 없었기 때문입니다. 이 방법 말고는 result를 구현할 방법이 없다고 생각했는데, 혹시 기존 주어진 UML처럼 관계가 생기지 않은 선에서 구현할 방법이 있을까요?
