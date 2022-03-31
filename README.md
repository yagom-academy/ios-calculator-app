# 📱ios-calculator 2

> 📅 프로젝트 기간 2022.03.28 ~ 2022.04.01
🎓 리뷰이 : [@dudu](https://github.com/FirstDo), [@marisol](https://github.com/marisol-develop) / 👑 리뷰어 : [@hyunable](https://github.com/hyunable)

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [UML](#uml)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [트러블슈팅](#트러블슈팅)

## 프로젝트 소개 및 기능

## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## UML
![](https://i.imgur.com/I7oNB57.png)


## [STEP 1](#step-1)
### 고민한점
x
### 배운개념
#### collaborator로 등록된 사람이, PR을 보내고, repo주인이 merge해주는 법

오픈소스도 해당방식으로 기여하는걸까요?

## [STEP 2](#step-2)
### 고민한점

### 배운개념
- layoutIfNeeded
- computed property

---
## 트러블슈팅
### dudu의 Formula를 marisol의 코드에 합쳤을 때, 동일한 코드인데도 오류가 발생한 이유

dudu의 Formula를 marisol의 코드에 가져왔을때, operands와 operators를 dequeue하는 코드에서
operands와 operators는 **immutable**하기 때문에 오류가 발생했습니다.
dudu의 프로젝트에서 오류가 발생하지 않았던 이유는, LinkedList를 final class로 구현해주었기 때문에 dequeue를 해서 변경해도 오류가 생기지 않았습니다. 하지만 Queue 구현 방식은 marisol의 코드를 선택했기 때문에, 오류를 해결하기 위해 operands와 operators를 var로 변경해주었습니다.

```swift=
struct Formula {
    let operands: CalculatorItemQueue<Double>
    let operators: CalculatorItemQueue<Operator>

    mutating func result() throws -> Double {
    var formulaResult = operands.dequeue() ?? 0

    while operands.isEmpty == false {
        guard let number = operands.dequeue(),
              let operatorData = operators.dequeue()
        else {
            throw CalculatorError.invalidFormula
        }
    }
```

### 앱을 처음 실행했을 때에도 stackView의 subview.isEmpty가 false인 이유?

flag를 관리해줄 필요를 없애기 위해 isFirstOperand와 isResultButtonDidTouch의 조건 중 formulaStackView.arrangedSubviews.isEmpty를 걸어주었는데요,
처음 실행하고 입력한 숫자가 아무것도 없을 때도 isFirstOperand에서 formulaStackView.arrangedSubviews.isEmpty가 false로 되어 첫번째로 입력한 숫자가 먹히는 현상이 있었습니다.
main.storyboard를 보니 UIScrollView 안에 빈 label이 default로 들어가 있어 발생한 문제였습니다.
해당 label을 삭제하니, 이번에는 scrollview의 오토레이아웃 제약 에러가 발생하였는데, UIScrollView의 Intrinsic Size를 placeholder로 설정하여 문제를 해결했습니다.

### removedOperand = operand.filter { $0 != "," }에 대해..

저 자리가 Character의 자리라고 생각해서

```swift
private extension Character {
    static let comma = ","
}

removedOperand = operand.filter { $0 != .comma }
```

와 같이 썼지만 컴파일 에러가 계속 떠서 해결하지 못했습니다.  
옆에서 동료캠퍼 mmim이 해당 타입이 comma의 타입이 String인것을 발견하여 명시적으로 Character(",") 로 써줘서 해결하였습니다.

