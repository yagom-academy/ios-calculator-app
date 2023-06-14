# 계산기

> +, -, ×, ÷ 연산이 가능한 계산기 앱

</br>

## 목차

1. [팀원](#1.)
2. [시각화된 프로젝트 구조](#2.)
3. [타임라인](#3.)
4. [실행 화면(기능 설명)](#4.)
5. [트러블 슈팅](#5.)
6. [참고 링크](#6.)
7. [프로젝트 회고](#7.)

---

</br>

<a id="1."></a>

## 1. 팀원

| [Erick](https://github.com/h-suo) |
| :---: |
| <img src="https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" height="150"/> | 

---

<a id="2."></a>

</br>

## 2. 시각화된 프로젝트 구조

### UML
<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/0b590bd2-f904-45b6-b017-21e26654cb49" height="1000"/>

### 폴더 구조

```
Calculator
├── Extension
│   ├── Double+Extension
│   ├── String+Extension
│   └── UIScrollView+Extension
├── Model
│   ├── ExpressionParser
│   ├── Formula
│   ├── CalculatorItemQueue
│   ├── CalculateItem
│   ├── Operator
│   └── CalculatorTerms
├── View
│   └── Main
└──  Controller
    ├── AppDelegate
    ├── SceneDelegate
    └── CalculatorViewController
    
Test
├── CalculatorItemQueueTests
├── OperatorTests
├── FormulaTests
└── ExpressionParserTests
```

</br>

---

<a id="3."></a>

## 3. 타임라인

### ***STEP2***

### **2023.06.01.(목)**
**Queue 수정**
- 연결리스트로 구현했던 `CalculatorItemQueue`를 더블 스택 큐로 수정

**Operator**
- `Operator` 타입에 연산 메서드 `calculate` 추가
- 테스트를 위한 `OperatorTests` 생성

**String+**
- `split` 메서드 추가

### **2023.06.02.(금)**
**UML**
- 제공받은 UML에 맞게 로직 구현
- **Formula**
    - 피연산자를 가져와 연산자로 계산하는 로직 구현
    - 테스트를 위한 `FormulaTests` 생성
- **ExpressionParser**
    - 받아온 문자열을 피연산자와 연산자로 나누어 Formula를 반환하는 로직 구현
    - 테스트를 위한 `ExpressionParserTests` 생성

### 2023.06.05.(월)
**리펙토링**
- 축약어를 사용하지 않도록 리네임
- 잘못된 띄어쓰기 및 대소문자 수정

</br>

### ***STEP3***

### **2023.06.06.(화)**
**뷰객체와 컨트롤러 연결**
- `@IBOutlet`으로 `operatorLabel`, `operandsLabel`을 생성하여 연산자를 표시하는 레이블과 피연산자를 표시하는 레이블에 연결
- `@IBAction`으로 버튼 액션과 관련된 함수를 생성하여 숫자 버튼, 옵션 버튼, 연산자 버튼으로 동작을 나누어 연결

### **2023.06.07.(수)**
**버튼 액션 분리**
- `TapNumberButton`에서 `TapDecimalPointButton`을 분리
- `TapOperatorButton`에서 `TapEqualButton` 분리
- `TapOptionButton`을 `AC`, `CE`, `ChangeSign`에 따라 분리

**버튼 액션 구현**
- 버튼을 눌렀을 때 그에 맞게 숫자가 입력되고 연산자가 입력되는 로직 구현
- `TapEqualButton`을 눌렀을 때 `formula`에 맞는 결과를 보여주도록 구현
- `TapChangeSignButton`을 눌렀을 때 부호를 변경하는 로직 구현

**연산 내역 추가**
- 연산을 추가할 때마다 스택뷰에 연산 내역이 쌓이도록 구현
- 연산이 많아져도 가장 최근 연산을 보여줄 수 있도록 `UIScrollView`를 확장하여 `scrollToBottom` 메서드 생성

### **2023.06.08.(목)**
**코드의 분리**
- `@IBAction` 내부에서 바로 처리하던 로직들을 함수로 분리

**계산기 용어 정리**
- 컨트롤러에서 반복적으로 사용되는 "0", "." 과 같은 문자들을 `CalculatorTerms`을 생성하여 정리

### **2023.06.09.(금)**
**README 작성**

**계산기 로직 수정**
- 연산 내역에는 정상적인 숫자가 추가되도록 수정
- 계산 후 숫자가 입력되면 결과에서 숫자가 추가되는 것이 아닌 새로운 숫자만 추가되도록 수정
- 입력 받는 자릿수 그리고 결과의 자릿수를 12자리로 수정

---

</br>

<a id="4."></a>

## 4. 실행 화면(기능 설명)

| **계산 수행** | **0으로 나누었을 때 NaN** |
|:----:|:----:|
|<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/27713959-1060-4abe-beaa-64919440373b" width="300"/>|<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/ba6f9ef9-67d8-44fe-a470-87524d2a9585" width="300"/>|

| **CE & AC** | **소수점 & 부호 변경** |
|:----:|:----:|
|<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/7ba36e98-093e-4e52-837c-93b7d61083a1" width="300"/>|<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/ba112176-a48a-40b7-ac6e-526fec84319d" width="300"/>|

</br>

---

<a id="5."></a>

## 5. 트러블 슈팅

### NaN

**🔥문제점**

- `Operator`의 `divide` 연산을 수행할 때 0으로 나누어도 NaN을 반환하지 않았습니다.

<details>
<summary>본문 코드 내용</summary>

```swift
func divide(lhs: Double, rhs: Double) -> Double {        
    return lhs / rhs
}
```
    
</details>

</br>

**🧯해결방안**

- `divide`의 결과값이 `Double.infinity`라면 `Double.nan`을 던져주도록 구현하였습니다.

<details>
<summary>본문 코드 내용</summary>

```swift
func divide(lhs: Double, rhs: Double) -> Double {
    let result = lhs / rhs
        
    return result.isInfinite ? Double.nan : result
}
```
    
</details>

</br>

### 고차함수

**🔥문제점**

- `ExpressionParser`의 `parse` 내부 로직에 고차함수와 `if`문이 섞여있어 가독성이 떨어지는 문제가 있었습니다.

<details>
<summary>본문 코드 내용</summary>

```swift
static func parse(from input: String) -> Formula {
    var formula = Formula()
    let calculateItemList = componentsByOperators(from: input)
        
    calculateItemList.forEach { item in
        if let oper: Double = Double(item) {
            formula.operands.enqueue(oper)
        } else if let oper: Operator = Operator(rawValue: item) {
            formula.operators.enqueue(oper)
        }
    }
    
    return formula
}
```
    
</details>

</br>

**🧯해결방안**

- if문과 고차함수를 같이 사용하는 것이 아닌 고차함수로만 로직을 구현하여 가독성을 높였습니다.

<details>
<summary>본문 코드 내용</summary>

```swift
static func parse(from input: String) -> Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    let components = componentsByOperators(from: input)
        
    components
        .compactMap { Double($0) }
        .forEach { operands.enqueue($0) }
        
    components
        .filter { $0.count == 1 }
        .compactMap { Operator(rawValue: Character($0))}
        .forEach { operators.enqueue($0)}
        
    return Formula(operands: operands, operators: operators)
}
```
    
</details>

</br>

### arrangedSubviews

**🔥문제점**

- 연산 내역을 `stackView`에 추가할 때 뷰를 추가하는 것과 삭제하는 것의 번거로움이 있었습니다.

</br>

**🧯해결방안**

- `arrangedSubviews`를 이용하여 스택뷰로만 이루어진 하위뷰에 쉽게 접근할 수 있었습니다.
- 이를 이용하여 `arrangedSubviews`에 새로운 레이블을 추가하거나, `arrangedSubviews`로 접근하여 상위 뷰와의 연결을 끊어 쉽게 뷰를 삭제할 수 있었습니다.

<details>
<summary>본문 코드 내용</summary>

```swift
final class CalculatorViewController: UIViewController {
    
    // ...
    private func addCalculationDetailsStackView(_ `operator`: String, _ operands: String) {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "\(`operator`) \(operands)"
        
        calculationDetailsStackView.addArrangedSubview(label)
        // ...
    }
    
    // ...
    private func clearCalculationDetailsStackView() {
        calculationDetailsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    // ...
}
```
    
</details>

</br>

### 오토레이아웃

**🔥문제점**

- 스택뷰에 새로운 뷰가 업데이트 되는 것보다 `scrollToBottom`이 먼저 호출되어 연산 내역에 화면 넘어까지 연산이 추가되어도 입력값이 보이지 않는 문제가 있었습니다.

<details>
<summary>문제 실행 화면</summary>
    
<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/5ba2414f-ea61-49c6-afb0-0fed3e7d05b1" width="300"/>

</details>
    
</br>

**🧯해결방안**

- iOS는 내부적으로 메인 스레드에서 `main run loop`를 실행하고 이후에 `Update Cycle`을 실행하기 때문에 레이아웃 업데이트를 즉시 실행해주는 `layoutIfNeeded()`를 호출하도록 하였습니다.

<details>
<summary>본문 코드 내용</summary>

```swift
final class CalculatorViewController: UIViewController {
    
    // ...
    private func addCalculationDetailsStackView(_ `operator`: String, _ operands: String) {
        
        // ...
        calculationDetailsScrollView.layoutIfNeeded()
        calculationDetailsScrollView.scrollToBottom(animated: false)
    }
    
    // ...
}
```
    
</details>

---

</br>

<a id="6."></a>

## 6. 참고 링크

- [🍎 Apple-NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
- [🍎 Apple-arrangedSubviews](https://developer.apple.com/documentation/uikit/uistackview/1616232-arrangedsubviews)
- [😺 Z1napp/ScrollView scroll to bottom extension.swift](https://gist.github.com/Z1napp/e7f921e16315d5b484e5d9a9c34a0b46)
- [🗒️ UIView에서 Subview 지우기](https://gyuha.tistory.com/419)
- [🗒️ layoutIfNeeded() 이해하고 사용하기 ](https://ios-development.tistory.com/986)

---

</br>

<a id="7."></a>

## 7. 프로젝트 회고

### 👏🏻 잘한 점

- 기능 구현을 하기 위해 여러 방법들을 찾아보고 공부한 것이 잘한 점이라고 생각합니다.

### 👊🏻 개선할 점

- 다양한 방향으로 생각하는 것이 부족한 것 같습니다.
