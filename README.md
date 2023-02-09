# 계산기🔢

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)

<br/>

## 1. 소개
숫자와 연산자를 터치하여 계산을 진행할 수 있는 어플입니다. 키패드 위에 현재 입력중인 숫자와 연산자를 보여줍니다. 연산자 버튼을 누를 때마다 연산하고자 하는 값과 연산하려는 연산자를 현재 입력중인 값 위에 띄워줍니다. 연산시 연산자 우선순위를 무시합니다. 


<br/>

## 2. 팀원
- [팀 회고](https://github.com/Rhode-park/ios-calculator-app/blob/calculator02_step01_songjun/%ED%8C%80%ED%9A%8C%EA%B3%A0.md)

|⭐️Rhode| ⭐️송준 |
| :--------: | :-------: |
|<img height="210px" src="https://i.imgur.com/XyDwGwe.jpg">| <img height="210px" src="https://i.imgur.com/9Bd6NIT.png"> |
| Navigator / Driver | Navigator / Driver |



</br>

## 3. 타임라인
### 프로젝트 진행 기간
**23.02.06 (월) ~ 23.02.10 (금)** 

|날짜|타임라인|
| :-------: | ------- |
|02.06 (월) | **계산기2 STEP1**: 각자의 코드 리뷰 후 코드 병합 및 PR 전송 |
|02.07 (화) | **계산기2 STEP1**: 코드 리뷰를 바탕으로 리팩토링  |
|02.08 (수) | **계산기2 STEP2**: 추가적인 리팩토링 및 예외사항 처리|
|02.09 (목) | **계산기2 STEP2**: Double Check 후 PR 전송 |
|02.10 (금) |  |


<br/>

## 4. 프로젝트 구조
### 폴더 구조
````
Calculator
    ├── Extension
    │   ├── Double+
    │   └── String+
    ├── Resources
    │   ├── AppDelegate
    │   ├── SceneDelegate
    │   ├── Assets
    │   ├── Main
    │   ├── LaunchScreen
    │   └── Info
    └── Sources
        ├── Model
        │    ├── CalculateItem
        │    ├── CalculatorItemQueue
        │    ├── Formula
        │    ├── Operator
        │    ├── ExpressionParser
        │    └── NameSpace
        ├── View
        │    ├── OperateStackView
        │    └── CircleButton
        └── Controller
             └── CalculatorViewController    
````


### 클래스 다이어그램

<img height="600px" src="https://i.imgur.com/rLm5AT9.png">


<br/>

## 5. 실행 화면(기능 설명)

| AC | CE | ⁺⁄₋ |
| :--------: | :--------: | :--------: |
| ![](https://i.imgur.com/evRMOQI.gif) | ![](https://i.imgur.com/Sf1YSNT.gif) | ![](https://i.imgur.com/S3UrM2e.gif) |


| ÷0 | 음수 연산 | 소수 연산 |
| :--------: | :--------: | :--------: |
| ![](https://i.imgur.com/EpGYX8n.gif) | ![](https://i.imgur.com/DEgf5El.gif) | ![](https://i.imgur.com/etIwEEZ.gif) |


| 큰 수 표시 | 연산 후 연산 | 연산 값 연산 |
| :--------: | :--------: | :--------: |
| ![](https://i.imgur.com/QBiOu2l.gif) | ![](https://i.imgur.com/o6ZDzb2.gif) | ![](https://i.imgur.com/ETgL9DN.gif) |

</br>

## 6. 트러블 슈팅
### 1. dropLast vs removeLast
<details>
<summary> 보기 </summary>
 마지막 문자열을 제거할 때, 사용할 메서드 결정에 있어 `dropLast`와 `removeLast`를 고민했습니다. 
 - `dropLast`를 사용하게 될 경우 새로운 배열을 생성해주어야 합니다.
```swift
func dropLast(_ k: Int) -> Self.SubSequence
```

- `removeLast`의 경우 `mutating func`으로 자기 자신을 변경시켜줄 수 있습니다.
```swift
@discardableResult mutating func removeLast() -> Self.Element

```

- 고로 현재 String값의 마지막 값만 삭제하면 되기 때문에 `removeLast`를 채택하여 사용했습니다.
<br/>
 
 기존의 코드는 다음과 같습니다:
 ```swift
 if Operator(rawValue: lastString) != nil {
                guard stringToBeCalculated = String(stringToBeCalculated.dropLast()) 
                removePreviousOperands()
            }
```

변경된 코드:
```swift
 if Operator(rawValue: lastString) != nil {
                stringToBeCalculated.removeLast()
                removePreviousOperands()
            }
```
</details>


### 2. components vs split 
<details>
<summary> 보기 </summary>
    
`extension String`에서 `split`을 구현하는데에 있어 의견차이가 있었습니다.
다음과 같은 특성으로 인하여 components를 사용하는 것이 적합하다고 판단하였습니다:
 - components: 매개변수로 String 타입 받음, [String]반환
 - split: 매개변수로 Character 타입 받음, [Substring]반환
split을 사용하게 되면 `map`과 같은 고차함수를 통해서 배열의 요소들을 String 타입으로 모두 바꿔줘야합니다. components를 사용하면 매개변수만 String 타입으로 바꿔주어도 되기 때문에 components를 사용하게 되었습니다.
</details>


### 3. 연산자로 끝날 때, 자동으로 0까지 계산해주는 현상
<details>
<summary> 보기 </summary>
    
1+2/3+=이라는 연산을 할 때, 기존에는 1+2/3+0으로 계산이 되어 결과값이 1로 나왔습니다. 그러나, 이 부분은 계산버튼(=)을 눌러도 계산이 되지 않아야한다는 것을 깨달았습니다.
그래서 다음과 같이 코드를 수정하였습니다:
```swift
@IBAction private func tapCalculateButton(_ sender: UIButton) {
        ...
        if let result = calculate() {
            isCalculated = true
            displayPreviousOperands()
            resetCurrentNumber()
            initializeCurrentOperator()
            displayResult(result: result)
        } else { return }
        ...
    }
    
    private func calculate() -> Double? {
        let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
        let lastString = stringToBeCalculated[lastIndex]
        if Operator(rawValue: lastString) != nil {
            return nil
        }
        ...
    }
```
수정 후 코드에 따르면 계산하고자하는 String의 마지막 값이 `Operator`에 해당하면 nil을 반환합니다. 그리고 `result = calculate()`가 `nil`일 경우에는 `return`을 하여 메서드에서 빠져나오게 하였습니다. 이를 통해서 마지막 값이 연산자이면 계산이 진행되지 않도록 할 수 있었습니다.
</details>
    
### 4. 20자리수 일 때, (,)로 분리 안되는 현상 

<details>
<summary> 보기 </summary>
    
기존의 코드는 다음과 같았습니다:
```swift
var stringWithComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let splittedNumber = self.components(separatedBy: ".")
        if splittedNumber.count == 1 {
            guard let intValue = Int(splittedNumber[0]) else {
                return self
            }
            return numberFormatter.string(from: Decimal(intValue) as NSNumber) ?? self
        } else if splittedNumber.count == 2 {
            guard let intNumberBeforeDecimalPoint = Int(splittedNumber[0]) else {
                return self
            }
            let numberBeforeDecimalPoint = numberFormatter.string(from: Decimal(intNumberBeforeDecimalPoint) as NSNumber) ?? self
            let wholeNumber = numberBeforeDecimalPoint + "." + splittedNumber[1]
            return wholeNumber
        }
        return self
    }
```
이 때, 1을 20개 입력하게 되면 11,111,111,111,111,111,111이 아닌 11111111111111111가 나오게 되었습니다. 
splittedNumber[0]이 "11111111111111111"일 경우, Int로 변환할 수 없어 self인 "11111111111111111"가 그대로 반환되기 때문에 생기는 문제였습니다.
이를 해결하기 위하여 다음과 같이 코드를 수정하였습니다:
```swift
guard let decimalValue = Decimal(string: splittedNumber[0]) else {
                return self
            }
            return numberFormatter.string(from: decimalValue as NSNumber) ?? self
```
수정 후 코드에 따르면, 기존의 string을 그대로 Decimal로 변환해줍니다. 그리하여 Int의 범위를 초과하는 수를 Int로 변환할 때 nil이 나오는 오류를 막을 수 있었습니다.
</details>
    
### 5. 0일 때, 음수처리가 되는 현상
<details>
<summary> 보기 </summary>
    
입력된 창이 0인 상태에서 `-/+` 버튼을 누를 때, `-0`이 되는 현상이 있었습니다. 그러나, 이 부분은 `-/+` 버튼을 눌러도 여전히 `0`이어야한다는 것을 깨달았습니다.
그래서 다음과 같이 코드를 수정하였습니다:
```swift
private func convertSign() {
        guard currentNumber != NameSpace.emptyString else {
            return
        }
    ...
    }
```
수정 후 코드에 따르면, `currentNumber`가 빈 String일 때, 메서드를 종료해줍니다. 그리하여 숫자가 입력되지 않은(입력창에 0이 보이는) 상태에서는 음수기호(-)가 붙지 않게 됩니다.
</details>

### 6. roundingNumber 메서드가 Formatter에 있어 불필요한 싱글톤을 호출해야하는 현상
<details>
<summary> 보기 </summary>
    
- 기존 코드에서는 `CalculatorFormatter`를 싱글톤 객체로 만들어 사용했습니다. 
- `extension Double`에 함수를 선언하면, 반환값이 `String`이 아닌 `Double` 나와야 되는 것으로 헷갈려서 `CalculatorFormatter`라는 새로운 클래스를 생성했습니다.
- 토의 끝에 `extension Double`에 함수를 선언해도 문제가 없음을 인지하고 `roundingNumber`메서드를 선언했습니다.


변경 전 
```swift
class CalculatorFormatter {
    static let shared = CalculatorFormatter()
    private init() {}
    
    func roundingNumber(from number: Double) -> String {
        let numberFormatter = NumberFormatter() 
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .ceiling
        let result = numberFormatter.string(for: number) ?? String(number)
        return result
    }
}
```

변경 후
```swift
extension Double: CalculateItem {
    func roundingNumber() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .ceiling
        let result = numberFormatter.string(for: self) ?? String(self)
        return result
    }
}
```
</details>

### 7. 첫번째 피연산자만 있을 때 (=)버튼 작동 
<details>
<summary> 보기 </summary>
    
첫번째 피연산자가 들어가 있고 연산자는 들어가 있지 않을 때 (=)버튼을 누를 경우 첫번째 피연산자가 결과값으로 들어가는 오류가 있었습니다. 이를 방지하기 위해 첫번째 피연산자만 들어가 있을 경우 (=)버튼이 작동되지 않게 분기처리했습니다.
- 변경 전
```swift
private func calculate() -> Double? {
        let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
        let lastString = stringToBeCalculated[lastIndex]
        if Operator(rawValue: lastString) != nil {
            return nil
        }
    
        var calculateFormula = ExpressionParser.parse(from: stringToBeCalculated)
        stringToBeCalculated = NameSpace.emptyString
        return calculateFormula.result()
    }
```

- 변경 후
```swift
private func calculate() -> Double? {
        let lastIndex = stringToBeCalculated.index(before: stringToBeCalculated.endIndex)
        let lastString = stringToBeCalculated[lastIndex]
        if Operator(rawValue: lastString) != nil {
            return nil
        }
        // 분기처리를 위한 조건문
        var isNumberOnly: Bool = true
        for `operator` in Operator.allCases {
            if stringToBeCalculated.contains(`operator`.rawValue) {
                isNumberOnly = false
            }
        }
        if isNumberOnly {
            return nil
        }

        var calculateFormula = ExpressionParser.parse(from: stringToBeCalculated)
        stringToBeCalculated = NameSpace.emptyString
        return calculateFormula.result()
    }
```
</details>

### 8. 20자리 넘어갈 때 e로 표현하기
<details>
<summary> 보기 </summary>
    
숫자를 20자리만 표현하라는 요구사항이 있었습니다. 20자리에 20자리를 곱하면 20자리를 넘는 결과가 나타나게 됩니다. 기존의 `roundingNumber()`를 통해서 소수부를 20자리까지 만들 수 있지만, 그것을 20자리 안으로 표현하기 위해서 'e'의 개념을 사용하게 되었습니다. 
생각했던 방향은 두 가지가 있었습니다:
1. 주어진 숫자를 10^n만큼 나누고 rounding을 한 후 다시 10^n을 곱해주는 방법(n = 정수부의 자릿수 - 1)
2. String으로 앞에서부터 17자리 잘라주는 방법

처음에는 첫 번째 방법처럼 하려고 했습니다. 그러기 위해서는 주어진 result를 숫자의 형태인 Double이나 Decimal로 바꿔야했는데, Double이든 Decimal이든 그 가용범위가 40자리까지 미치지 못한다는 점이 마음에 걸렸습니다. 그래서 두 번째 방법을 채택했습니다:
```swift
func convertToExponent() -> String {
    guard self.count > 20 else {
        return self
    }
    let splittedNumber = self.components(separatedBy: NameSpace.dot)
    let eCount = splittedNumber[0].count - 1
    let stringToBeRounded: String
    if splittedNumber.count == 1 {
        stringToBeRounded = splittedNumber[0]
    } else {
        stringToBeRounded = splittedNumber[0] + splittedNumber[1]
    }
    var newString = NameSpace.emptyString
    for number in stringToBeRounded {
        newString += String(number)
        if newString.count == 17 {
            break
        }
    }
    newString.insert(Character(NameSpace.dot), at: newString.index(newString.startIndex, offsetBy: 1))
    newString += "e" + String(eCount)
    return newString
}
```
이 결과, 12345678901234567890123이라는 숫자가 있다면, 1.2345678901234567e22로 표현되게 됩니다.
</details>

### 9. 계산 후에 결과값으로 다시 계산하기
<details>
<summary> 보기 </summary>
    
리팩토링하기 전에는 계산 후에 연산자를 누르고 계산을 하게 되면 앞에 0이 있는 것으로 상정하고 새로운 계산이 진행됩니다. 가령 1+2+3=6을 한 후에 *3을 하면 18이 아닌 0이 나타나게 됩니다. 계산한 결과값을 이어받아 다시 계산할 수 있도록 하기 위해서 다음과 같은 리팩토링을 하였습니다:

- 변경 전
```swift
@IBAction private func tapOperatorButton(_ sender: UIButton) {
    
    displayPreviousOperands()
    insertOperatorSign(titleName: sender.titleLabel?.text)
    displayCurrentOperator(titleName: sender.titleLabel?.text)
    fixateScrollViewBottom()
    resetCurrentNumber()
}
```

- 변경 후
```swift
@IBAction private func tapOperatorButton(_ sender: UIButton) {
    if isCalculated {
        allClearViews()
        stringToBeCalculated += currentNumber
        isCalculated = false
    }
    displayPreviousOperands()
    insertOperatorSign(titleName: sender.titleLabel?.text)
    displayCurrentOperator(titleName: sender.titleLabel?.text)
    fixateScrollViewBottom()
    resetCurrentNumber()
}
```
</details>


<br/>

## 7. 참고 링크

> - [Microsoft - Floating-point numeric types (C# reference)](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/floating-point-numeric-types)
> - [Swift 공식문서 - dropLast(_:)](https://developer.apple.com/documentation/swift/string/droplast(_:))
> - [Swift 공식문서 - removeLast()](https://developer.apple.com/documentation/swift/array/removelast())
> - [Swift 공식문서 - components(separatedBy:)](https://developer.apple.com/documentation/foundation/nsstring/1413214-components)
> - [Swift 공식문서 - split(separator:maxSplits:omittingEmptySubsequences:)](https://developer.apple.com/documentation/swift/string/split(separator:maxsplits:omittingemptysubsequences:))




