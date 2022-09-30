# **계산기 (calculator-app)*

## 1. 🧮 프로젝트 소개
두개의 연산값을 연산하여 반환하는 계산기앱입니다. 
- **연산자 우선순위는 생각하지 않습니다.**


## 2. 🧑‍🤝‍🧑 팀원

| **stone** | 
| ----- | 
| <img width="180px" src="https://avatars.githubusercontent.com/u/74972815?v=4"> | 

## 3. 📂 폴더구조
```
└── Calculator/
    ├── Appdelegate
    ├── SceneDelegate
    ├── Assets
    ├── info
    ├── Controller/
    │   └── ViewController
    ├── View/
    │   ├── LanchScreen
    │   └── Main
    ├── model/
    │   ├── CalculatorItemQueue
    │   ├── CalculateItem
    │   ├── Extension
    │   ├── Operator
    │   ├── ExpressionParser
    │   ├── Formula
    │   ├── CalculatorError
    │   └── CalculatorNameSpace
    ├── CalculatorItemQueueTests/
    │   └── CalculatorItemQueueTests
    ├── FormulaTests/
    │   └── FormulaTests
    └── ExpressionParserTests/
        └── ExpressionParserTests
```
## 4. 👩🏻‍💻 실행 화면(기능 설명)
| 정상 연산 | 연산 후 `=` 버튼 비활성화 | 0이하 소숫점 | 
| ----- | ----- | ----- | 
| ![](https://i.imgur.com/HcKP2Ca.gif)|![](https://i.imgur.com/o9kiG5I.gif)|![](https://i.imgur.com/eFLcU9M.gif)| 
| **AC버튼** | **CE 버튼** |**연산후 CE버튼**| 
|![](https://i.imgur.com/dd4uQx3.gif)|![](https://i.imgur.com/77wappw.gif)|![](https://i.imgur.com/a4Zn4Eg.gif)| 
| **0일때 0,00입력**|**0으로 나눴을시 NaN**|**0일때 연산자 변경**| 
|![](https://i.imgur.com/tFlsrTM.gif)|![](https://i.imgur.com/23EMmdK.gif)|![](https://i.imgur.com/sPOSMCD.gif)| 


## 5. 📄 UML
![](https://i.imgur.com/WkomQE2.jpg)

## 6. 🔥 트러블 슈팅

### `CalculatorItemQueue`에서 빈`queue`에 `dqueue`메서드를 실행했을때, `index out of range`에러
- `headIndex`를 통하여 큐에 직접 접근하는 방식으로 구현하다 보니, 테스트 코드에서 빈`queue`값에 접근 시 `index out of range`에러가 발생하는 문제가 있었습니다.
- 이와 같은 에러를 해결하기 위해 아래같은 방식으로 접근했습니다.
```swift
mutating func dequeue() -> CalculateItem? {
    guard queue.count != 0, head <= queue.count, let element = queue[head] else { return nil }

    queue[headIndex] = nil
    headIndex += 1
    if headIndex > (queue.count / 4) {
        queue.removeFirst(headIndex)
        headIndex = 0
    }
    return element    
}
```
- 위 방식으로 구현했을 떄 문제점은, `queue.count != 0` 조건을 통해 빈`queue`에 접근했을시, nil을 반환하는 조건으로 체크할 수 있었지만, 안전하지 않아 보인다는 문제가 있었습니다.

- 문제를 개선하기 위해 아래 코드와 같이 `Array`타입을 확장해주어 서브스크립트로 빈값에 접근할시 nil을 반환하는 코드를 작성했습니다.
```Swift
extension Array {
    public subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
```
- 위 코드를 통해 `queue.count != 0` 조건을 제거할 수 있었고, `queue[safe: headIndex]` 한 코드로 `queue` 에 대한 유효성 검사를 할 수 있었습니다.
```swift
mutating func dequeue() -> CalculateItem? {
    guard headIndex <= queue.count, let element = queue[safe: headIndex] else { return nil }

    queue[headIndex] = nil
    headIndex += 1
    if headIndex > (queue.count / 4) {
        queue.removeFirst(headIndex)
        headIndex = 0
    }
    return element
}

```

## 7. 🤔 고민한 부분

### 1. `Array`형식의 큐 구현시 시간 복잡도에 대한 고민

- `enqueue`작업을 하는 부분은 배열의 끝에 요소를 추가하는 `append`메서드로 시간복잡도 O(1)로 문제가 없지만,
- `dequeue`작업을 하는 부분은 `removeFirst`메서드를 사용하여 배열의 맨 앞의 요소를 추출해 배열의 전체요소의 index가 -1되다보니, 시간복잡도가 O(n)으로 `dequeue`작업은 오버헤드를 발생합니다.
- 이러한 단점을  Int형 변수인 `head`를 추가함으로써 `removeFirst`메서드를 사용하지 않고, `head`의 위치를 1씩 증가시키며 nil 값을 할당해주는 방식으로 구현하여 O(1)의 시간복잡도를 갖는 메서드로 구현해보았습니다.
    - `nil` 값으로 할당된 배열은 `head`의 값이 `queue`크기의 25% 를 차지하게되면 nil 값을 remove하도록 구현하였습니다.
### 2. `LinkedList`와 `Array` 선택에 대한 고민 
- 계산기 구현시 특정 값을 찾아 사용하는것이 아닌 값을 넣은 순서대로 사용한다고 판단되어 Array를 채택하였고 Array의 단점을 보완하는 방향으로 구현해보았습니다.


### 3. **componentsByOperator 함수를 작성하면서 했던 고민**
- 처음 작성한 코드는 String타입의 `input`값을 `compactMap`고차함수와 `joined`메서드, `components` 메서드 세가지를 활용하여 피연산자들의 값을 리턴해주는 함수로 구현했습니다
```swift
static private func componentsByOperator(from input: String) -> [String] {
    return input.compactMap { Double(String($0)) != nil ? String($0) : " " }.joined().components(separatedBy: " ")
}
```
위 코드를 작성하고보니 가독성이 너무 떨어진다는 생각이 들었고, 확장 구현한 `split`메서드를 통하여, `compactMap`으로 `Double`형으로 형변환이 되지 않는 값`(연산자)`만 리턴해주도록 구현하였습니다. 
```Swift
static private func componentsByOperator(from input: String) -> [String] {
    return input.split(with: " ").compactMap { Double($0) != nil ? $0 : nil }
}
```
### 4. **ExpressionParserTests** 테스트 케이스를 작성하면서 했던 고민

```swift
func test_string값의_식의_결과값이_356일때_string내부의값을_parse하여_연산한_결과값이_356와일치하는지()
```
- 위 케이스에서, String 값을 `parse`한 return 값인 `Formula`구조체와 동일한 `Formula`구조체를 생성해서 비교해주어야 하는지 고민을 했습니다. 하지만 해당 케이스에서 `Formula`구조체 인스턴스를 생성하여 비교하는건 바람직 하지 않다고 판단하였습니다. 고민한 결과, String값을 `parse`한 결과 값과, Double 타입의 `result` 값을 비교하는 방식을 채택하였습니다. 

### 5.StackView생성에 대한 고민
StackView를 생성할 때 매번 다른 값으로 Label을 생성하고, StackView를 만들어줘야 하다보니 어떻게 접근하면 좋을까 고민했습니다.
1. 클로져
 - 클로져 형식으로 Label을 생성 후, StackView를 만들어 보려고 했으나, lazy 속성을 통하여 선언해준다고 하여도, 변수에 접근할 때 Label의 속성을 정의해주고 접근할 때마다 같은 Label이 생성되는 문제가 발생하여 클로져 형식은 맞지 않다 생각했습니다.
2. 함수
- label의 text에 대한 속성 값을 받는 함수를 정의하여 구현 했습니다. 정상적으로 작동되었으나 조금 더 깔끔한 코드를 채택해보고 싶었습니다.
3. 계산 속성⭐️
- 계산 속성을 사용하여 Label을 정의하였을때, 속성에 접근할 때마다 label의 text값을 가지고 Label을 생성해줄 수 있었습니다. 이 방식을 채택했을때 코드가 조금 더 깔끔해지는 느낌을 받아 이 방식을 채택하였습니다.


## 8. 🔗 참고 링크

[[Swift]안전하게 배열 조회하기](http://minsone.github.io/programming/check-index-of-array-in-swift)
