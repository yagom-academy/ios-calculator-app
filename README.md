# ➕➖✖️➗🟰 계산기

## 📖 목차

1. [소개](#-소개)
2. [Tree](#-Tree)
3. [고민한 점](#-고민한-점)
4. [타임라인](#-타임라인)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

## 🌱 소개

`Dragon`, `Aejong`이 만든 계산기 앱입니다.

- KeyWords
  - Queue
  - LinkedList
  - Operator
  - Formula
  - ExpressionParser
  - UnitTest
  - Calculator


## 🌲 Tree

```
<Calculator>
├── Info.plist
├── Error
│    └── CalculateError.swift
├── Extension
│    ├── String.swift
│    └── Double.swift
├── Model
│    ├── NameSpace.swift
│    ├── Operator.swift
│    ├── Formula.swift
│    ├── ExpressionParser.swift
│    └── Queue
│         ├── CalculatorItemQueue.swift
│         ├── LinkedList.swift
│         └── LinkedListNode.swift
├── Protocol
│    └── CalculateItem.swift
├── Controller
│    ├── AppDelegate.swift
│    ├── SceneDelegate.swift
│    └── CalculatorViewController.swift
└── View
     ├── Assets.xcassets
     │   ├── AccentColor.colorset
     │   │   └── Contents.json
     │   ├── AppIcon.appiconset
     │   │   └── Contents.json
     │   └── Contents.json
     └── Base.lproj
         ├── LaunchScreen.storyboard
         └── Main.storyboard

<CaclulatorTest>
├── CalculatorModelTests.swift
├── FormulaTests.swift
├── ExpressionParserTests.swift
└── OperatorTests.swift

```

## 👀 고민한 점

### 1. 에러 케이스 추가
- Formula.result()메서드 내부의 dequeue()를 옵셔널바인딩하는 과정에서 에러가 발생했을 경우, 0만 반환시키지 않고 emptyOperands, emptyOperators의 에러타입을 던져주도록 수정

### 2. 고차함수 사용
- ExpressionParser 에서 배열 혹은 enum.allCases에 고차함수를 사용해 구현해준 부분이 많았다. 고차함수 사용을 연습해보고 다음과 같은 장점들을 알게 되었다.
    - 코드의 가독성이 좋아진다.
    - 불필요한 변수사용을 줄이고 그로인한 side effect가 줄어든다.
 


## ⏰ 타임라인

### Step 1
- 221004: 애종 코드와 Dragon 코드 병합
    - Queue의 list 타입은 `LinkedList`사용
    - UI 구현부는 Dragon 코드 사용
- 221004: `ExpressionParser` 구현부 고차함수로 refactor
    - forEach를 통해 불필요한 변수 제거

### Step 2
- 221006: `changeSign`기능 관련 코드 수정
    - 트러블 슈팅에서 상세하게 설명
- 221006: scrollView에 Item이 추가될 때마다 시점이 scrollView bottom을 가리키게 구현
- 221007: operator버튼 action 메서드를 하나로 통합
    - tag를 사용해 각각의 버튼들을 구분
- 221007: `changeSign`메서드 구현방법 변경
    - 빼기연산과 음수표시기호를 각각 다른 문자로 구분
    - 이 부분도 트러블 슈팅에서 자세하게 설명
- 221007: 연산이 끝났음을 표현하는 `isCalculateEnd`변수 추가
- 221007: HumanError를 줄이기 위한 `NameSpace` 추가

## 📱 실행 화면

| ![Simulator Screen Recording - iPhone 14 - 2022-10-07 at 23 58 40](https://user-images.githubusercontent.com/102534252/194590549-5f66d2a2-a792-41ce-adc9-ebd1b28e4a8c.gif) | ![Simulator Screen Recording - iPhone 14 - 2022-10-07 at 23 59 29](https://user-images.githubusercontent.com/102534252/194590577-643755a6-b778-4b08-bf49-63db05dc1525.gif) | ![Simulator Screen Recording - iPhone 14 - 2022-10-08 at 00 00 09](https://user-images.githubusercontent.com/102534252/194590601-b5d4f70f-a19f-4095-bfc6-a4fd87dc3ff8.gif) |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                계산식이 많이 추가되는지 확인                 |               연산기호가 모두 적용되는지 확인                |               +/- 연산기호 변경이 되는지 확인                |
| ![Simulator Screen Recording - iPhone 14 - 2022-10-08 at 00 03 29](https://user-images.githubusercontent.com/102534252/194590640-658803d4-be00-4bee-93fe-7d8c31dbc87f.gif) | ![Simulator Screen Recording - iPhone 14 - 2022-10-08 at 00 04 29](https://user-images.githubusercontent.com/102534252/194590755-a3a89df3-ad72-4ad0-8705-4fd5339d5aef.gif) | ![Simulator Screen Recording - iPhone 14 - 2022-10-08 at 00 06 22](https://user-images.githubusercontent.com/102534252/194590786-f4181b29-83bc-41c3-b491-407c2ff63552.gif)
|                     CE버튼이 되는지 확인                     |               연산기호 여러개 처리되는지 확인                |                최종값에 추가 연산되는지 확인                 |


## ❓ 트러블 슈팅

### 1. ChangeSign기능 구현을 위한 구조 변경
 #### a. 기존코드 vs 변경코드
 - 기존 방식
     - 구조설명
         - ChangeSignButton을 클릭하게 되면 계산기로 현재까지 입력한 연산식을 `String`단위로 쪼갠 배열로 만들어 For-In 반복문을 통해 마지막index->처음index 순서로 진행될 때 Operator가 있다면 `+`와 `-`를 변경하는 방식
     - 발생하는 문제점
         - ChangeSignButton을 눌렀을 때 가장 마지막이 입력된 Operator가 곱하기 또는 나누기일 경우에 대해서 새로운 방식을 적용 해줘야함
             - 현재까지 입력된 연산식을 기준으로 계산하여 결과값을 가져온 뒤 결과값의 부호를 추가해주는 방식
         - 계산기 초기상태에서 changeSign기능이 동작하지 않음
             - 초기값을 "0+"로 설정
        > ⚠️ **그 외에도 몇가지 문제가 더 발생하여, 코드에 조건들을 추가하여 처리하다보니 코드의 복잡성이 계속 상승하여 디버깅 과정에서 코드를 이해하는 시간이 길어지고 코드의 안정성 떨어지는 문제점 발생!**
 - 기존 코드
 ```swift
private func changeSignFinalCalculation(from target: String, to replacement: String) {
        if finalCalculation.count == 0 {
            return
        }
        
        var finalCalculationList = Array(finalCalculation).map { String($0) }
        
        for count in (0...finalCalculationList.count-1).reversed() {
            if finalCalculationList[count] == target {
                finalCalculationList[count] = replacement
                finalCalculation = finalCalculationList.joined()
                return
            } else if finalCalculationList[count] == replacement {
                finalCalculationList[count] = target
                finalCalculation = finalCalculationList.joined()
                return
            } else if finalCalculationList[count] == "*" || finalCalculationList[count] == "/" {
                updateFinalCalculation(userInput: stackCalculation.trimmingCharacters(in: ["-"]))
                
                try? showResult()
                resetCalculation()
                
                finalCalculation = "0" + "-" + "\(result)"
                finalCalculation = finalCalculation.replacingOccurrences(of: "--", with: "+")
                isCalculateResult = true
                return
            }
        }
}
```
 - 변경 방식
     - 구조 설명
         - 빼기 연산기호("-")와 음수를 나타내는 부호("-")가 같은 문자여서 parsing과정에서 오류가 발생한다고 판단
         - 계산기 UI의 버튼 중 빼기를 표현한 "-"문자가 키보드의 "-"와 다른 문자인 것을 알고 빼기 연산의 기호를 UI와 같은 "-"로 표현해 음수부호와 `모양은 같지만 서로 다른 부호`로 구분해주었음
         - ExpressionParser.componentsByOperator()메서드에서 빼기 연산기호를 포함한 Operator를 기준으로 String을 구분해줌으로써 음수, 예를 들어 -3과 같은 음수 또한 Operand에 enqueue될 수 있도록 구현


 - 변경 코드

```swift
// 둘의 모양은 같지만 서로 다른 문자
Operator.subtract = "-" // 빼기 연산자로 사용된 문자
NameSpace.subtractText = "-" // 키보드에 있는 -. 음수부호로 사용된 문자

// changSignButton클릭시 계산기에 작성중인 숫자에 음수부호"-"를 추가해주거나 삭제해줌
@IBAction func changeSignButton(_ sender: UIButton) {
        guard let operandLabelText = operandLabel.text else { return }
        
        if operandLabelText.contains(NameSpace.subtractText) {
            operandLabel.text = operandLabelText.trimmingCharacters(in: ["-"])
        } else {
            operandLabel.text = NameSpace.subtractText + operandLabelText
        }
    }
```

 
 ### 2. HumanError를 최소화하기 위한 [Enum]NameSpace파일 추가 생성
 ```swift
enum NameSpace {
    static let whiteSpace = " "
    static let emptyString = ""
    
    static let addText = "+"
    static let subtractText = "-"
    static let divideText = "÷"
    static let multiplyText = "x"
    
    static let error = "Error"
}
 ```
 - 빈 문자열, 공백이 있는 문자열 등 코드에서 자주 쓰이는 String들을 NameSpace화해 오기입으로 발생할 수 있는 Human Error를 줄이고자 했음

 ### 3. 계산기 동작순서과 코드 동작순서가 맞지않아 생긴 에러 수정
 - Operand가 입력되지 않은 상태에서 Operator가 연속으로 n번 입력되었을 때 최종연산식에 n개의 Operator가 입력되는 문제
     - Operator 추가를 하기전에 조건문을 만들어 Operand가 입력되지 않은 상태에서 Operator만 입력되었을 경우 연산식 마지막에 추가되어 있는 Operator를 삭제하고 새로 추가하고 하는 Operator를 연산식에 추가하는 방식
     - 기능구현 코드
```swift=
// if문을 통해 Operand가 입력되었는지 확인하여 연속적인 Operator가 입력되었는지 판단
private func pushOperator(operatorInput: Operator, operatorLabelTextInput: String) {
        let operatorString = String(operatorInput.rawValue)
        updateFinalCalculation(userInput: operandLabel.text ?? NameSpace.emptyString)
        
        if operandLabel.text == NameSpace.emptyString {
            changeOperator(replacement: operatorString)
        } else {
            updateFinalCalculation(userInput: operatorString)
        }
        
        operatorLabel.text = operatorLabelTextInput
        operandLabel.text = NameSpace.emptyString
}

// 연산식에 있는 마지막 글자를 제거하고 새로운 값을 입력
private func changeOperator(replacement: String) {
        guard finalCalculation.count != 0 else { return }
        
        finalCalculation.removeLast()
        updateFinalCalculation(userInput: replacement)
}
```
 - Result값이 만약 11.0이 표시되었을 때, Operand(ex:5)를 추가하면 11.05로 result값에 연속적인 입력이 되는 문제
     - Result값 표시 후 Operand 추가했을 때 어떻게 동작하게 할지 고민했음
         - Result값 표시 후 Operand를 추가할 경우 연산식 초기화하고 재계산식 구성
         - Result값 표시 후 Operator를 추가할 경우 Result값에 추가적인 연산이 진행하도록 구성
     - 기존구조는 `resetCalculator()`메서드에서 Label.text와 finalCalculation 변수와 stackView초기화를 모두 한번에 처리해주는 코드였는데 이것을 `resetLabelText()`, `resetCalculation()`, `resetCalculatorStackView()` 3가지 함수로 세분화하여 원하는 동작이 될 수 있도록 필요한 위치에 각각 위치시킴
 
 ### 4. 스크롤뷰에 최신 계산수식이 업로드되지 않는 현상 개선
![calculatorImage](https://user-images.githubusercontent.com/102534252/194590988-c9df279d-114c-474f-92e5-0fb82ead2c98.png)
 - ScrollView안에 있는 StackView에 피연산자와 연산자를 Label에 담아 추가해주는 작업 후 스크롤이 항상 뷰 제일 하단에 머무르도록 구현하고자 했음
 - `setContentOffset`메서드를 통해 스크롤뷰의 시점을 가장 아래로 향하게 구현했지만 바로 직전에 추가된 Label은 보이지 않는 현상이 발생. 그리고 그 이유는 레이아웃이 업데이트되지 않은 상태에서 시점을 조정해주었기 때문이라고 판단
 - 처음 생각한 해결책은 delay를 준 뒤 스크롤의 시점을 지정해주는 방법이었지만 이 방법은 뷰의 변화가 반영되는 시간을 모르는 채 무작위 시간을 정해주는 것이기 때문에 근본적인 해결책이 아니라고 판단

```swift
private func scrollToCalculatorScrollViewBottom() {
        calculatorScrollView.layoutIfNeeded()
        calculatorScrollView.setContentOffset(CGPoint(x: 0,
         y: calculatorScrollView.contentSize.height - 
            calculatorScrollView.bounds.height), animated: true)
    }
```
 - `layoutIfNeeded()`라는 메서드를 통해 뷰를 직접 바로 업데이트해줄 수 있다는 걸 알게 되었고, 시점 지정 전에 뷰를 업데이트해주고 난 후 `setContentOffset`메서드를 사용해 문제를 해결


---

## 📖 참고 링크

- 재미난 CS - [PART II](https://camp.yagom-academy.kr/camp/628f3c9086f2cb44234de041/boards/632406fc2b3d440eb03d0a23/articles/632407832b3d440eb03d0a27)
- [Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [Swift Language Guide - Extentions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
- [Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
- [Swift Language Guide - Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [Swift Language Guide - Advanced Operators](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html)
- [Swift Language Guide - Inheritance](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Swift Language Guide - Subscripts](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)
- [NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)

[🔝 맨 위로 이동하기](# ➕➖✖️➗🟰 계산기)
