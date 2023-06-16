# 계산기🤖

> 사칙연산을 수행하는 계산기를 만드는 프로젝트입니다.

**프로젝트 진행기간**: 23.06.12(월) ~ 23.06.16(금)

## 📂 목차
1. [팀원](#-팀원)
2. [시각화 구조](#-시각화-구조)
3. [타임 라인](#-타임-라인)
4. [실행 화면](#-실행-화면)
5. [트러블 슈팅](#-트러블-슈팅)
6. [팀 회고](#-팀-회고)
7. [참고 문서](#-참고-문서)

## 1. 팀원

| JusBug | Yetti |
| :---: | :---: |
| <Img src="https://github.com/JusBug/ios-juice-maker/assets/109963294/53a73571-41d9-4914-a917-d8ea099be948" width="150"/> | <img src="https://hackmd.io/_uploads/B1I0iwo42.jpg" width="120"/>
| **[Github](https://github.com/JusBug)** | **[Github](https://github.com/iOS-Yetti)** |


- - -

</br>

## 2. 시각화 구조

### UML

![](https://hackmd.io/_uploads/rJZDHqtDh.png)

</br>

- - -

<a id="3."></a>

## 3. 타임라인
##### 중요 커밋 위주로 작성하였습니다. 

### 2023.06.12.(월)
- Operator, ExpressionParser, Formula 코드 병합

### **2023.06.13.(화)**
- PR 후 코드 수정

### **2023.06.14.(수)**
- Unit Test 코드 추가 및 수정

### **2023.06.15.(목)**
- 스택뷰와 레이블을 활용하여 계산내역 표시

### **2023.06.16.(금)**
- 계산기 UI연동하여 터치 이벤트를 수신하고 연산 수행하도록 구현
- 숫자를 입력하고 계산하는 기능 구현
---

</br>

<a id="4."></a>

## 4. 실행 화면(기능 설명)

| 기본 사칙연산 | AC, CE, ChangeSign 기능 | dotSign, DoubleZero 연산 |
| :--------: | :--------: | :--------: |
|<img src="https://i.ibb.co/zmvpSCj/Calculator-Simulator-1.gif" width="262">| <img src="https://i.ibb.co/Jn2Tk3d/Calculator-Simulator-2.gif" width="250">| <img src="https://i.ibb.co/jzzkrqh/Calculator-Simulator-3.gif" width="250">|

---

<a id="5."></a>

## 5. 트러블 슈팅

### 1️⃣ 기능함수 분기처리

**문제점**
- 기존 UML에서는 `componentsByOperator()` 라는 네이밍 뜻대로 연산자를 기준으로 해서 피연산자를 반환해주는 것이 맞지만 구현한 코드에서는 `formula`에 연산자와 피연산자 간에 빈칸을 두어 그 공백을 기준으로 `split()`하여 각 요소들을 제네릭으로 변환한 타입에 맞춰 각각 큐에 넣어줬기 때문에 타입에 따른 `enqueue`연산을 수행하는 메서드를 각각 생성해줄 필요성을 느꼈다.

<details>
<summary>본문 코드 내용</summary>

```swift!
static private func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
```

</details>

</br>

**해결방안**

- `operandComponents`와 `operatroComponents`를 각각 다른 메서드로 기능을 분리하여 가독성과 유지보수성을 높였습니다.
<details>
<summary>본문 코드 내용</summary>
    
```swift
static private func collectOperands(from input: String) -> CalculatorItemQueue<Double> {
    let operandComponents = input.split(with: " ")
    var operands = CalculatorItemQueue<Double>()

    operandComponents
        .compactMap { Double($0) }
        .forEach { operands.enqueue($0) }

    return operands
}

static private func collectOperators(from input: String) -> CalculatorItemQueue<Operator> {
    let operatorComponents = input.split(with: " ")
    var operators = CalculatorItemQueue<Operator>()

    operatorComponents
        .filter { $0.count == 1 }
        .compactMap { Operator(rawValue: Character($0)) }
        .forEach { operators.enqueue($0) }

    return operators
}
```
    
</details>

</br>


### 2️⃣ 매직 넘버, 매직 리터럴 처리

**문제점**  
- 계산기 내부에서는 숫자 이외에도 `.`, `,`, `-`와 같은 기호들이 많이 사용되었고 그러다보니 매직 넘버와 매직 리터럴로 값을 할당해야하거나 처리하는 부분이 너무 많아졌습니다. 


</details>

</br>

**해결방안**
- `CalculatorViewController` 내부에서 사용할 수 있는 `네임스페이스`를 하나 만들어 매직 리터럴들을 처리해 주었습니다.

<details>
<summary>본문 코드 내용</summary>

```swift
extension CalculatorViewController {
    enum CalculatorSigns {
        static let dot = "."
        static let zero = "0"
        static let doubleZero = "00"
        static let minusSign = "-"
        static let allClear = "AC"
        static let clearEntry = "CE"
        static let changeSign = "⁺⁄₋"
        static let decimalSign = ","
        static let notaNumber = "NaN"
    }
```
    
</details>

</br>

### 3️⃣ DecimalSign 값 처리

**문제점**
- 4자리수 이상의 숫자가 입력되어 `NumberFormatter` 거친 후 저장된 `displayOperandLabel.text`에는 `decimal`값을 내포하고 있기 때문에 `parse()`로 연산와 피연산자를 구분하여 `result()`로 연산 결과를 리턴해올 수 없었습니다.

<details>
<summary>본문 코드 내용</summary>

```swift!
private func addFormula() {
    guard let operands = displayOperandLabel.text,
          let `operator` = displayOperatorLabel.text else { return }
```


</details>

</br>

**해결방안**

- 따라서 문자열의 특정 값을 다른 값으로 대체해주는 메서드인 `replacingOccurrences(of: with:)`를 이용하여 "," 값을 빈값으로 대체해주며 문자열 `formula` 다시 반환하여 연산이 이루어지도록 해결하였습니다.

<details>
<summary>본문 코드 내용</summary>
    
```swift
private func addFormula() {
    guard let operands = displayOperandLabel.text?.replacingOccurrences(of: CalculatorSigns.decimalSign, with: ""),
          let `operator` = displayOperatorLabel.text else { return }
```
    
</details>

</br>


- - -


<a id="7."></a>

## 6. 팀 회고

### 👏🏻 우리팀이 잘한 점

- 코드를 병합하는 과정에서 의견 대립이 있을 때마다 함께 계속해서 논의하며 이상적인 코드의 방향을 찾기 위해 고심했고 상대방의 코드를 이해하기 어려울 때나 지적을 할때에도 서로 계속해서 질문하고 답하는 과정을 거치며 코드를 완벽하게 이해하고 공부하는데 있어 큰 도움이 되었습니다.

- 해결되지 않는 부분을 그냥 넘기지 않고 계속 함께 코드를 작성해보면서 어떤 해결방법이 있을까 고민을 했던 시간을 가졌던 부분이 코드의 이유를 한 번 더 상기할 수 있는 좋은 시간이었습니다.
### 👊🏻 우리팀이 개선할 점

- Step3를 완벽하게 구현하지 못해서 코드 병합을 하데 다른 팀보다 제한이 있었습니다. 따라서 방학 기간에 미흡했던 부분을 공부하고 계산기 프로젝트를 스스로 끝마칠 수 있도록 노력하겠습니다.

</br>

### 👍 서로에게 좋았던 점 피드백

### Dear. Yetti

```
- 제가 생각하지 못 하고 놓쳤던 예외처리 부분들도 계속해서 질문을 해주신 덕분에 다시 생각해보고 더 나은 방향으로 코드를 수정할 수 있었습니다.
```

### Dear. JusBug

```
- 제가 부족하고 이해하지 못하는 부분들을 잘 설명해주셔서 예상보다 완성도있게 프로젝트 코드를 작성할 수 
있었습니다.
```

</br>

### :pray: 서로에게 아쉬웠던 점 피드백

### Dear. Yetti

```
- 아무래도 초반에 코드 병합하는 과정에서 각자 구현된 기능이 다소 부족한 부분이 있었지만 UI연동 소스코드는 대부분 먼저 구현헀던 제 코드를 진행이 되었기에 예티가 단 번에 이해하기 어려웠고 개인적으로는 코드를 서로 비교할 수 없었던 점이 아쉬웠습니다.
```

### Dear. Jusbug
```
- 
```

## 7. 참고 문서

- [🍎 Apple-numberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
- [🍎 Apple-UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
- [🍎 Apple-replacingOccurrences](https://developer.apple.com/documentation/foundation/nsstring/1412937-replacingoccurrences)
- [📖 blog-Generic](https://babbab2.tistory.com/136)
