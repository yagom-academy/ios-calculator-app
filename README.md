# 계산기 앱 프로젝트
###### tags: readME
계산기 프로젝트 저장소

## 목차

1. [소개](#소개)
2. [앱 실행화면](#앱-실행화면)
3. [UML](#UML)
4. [타임라인](#타임라인)
5. [트러블 슈팅](#트러블-슈팅)
6. [참고 링크](#참고-링크)




## 1. 소개
- 계산기로 활용 가능한 ios 앱입니다.
## 2. 앱실행화면
-  추후 공개 예정입니다.

## 3. UML

### STEP 1 - UML
![](https://i.imgur.com/rl6zEnM.png)

## 4. 타임라인

### 🌈 STEP 1
| 날짜 | 중요 진행 상황 | 코드 관련 사항
|---|---|---|
|9/19| `STEP1` 시작, `LinkedList` 구현 및 테스트 작성 | `LinkedList`와 `Node` 생성 후 내부 메서드 구현 - `append(), pop(), removeLast(), removeAll()`|
|9/19| `CalculatorItemQueue` 구현 및 테스트. | `CalculatorItemQueue`를 `CalculateItem` 프로토콜을 따르도록 하고, `dequeue(), enqueue(item:)` 메서드 구현 및 테스트|
|9/19|`CalculatorItemQueue`의 프로토콜 준수 리팩토링 |`String`이 `CalculatorItemQueue`의 내부 요소이기 때문에 String이 `CalculateItem` 프로토콜을 따르도록 변경.
|9/20 ~ 21| `코드리뷰 후`, `CalculatorItemQueue`, `LinkedList` 리팩토링| `CalculatorItemQueue`에 `isEmpty()` 메서드 추가, 전체적으로 접근 제어자를 수정, 테스트 코드 `given, when, then` 을 따르도록 수정, `CalculatorItemQueue` final class로 변경|

### 🌈 STEP 2
| 날짜 | 중요 진행 상황 | 코드 관련 사항
|---|---|---|
|9/21| `Operator` enum 구현 및 테스트 |`Operator`가 `CalculateItem` 프로토콜을 따르도록 구현.`Operator` 안 case 구현, 메서드 구현 및 테스트 구현 - add(), subtract(), divide(), multiply(), calculate() |
|9/21| struct `Formula`  구현 및 테스트| `Formula`내 프로퍼티 및 메서드 구현 - 프로퍼티: operands, operators - 메서드: result(), 테스트 구현|
|9/22| enum `ExpressionParser` 구현 및 테스트 | 고차함수를 활용하여    `parse()`, `componentsByOperators()` 메서드 구현 및 테스트|

## 5. 트러블 슈팅

### 🌈 STEP 1

#### 1. `CalculateItem` 프로토콜을 따르도록 하는 타입이 무엇일까?
- 단순히 `CalculatorItemQueue`를 따르게 하였으나, `CalculatorItemQueue`내의 요소가 따라야 한다는 것을 알고, Test 중인 String 타입을 따르게 하였다. 이후, STEP2에서 Double이 `CalculatorItemQueue`의 요소로 사용된다는 것을 알고 String의 extension으로 프로토콜을 준수하게 해준 부분을 삭제하였다. 그리고 테스트 코드를 Double 중심으로 다시 작성해 주었다.

### 🌈 STEP 2
#### 1. Expression Parser에 대한 이해
`ExpressionParser`가 무슨 역할을 하는지에 대해 고민이 많았다. `Parser`는 결국 `Folmula`를 만들어 return을 해주는 역할인데, 함수 내에서 역할을 나누는 데에 고민이 많았다.

#### 2. `componentsByOperators()`의 역할.
- 어떻게 보면 이름이 애매하기도 해서, Operator들만 모아 요소를 반환하라는 것인지, Operator를 뺀 숫자들만 배열로 반환하라는 것인지 생각이 많았다. 처음에는 연산자와 숫자를 함께 순서대로 반환해주는 메서드로 구현을 해주었다. 예를들어 "3+5"는 ["+", "3", "5"]로 반환해주는 형식이다. 그런데 이 로직이 사람들이 알기에는 어렵고, 가독성이 떨어진다고 판단하여 고차함수를 활용해, 연산자로 나눈 숫자만 반환하는 함수로 바꾸어 주고 parse의 함수를 수정해 주었다.
- 바꾼 후
```swift
private static func componentsByOperators(from input: String) -> [String] {
        
    let operators = CharacterSet(charactersIn: Operator.allCases.map{ String($0.rawValue) }.joined())
        
    return input.components(separatedBy: operators)
}
```

#### 3. 고차함수의 활용
- 처음에 `componentsByOperators()`를 연산자와 숫자를 함께 반환해주는 메서드로 구현을 해주었을때 고차함수를 사용하지 않았을 때는 다음과 같다.
- 참고로, 두번째 메서드는 들어온 순서 그대로가 아닌, 숫자별, 문자별 들어온 순서대로를 반환한다.
- 바꾸기 전
```swift
private static func componentsByOperators(from input: String) -> [String] {
        
    var result: [String] = []
    var operand = ""
        
    for char in input {
        if Operator(rawValue: char) != nil {
            result.append(operand)
            result.append(String(char))
            operand = ""
        } else {
            operand += String(char)
        }
    }
    result.append(operand)
        
    return result
}
```
- 바꾼 후
```swift
private static func componentsByOperators(from input: String) -> [String] {
        
    let operators = CharacterSet(charactersIn: Operator.allCases.map{ String($0.rawValue) }.joined())
    var result: [String] = []
        
    result = input.filter{ Operator(rawValue: $0) != nil}.map{ String($0) }
    result += input.components(separatedBy: operators)
        
    return result
}
```

- 훨씬 가독성이 높아졌다는 걸 알 수 있다. 

## 6. 참고 링크
(Swift Language Guide - Protocols)[https://docs.swift.org/swift-book/LanguageGuide/Protocols.html]
(Swift Language Guide - Extentions)[https://docs.swift.org/swift-book/LanguageGuide/Extensions.html]
(Swift Language Guide - Error Handling)[https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html]
