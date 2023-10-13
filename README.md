# 🧮 계산기
사용자는 숫자패드와 기호를 통해 연산을 입력하고,
입력받은 숫자를 기호에 맞게 연산을 하여 결과값을 도출하는 계산기를 구현합니다.

---
## 🔎 목차
- [팀원](#-팀원)
- [타임라인](#-타임라인)
- [시각화 구조](#-시각화-구조)
- [트러블 슈팅](#-트러블-슈팅)
- [참고 링크](#-참고-링크)

---
## 👥 팀원
|쥬봉이🐱|
|---|
|<img src="https://avatars.githubusercontent.com/u/126065608?v=4" width="200" height="200">|
|[GitHub](https://github.com/jyubong)|

## 📅 타임라인
|날짜|내용|
|------|---|
|23.10.02|- 공식문서 공부|
|23.10.03|- Queue, LinkedList 등 공부|
|23.10.04|- TDD <br> - LinkedList로 Queue 구현 <br>- UnitTest <br>- Step1 PR|
|23.10.05|- UnitTest 수정 <br> - Queue와 LinkedList 리팩토링|
|23.10.06|- Queue와 LinkedList init 추가 <br> - UnitTest 수정 <br> - LinkedList count와 isEmpty 연산프로퍼티 로직 수정|
|23.10.10|- UML에 따라 타입, 프로퍼티, 메서드 구현 <br> - UnitTest <br> - Step2 1차 PR|
|23.10.12|- Double의 .nan, .zero 프로퍼티 활용 <br> - extension String split, compotnentsByOperator 방향 수정: 공백 -> operator 기준으로 split <br> - Expression parser의 메서드 고차함수 활용방향으로 수정|
|23.10.13|- extension String 및 Expression parser의 메서드 단순화 및 고차함수 활용 수정 |


## 👀 시각화 구조
### 1. CalculatorItemQueue UML
![CalculatorItemQueue](https://github.com/jyubong/ios-calculator-app/assets/126065608/1bf398a3-04ff-4e05-8177-e40b8a8a4e12)


## 🔥 트러블 슈팅
1. **Character(String) 오류**
    - components가 Operator의 rawValue이면 operators Queue에, Doulbe로 변환되면 operands Queue에 담기도록 로직 구현
    - '1.1*-2' test에서 `can't form a character from a string containing more than one extended grapheme cluster` 오류 발생
    - Charater init(_ s: String)에서 optional을 반환하지 못해서 Double등의 값이 들어갈 경우 발생
    - operand 와 operator 조건 순서를 바뀌어서 해결되었으나 안전하지 못하다고 판단하여 로직을 수정함

- 수정 전
```swift
componets.forEach { component in
    if let `operator` = Operator(rawValue: Character(component)) {
        operators.enQueue(`operator`)
    } else if let operand = Double(component) {
        operands.enQueue(operand)
    }
}

```
- 수정후
```swift
let components = componentsByOperator(from: input)

components.compactMap { Double($0) }.forEach {
    operands.enQueue($0)
}

input.compactMap { Operator(rawValue: $0) }.forEach {
    operators.enQueue($0)
}
```

2. **음수의 "-"와 빼기 연산자 "-" 구분**
    - componentsByOperator(_:)메서드에서 operator를 기준으로 split을 해줄 때 음수의 "-"와 빼기 연산자 "-" 구분을 해야하는 문제 발생
    - `음수의 "-"와 연산자 "−"를 모양이 비슷하지만 ASCII코드가 다른 문자로 지정함.`
``` swift
음수의 "-"는 기존 키보드 - : Hyphen Minus
빼기 연산자의 "−"는 이모지 : Minus Sign
```

## 📚 참고 링크
[애플 공식문서 : Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)   
[애플 공식문서 : Extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions/)   
[애플 공식문서 : Protocol](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/)   
[애플 공식문서 : Character init](https://developer.apple.com/documentation/swift/character/init(_:)-6o1aq)

