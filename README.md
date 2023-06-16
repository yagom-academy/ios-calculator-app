# 🧮 계산기 II

> +, -, ×, ÷ 연산이 가능한 계산기 앱

</br>

## 목차📌</br>
1. [팀원소개](#1.)
2. [타임라인](#2.)
3. [UML](#3.)
4. [실행화면](#4.)
5. [트러블슈팅](#5.)
6. [참고자료](#6.)
7. [회고](#7.)

</br>

<a id="1."></a>

## 팀원소개🧑‍💻
|<img src="https://user-images.githubusercontent.com/109963294/235300758-fe15d3c5-e312-41dd-a9dd-d61e0ab354cf.png" width="200"/>|<img src="https://user-images.githubusercontent.com/109963294/235301015-b81055d2-8618-433c-b680-58b6a38047d9.png" width="200"/>|<img src="https://hackmd.io/_uploads/r1rWKewLn.png" width="200"/>|
| :-: | :-: | :-: |
|[**Erick**](https://github.com/h-suo)|[**idinaloq**](https://github.com/idinaloq)|[**maxhyunm**](https://github.com/maxhyunm)<br/>|

</br>

<a id="2."></a>

## 타임라인📅
<details><summary>타임라인 테이블</summary>
    <div markdown="1">
        <table>
            <tr>
                <td><b>날짜</b></td>
                <td><b>작업내용</b></td>
            </tr>
            <tr>
                <td>6/12(월)</td>
                <td>ExpressionParser, Operator 타입 병합 및 리팩토링<br/></td>
            </tr>
            <tr>
                <td>6/13(화)</td>
                <td>CalculatorNamespace, OperandFormatter 병합 및 리팩토링<br/>나누기 연산문제 수정<br/></td>
            </tr>
            <tr>
                <td>6/14(수)</td>
                <td>병합된 코드 기반으로 정상작동할 수 있도록 OperationManager, CalculatorViewController 리팩토링<br/>OperationManager, OperandFormatter 유닛테스트 작성<br/></td>
            </tr>
            <tr>
                <td>6/15(목)</td>
                <td>OperandFormatter 리팩토링 - 부동소수점 표기 문제 수정 및 불필요한 메서드 삭제<br/>CalculatorViewController 리팩토링 - tapFunctionButton 메서드 분할<br/></td>
            </tr>
            <tr>
                <td>6/16(금)</td>
                <td>setUpCalculationDetailsLabel() 메서드 생성<br/>README 작성</td>
            </tr>
        </table>
    </div>
</details>
    
</br>

<a id="3."></a>

## UML📊
<details><summary>UML 이미지</summary>
    <div markdown="1">
        <img src="https://github.com/idinaloq/testRep/assets/124647187/4de1076f-d5c6-4441-bfbd-b096615d6ec9" width="700">
    </div></details>
</br>

<a id="4."></a>

## 실행화면📱

| **계산 수행** | **0으로 나누었을 때 NaN** |
|:----:|:----:|
|<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/27713959-1060-4abe-beaa-64919440373b" width="300"/>|<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/ba6f9ef9-67d8-44fe-a470-87524d2a9585" width="300"/>|

| **CE & AC** | **소수점 & 부호 변경** |
|:----:|:----:|
|<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/7ba36e98-093e-4e52-837c-93b7d61083a1" width="300"/>|<img src="https://github.com/h-suo/ios-calculator-app/assets/109963294/ba112176-a48a-40b7-ac6e-526fec84319d" width="300"/>|

</br>

<a id="5."></a>

## 트러블슈팅🚨

### 부동소수점
🔒 **[ 문제사항 ]** 
소수점 자리수가 늘어나거나 일반 연산과 합쳐지면 실제 값이 아닌 근사값을 표기하며 오류가 발생하였습니다.
<details>
    <summary>참고 이미지</summary>
    <div markdown="1">
        <img src="https://hackmd.io/_uploads/BJyExtuvn.png">
    </div>
</details>
<br>

🔑 **[ 해결1 ]** 
연산하기 전과 포매터에 넘기기 전 타입을 `Decimal`과 `NSDecimalNumber`로 변경하여 오차 폭을 줄였습니다.
```swift
private func add(lhs: Double, rhs: Double) -> Double {
    let result = NSDecimalNumber(decimal: Decimal(lhs) + Decimal(rhs))
    return result.doubleValue
}

static func formatStringOperand(_ operand: String) -> String {
        let operandNumber = NSDecimalNumber(string: operand)
    ...
}
```
🔑 **[ 해결2 ]** 
`NSDecimalNumber`로 설정했음에도 오류가 발생하는 상황에 대해서는 `NumberFormatter`에서 소수점 자릿수 한정을 두어 반올림 표현되도록 해결하였습니다.
```swift
static func formatStringOperand(_ operand: String) -> String {
    ...
    numberFormatter.maximumFractionDigits = 11
    numberFormatter.maximumIntegerDigits = 12
    ...
}
```

### 테스트를 통과하지 않는 코드
🔒 **[ 문제사항 ]** 
옵셔널 바인딩을 위해 작성한 `guard`문 같은 경우 `else`문을 통과할 경우의 수가 존재하지 않아 실질적으로 테스트를 100% 진행하지 못하는 경우가 발생하였습니다. 
```swift
guard let operandInteger = operandSplit.first,
    let operandFraction = operandSplit.last
else {
 return newOperand
}
```
🔑 **[ 해결 ]** 
이런 경우를 최소화하기 위해 옵셔널처리가 필요한 `.first`와 `.last` 대신 `for`문과 `enumerate()` 메서드를 활용하여 불필요한 else문을 제거하였습니다.
```swift
for (index, item) in operandSplit.enumerated() {
    if index == 0 {
        newOperand = formatStringOperand(item)
    } else {
        newOperand += CalculatorNamespace.dot + item
    }
}
```

### 모호한 메서드명
🔒 **[ 문제사항 ]** 
`AC`, `CE`, `+/-` 버튼을 눌렀을 때 동작하는 `IBAction` 메서드의 명칭이 정확히 어떤 행동을 나타내는 것인지 파악하기가 어려웠습니다.
```swift
@IBAction private func tapFunctionButton(_ sender: UIButton) {
    ...
}
```
🔑 **[ 해결 ]** 
내용을 삭제하는 기능을 가진 `AC`와 `CE`를 묶고, 별도의 기능을 가진 `+/-`를 분리하여 메서드명을 정리하였습니다.
```swift
@IBAction private func tapClearButton(_ sender: UIButton) {
    ...
}

@IBAction private func tapSignToggleButton(_ sender: UIButton) {
    ...
}
```


### 코드병합
🔒 **[ 문제사항 ]** 
각자 작업했던 코드를 하나로 합치는 과정에서 불필요한 변수나 상수, 메서드가 다수 발생했고 분기처리에 오류가 발생하는 등 많은 리팩토링이 필요했습니다.

🔑 **[ 해결 ]** 
사용하지 않는 변수와 메서드를 구분하여 삭제처리하고, 병합할 수 있는 내용을 병합하였습니다. 로직 분기점 또한 효율적으로 진행할 수 있는 부분을 찾아 다시 배치하였습니다. 결과적으로 코드가 더욱 깔끔해져 가독성이 올라갔고, 기능에 따라 분리가 이루어져 효율성이 크게 올라갔습니다.

</br>

<a id="6."></a>

## 참고자료📘
[Apple Developer Documentation - Double](https://developer.apple.com/documentation/swift/double)</br>
[Apple Developer Documentation - Decimal](https://developer.apple.com/documentation/foundation/decimal)</br>
[Apple Developer Documentation - NSDecimalNumber](https://developer.apple.com/documentation/foundation/nsdecimalnumber)</br>
[Apple Developer Documentation - NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)</br>

</br>

<a id="7."></a>

## 회고📝
### 우리 팀이 잘한 점👍
- 개인적인 일이 있어서 참여를 못해도 시간 배분을 잘했기 때문에 수월하게 프로젝트를 진행할 수 있었습니다.</br>
- 각자의 의견을 모두 취합하여 코드를 작성하였습니다.</br>
- 문제가 발생했을 때 효율적인 해결법이 무엇인지에 대해 함께 고민하고, 의견을 모아 진행한 덕분에 리팩토링이 깔끔하게 진행되었습니다.</br>

### 우리 팀이 아쉬웠던 점👎
- 코드를 합치는 과정에서 세 명이 작업한 코드를 적용해야 하다보니 내비게이터와 드라이버의 구분이 종종 모호해지는 경우가 있었습니다.</br>
