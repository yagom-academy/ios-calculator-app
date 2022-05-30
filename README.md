## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

> 프로젝트 기간 2022/05/16 ~ 2022/05/27  
> 팀원: [@sookoong](https://github.com/Jeon-Minsu) / 리뷰어: [@찰리](https://github.com/kcharliek)

# 목차
- [프로젝트 소개](#프로젝트-소개)
- [키워드](#키워드)

- [그라운드 룰](#그라운드-룰)
    - [활동시간](###시간)
    - [예외사항](##예외사항)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)

- [STEP 0](#STEP-0)
    - [고민한점](#고민한점)
    - [배운 개념](#배운개념)
- [STEP 1](#STEP-1)
    - [고민한점](#고민한점)
    - [배운개념](#배운개념)
- [STEP 2](#STEP-2)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)
- [STEP 3](#STEP-3)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)

# 프로젝트 소개
- 계산기 어플리케이션


# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3.1-blue)]()

# 키워드
- `queue`, `array`, `linked-list`, `double-stack`
- `UML`, `TDD`
- `enqueue`, `dequeue`, `peek`, `isEmpty`
- `clear`, `isFull`, `count`
- `generics`
- `split`, `whereSeparator`, `Components`
- `enum`, `CaseIterable`, `caseless enum`
- `class diagram`, `static`
- `for-in`, `forEach`
- `Parsing`, `Parser`
- `Context`, `Container`
- `고차함수`, `closure`, `Map`, `Filter`, `Reduce`, `Reduce(into:)`
- `??`, `NaN`, `Error Handling`, `XCTAssertThrowsError`
- `의존관계 Property Private 설정`
- `고차함수`, `map`, `filter`, `reduce`, `flatMap`, `compactMap`
- `where`, `element`, 
- `Auto Layout`, `overhead`, `@inlinable`
- `subviews`, `arrangedSubviews`, `UIStackView`
- `addSubview`, `addArrangedSubview`
- `removeArrangedSubview`, `removeFromSuperview`, `isHidden`, `Alpha`
- `Offset`, `SetContentOffset`, `ContentSize`, `Frame`, `Bounds`
- `Main Run Loop`, `Update Cycle`
- `LayoutSubviews`, `SetNeedsLayout`, `LayoutIfNeeded`


# 그라운드 룰

### 시간

[프로젝트에 집중하는 시간]

- 09 : 00 ~ 22 : 00

[식사 시간]

- 점심 12 : 30 ~ 13 : 30
- 저녁 18 : 00 ~ 19 : 00

[연락이 어려운 시간]

- 수꿍 : 00 : 00 ~ 01 : 00

[휴일]

- 수꿍 : 주말

### 규칙

[커밋]

- 최소기능 단위 commit
- 카르마 스타일 따르기 ( 한글로 작성 )
- `feat` = 주로 사용자에게 새로운 기능이 추가되는 경우
- `fix` = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- `docs` = 문서에 변경 사항이 있는 경우
- `style` = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- `refactor` = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- `test` = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

[컨벤션]

- Swift API Design Guidelines
- Swift Language Guide
- ios - Human Interface Guidelines

[커뮤니케이션]

- 디스코드 회의실
- 디스코드 다이렉트 메시지

# 핵심경험

# [STEP 1]

## UML
![calculator_UML](https://user-images.githubusercontent.com/99063327/168565413-a98d1400-f9e4-45bc-946b-7edfa04e803a.jpg)


## 고민한점 
### 1. Queue 생성 방법


- `swift`에서는 `queue`가 따로 구현되어 있지 않아 직접 만들어야 된다는 알게 되어, 처음에는 단순히 배열을 하나 생성하여, 선입선출이 될 수 있게 구현만 하면 되는 줄 알았습니다. 하지만, `queue`에 대하여 조사해본 결과, 생성 방법이 다양하게 존재하며, 각각의 방법에 따라 시간 복잡도가 상이함을 발견하였고, 이에 서로를 비교하여 최선의 방법을 찾을 필요성을 느꼈습니다. 
<br/>

> ### (1) 단순 배열
>- 장점 : 빈 공간에 요소를 추가할 시 빠르게 작동합니다. `enqueue` 메서드 구현시 `append`를 사용하여 시간복잡도가 `O(1)`에 해당합니다.
>- 단점 : 배열의 메모리는 기본적으로 고정되어 있습니다. 하지만, `enqueue` 과정이 빈번하게 발생하여 기존의 메모리를 초과하여 요소를 추가하고자 할 때, 메모리를 늘리는 과정 속에서 배열의 메모리를 n번 반복하여 할당해야 되므로 공간복잡도가 `O(n)`이 됩니다. `dequeue` 메서드 구현시 `removeFirst`를 사용하면, 첫번째 요소를 제거한 이후, 나머지 요소들의 순서또한 수정하는 작업이 이루어지게 되어 시간복잡도가 `O(n)`에 해당합니다.
<br/>


> ### (2) 연결 리스트
> - 장점 : `enqueue` 메서드도 O(1)로 빠르게 이루어짐과 동시에 배열의 단점이었던 `dequeue` 메서드의 수행속도가 `O(1)` 로 빠릅니다. 이는 연결리스트는 노드 형태로 이루어져 요소가 제거되어도 나머지 요소들을 재정렬하지 않아도 되기 때문입니다.
> - 단점 : 각각의 노드가 데이터와 참조하는 주소로 이루어져 있기 때문에 연결리스트를 추가할 때 수행하는 동적할당이 상대적으로 큰 메모리를 소모합니다. 이는 공간 복잡도를 크게 하며, 메모리 접근 시간도 더디게 합니다.  
<br/>

> ### (3) 더블 스택
> - 장점 1 : 두 개의 스택으로 큐를 구현하여 배열의 마지막 요소를 제거하는 연산은 재정렬이 필요하지 않으므로 수행속도가 빠르다. 이를 더 자세히 살펴보면, `enqueue` 메서드는 `append`를 사용하여 시간복잡도가 `O(1)`에 해당하고, `enqueueStack`의 요소를 반전시키는 `reversed` 기능의 시간복잡도가 `O(1)`에 해당하며, `dequeue` 메서드는 `popLast`를 사용하여 시간복잡도가 `O(1)`에 해당한다.
> - 장점 2: 더블스택으로 구현한 큐는 `Array`이기 때문에 요소가 모두 나란히 존재하여 각각의 주소를 참조하기에 요소들이 산개하여 존재하는 연결 리스트보다 공간복잡도가 낮으며, 메모리 접근 속도가 빠르다.
<br/>

- 위의 방법들을 비교해본 결과, 큐를 더블 스택 구조로 구현할 시, 다른 방법들보다 시간복잡도와 공간복잡도 면에서 강점을 갖고 있다고 판단하여, 이번 프로젝트에서 큐를 더블 스택 구조로 구성하였습니다.
<br/>

### 2. Queue 기능 구현

- 조사해본 바에 따르면 `Queue`는 다음의 최소 기능을 구현해야 한다고 이해하였습니다.
    
    1) `enqueue` : 큐의 맨 뒤에 새로운 요소를 추가
    
    2) `dequeue` : 큐의 맨 첫 번째 요소를 제거한 뒤 반환
    
    3) `peek` : 큐의 첫 번째 요소를 반환하되, 제거하지는 않음
    
    4) `isEmpty` : 큐가 비어있으면 `true`, 그렇지 않으면 `false` 반환
    
- 그리고, 기본적으로는 위의 기능에 추가하여 다음의 기능들을 필요로 한다는 사실을 발견하였습니다.
    
    1) `clear` : 큐를 재설정해 빈 상태가 되게 함
    
    2) `count` : 큐에 있는 요소의 수를 반환
    
    3) `isFull` : 큐가 꽉 차있으면 `true` 반환 / 그렇지 않으면 `false` 반환
<br/>

- 물론, 위의 메서드 이외에도 큐를 위한 추가적인 메서드를 구현할 수 있지만, 현재는 계산기 프로젝트임에 초점을 맞추어, 최소 기능인 `enqueue`, `dequeue`, `peek`, `isEmpty`에 더하여 큐의 모든 값을 `reset`해주는 `clear` 메서드를 추가하여 계산기 기능 구현을 위한 큐를 생성해보았습니다.
<br/>


## 의문점

### 1. TDD로 인한 접근 제어 설정 고민

- 이번 프로젝트를 통하여 `UML`과 `TDD`를 처음으로 진행하고 있어, 아직은 이를 원활히 사용하지 못하고 어려움을 겪고 있습니다.

- 그러던 도중, `CalculatorItemQueue` 구조체 안에 있는 프로퍼티인 `enqueueStack`과 `dequeueStack`을 `private`으로 접근 제어를 하려고 하였으나, `TDD`를 진행하면서, test_enqueue_enqueueStack에_100개의_실수가_순서대로_들어가는지를 테스트하던 중, “ **let** result = sut.enqueueStack “ 코드로 인하여 `private` 수준으로 접근 제어를 할 수 없어, 현재 `private(set)` 수준으로 은닉화를 진행하였습니다.

- `private`으로 충분히 설정할 수 있을 것 같다고 생각하였는데, 테스트 코드로 인하여 `private(set)`으로 설정한 작업은 제 생각에는 테스트 코드에 너무 몰입한 결과가 아닐까 우려가 됩니다. 이에, 테스트 코드를 무시하고 `private`으로 접근 제어를 하는 것이 옳은 방법인지 확신이 들지 않아 질문드립니다.
<br/>

### 2. TDD와 제너릭 고민

- `CalculatorItemQueue`는 숫자 이외에 사칙연산에 사용되는 연산자 또한 큐에 들어가야 하지 않을까 생각하여 코드의 확장성 및 유지보수에 용이한 제너릭을 사용하였습니다.
- `TDD`를 통해서 숫자가 들어오는 상황들은 제너릭 타입을 `Double`로 설정하여 테스트를 진행해보았습니다.
    
    ```swift
    class CalculatorItemQueueTests: XCTestCase {
        var sut: CalculatorItemQueue<Double>!
        
        override func setUpWithError() throws {
            try super.setUpWithError()
            sut = CalculatorItemQueue<Double>()
        }
    
        override func tearDownWithError() throws {
            try super.setUpWithError()
            sut = nil
        }
            ...
    }
    ```
    
- 하지만, 만약 사칙연산의 연산자들이 들어올 때는 이를 `character`나 `string`으로 제너릭 타입을 바꿔야함이 예상되는데, 그렇다면 기존에 `Double`로 설정한 테스트 코드는 작동이 실패할 것으로 생각됩니다.
- 이러한 별개의 상황에서 하나의 `sut`로는 구현이 불가능한 것인지, 만약 그렇다면 기존의 `sut` 프로퍼티 아래에 “var sut2: CalculatorItemQueue<String>!”과 같이 새로운 프로퍼티를 작성하여 각각의 상황에 맞게 사용하면 되는 것인지 궁금합니다.
<br/>

## 의문점 해결

### 1. TDD로 인한 접근 제어 설정 고민

- 찰리의 코멘트에 따르면, 테스트 코드를 위해 인터페이스를 여는 일은 99% 확률로 대부분 불필요함을 밝혔다. 따라서, 테스트 코드를 위하여 접근 수준을 낮추는 것은 본말전도된 상황임을 확인할 수 있었다. 추가로, 본인이 작성한 테스트 `test_enqueue_enqueueStack에_100개의_실수가_순서대로_들어가는지` 와 같은 케이스는, 이미 구현된 인터페이스를 이용해서 간접적으로 테스트하면 접근 제어 수준을 원하는 수준으로 설정할 수 있었다. 그 예로, 기존의 `enqueueStack`을 호출하였던, 테스트 함수에서 1000개를 `enqueue` 하고 1000개 `dequeue` 했을 때 순서대로 반환되었는 지를 통하여 유추할 수 있었다.
<br>

### 2. TDD와 제너릭 고민


- 결론부터 말하자면, `enqueue`는 반환 타입을 가지는 것은 좋은 선택이 아니다. 먼저, `TDD`를 의도하여 다음과 같이 반환 타입이 추가된 점 또한 옳지 않지만, 개발자들은 기본적으로 큐의 `enqueue` 메서드에 대하여 반환 타입을 요구하지 않는다. 큐의 `enqueue` 메서드는 무엇이 들어가 있는지 하나하나 확인하고 넣는 것이 아니라, 입력받는 대로 큐에 집어넣는 방식이다. 그리고 필요시 `dequeue` 메서드를 통해 먼저 입력받은 요소를 내보내는 자료 구조이다. 정리하자면, 개발자들이 공통적으로 큐에 기대하는 `enqueue` 메서드는 반환 타입 없이 입력값을 넣는 기능만을 수행하면 충분하다는 의미이다.
<br>


## 배운개념
- `queue`, `array`, `linked-list`, `double-stack`
- `UML`, `TDD`
- `enqueue`, `dequeue`, `peek`, `isEmpty`
- `clear`, `isFull`, `count`
- `generics`
<br>


# [STEP 2]

## 고민한점 
### 1. Queue 생성 방법case-less enum 초기화 문제

- 계산기 프로젝트 STEP2 `UML`에 따르면, `ExpressionParser`는 열거형 구조로, `parse()` 함수와 `componentsByOperators` 함수만 내부에 구현되기를 요구하였습니다. 이전까지 접한 열거형 구조는 모두 프로퍼티 혹은 메서드가 구현된 적이 있었으나, 이 경우들 모두 `case`를 가지고 있던 사례들이었습니다. 하지만, 이번에 처음으로 `case`가 내부에 구현되지 않은 `enum` 구조를 접하게 되었습니다. 이에 초기화 없이 어떻게 열거형 구조 내의 인스턴스 메서드를 호출할 수 있을지 갈피를 잡지 못하였습니다. 하지만 두 가지 사실을 통하여 위의 문제를 해결할 수 있었습니다.


- 먼저, `case`가 구현 되지 않은 `enum`은 인스턴스로 생성이 불가능하여, 뜻하지 않는 초기화를 막을 수 있고, 순수히 `namespace` 로서만 작동할 수 있다는 장점을 알게 되었습니다. 즉, `case-less` `enum`은 의도된 구조임을 확인할 수 있었습니다. 다음으로, `UML`에서 `ExpressionParser` 내부의 함수에는 밑줄 표시(underline)가 되었다는 점을 간과하였습니다. 밑줄 표시는 해당 프로퍼티 혹은 메서드가 `static` 임을 의미합니다. 즉, `ExpressionParser` 내부 메서드인 `parse()` 함수와 `componentsByOperators`는 인스턴스 메서드가 아닌 타입 메서드로 구현되어야 함을 깨달았습니다. 타입 메서드로 이를 구현하면, 초기화 없이도 열거형 구조내 원하는 메서드를 사용할 수 있었습니다.

<br>

### 2. ExpressionParser 내 componentsByOperators 메서드 존재 이유


- 코드

```swift
private static func componentsByOperators(from input: String) -> [String]
```

- `ExpressionParser` 내 `componentsByOperators` 메서드를 구현하는 이유가 처음에 납득이 가지 않았습니다. `parse()` 함수에서 충분히 입력받은 값 내에 존재하는 연산자를 추출할 수 있다고 생각이 되는데, 왜 굳이 하나의 함수를 더 생성하였고, 추출을 할 거면 피연산수인 `operand` 또한 추출이 되어야 하는데, 왜 연산자만을 추출하는 지 납득이 가지 않았습니다.


- 이에 고민한 결과, 두 가지 근거를 발견하였습니다. 먼저, 연산자만을 추출한 이유는 피연산자를 먼저 추출한다면, 예를 들어, “10+2-3”이라는 `string` 값을 입력받았다면, 고차함수 `filter`나 `split`을 통해 추출하면 ‘10’, ‘2’, ‘3’이 추출되는 것이 아닌, ‘1023’ 혹은 ‘1’, ‘0’, ‘2’, ‘3’이 추출된다는 것을 발견하였습니다. 이는 우리가 계산기에서 원하는 결과는 후자가 아닌 전자의 상황입니다. 따라서 이를 온전하게 추출하기 위하여서는 아래의 코드에서 알 수 있듯, `filter`를 통하여 입력받은 값 내 숫자가 아닌 값, 즉 연산자만을 추출한 다음, 하나의 `string`으로 반환된 연산자를 `map`을 통하여 `[String]`으로 반환하면, 각각의 요소에 연산자를 하나씩 배분할 수 있게 됩니다.


- 코드
```swift
let operators = input.filter { $0.isNumber == false }.map { String($0) }
```

- 그리고 이 연산자 배열을 `parse()`함수에 가져와 이를 바탕으로 `split`을 진행하면, 피연산수를 각각의 자리수에 맞게 온전하게 추출할 수 있었습니다. 정리하자면, 함수의 기능별 분리와 피연산수가 아닌 연산자를 먼저 추출하여 `[String]`에 넣기 위하여 프로젝트 요구사항에 기입되었던 것 같습니다.
<br>


### 3. for-in 구문(반복문) 지양 고민

- 계산기 프로젝트 요구 사항에 따르면, 변수보다는 상수를, 반복문 조건문 보다는 고차함수를 더 활용하기를 권장하였다. 이에 `ExpressionParser` 구조체의 `parse()` 메서드 내에서 하나하나 추출한 연산자와 피연산수를 각각의 큐에 `enqueue()`하는 과정에서 사용된 `for`문을 사용하지 않고, 값이 원하는 바와 같이 들어갈 수 있기 위해서는 어떤 방법이 있을지 궁리하였습니다.
> 

- 코드

```swift
for i in 0..<operators.count {
    operatorsQueue.queue.enqueue(element: operators[i])
}
for j in 0..<operands.count {
    operandsQueue.queue.enqueue(element: Double(operands[j]) ?? 0.0)
}
```

- 이에 고차함수 `forEach`를 이용하면 반복적으로 `enqueue()` 메서드를 실행할 수 있었습니다. `forEach`는 컬렉션 요소의 갯수만큼 반복해주는 고차함수로, `for-in` 루프와 동일한 순서로 시퀀스의 각 요소에 대해 주어진 클로저를 호출합니다. 반복할 작업을 클로저에 작성하여 파라미터로 넘겨주고, `Collection`에 저장된 요소는 클로저를 반복 실행할 때마다 클로저 상수로 넘겨받습니다. `for - in` 반복문과 `forEach`의 차이로 반복문이냐 아니냐가 있었습니다. `for-in` 구문은 반복문으로 `continue`, `break`를 사용할 수 있지만, `forEach`는 반복 기능을 하는 메서드로 다음의 기능을 사용할 수 없었습니다. 이는 클로저의 현재 호출을 종료하거나 후속 호출을 건너뛸 수 없음을 의미합니다.


- 다음으로, `forEach` 메서드는 `return` 문을 사용하면 외부 범위가 아니라 본문에 대한 현재 호출에서만 종료되며 후속 호출을 건너뛰지 않습니다. `for-in` 구문의 경우 반복을 하다가 `return` 키워드를 발견하면 함수 자체가 종료됩니다. 하지만, `forEach`에 경우는 `return` 키워드를 발견할 시, 현재 자신이 전달한 클로저를 종료하고, 다음 반복 클로저가 실행됩니다(클로저를 요소 갯수를 초과하지 않았다는 가정 하). 즉, 반복 횟수는 절대적이기에 `return`문을 발견하여도 반복 횟수에는 영향을 주지 않음을 의미합니다.


- 따라서, 추출한 연산자와 피연산수는 절대적으로 연산큐에 입력받아야 되기 때문에 `for-in` 구문보다는 `forEach`를 사용하여 확실하게 `enqueue` 하는 것이 더욱 적절하다 판단하여 이를 사용하였습니다.
<br>


## 의문점

### 1. extension String 존재 이유

- 프로젝트 요구사항으로 `String`의 `extension`을 구현하고, 추가적으로 `Character` 값을 입력받으면 `[String]`으로 반환하는 `split` 함수를 구현하는 내용이 있었습니다. 저는 이 `String` `Extension` 내 `split` 함수가 `ExpressionParser` 열거형 구조 내 `parse()` 메서드의 기능 구현을 위하여 `componentsByOperators()` 메서드에서 반환받은 `[String]` 타입의 값의 요소 하나하나를 이용하여 피연산수를 연산자와 분리하기위하여 사용해야 된다고 판단하였습니다. 하지만 `string` `extension` 내 `split`을 이용해본 결과, 먼저 각 요소를 `Character`로 변환해주어야 하고, 한번에 피연산수를 추출하지 못하여 이용하는 것이 옳지 않다고 판단하였습니다. 특히, 후자의 근거 때문에 사용을 기피하였는데, 이를 예를 들어 설명해보겠습니다.
 

- “10+2-3” 이란 `string` 값을 입력받으면, `componentsByOperators()` 메서드를 통하여 [”+”, “-”]를 추출할 수 있습니다. 그리고 다시 이 “10+2-3” 입력값에 동시에 연산자를 추출하지 않고, 반복문을 이용하여 하나하나 추출하게 된다면, [“10”, “2-3”], [”10+2”, “3”]와 같은 결과 값을 얻게 됩니다. 그렇다고 한번 쪼갠 결과값을 다시 한번 받아, `split` 함수를 구현할 수 없었습니다. 이는 `split` 메서드의 반환값이 `string`이 아닌 `[String]`이기 때문에 `string` 메서드를 사용하지 못하기 때문입니다.
> 

- 코드

```swift
// 실패방법 1

for number in 0..<operators.count {
        let operands = input.split(with: Character(operators[number]))
}

// result
// ["10", "2-3"]
// ["10+2", "3"]


// 실패방법 2

let operands_1 = input.split(with: Character(operators[0]))
let operands_2 = operands_1.split(with: Character(operators[1]))

// result
// operands_1은 string이 아닌 [String]이므로 split 메서드 사용 불가
```

- 저는 이를 해결하기 위하여, `string` `extension`에 구현한 `split` 함수가 아닌, 기존의 `split` 함수의 `whereSeparator` 파라미터를 통하여 클로저로 “operators.contains(String($0))”를 입력하여 연산자가 있는 위치를 기준으로 피연산수를 분리하여, [“10”, “2”, 3”]이라는 원하는 값을 반환할 수는 있었습니다. 하지만, `string`에 `extension`을 통해 `split(with:)` 함수를 만든 근거가 반드시 있다고 생각합니다. 따라서, `extension`을 통해 구현한 `split(with:)` 함수를 통해서 계산기 입력값을 원하는 값으로 반환하는 방법이 있을지 궁금합니다.
<br>

### 2. result() 함수 내 reduce 고차함수 구현 가능 여부


- `Formula` 구조체 내 `result()` 함수는 연산큐에 들어간 모든 값을 계산한 결과를 반환하는 함수로 이해하였습니다. 이에 실수(`double`) 연산큐 내의 첫 값부터 호출하고, 다음으로 연산자(`string`) 연산큐의 첫 연산자를 호출하고, 다시 실수(`double`) 연산큐 내의 두번째 값을 호출하여 연산을 해야 한다고 판단하였습니다. 우리의 인식 속 계산기는 “10 + 2 - 3 + 4”의 값이 있으면, “10+2”를 먼저 연산하여 결과값 “12”를 반환하고, 이를 다시 좌변에 두어 “12 - 3 + 4”의 연산이 이루어진다고 생각합니다. 하지만, 코드로 이를 구현하면, 좌변과 우변을 각각 `operands.queue.dequeue()`로 설정한다면, “10 + 2”는 정상적으로 이루어지지만, 다음의 연산은 “3 - 4”가 되어버립니다. 따라서, 연산의 결과가 `calculate` 함수의 좌변에 항상 위치하게 하여 다음과 같이 계산기 기능을 구현하였습니다.


- 코드

```swift
mutating func result() -> Double {
    var result = operands.queue.dequeue() ?? 0.0
    
    while operators.queue.isEmpty == false {
        let `operator` = operators.queue.dequeue() ?? ""
        let operatorCase = Operator(rawValue: Character(`operator`))
        
        result = operatorCase?.calculate(lhs: result, rhs: operands.queue.dequeue() ?? 0.0) ?? 0.0
    }
    
    return result
}
```

- 이에 구현은 성공하였으나, 요구사항에서 반복문을 지양하라는 내용이 있기에, 이를 고차함수인 `reduce`를 이용하여 `calculate` 메서드 내 좌변은 결과값이 항상 업데이트되고, 우변은 `operands.queue.dequeue()`를 입력하면 구현이 가능하지 않을까 생각했으나, 끝내 이를 해결하지 못하였습니다. 일단 이해를 위하여 다음과 같이 `reduce()`를 이용한 코드를 구현해보았습니다.
 

- 코드

```swift
let result = operands.queue.enqueueStack.reduce(0) { operatorCase?.calculate(lhs: result, rhs: operands.queue.dequeue()) }
```

- 첫번째 문제는, 좌변에 들어가는 `result`의 값이 계속 업데이트 되어야 합니다. 일반적인 `reduce()` 에서는 이를 구현하는 방법을 찾지 못하였지만, `reduce(into:)` 함수를 이용하면 좌변의 `result`를 값을 업데이트 할 수 있을 가능성을 발견하였습니다. 다음으로, 우변의 값을 “operands.queue.dequeue()”을 이용한다면 `dequeue()` 메서드에 구현된 `enqueueStack`의 요소를 없애는 `removeAll()` 메서드를 통하여 `enqueueStack`이 빈 배열이 되고 맙니다. 하지만, 이또한 우변의 값을 `$0`으로 설정하면 해결할 수 있을 것입니다. 그러나, 마지막 가장 큰 문제로, `operatorCase`에서 큐에 들어간 연산자의 순서대로 다양한 연산자가 때에 맞춰 입력되어야 하나, 위와 같이 코드를 작성하면 하나의 연산자로만 `calculate` 메서드가 작동하게 됩니다. 이에, 찰리에게 반복문을 사용하지 않고 `operatorCase`가 시기적절하게 들어갈 수 있는 방법이 있는지 질문드립니다.
<br>


### 3. 나누기 0에 대한 에러 처리 방법

- `Operator` 열거형 구조 내에 `divide` 메서드에 대하여 우변의 값이 0이면, 다시 말해 나누는 값이 0이면 `CalculatorError`의 `dividedByZero` 에러 케이스에 `throw`하는 기능을 구현하였습니다. 이를 통해 `dividedByZero` 에러 발생 시, `NaN`을 반환하는 식으로 구현해보고자 하였습니다. `divide`의 에러는 `calculate` 함수 내에서 `do-catch`를 통해 처리가 되어야 한다고 판단하였으나, `calculate`함수의 반환타입은 `Double`이므로 `NaN`이라는 `String` 값을 반환할 수 없었습니다. 일단, 입력 받을 것 같지 않은 `Double(Int.max)`를 반환하여 `UI`와 연동할 시 `Double(Int.max)`의 값이 나올 때 `text`로 `NaN`이 표시될 수 있도록 하는 방식을 고려해보았습니다. 이에 대하여, `calculate`에서 에러 처리를 하는 것이 적절해 보이는지, 그리고 `String` 값을 반환하기 위한 좋은 방법이 무엇이 있을지 조언을 구하고 싶습니다.
<br>


## 의문점 해결

### 1. extension String 존재 이유

- 피드백을 통하여 현재 본인의 구현 방법이 좋다고 생각한다는 피드백을 받았다. 이에, 꼭 `split(_ char: Char) -> [String]` 을 이용해서 구현한다면, 특정 메서드를 재귀(`for Loop`) 로 호출해서 구현할 수 있을 것 같다는 의견을 받았다. 즉, "-", "+", "*", "/" 이 포함 되지 않을 때 까지 쪼개는 식이다.
- 예를 들자면, "10+1-2" (+ 로 쪼갬) -> "10", "1-2" (- 로 쪼갬)-> "10", "1", "2" -> Operator 없으니 탈출하는 방식이다. 이보단 앞서 구현한 `wheresperator`를 이용한 `split`이 더욱 유용해보인다.
<br>

### 2. result() 함수 내 reduce 고차함수 구현 가능 여부

- 직접 만든 `Queue`가 `iteration`을 지원하지 않으니, `queue`에 직접 `reduce`를 붙이기는 어려울 것 같다는 의견을 받았다. (+, 10), (+, 3), (-, 4)의 `Tuple Array` 로 한번 변환해서 `reduce`를 하는 방법이 있을텐데 그럴거면 성능이 아쉽다는 우려가 들었다. 해당 문제는 첫번째 의문점과 마찬가지로, 너무 요구사항에 몰입하여 좀 더 좋은 코드를 구현하자는 가치를 위배한 사례로, `while`문이 정답이라고 생각하지만 억지로 고차함수를 써본다면 `(0..<queue.count).reduce(0) { queue.dequeue() ... }` 와 같은 식으로 쓸 수 있을 것 같단 의견을 받았다.
<br>

### 3. 나누기 0에 대한 에러 처리 방법

- 찰리의 코멘트에 따르면, " `Double(Int.max)`를 `Error`로 처리한다" 와 같은 구현은 좋지 않다는 피드백을 받았다. 누군가 보기엔 `Int.max` 또한 정상 값일 수 있고, `Int.max`가 `Error`라는 사실을 별도로 관리해야하는 번거로움이 있기 때문이다. 오류가 난다면 차라리 `Optional`로 두어 `nil`을 반환하는 것이 나을 것 같다. 조금 더 정석으로 접근하자면 `Result`타입을 이용한다던지, `calculate` 또한 `throwable`하게 구현하면 된다는 수정사항을 받게 되었다.

- 처음에는 에러 코드를 통해 코드가 복잡해지는 것을 기피하고자, 새로운 방안으로 타입은 `Double`이면서 값은 `nan`을 부여할 수 있는, `Double.nan`이라는 코드를 알게 되었다. 이를 사용하면 `nan`이라는 사실이 명확하기 때문에 사용자 및 개발자에게 혼란을 주지 않을 수 있고, 별도로 에러를 처리하지 않을 수 있어 더욱 좋은 방법이라고 생각하였다. 그러나, 계산기에서 사용자가 기대하는 값은 `nan`이 섞여있을지도 모르는 `Double`의 값을 사용하는 것은 바람직하지 못하였다. 따라서, 코드가 복잡해지지만 에러 핸들링을 하는 것이 더욱 알맞은 방법이었다. 이에 에러 핸들링 부분으로 수정하여 코드를 완성해보았다.

- 코드(CalculatorError)
    
    ```swift
    enum CalculatorError: Error {
        case dividedByZero
        case emptyQueues
        case notEnoughOperators
        case notEnoughOperands
        case invalidOperator
    }
    ```
    

- 코드(Operator)
    
    ```swift
    //  Operator.swift
    
    enum Operator: Character, CaseIterable, CalculateItem {
        ...
        case divide = "/"
        ...
        
        func calculate(lhs: Double, rhs: Double) throws -> Double {
            ...
            case .divide:
                return try divide(lhs: lhs, rhs: rhs)
                    ...
            }
        }
        
        ...
        
        private func divide(lhs: Double, rhs: Double) throws -> Double {
            guard rhs != 0 else {
                throw CalculatorError.dividedByZero
            }
            
            return lhs / rhs
        }
        ...
    }
    ```
    

- 코드(Formula)
    
    ```swift
    //  Formula.swift
    
    struct Formula {
        ...
        mutating func result() throws -> Double {
            ...
                result = try operatorCase.calculate(lhs: result, rhs: operand)
            }
            ...
        }
        ...
    }
    ```
<br>

## 배운개념
- `split`, `whereSeparator`, `Components`
- `enum`, `CaseIterable`, `caseless enum`
- `class diagram`, `static`
- `for-in`, `forEach`
- `Parsing`, `Parser`
- `Context`, `Container`
- `고차함수`, `closure`, `Map`, `Filter`, `Reduce`, `Reduce(into:)`
- `??`, `NaN`, `Error Handling`, `XCTAssertThrowsError`
- `의존관계 Property Private 설정`
<br>

# [STEP 3]

## 고민한점 
### 1. 음수 계산

- 일반적인 계산기는 음수의 값이 입력받았을 때도, 이를 음수로 인식하여 문제없이 계산을 해나갑니다. 하지만, 계산기 프로젝트에서의 계산은 `Operator`열거형 구조의 `calculate` 메서드를 통해 진행됩니다. 여기서 `subtract` 케이스의 `rawValue`를 키보드에 있는 `-`로 입력하면, "1-(-1)"이라는 `input`에 대하여 `subtract` 케이스가 두 번 언급한 것으로 받아들여, 계산을 두 번 실행하고자 하고, 이는 곧 피연산수 부족으로 인하여 오류를 발생시킵니다.
- 이를 해결하기 위하여 처음에는 음수로 입력된 값이면, 일반적인 경우 피연산수의 개수보다 연산자의 개수가 크거나 같을 것이므로, 피연산수의 수가 연산자의 수보다 1개 더 많아질 때까지, 반복문을 실행시켜, 각각의 "+-", "/-", "*-", "--"의 경우에 맞는 동작을 구현해야할까 고민하였습니다.
- 하지만, 더욱 근본적인 측면에 집중한 결과, 빼기의 "-"와, 음수를 의미하는 "-"부호에 대하여 일반적으로는 같다고 생각하나, 컴퓨터에서는 이를 서로 다른 것으로 인식하게 한다면 위의 문제를 해결할 수 있었습니다. 스토리보드에 접근하여 마이너스 연산 버튼의 `currentTitle`을 확인한 결과, 키보드에 있는 "-" 부호와 서로 다르다는 것을 발견하였습니다. 이에 `Operator`열거형 구조의 `subtract` 케이스의 `rawValue`를 `currentTitle`과 같은 부호로 설정하고, 부호전환에 관하여서는 키보드에 있는 "-" 부호를 이용한 결과, 빼기와 음수를 컴퓨터에서 구분하여 인식이 가능해져 음수 연산이 정상적으로 작동하였습니다.

<br>

### 2. stackView 내 subview 삭제

- 메인 스토리 보드에 구현되어 있는 `stackView` 내 두 개의 `subView`를 코드를 통해 제거하고자 하였습니다. 이에 `removeArrangedSubview` 메서드를 통해 해당 뷰들을 제거하였습니다. 최초하면에는 이 서브뷰들이 보이지 않아 제거된 줄 알았으나, 사용자 입력값을 뷰에 올리게 될 때, 계산기 화면의 구석에서 다시 등장하는 것을 확인할 수 있었습니다. 이를 통해 해당 메서드로는 없어진 것처럼 보이나 사실은 없어진게 아닐까 의심을 하게 되었습니다. 이를 바탕으로 뷰 계층구조와 자료들을 검색해본 결과, `removeArrangedSubview` 메서드를 통해서는 배열에서 해당 뷰를 제거할 수는 있지만, 여전히 뷰의 `hierarchy`에는 남아있고, 심지어는 제거된 뷰들의 위치와 크기가 더 이상 스택 뷰에서 관리되지 않는다는 사실을 알 수 있었습니다.
- 그래서 해당 뷰들을 뷰의 `hierarchy`에도 남지 못하도록, 확실하게 제거하고자 `removeFromSuperview` 메서드를 실행하였고, 이를 해결할 수 있었습니다. 추가로, 애플 개발자 문서를 찾아보니 `removeFromSuperview` 메서드 이외에도 뷰의 `isHidden`속성을 `true`로 설정하면 같은 결과를 도출할 수 있음을 알게 되었습니다.
<br>

## 의문점

### 1. 함수 내 guard 문을 별도의 함수로 기능 분리

- `touchNumberButton` 메서드만 살펴보아도 `guard`문이 6개나 쓰였습니다. 물론 옵셔널 바인딩을 위하여 사용한 경우도 있지만, 조건을 설정해주기 위하여 guard문을 사용한 경우도 적지 않았습니다. 이에, 함수의 기능 분리를 위하여, 각각의 guard문을 `touchNumberButton` 내에서 분리하여 별도의 함수 내에 구현하고, 이를 호출만 하는 방식으로 `touchNumberButton` 메서드를 수정해보았습니다. 하지만, 이는 정상적으로 작동하지 않았습니다. 
- 이러한 실패 결과가 나타난 이유를 예를 들어 설명드리자면, 3개의 조건을 만족하였을 때 프로퍼티를 변경하는 `method`라는 함수를 구현해보았습니다. 아래와 같이 하나의 함수 내 3개의 guard문이 있고 값을 변경하는 코드가 존재할 때는 `condition1`을 충족한 이후, 이를 충족하는 상태에서 `condition2`에 접근하고, 또 이를 충족하면 `condition3`에 접근하여, 모두 충족할 시, 값을 변경하는 코드에 접근할 수 있게 됩니다.

```swift
func method() {
    guard condition1 else { return }
    guard condition2 else { return }
    guard condition3 else { return }
    
    someProperty = changedProperty
}
```
<br>

- 하지만 아래와 같이 각각의 `guard`문을 함수로 빼내어 이를 호출하는 방식으로 진행할 시, `firstGuard`문의 조건을 충족한다면, 첫번쨔 조건을 충족했다는 상태에서 `secondGuard()` 함수에 접근하는 것이 아니라, 조건을 충족한 상태가 만료된 채 두번째 `guard`문 함수에 접근하는 것으로 인식하였습니다. 즉, 3가지 조건을 충족한다 하여도, 값을 변경하는 코드에 접근하였을 때의 상태는 그 3가지 조건을 동시에 만족한 상태가 아닌 것입니다. 
```swift
func method() {
    firstGuard()
    secondGuard()
    thirdGuard()
    someProperty = changedProperty
}

func firstGuard() {
    guard condition1 else { return }
}

func secondGuard() {
    guard condition2 else { return }
}

func thirdGuard() {
    guard condition3 else { return }
}

```
<br>

- 이를 바탕으로, 저는 `guard`문을 함수 외부로 빼내기에는 어렵다고 판단이 되는데, 제가 이해한 작동 방식이 옳은 것인지, 그리고 이를 해결할 수 있는 방법이 무엇이 있을지 여쭈어보고 싶습니다.



<br>

### 2. stackView 내 subview로 Label 추가 시 애니메이션

![May-26-2022 20-51-04](https://user-images.githubusercontent.com/99063327/170482942-b1586a97-f5fb-4675-9003-28df8e00cbe7.gif)

- 계산기에서 입력한 지난 연산자와 피연산수는 입력 이후, 스크롤뷰 내 스택뷰에 쌓이는 방식으로 진행하고자 하였습니다. 이에 `Label`의 속성을 생략하면 다음과 같은 코드를 작성할 수 있었습니다.

```swift
private func clearLastInput() {
    lastInput.subviews.forEach { $0.removeFromSuperview() }
}

private func addCalculatorItems() {
    ...
    let label = UILabel()
    label.isHidden = true
    lastInput.addArrangedSubview(label)
    UIView.animate(withDuration: 1) {
        label.isHidden = false
    }
    ...
}
```
<br>

- 먼저, 스토리보드에서 확인할 수 있는 초기에 설정된 스택뷰를 `clearLastInput` 함수를 통하여 제거하고, 연산자 버튼이 터치될 때마다, 이전까지 입력된 피연산수와 연산자를 스택뷰에 추가하기 위하여, `addCalculatorItems` 함수 내 `addArrangedSubview` 함수를 사용하였습니다. 하지만 이를 작동한 결과는 위의 동적 이미지에서 확인하실 수 있듯이, 처음의 입력값은 왼쪽에서 오른쪽으로 이동하는 것에 비해, 나머지 입력값은 아래에서 위로 이동함을 알 수 있었습니다.
- 지금까지 고민해본 결과, `clearLastInput` 함수로 인하여 스택뷰가 아무것도 없을 때는 왼쪽에서 오른쪽으로 이동하지만, 스택뷰가 하나라도 존재한다면 아래에서 위로 애니메이션이 작동하는 것 같습니다. 현재는 `Label`을 스택뷰 안에 넣어 뷰를 추가하는 방식으로 진행하였는데, 이렇게 진행할 시에는 모든 입력값들이 왼쪽에서 오른쪽으로 이동함을 발견할 수 있었습니다.
- 왜 이러한 문제가 일어나는지 오랜 시간 고민해봐도 마땅한 근거를 발견하지는 못했습니다. 이에 찰리는 위의 문제가 어떤 이유로 일어나는지 알고 계신지 질문드리고 싶습니다.

<br>

### 3. UILabel.text 옵셔널 처리

- Step2의 피드백을 통하여 ??의 사용을 지양하고, 옵셔널 바인딩 방법을 사용해야 함을 배울 수 있었습니다. 이를 바탕으로 Step3를 진행해보았는데, `touchNumberButton` 메서드와 관련하여 `guard` 구문을 통하여 "text = numberInput.text"으로 옵셔널 바인딩을 하여, 여러 조건을 충족하는지 `text`를 통해 확인해보고, 최종적으로 `numberInput.text`의 값을 최신화해주기 위해선 "numberInput.text = text"와 같이 `text`를 다시 넣어주어야 했습니다.
- 이에, 옵셔널 바인딩을 다음의 방법으로 진행하는 것이 옳은지 확신이 들지 않고, 해당 프로퍼티를 계속 이용하고자 하는데, 그 프로퍼티 자체의 네이밍을 사용하면서 옵셔널 추출을 하는 또다른 방식이 있을지 궁금합니다.
<br>

### 4. stackView 화면 하단 자동 이동

```swift
private func goToBottomOfScrollView() {
    scrollView.setContentOffset(CGPoint(x: 0,
                                        y: scrollView.contentSize.height - scrollView.bounds.height),
                                animated: true)
}
```
<br>

- 저는 위의 코드를 `touchOperatorButton` 함수 내에 구현하여 연산자 버튼이 클릭되어, 입력값들이 스택뷰에 올라간 이후, `goToBottomOfScrollView` 함수를 통하여 화면이 아래로 스크롤 되도록 구현해보았습니다. 그러던 중, 문제점을 발견하였는데, `addCalculatorItems` 함수 내에서 "UIView.animate(withDuration: 1) { label.isHidden = false }" 코드가 없으면, 새로운 입력값이 스택뷰에 오를때마다 실시간으로 화면이 아래로 스크롤 되는 것이 아닌, 한박자 늦게 이동되고 있음을 발견하였습니다. 
- `animation`의 유무가 화면 자동 이동에 영향을 미친 것인지, 혹은 화면 자동 이동 코드는 모두 한박자 늦게 이동되고 있었는데, `animation`을 통해 화면이 자동적으로 이동된 것인지 혼란스러워 질문드리고자 합니다.

- <animation 적용시>

    ![May-26-2022 21-25-41](https://user-images.githubusercontent.com/99063327/170487742-ba7a66f9-402e-4a2f-81b8-fed06ec1948d.gif)


- <animation 미적용시>

    ![May-26-2022 21-27-13](https://user-images.githubusercontent.com/99063327/170487905-10dc6b9e-29e4-4303-a19c-86adac5e5d9c.gif)

## 의문점 해결
### 1. 함수 내 guard 문을 별도의 함수로 기능 분리

```swift
func check1() -> Bool {} 
func check2() -> Bool {} 
func check3() -> Bool {} 

func doSomething() { 
        guard check1(), check2(), check3() else { return } 
        
        // do something 
}
```

- 위와 같이 기능 분리 가능하다는 사실을 깨달았고, 외부에 조건문을 생성하여도 충분히 조건문에 해당하는 값을 이용할 수 있다는 사실을 알게 되었습니다. 이를 바탕으로, `guard` 구문을 포함하여 함수 내 기능을 최대한 분리하여 하나의 함수가 하나의 기능만을 수행하도록 수정해보았습니다.
- 코드(`numberButtonDidTapped`)
    
    ```swift
    @IBAction private func numberButtonDidTapped(_ sender: UIButton) {
            updateNumberInput(sender)
        }
        
        private func updateNumberInput(_ sender: UIButton) {
            guard let number = checkNumber(sender) else {
                return
            }
            
            guard let formattedNumber = formatNumber(number) else {
                return
            }
            
            setNumber(formattedNumber)
        }
        
        private func checkNumber(_ sender: UIButton) -> String? {
            guard let firstConditionPassedText = isAdditionalNumberInput(sender) else {
                return nil
            }
            
            guard let secondConditionPassedText = isUsingComma(sender, firstConditionPassedText) else {
                return nil
            }
            
            return secondConditionPassedText
        }
        
        private func isAdditionalNumberInput(_ sender: UIButton) -> String? {
            guard let text = numberInput.text else {
                return nil
            }
            
            guard isNotAdditionalNumberInputAfterResultHasBeenShown(sender) else {
                return nil
            }
            return text
        }
        
        private func isNotAdditionalNumberInputAfterResultHasBeenShown(_ sender: UIButton) -> Bool {
            guard lastInput.arrangedSubviews.count <= 0 || operatorInput.text != "" else {
                clearLastInput()
                
                numberInput.text = sender.currentTitle
                return false
            }
            return true
        }
        
        private func isUsingComma(_ sender: UIButton, _ text: String) -> String? {
            guard isCommaButtonNotTappedTwice(sender: sender, number: text) else {
                return nil
            }
            
            guard let newText = addNewNumber(sender, text) else {
                return nil
            }
            
            guard newText.contains(".") == false else {
                return nil
            }
            
            return newText
        }
            ...
    }
    ```
    
- 먼저, `numberButtonDidTapped` 함수의 기능은 `updateNumberInput` 함수 만을 호출합니다. 즉, 숫자 버튼이 눌릴 때는 숫자 입력값을 업데이트 한다는 하나의 기능만을 수행합니다. 이는 은닉화와도 연결이 되는데, 사람들은 숫자 버튼이 눌릴 때 어떻게 작동하는 지 궁금해하지도 않고, 만약 같은 개발자가 봤을때, 이 버튼은 숫자 입력을 업데이트 하는지만 확인하고 넘어가고 싶을 때 이와 같이 코드를 작성하면 매우 유용합니다. 뿐만 아니라, 코드 내부를 더 알고 싶다면, `updateNumberInput` 함수도 찾아 그 내부 구현을 보면 되는 것입니다.
- `numberButtonDidTapped` 함수에서 설명하고 싶은 부분은 조건문을 외부 함수로 분리할 때, 각 조건의 결과값을 이용하고 싶을 때의 경우를 보여주고 싶습니다. `updateNumberInput` 함수 내에서는 `guard` 문으로 `checkNumber`, `fomatNumber`를 한 이후, `setNumber`를 수행합니다. 만약 여기서 `guard`문을 하지 않고, 그냥 `checkNumber`, `formatNumber`를 사용하면, 이전 함수에서 조건에 이어서 진행되지 않습니다. 즉, `checkNumber`에서 기준에 부합하지 않은 숫자임을 인식했다면 이 숫자를 `format`할 필요가 없음에도 불과하고, 그냥 하나의 함수가 끝났기 때문에, 저절로 `formatNumber` 함수로 순서가 이어집니다. 그리고 `checkNumber`의 결과값을 변수에 넣어주지 않으면, `formatNumber`는 `updateNumberInput` 함수 초기 실행 때 받은 `sender`를 통한 숫자를 이용하여 연산을 진행하기 때문에 연속적인 작업이라 할 수 없습니다.
- 그러므로, `guard`문을 이용하여 조건에 부합하지 않을 시 바로 함수가 종료되게 설정을 하고, 또 결과값을 변수에 넣어주어, 이를 연속적으로 다음 함수의 입력값으로 사용하면, 하나의 함수 내에서 연속적인 `guard`문을 사용했을 때와 동일한 수행 과정을 보여줍니다.
- 코드(operatorButtonDidTapped)
    
    ```swift
    @IBAction private func operatorButtonDidTapped(_ sender: UIButton) {
            updateOperatorInput(sender)
            resetNumberInput()
            goToBottomOfScrollView()
        }
        
        private func updateOperatorInput(_ sender: UIButton) {
            guard checkOperator(sender) == true else {
                return
            }
            
            addCalculatorItems()
            setOperator(sender)
        }
        
        private func checkOperator(_ sender: UIButton) -> Bool {
            guard operatorButtonDidTappedWhileFirstOperandIsZero(sender) else {
                return false
            }
            
            if isAdditionalOperatorAfterResultHasBeenShown() {
                return true
            }
            
            guard isCurrentNumberEqualToZero(sender) else {
                return false
            }
            
            return true
        }
            ...
    }
    ```
    
- 다음으로, `operatorButtonDidTapped` 함수의 경우에는 함수의 분리에 있어 반환값을 필요로 하지 않았습니다. `checkOperator`는 `numberInput`, `isAdditionalOperatorAfterResultHasBeenShown`도 `numberInput`를, 그리고 마지막으로 `isCurrentNumberEqualToZero`은 `operatorInput`을 가지고 조건에 부합하는지 판단하였습니다. 처음에는 숫자 버튼 함수와 같이 반환값을 자꾸 이어서 주면 되지 않을까 생각했지만, 조건마다 사용하는 조건 대상이 차이가 있었고, 같은 조건 대상을 사용한다고 하더라도, 연속적인 조건이 아니었습니다. 그래서 이를 고민하다보니, 이는 `Bool` 값을 이용하여 해당 값을 반환하고 모두 만족하였을 경우 `true` 값을 반환한다면 3가지의 조건을 모두 만족하는 경우를 설정할 수 있었습니다.
- 이러한 방법을 자꾸 연습해보아 본인이 쓴 코드가 적절한 수준의 로직만 드러내고 있는지를 항상 의심하여야 합니다. 함수의 역할에 맞는 작업만 하고 있는지, 아니면 본 기능 이외의 추가적인 기능도 수행하고 있는지 살펴보아야 합니다. 이는 단일 책임 원칙을 지키는 첫 걸음이 될 것입니다. 이 원칙을 지키지 못할 경우 결국 함수의 직관성, 가독성 등을 상실하게 될 것이므로 귀찮다고 눈을 돌리지 말고, 지금부터라도 함수를 간결하게 만드는 연습을 시작할 때임을 알게 되는 주제였습니다.
<br>

### 2. stackView 내 subview로 Label 추가 시 애니메이션

- 아무것도 입력하지 않았을 때 (왼쪽에 있었을 때), 하나 입력했을 때 (오른쪽으로 이동 완료했을 때) 각 상태에 대해 `view debugging`으로 `frame` 확인 해보고, 의심가는 부분은 `label`이 추가되었을 때 `stackView` 의 `Frame`이 변해서 그렇게 될 것 같고, 맞다면 `autolayout`을 다시 설정해야할 것이라는 피드백을 받았습니다. 이에 대하여 뷰 디버깅을 해보니 아무것도 입력이 되지 않을 때는 `scrollView`가 삭제가 되어있었고, 레이블을 추가하고 나서야 비로서 스크롤뷰가 생성되어 `autolayout`이 풀려 다음과 같은 에러 결과가 나타난 것 같습니다. 이에 대한 해결책은 4번 문제에서 해결하고자 합니다.
<br>

### 3. UILabel.text 옵셔널 처리

- `numberInput.text` 로 분기를 태우기 위해 `optional-binding`을 하고, `numberInput.text` 를 갱신하기 위해 `numberInput.text = text`로 할당하는 건 당연한 행동입니다. 이에 대해 고민한 것은, 1번 `guard`문과 연관되어 있는데, 그저 옵셔널 체이닝 하는 부분만을 외부 함수로 빼내면 이를 호출하기 위해서는 또 옵셔널 추출을 해야 합니다. 따라서, 외부 함수로 빼낼 때, 옵셔널 체이닝을 진행하면서 확인하고 싶은 조건을 이 함수 내부에서 확인한 후 결과값을 반환한다면 옵셔널 체이닝을 의미없고 무한하게 반복하는 작업을 피할 수 있습니다.
<br>

### 4. stackView 화면 하단 자동 이동

- 스크롤뷰에 `setContentOffset` 메서드를 이용하여 새롭게 추가되는 스택뷰만큼 오프셋이 적용되면 입력을 받을때마다 자동으로 입력된 스택뷰의 크기만큼 하단으로 자동 이동하는 부분을 구현할 수 있었습니다. 화면은 좌우의 움직임 없이 상하의 움직임만을 구현하면 되므로 `setContentOffset` 내 파라미터로 `x` 값은 0으로 설정하고 `y` 값은 `scrollView`의 `contentSize` 높이에서 `bounds` 높이를 빼주면 되었습니다.
- `Scroll` 되기 전 화면 기준으로 `scrollview.frame.size.height`가 `contentOffset`의 시작 기준점입니다. 즉, `contentOffset = 0`임을 의미합니다. 최초에 `scrollView` 화면이 스크롤이 전혀 안된 상태에서, 스크롤이 위로 올라가기 시작하면 `contentOffset` 값이 증가합니다.
- `y` 값에 대하여 자세히 풀어 설명하자면, 스택뷰가 입력될 때 `contentSize`는 `scrollView`의 `contentLayoutGuide`의 크기로, 스크롤뷰의 전체 크기로 이해하면 편합니다. 즉, 화면 밑으로 추가적으로 입력하여 화면 안에 안 보이게 되어도, 그 부분까지 모두 포괄하는, 콘텐츠가 모두 들어있는 만큼의 크기입니다. 반면, `bounds`의 크기는 현재 프로젝트 내에서는 스크롤뷰 내 삽입한 스택뷰의 크기로, 고정된 크기입니다. 따라서, 스택뷰를 초과하여 입력하면 `contentsize`는 이에 맞게 자꾸 증가하지만, `bounds`의 크기는 화면에 보이는 크기에 도달하면 더 이상 증가하지 않습니다. 따라서, 그 차이만큼 `Offset`을 설정해주면, 화면이 추가될 때마다 자연스럽게 추가되는 동작을 구현할 수 있습니다.
- 코드
    
    ```swift
    private func goToBottomOfScrollView() {
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: true)
    }
    ```
    
- 사진 (`contentSize`)

    <img width="301" alt="ContentSize" src="https://user-images.githubusercontent.com/99063327/170857085-ca0316fe-11b1-4245-879a-88b88fac2b5c.png">

- 사진 (`bounds`)

    <img width="345" alt="bounds" src="https://user-images.githubusercontent.com/99063327/170857117-c5be8ac7-5e69-4a83-a460-f83e703c8a5b.png">

- 영상 (`contentSize`와 `bounds`간 높이 비교)

    ![May-29-2022 13-34-32](https://user-images.githubusercontent.com/99063327/170857144-d3205d08-6780-471d-975d-dcba3f6f2bb8.gif)

- 그리고 애니메이션 기능을 원하지 않는 상태에서 화면의 하단 이동이 동기적으로 진행되기 위하여  `addCalculatorItems` 내에 `animation`을 추가하는 건 무의미한 행위임을 알게 되었습니다. 따라서, `animation`에 집중하는 것이 아닌 `goToBottomOfScrollView` 내 `layout` 변경사항에 집중할 필요가 있었습니다. `setContentOffset` 함수는 값이 변경될 때마다 호출이 되고는 있지만, 동기적으로 레이아웃 변경이 이루어지지 않고, 다음 `update cycle`에서 변경이 이루어지고 있습니다. 따라서 이를 즉각적으로, 다시 말해, 동기적으로 `layout` 변경 사항을 적용하기 위하여 `layoutIfNeeded` 메서드를 호출하여 해결할 수 있었습니다.
- 코드
    
    ```swift
    private func goToBottomOfScrollView() {
            scrollView.layoutIfNeeded()
            scrollView.setContentOffset(CGPoint(x: 0,
                                                y: scrollView.contentSize.height - scrollView.bounds.height),
                                        animated: true)
        }
    ```
<br>


## 배운개념
- `고차함수`, `map`, `filter`, `reduce`, `flatMap`, `compactMap`
- `where`, `element`, 
- `Auto Layout`, `overhead`, `@inlinable`
- `subviews`, `arrangedSubviews`, `UIStackView`
- `addSubview`, `addArrangedSubview`
- `removeArrangedSubview`, `removeFromSuperview`, `isHidden`, `Alpha`
- `Offset`, `SetContentOffset`, `ContentSize`, `Frame`, `Bounds`
- `Main Run Loop`, `Update Cycle`
- `LayoutSubviews`, `SetNeedsLayout`, `LayoutIfNeeded`

