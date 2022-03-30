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
- [기술의 장단점](#기술의-장단점)

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

