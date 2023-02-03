# 🧮 Calculator

## 📚 목차
* [🧮 소개](#-소개)
* [📁 프로젝트 구조](#-프로젝트-구조)
* [🖥 실행화면](#-실행화면)
* [⏱ 타임라인](#-타임라인)
* [🔥 트러블 슈팅](#-트러블-슈팅)
* [🔍 참고 링크](#-참고-링크)

## 🧃 소개
### 프로젝트 기간: 23.01.24 ~ 23.02.03
* 간단한 계산기 프로그램입니다.
* 단, 사칙연산 우선순위를 무시합니다.

### 프로젝트 팀원
|⭐️Vetto|
| :--------: |
|<img src="https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg" width="150" height="180">|

<details>
    <summary><big>📄 규칙</big></big></summary>

#### Commit 컨벤션
* feat : 기능 구현, 수정
* docs : 문서 추가, 수정
* refactor : Naming 수정 등
* fix : 사용자가 사용하는 부분에서 bug 수정
* chore : 별로 중요하지 않은 사항

</details>

## 📁 프로젝트 구조

<details>
    <summary><big>UML</big></big></summary>

![Calculator_step3 drawio](https://user-images.githubusercontent.com/72865221/216542801-aa1a69d0-8812-4120-8d31-ac5eb21eb131.png)
리팩토링 후 수정 예정

</details>

## 🖥 실행화면

###  ACButton, CEButton 실행 결과

| ACButton | CEButton |
| :--------: | :--------: |
| <img src="https://user-images.githubusercontent.com/72865221/216528148-86a6494d-2706-48a8-8054-f2b346fab88d.gif" width="300" height="600"> | <img src="https://user-images.githubusercontent.com/72865221/216528552-337b67dc-0d26-441a-8e6a-0be4e1d0299b.gif" width="300" height="600"> |

### ChangeSignButton, NaN 실행 결과

| ChangeSignButton | NaN |
| :--------: | :--------: |
| <img src="https://user-images.githubusercontent.com/72865221/216529213-464f1b05-7705-4f50-bce3-bde280d8f0b2.gif" width="300" height="600"> | <img src="https://user-images.githubusercontent.com/72865221/216529216-8d56b1e8-555c-46ae-b054-51009eb30705.gif" width="300" height="600"> |

### result 실행 결과

| scroll | result |
| :--------: | :--------: |
| <img src="https://user-images.githubusercontent.com/72865221/216529220-b0e5bfb2-8715-47c3-b377-098e2276949c.gif" width="300" height="600"> | <img src="https://user-images.githubusercontent.com/72865221/216529218-5e5f8092-ffe4-4aae-9aad-b28b9d4ff9cd.gif" width="300" height="600"> |

## 📌 프로젝트 수행 중 핵심 경험
   
* TDD
* UML을 기반 코드 구현
* Queue 자료구조의 이해와 구현
* 숫자와 연산자 입력에 Queue 활용
* StackView, ScrollView의 이해
* IBAction, IBOutlet의 이해

## ⏱ 타임라인

<details>
    <summary>STEP 1 [2023.01.24] ~ [2023.01.27]</summary></summary> 

- 2023.01.24
    - node 구현, node를 이용한 queue구현
    - isEmpty, size, peek 연산 프로퍼티 구현
    - enqueue, dequeue, clear 메서드 구현
    
- 2023.01.25
    - node test코드 추가
    - calculator test코드 추가
    - calculator method test실행

- 2023.01.26
    - 불필요한 size, peek 연산 프로퍼티 삭제
    - 불필요한 node test 삭제
    - 함수명, 접근제어자 관하여 리팩토링
    
</details>

<details>
    <summary>STEP 2 [2023.01.28] ~ [2023.01.31]</summary></summary> 
    
- 2023.01.28
    - operator 구현, ExpressionParse 구현, split 구현
    - operator , ExpressionParse, split test 구현

- 2023.01.29
    - parse메서드 리팩토링, parse test 구현
    - result메서드 구현 및 리팩토링

- 2023.01.30
    - 접근 제어자 수정
    - Formula init 추가

- 2023.01.31
    - split 테스트 추가
    - componentsByOperator 메서드 리팩토링

    
</details>

<details>
    <summary>STEP 3 [2023.01.24] ~ [2023.01.27]</summary></summary> 

- 2023.02.01
    - 숫자 버튼 구현
    - 연산자 버튼 구현

- 2023.02.02
    - AC 버튼 구현, CE 버튼 구현
    - NaN 결과 수정

- 2023.02.03
    - NumberFormatter 생성
    - Dot버튼 구현 및 리팩토링
    - 계산기 오류 수정
    
</details>

## 🔥 트러블 슈팅

<details open>
    <summary><strong><big>📍 STEP 1</big></big></strong></summary>


### 1️⃣ CalculatorItemQueue 타입에 대한 고민

#### 문제점
* CalculatorItemQueue의 타입을 struct와 class 두 개의 타입 중에서 고민을 하였습니다.  두 개의 타입에는 차이점이 많았지만 아직 프로젝트를 많이 해보지 않아서 어떤 방식을 선택해야 할지 선뜻 생각이 안났습니다.

#### 해결법
* struct로 구현을 할때에는 많은 이유가 있지만 그 중에서 `다른 타입으로부터 상속받거나, 자신을 상속할 필요가 없을때`, `캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할때`라는 타당한 이유가 있었기 때문에 struct를 선택하여 구현하였습니다.
    
```swift
struct CalculatorItemQueue<Element: CalculateItem> {}
```

### 2️⃣ UnitTest 하기위해 접근제어자 설정
#### 문제점
* UnitTest를 통해 각 메서드가 잘 실행이 되는지 테스트를 하려고 했습니다. 하지만 하나의 메서드를 테스트할 때 다른 메서드를 사용하게 되면 의존성이 높아진다고 하여 다른 메서드를 사용하지 않고 테스트를 진행하기 위해 내부의 데이터들을 internal로 선언하여 접근을 허용했습니다. 

```swift
var head: Node<Element>?
var tail: Node<Element>?
```
    
#### 해결법
* 리뷰어의 조언대로 데이터의 직접 접근은 허용하지 않는 것이 좋다고 생각하여 private(set)을 붙여 외부에서는 읽기 전용인 접근제어자를 붙여 접근을 제어하였습니다.
    
```swift
private(set) var head: Node<Element>?
private(set) var tail: Node<Element>?
```
    
### 3️⃣ Node 연결 해제에 관한 고민
#### 문제점
* 계산기에는 한번에 초기화하는 버튼이 있기 때문에 이것을 clear메소드로 구현하고 test를 하고 싶었습니다. 하지만 Node를 이용한 방식으로 queue를 구현하였기 때문에 노드가 연결이 해제되어 빈 queue가 되는지 명확하게 알 방법이 없다고 생각했습니다. 

#### 해결법
* node들은 클래스로 구현을 하였기 때문에 참조에 의해서 연결되어있습니다. 따라서 어디서 어떻게 연결되어있는지 그림을 그리다 보면 참조를 알 수 있습니다. class는 ARC에 의해서 자동으로 관리 되고 있기 때문에 참조만 끊어주면 모든 노드가 할당이 해제되며 빈 queue가 된다고 생각했습니다. 이것을 리뷰어에게 질문 하였고 리뷰어는 제 생각이 맞다고 해주었습니다. 따라서 head와 tail에 nil값을 넣어주면 할당이 해제되는 것을 알 수 있고 이 것을 코드로 구현했습니다.

```swift
mutating func clear() {
    self.head = nil
    self.tail = nil
}
```
</details>

<details open>
    <summary><strong><big>📍 STEP 2</big></big></strong></summary>
    
### 1️⃣ componentsByOperators 함수의 기능
#### 문제점
* 처음에는 빈칸을 기준으로 나눈 뒤 숫자와 기호들을 분리하여 숫자만 따로 배열에 넣어서 반환해주는 코드를 작성했습니다. 하지만 리뷰어의 조언대로 함수명과 기능이 일치하지 않는다는 것이 문제였습니다.

```swift
private static func componentsByOperators(from input: String) -> [String] {
    return input.split(with: " ").compactMap { String(Double($0) ?? 0)}
}
```

#### 해결법
* 나중에 알아보니 키보드로 치는 `-`와 계산기에 있는 `-`는 다른 것을 알게되었습니다. 따라서 기호들로 나눠준 다음 그것을 배열로 반환하는 함수로 수정하였습니다.

```swift
private static func componentsByOperators(from input: String) -> [String] {
    var result: [String] = [input]
    
    Operator.allCases.forEach { `operator` in
        result = result.flatMap{ $0.split(with: `operator`.rawValue) }
    }
        
    return result
}
```

### 2️⃣ parse method test코드 작성
#### 문제점
* parse메서드를 테스트하기 위해서는 parse를 통해 나온 formula와 예상한 결과가 있는 formula를 비교하는 테스트가 필요했습니다. 하지만 formula는 == 연산자를 적용할 수 없기 때문에 어떻게 비교를 해야 하는지 고민했습니다. 

#### 해결법
* 먼저 extension formula의 equatable을 채택하게 해주어 비교할 수 있게 작성한 후 parse로 반환된 formula와 예상한 formula를 비교하는 방식을 선택하여 정확한 테스트를 할 수 있게 만들어 주었습니다.

```swift
mport XCTest
@testable import Calculator

extension Formula: Equatable {
    public static func == (lhs: Calculator.Formula, rhs: Calculator.Formula) -> Bool {
        var operatorsHead = lhs.operators.calculatorQueue.head
        
        while operatorsHead != nil {
            let lhsData = lhs.operands.calculatorQueue.head?.data
            let rhsData = rhs.operands.calculatorQueue.head?.data
            
            if lhsData != rhsData {
                return false
            }
            
            operatorsHead = operatorsHead?.next
        }
        
        var operandsHead = lhs.operands.calculatorQueue.head
        
        while operandsHead != nil {
            let lhsData = lhs.operands.calculatorQueue.head?.data
            let rhsData = rhs.operands.calculatorQueue.head?.data
            
            if lhsData != rhsData {
                return false
            }
            
            operandsHead = operandsHead?.next
        }
        
        return true
    }
}

final class ExpressionParserTests: XCTestCase {
    
    // MARK: - parse method test
    func test_parse호출후_임시로_로만든() {
        // given
        let input: String = "123 + -3 - 34 + 123 * 2"
        var formula = Formula(operands: CalculatorItemQueue<Double>(),
                              operators: CalculatorItemQueue<Operator>())
        
        formula.operands.enqueue(123)
        formula.operands.enqueue(-3)
        formula.operands.enqueue(34)
        formula.operands.enqueue(123)
        formula.operands.enqueue(2)
        
        formula.operators.enqueue(Operator.add)
        formula.operators.enqueue(Operator.subtract)
        formula.operators.enqueue(Operator.add)
        formula.operators.enqueue(Operator.multiply)
        
        // when
        let result = ExpressionParser.parse(from: input)
        let expectation = formula
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
```
    
</details>

<details open>
    <summary><strong><big>📍 STEP 3</big></big></strong></summary>
    
### 1️⃣ subView 업데이트
#### 문제점
* addArrangedSubview로 view를 추가한다 해도 view가 바로바로 업데이트 되지 않는다는 것을 알았습니다.

#### 해결법
* 이것을 해결하기 위해서는 ios drawcycle에 대해서 알아야했습니다. 일단 layoutIfNeeded메서드를 활용하여 업데이트가 바로바로 될 수 있게 해주었습니다. 자세한 내용은 더 공부해야 할 거 같습니다.

수정 전
```swift
private func scrollToBottom() {
    let bottomOffset = CGPoint(x: 0,
                                y: calculateScrollView.contentSize.height
                                - calculateScrollView.bounds.height)
    
    calculateScrollView.setContentOffset(bottomOffset, animated: true)
}
```

수정 후
```swift
private func scrollToBottom() {
    let bottomOffset = CGPoint(x: 0,
                                y: calculateScrollView.contentSize.height
                                - calculateScrollView.bounds.height)
    calculateScrollView.layoutIfNeeded() // 추가 됨
    calculateScrollView.setContentOffset(bottomOffset, animated: true)
}
```

### 2️⃣ NumberFormatter
#### 문제점
* 계산한 숫자를 그냥 출력하게 되면 Double타입을 String으로 출력하게 되어 3.0 이런 식으로 출력되게 됩니다. 따라서 이 숫자 출력을 어떻게 해야 좋을지 고민하였습니다.

#### 해결법
* swift의 NumberFormatter라는 클래스를 이용하여 숫자를 출력하여 비교적 알기 쉽게 출력하였습니다.
```swift
extension String {
    func numberFormatting() -> String {
        var stringArray = self.split(with: ".")
        stringArray[0] = integerFormatting(stringArray[0])
        if self.contains(".") {
            if Double(stringArray[1]) == 0 {
                stringArray.removeLast()
            }
        }
        
        return stringArray.joined(separator: ".")
    }
    
    func integerFormatting(_ input: String) -> String {
        var numberFormatter: NumberFormatter {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 20
            numberFormatter.roundingMode = .halfUp
            
            return numberFormatter
        }
        
        let number = input.components(separatedBy: ",").joined()
        guard let numberString = numberFormatter.string(for: Double(number)) else { return "" }
        
        return numberString
    }
}
```
    
</details>

## 🔍 참고 링크
* [Kodeco - Class Diagram](https://www.kodeco.com/books/design-patterns-by-tutorials/v3.0/chapters/2-how-to-read-a-class-diagram) 
* [Receive messages from a UI object]()
* [NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
* [Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
* [Swift Language Guide - Extentions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
