# iOS 커리어 스타터 캠프
# 계산기
> 숫자와 기호를 이용하여 사칙연산을 하는 계산기 앱 만들기
> 
> 프로젝트 기간: 2023.01.24 - 2023.02.03
> 
> 팀원: 👩🏻‍💻[리지](https://github.com/yijiye?tab=repositories) | 리뷰어: 👩🏻‍💻[Judy](https://github.com/Judy-999)
>


## 목차
1. [타임라인](#타임라인)
2. [폴더구조](#폴더구조)
3. [UML](#UML)
4. [실행화면](#실행화면) - step3 완성 후 추가예정
5. [트러블 슈팅](#트러블-슈팅) - step3 피드백 후 추가예정
6. [참고 링크](#참고-링크)
7. [회고👀](#회고)



# 타임라인 
- 23.01.24(화) : 사칙연산을 구현하기 위한 UML 작성
- 23.01.25(수) : UML을 기반으로 CalculatorItemQueue 구현
- 23.01.26(목) : Queue 코드 보완 
- 23.01.27(금) : STEP2 UML 기반 코드 작성하기 - Operator 구현
----
- 23.01.30(월) : 계산기앱 Model 구현 및 UnitTest - Formula, ExpressionParser 
- 23.01.31(화) : 계산기앱 Model 로직 수정 - Formula, ExpressionParser
- 23.02.01(수) : STEP3 Autolayout, NumberFormatter 학습 및 ViewController 기본 구현
- 23.02.02(목) : 계산기앱 UIViewController 구현
<br>

# 폴더구조
```
Calculator
├── Model
|   ├── CalculatorItemQueue.swift
|   ├── CalculateItemProtocol.swift
├── └── Formula.swift
├── ├── Extension
|       ├── String.swift
|       └── Double.swift
├── ├── Enumeration
|       ├── Operator.swift
|       ├── CalculatorError.swift
|       ├── ExpressionParser.swift
|       └── Expression.swift
├── AppDelegate
├── SceneDelegate
├── CalculatorViewController
├── CalculatorItemQueueTests
├── └── CalculatorItemQueueTests.swift
├── OperatorTests
├── └── OperatorTests.swift
├── FormulaTests
├── └── FormulaTests.swift
├── ExpressionParserTests
├── └── ExpressionParserTests.swift
├── ExtensionStringTests
└── └── ExtensionStringTests.swift
```

# UML

<img src = "https://user-images.githubusercontent.com/114971172/215666552-64420c67-722b-43b9-977c-5ebadb4e8a96.png" width = "800">
   
# 실행화면
- 추가예정

# 트러블 슈팅 

## **[기능 구현]**

### 1️⃣ 배열 vs 연결리스트
  - 자료구조 중에 배열과 연결리스트가 있었고 둘중에 어떤 것을 사용하면 좋을지 고민했습니다. 결정하고자 둘의 장단점을 비교해보았습니다.

#### ⚒️ 해결방법
<details>
<summary>장단점 비교 표 </summary> 

|      | 배열                                                 | 연결리스트                                 |
| ---- | ---------------------------------------------------- | ------------------------------------------ |
|    장점  |   - 위치가 정해져있어 빠르게 원하는 값을 찾을 수 있다                                                   |  - 데이터를 추가하거나 삭제하는게 자유롭다                                         |
| 단점 | - 값을 삽입하거나 삭제할때 메모리 공간을 효율적으로 사용하기 위해 값을 당기거나 늘리거나 해야할 경우 시간복잡도가 증가할 수 있다. | - 위치가 정해져있지 않아 원하는 값을 순차적으로 찾아야한다. 따라서 원하는 값을 찾을때 시간이 소요된다.|
    
</details>

</br>

- 장단점을 비교했을 때, 값을 추가 삭제하는 경우엔 연결리스트가 배열보다 좋을 것 같다는 생각을 했습니다. 그러나 swift에서 배열은 이미 구현되어 있지만 연결리스트는 구현되어 있지 않아 새로 구현해줘야 한다는 번거로움이 있었고 내용도 배열보다 어렵다고 느꼈습니다.
- 따라서 주디랑 얘기했을 때 러닝커브도 중요한 기준이 된다는 얘기를 듣고 개념 이해가 확실한 배열을 선택하여 적용했습니다.

### 2️⃣ UML을 파악하여 코드로 구현하기
- UML에 나와있는 연결선과 표식을 보고 타입끼리 어떤 관계로 엮여있고 어떤 의도를 가지고 작성을 했는지 파악하는게 필수적으로 요구되는 과제였습니다. 또한 네이밍을 통해 어떤 역할을 하는지 파악해야 과제를 수행할 수 있었습니다.

#### ⚒️ 해결방법
💡 **ExpressionParser 밑줄의 의미**

- UML 상 밑줄로 표시되어있는 부분은 static 타입메서드를 적용하였다고 생각했습니다.
  그 역할을 조금 더 찾아보니, enum 에서 case로 구현을 하는 경우 그 enum에 접근을 하기 위해서는 새로운 인스턴스를 생성해주면서 접근하는 것이지만 타입프로퍼티 또는 타입메서드를 사용하면 새로운 인스턴스 접근 없이 swift의 Copy on Write가 작동하여 참조하는 것으로 값을 접근할 수 있다는 것을 알게되었습니다. (네임스페이스를 적용한 것으로 찾아보았습니다.)
- 따라서 새로운 인스턴스의 생성없이 전역에서 모두 하나의 enum을 공용으로 접근할 수 있게 해주는 용도로 static 을 적용시킨 것으로 생각했습니다.


💡 **extension String 네이밍**
- split이란 이름을 보고 입력받은 값을 나눠주는 역할을 한다고 생각을 했고 split과 components를 비교해보았습니다.
  - components
    `func components(separatedBy separator: String) -> [String]`
  - split
    `func split( separator: Self.Element, maxSplits: Int = Int.max, omittingEmptySubsequences: Bool = true ) -> [Self.SubSequence`
- 두가지를 사용했을 때 결과값은 동일하지만 반환타입이 다른 것을 확인할 수 있었습니다. 처음엔 반환값이 같은 `component`를 사용하였으나 `character`에 의해 제거되는 부분이 " " 로 비어있는 `String` 값으로 확인이 되어 `split` 으로 변경한 후 고차함수 `map`을 이용하여 `String` 배열로 다시 반환해주도록 수정했습니다.

💡 **componentsByOperator 네이밍**
- 연산자에 의해 분리된다는 네이밍을을 가진 메서드를 고차함수를 이용하여 구현해보았습니다. (처음엔 쉽게 가려고 " "에 의해 분리되도록 구현했으나 주디에게 바로 지적당함 😅)
- 여러 고차함수를 이용하였기 때문에 한번에 코드를 작성하는 것이 어려워 주디와 함께 하나씩 단계별로 구현을 해보았습니다.

```swift
  private static func componentsByOperator(from input: String) -> [String] {
        var result: [String] = [input]
        
        Operator.allCases.forEach { `operator` in
            result = result.map {
                $0.split(with: `operator`.rawValue)
            }.flatMap{ $0 }
        }
        
        return result
    }
```
<details>
<summary> 단계별 설명 </summary> 

   1) `Operator`는 `CaseIteral` protocol을 채택하고 있어 `allCases` 로 모든 값을 배열처럼 접근할 수 있었고 모든 값을 forEach 구문을 이용하여 다 돌게 해줌.
   2) 그 반환 값은 `operator` 타입의 ``.rawValue`` 를 기준으로 잘려져서 맵핑됨.
   3) `forEach`로 계속 반복되다보니 이중 배열이 들어갈 수 있고 이를 방지하기 위해 `flatMap`으로 flat한 배열로 만들어줌.
   4) 그 값들을 반복적으로 `result` 배열안에 넣어주고 최종 반환값은 `result` 가 됨.
</details>

### 3️⃣ 함수형 프로그래밍
- ExpressionParser에서 componentsByOperator에 의해 값이 나뉘고 계산하는 Formula의 연산자와 피연산자에 각각 enqueue로 값을 넣어주는 코드로 구현을 했습니다. 여기서 중요한 포인트는 swift는 **함수형 프로그래밍** 특징을 가지고 있습니다. **함수형 프로그래밍**에서 함수는 **순수 함수**를 의미하고, 이는 외부에 영향을 끼치지 않는 함수를 의미합니다. 
- 즉, 코드의 실행과 결과값이 함수에 전달된 인자값으로만 결과를 만들어 내기 때문에 상태값을 가지고 있지 않고 순수하게 함수만으로 동작해야 합니다. 
- 함수의 응용과 재사용성을 중시하기 때문에 다른 함수의 간섭이 생길 경우 예상하지 못하 오류를 발생시킬 수 있으므로 **함수형 프로그래밍**을 지향하는 코드를 작성하는 것이 좋습니다.

#### ⚒️ 해결방법

<img src ="https://i.imgur.com/23Za75w.png" width ="600">

- 따라서 비어있는 큐를 만들어서 넣어주는 것이 아니라 `원하는 큐를 만들어 내는 방법`으로 수정하였습니다.


### 4️⃣ 큐를 배열로 구현했을 때 시간복잡도 문제를 해결하는 방법
- 큐는 먼저들어간 값이 먼저 나오게되는 구조로 되어있습니다. 그렇기 때문에 첫번째 값이 빠져나가면 값들이 하나씩 당겨지는 오버헤드 현상이 생기게 되어 시간복잡도가 O(n)이 되었습니다. 이를 해결하고자 두가지 방법을 알아보고 더 적합한 방법을 적용하였습니다.


#### ⚒️ 해결방법
    
#### 1). 커서큐
```swift
struct Queue<T> {
    var queue: [T?] = []
    var head: Int = 0
    
    mutating func dequeue() -> T? {
        guard head <= queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        if head > 50 { // nil로 반환된 값을 삭제해주는 기준
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
```

    
- 값을 하나씩 당겨줄 필요 없이 ```head``` 포인터를 이용하여 위치를 입력해 주어 해결하는 방법.
- head가 큐배열의 수보다 작고 head의 위치에 있는 큐배열의 값이 존재하면 그 값은 nil로 반환하고 head는 +1을 해서 옆으로 이동.
- 계속해서 반복하면 nil이 남아있게 되므로 50개를 기준으로 nil을 모두 삭제해주고 head도 다시 0으로 초기화 시켜주어 문제를 해결.

#### 2). 더블 스택큐 ✅ 

```swift
struct DoubleStackQueue<T> {
    var input: [T] = []
    var output: [T] = []
    var isEmpty : Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        return input.count + output.count
    }
    
    mutating func enqueue(_ data: T) {
        input.append(data)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll() // 중복값으로 들어가지 않게 해주려고 input.removeAll을 한다.
        }
        return output.removeLast()
    }
}
```
- 두개의 빈 배열을 만들어 주고 enqueue로 값을 넣어주고 그 값을 ```reversed```해주어 값을 반대로 뒤집은 다음 마지막 값을 제거하여 반환하여 시간복잡도가 그대로 O(1)로 해결해 줄 수 있는 방법.

<details>
<summary> removeAll 테스트 코드 </summary> 

```swift
var someQueue = DoubleStackQueue<String>()
someQueue.enqueue("10")
someQueue.enqueue("11")
someQueue.enqueue("12")
print(someQueue.input) // 10, 11, 12
someQueue.dequeue()
print(someQueue.output) // 12, 11
print(someQueue.input) // 10, 11, 12
someQueue.enqueue("13")
print(someQueue.input) // 13
print(someQueue.output) // 12, 11
someQueue.dequeue() // 11
someQueue.dequeue() // 12
someQueue.dequeue() // 비어있으니까 input을 reversed() 하고 removeLast() 해서 13 반환
print(someQueue.output) // 빈 배열
```

- 값을 넣어주고 빼주고 반복하면 왜 저 구문이 필요한지 확인할 수 있음.
- 만약 input을 제거해주는 구문이 없다면 계속해서 쌓이고 중복되는 경우가 발생!!
    </details>
    
#### 결론적으로, 
- 커서큐의 경우 nil로 바뀐 값들을 제거해주기 전까지는 메모리 상에 남아있기 때문에 불필요한 값이 있을 수 있다고 생각했습니다. 그래서 조금 더 깔끔한 더블 스택큐를 선택하였습니다.

## **[UI 앱 구현]**

### 1️⃣ stackView 활용 
- 숫자가 입력되는 칸에 입력되고 연산자를 누르면 위로 올라가고 다시 초기화가 되어야 하는데, view를 확인해보니 scrollView 안에 stackView가 있고 그 안에 또 stackView가 존재했습니다. 처음에 있는 그대로 접근을 하려다 보니 가장 안에 있는 stackView에만 값이 올라갔다 내려가서 위로 계속해서 쌓이는게 아니라 값을 새로 바꿔주는 형태가 되었습니다.

#### ⚒️ 해결과정
- 우선 안에 있는 stackView를 지우고 하나의 stackView를 남겨놓고 그안에 입력되어 쌓이도록 수정을 하였습니다. 
- `@IBOutlet weak private var stackView: UIStackView!` 를 viewController에 만들어 하나의 stackView와 연결시키고 stackView를 코드로 구현하여 연산자와 피연산자 text가 입력되도록 구현했습니다.
```swift
  private func addStackView() {
        
        guard let operandStackLabel = numberInput.text,
              let operatorStackLabel = operatorInput.text else {  return  }
        
        let stackLabel = UILabel()
        stackLabel.text = operatorStackLabel + " " + operandStackLabel
        stackLabel.numberOfLines = 0
        stackLabel.adjustsFontForContentSizeCategory = true
        stackLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackLabel.textColor = .white
        stackView.addArrangedSubview(stackLabel)
        setScrollView()
        
    }
```
### 2️⃣ NumberFormatter 적용

- 숫자가 3자리씩 끊어서 입력되도록 구현하고자 했습니다. 처음엔 입력받는 메서드를 만들고 그 메서드를 Label.text에 반영시킬 때 NumberFormatter를 적용시키려고 하였는데, 여러 오류를 잡는 과정에서 숫자가 아닌게 들어가 return으로 빠지는 오류를 발견하였습니다. LLDB로 하나씩 타고 들어가서 확인해보니 처음 구현한 `func numberButtonTapped(_ sender: UIButton)` Bool 타입을 이용하여 조건문을 걸어준 메서드의 로직이 문제였습니다. 

#### ⚒️ 해결과정
- 값을 입력해주는 부분을 연산프로퍼티로 정의하여 `didSet`에 적용시켜보았습니다. 초기값을 0으로 지정해두고 0이면 입력되는 숫자가 들어오고 0이 아니면 거기에 더해서 입력되는 로직으로 변경하였고 text에 입력될때 NumberFormatter가 적용되어 반환되는 `applyDecimalPoint()` 메서드의 반환값으로 넣어주었습니다.

```swift
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else { return }
        if currentNumber == "0"  {
            currentNumber = number
        } else {
            currentNumber += number
        }
    }
```
    
```swift
   private var currentNumber: String = "0" {
        didSet {
            numberInput.text = applyDecimalPoint(number: currentNumber)
        }
    }
```
---

<details>
<summary><big>[작지만 귀엽지않은 트러블 모음집]</big></summary>

### ▶️ TDD
- ExpressionParser의 TDD를 작성할때, 반환 값이 Formula로 직접 구현한 타입이였습니다. 그래서 직접 비교를 하려면 Equatable 을 채택하고 준수해야하는 복잡함이 있었습니다.
- TDD는 코드를 작성하기 전에 실패케이스를 테스트하면서 올바른 코드를 작성하기 위함이고 Unit Test는 코드를 작성한 후에 코드가 제대로 작동하는지 확인하기 위해 작성하는 테스트입니다. 큐를 구현할때 코드가 단순해서 실패케이스를 작성하는 것이 어려웠습니다. 또한 메서드가 하는 역할과 상관없는 테스트를 작성하기도 했습니다.

#### ⚒️ 해결방법 (커스텀한 타입 비교)
- Formula가 가지고 있는 프로퍼티나 메서드를 통한 결과값과 비교하여 test를 진행할 수 있었습니다.

#### ⚒️ 해결방법 (TDD 테스트 구현)

- 기본적으로 테스트할 메서드가 하는 역할이 무엇인지 초점을 맞추고 수정했습니다. 예를 들어 dequeue 메서드의 경우 결국 반환하는 값이 맞는지, 또는 nil을 반환하는 경우는 어떤 경우인지가 가장 중요한 핵심이였습니다. 따라서 아래와 같이 테스트 코드를 수정하였습니다.

```swift
 func test_dequeue_를실행했을때_output과_input이비어있다면_nil을반환한다() {
         //when
         let result = sut.dequeue()

         //then
         XCTAssertNil(result)

     }

     func test_dequeue_를실행했을때_output은비어있고_input은비어있지않을때_output은input의_첫번째값을반환한다() {
         //given
         let input = ["1", "2", "+"]

         //when
         for value in input {
             sut.enqueue(value)
         }
         let result = sut.dequeue()
         let expectation = "1"

         XCTAssertEqual(result, expectation)
     }

```
    
### ▶️ TDD 작성시 nan 확인 방법

Double 타입에서 사용할 수 있는 기능중에 `.zero` `.nan` 이라는 것을 알게되었습니다. 따라서 0을 반환한다에서는 `.zero`를 사용했고, 값이 없다는 의미에서는 `.nan` 을 사용했습니다. 그런데, `.nan`을 비교하려고 할때 값이 없기 때문에 비교자체가 불가하는 것을 알게되어 bool 타입인 `isNaN`을 활용했습니다.
    
### ▶️ UnitTest 불필요한 코드 삭제
    
- UnitTest 작성시에 `setUpWithError()` `tearDownWithError()`를 사용하지 않을때 불필요하므로 삭제하였습니다.


### ▶️ 고차함수 filter
- input을 쪼개어 Double과 Operators 타입으로 나누어 피연산자와 연산자로 나눠서 enqueue()를 해주는 역할을 처음엔 조건문으로 구현을 했습니다. 또한 옵셔널값이였기 때문에 옵셔널바인딩을 해주는 과정이 필요했었는데, 이부분에 고차함수를 적용시켜보았습니다.
- Double 타입은 문제가 없는 반면, Operator 타입은 Character로 접근하다보니 아래와 같은 오류가 발생했습니다.
    
<img src ="https://i.imgur.com/OGlQmrT.png" width = "500">

#### ⚒️ 해결방법
- "10 - 5 x 100" 이란 값이 들어오는 경우 한자리수는 관계없지만 한자리이상의 String을 받으면 더이상 character로 받을 수 없는 것이 문제였고 filter로 갯수의 조건을 추가하여 해결했습니다.

```swift
components.filter{ $0.count == 1 }.compactMap({ Operator(rawValue: Character($0)) }).forEach{ operators.enqueue($0) }
```

### ▶️ protocol, extension
- 미션에서 언급한 protocol은 비어있었고, 큐를 구현할때는 모든 타입이든 받을 수 있는 제네릭타입으로 구현했습니다. 처음에 이 둘의 연관관계에 대해 생각하는 것이 어려웠습니다.

#### ⚒️ 해결방법
- 주디랑 멘토링 시간에 주디의 도움을 받아 어떤 역할로써 protocol이 존재하는지 알게되었습니다! 
- protocol은 하나의 약속으로 그 protocol을 채택하게 되면 그 안에 있는 기능을 반드시 준수해야합니다. 현재 과제에서는 비어있기 때문에 반드시 준수해야하는 항목은 없었습니다. 대신 extension을 사용하여 protocol을 채택하고 있는 CalculateItemQueue의 타입을 제한해주도록 구현할 수 있었습니다. 

```swift
protocol CalculateItemProtocol {

 }

 extension String: CalculateItemProtocol {

 }

 extension Double: CalculateItemProtocol {

 }
```
- 위와같이 구현하여 같은 프로토콜을 채택하고 있는 CalculateItemQueue 역시 String 과 Double 타입만 구현할 수 있게 되었습니다.

### ▶️ 접근제어 (쓰기전용)
- 코드에 접근제어를 설정하려고 했는데, TDD를 작성하기 때문에 ```private``` 으로 걸어두면 접근할 수가 없었습니다.

#### ⚒️ 해결방법
- 이를 해결하고자 읽는것은 가능하지만 쓰는것은 접근제어로 막아 변경할 수 없게끔 수정하였습니다.
- 또한 테스트에 필요한 기본값은 ```setUpWithError()```구문에서 초기화를 시켜주는 것으로 해결했습니다.

```swift
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue(items: [], reversedItems: [])
    }
```
- ```setUpWithError()```는 각 테스트 케이스가 실행되기 전에 호출되어 모든 테스트가 동일한 조건에서 확인되도록 하는 역할을 하고 있습니다. ```tearDownWithError()```는 각 테스트 케이스가 실행된 후에 호출되어 nil을 처리해서 값일 해제해주는 역할을 하고있습니다.
- 기본값으로 빈 배열을 넣어주고 필요할때 마다 ```CalculateItemQueue```의 메서드 (```enqueue,dequeue```)를 실행하여 값을 변경해주는 방법으로 테스트를 진행했습니다. 


### ▶️ 마지막값 반환하는 메서드 
- 아무생각없이 removeLast()를 처음에 사용했었는데 반환값은 옵셔널로 했습니다. removeLast()는 값이 반드시 있을경에만 사용해야 하기 때문에 문맥에 맞지 않는 코드였습니다.

#### ⚒️ 해결방법
- 여러종류의 메서드와 프로퍼티를 확인해보고 맞는 메서드를 적용하였습니다.

<details>
    <summary>메서드, 프로퍼티 정리</summary>
🔹 **last** 
> 마지막 값을 삭제하지 않고 반환한다. 옵셔널이기 때문에 빈 배열일 경우 nil을 반환한다.

```swift!
var array: [Int] = [1, 2, 3, 4, 5]

array.last // 5
print(array) // [1, 2, 3, 4, 5]
```
🔹 **dropLast(Int)**
> 뒤에서 Int 만큼 값을 제외하고 나머지 값을 반환한다. 이때 제외한 값은 삭제되지 않는다.

```swift
array.dropLast(2) // [1, 2, 3]
print(array) // [1, 2, 3, 4, 5]
```
🔹 **popLast()**
> 마지막 값을 삭제하고 반환한다. 옵셔널이기 때문에 빈 배열일 경우 nil을 반환한다.

```swift
array.popLast() // 5
print(array) // [1, 2, 3, 4]
```
🔹 **removeLast()**
> 마지막 값을 삭제하고 반환한다. 값이 늘 있어야 하므로 배열이 비어있으면 오류가 발생한다.

```swift
array.removeLast() // 4
print(array) // [1, 2, 3]
```
🔹 **removeLast(Int)**
> 뒤에서 Int 만큼 값을 제외하고 나머지 값을 반환한다. 이때 제외한 값은 삭제된다.
```swift
array.removeLast(2) // [1]
print(array) // [1]
```

**reversed() vs reverse()**

🔹 **reversed()**
> 배열의 순서를 뒤집어서 접근할 수 있지만 새로운 배열로 반환해주지는 않는다.

🔹 **reverse()**
> 원래의 배열을 뒤집어서 새로운 배열로 바꿔준다.

```swift
var someArray: [Int] = [10, 20, 30]

let reversed: [Int] = someArray.reversed() // [Int]타입의 reversed에 새로 넣어주면 확인할 수 있다.
print(reversed) // [30, 20, 10]
print(someArray) // [10, 20, 30]

someArray.reverse() 
print(someArray) // [30, 20, 10]
```
    
</details>
</details>
    
# 회고👀

- 잘한 점
  - 혼자서 진행하는 프로젝트라 막막하고 많이 힘들었지만 끝까지 포기하지 않은 나자신 너무 대견스럽다 😭
  - 적극적으로 동기캠퍼와 리뷰어에게 도움을 요청하여 어려움을 헤쳐나갔다
  - 도움을 받았다면 그 내용을 혼자서 반복하고 정리하면서 한번 더 공부하려고 노력했다.
    
- 보완하고 싶은 점
  - 한번만 더 생각해봤으면, 한번만 더 확인해봤으면 이란 아쉬움은 왜 피드백을 받으면 생기는지..! 다음 미션에서는 조금더 꼼꼼하고 생각하는 사람이 되도록 노력하자
  - 나만의 페이스대로 가야하는데 자꾸 급해지는 마음 덕분에 과제를 마칠수도 있었지만, 그 마음 때문에 여러가지 방향으로 풀어내기에 시간이 부족했다. 꼭 시간을 내서 이런 저런 방법을 적용해보자!

---- 

# 참고 링크
[zdodev.github](https://zdodev.github.io/uml/swift/UML-Class-Diagram/)</br>
[nextree](https://www.nextree.co.kr/p6753/)</br>
[Apple-array 공식문서](https://developer.apple.com/documentation/swift/array)</br>
[개발자아라찌](https://apple-apeach.tistory.com/8)</br>
[개발자소들이](https://babbab2.tistory.com/84)</br>
[dudu-velog](https://velog.io/@aurora_97/Swift-큐)</br>
[Apple-remove 공식문서](https://developer.apple.com/documentation/swift/array/removelast())</br>
[Apple-protocol 공식문서](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)</br>
[Apple-extension 공식문서](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)</br>
[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)</br>
[함수형프로그래밍-코딩하는버디](https://coding-rengar.tistory.com/13)</br>
[야곰닷넷-오토레이아웃 정복하기](https://yagom.net/courses/autolayout/)</br>
[Apple-UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
