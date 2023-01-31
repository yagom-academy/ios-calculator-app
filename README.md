# 계산기🔢

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)
8. [아쉬운점](#8-아쉬운-점)

<br/>

## 1. 소개
숫자와 연산자를 터치하여 계산을 진행할 수 있는 어플입니다. 


<br/>

## 2. 팀원

|⭐️Rhode|
| :--------: | 
|<img height="210px" src="https://i.imgur.com/XyDwGwe.jpg">|
|그렇지만 어쩌겠습니까 해내야죠|



</br>

## 3. 타임라인
### 프로젝트 진행 기간
**23.01.24 (화) ~ 23.01.27 (금)** 

|날짜|타임라인|
| :-------: | ------- |
|01.24 (화) | **STEP01**: CalculatorTests 유닛 테스트 구현, CalculatorItemQueue 구현 |
|01.25 (수) | **STEP01**: dequeue와 enqueue에 대한 테스트 케이스 추가, PR |
|01.26 (목) | **STEP01**: data프로퍼티 수정, isEmpty메서드 프로퍼티로 수정, **STEP01 Merge** |
|01.27 (금) | **STEP02**: Operator 열거형, ExpressionParser 열거형, Formula 구조체 틀 구현, OperatorTests 유닛 테스트 구현 |
| 01.29 (일) | **STEP02**: FormulaTests 유닛 테스트 구현, Formula 구조체 구현, String 익스텐션 구현, ExpressionParserTests 유닛 테스트 구현 |
| 01.30 (월) | **STEP02**: ExpressionParser 열거형 구현, FormulaTests 유닛테스트 추가, Operator rawValue UI에 있는 값으로 수정 |
|01.24 (화) | **STEP02 Merge**, **STEP03**:  |
|01.25 (수) | **STEP03**:  |
|01.26 (목) | **STEP03**:  |
|01.27 (금) | **STEP03**:  |

<br/>

## 4. 프로젝트 구조
### 클래스 다이어그램

|STEP01|STEP02|
| :--------: | :--------: |
|<img height="500px" src="https://i.imgur.com/b4dEFJN.png">| <img height="500px" src="https://i.imgur.com/PUf6yZm.png"> |


<br/>

## 5. 실행 화면(기능 설명)
이후 STEP에서 추가 예정

</br>

## 6. 트러블 슈팅
### 1. STEP01: CalculatorItemQueue를 struct로 구현하는 것이 옳은가?
다음과 같은 이유로 `CalculatorItemQueue`을 struct로 구현했습니다.

값을 참조해야하는 경우 class로 구현하는 것을 권장한다.
상속을해야하는 경우 class로 구현하는 것을 권장한다.
타입캐스팅을 사용해야하는 경우 class로 구현하는 것을 권장한다.
위 세가지의 이유가 아니라면 일반적으로 struct로 구현하는 것을 애플의 guideline에서는 권장한다.
참조, 상속, 타입캐스팅 모두 사용할 일이 없어서 struct로 구현하는 것이 맞다고 판단했습니다. 

### 2. STEP02: 0으로 나누었을 경우 nan을 반환하는 것에 대해서 테스트하기

```swift
func test_Operator가devide이고3과0이주어졌을때_calculate호출시_NaN을반환한다() {
    //given
    let lhs = 3.0
    let rhs = 0.0
    sut = Operator.devide
    let expectedValue = Double.nan
    //when
    let result = sut.calculate(lhs: lhs, rhs: rhs)
    //then
    XCTAssertEqual(expectedValue, result)
}
```
위와 같이 테스트를 진행하였고, "nan"과 "nan"이 일치하지 않는다는 문제가 나왔습니다.

공식문서를 통해서, nan인지 여부를 확인하는 것은 Equal로 접근해야할게 아니라 isNaN으로 접근해야한다는 것을 알았습니다.

> Because a NaN always compares not equal to itself, to test whether a floating-point value is NaN, use its isNaN property instead of the equal-to operator (==). In the following example, y is NaN.
> ```swift
> let y = x + Double.nan
> print(y == Double.nan)
> // Prints "false"
> print(y.isNaN)
> // Prints "true"
> ```

```swift
func test_Operator가devide이고3과0이주어졌을때_calculate호출시_NaN을반환한다() {
    //given
    let lhs = 3.0
    let rhs = 0.0
    sut = Operator.devide
    let expectedValue = Double.nan
    //when
    let result = sut.calculate(lhs: lhs, rhs: rhs)
    //then
    XCTAssertTrue(result.isNaN)
}
```

그래서 위와 같이 테스트를 고쳤고 정상적으로 확인이 됩니다.

### 3. STEP02: componentsByOperators 리팩토링하기

**코드01**
<details>
<summary>코드보기</summary>
    
```swift
private static func componentsByOperators(from input: String) -> [String] {
    let componentsByAdd: [String]
    var componentsBySubtractTwo: [[String]] = []
    var componentsByMultiplyTwo: [[String]] = []
    var componentsByDevideTwo: [[String]] = []
    
    componentsByAdd = input.split(with: Operator.add.rawValue)
    
    for component in componentsByAdd {
        componentsBySubtractTwo.append(component.split(with:
Operator.subtract.rawValue))
    }
    let componentsBySubtract = componentsBySubtractTwo.flatMap { $0 }
    
    for component in componentsBySubtract {
        componentsByMultiplyTwo.append(component.split(with:
Operator.multiply.rawValue))
    }
    let componentsByMultiply = componentsByMultiplyTwo.flatMap { $0 }
    
    for component in componentsByMultiply {
        componentsByDevideTwo.append(component.split(with:
Operator.devide.rawValue))
    }
    let componentsByDevide = componentsByDevideTwo.flatMap { $0 }
    
    return componentsByDevide
}
```
</details>
    
가장 최초의 코드입니다. 중복되는 코드와 변수가 불필요하게 많아 지저분한 상황이었습니다.
<br/>

**코드02**

<details>
<summary>코드보기</summary>

> 배열 더하기
> ```swift
> let ArrayA = [1, 23, 456]
> var ArrayB = [2, 34, 567]
>
> let ArrayC = ArrayA + ArrayB
> print(ArrayC)  //[1, 23, 456, 2, 34, 567]
> 
> ArrayB += ArrayA
> print(ArrayB)  //[2, 34, 567, 1, 23, 456]
> ````
> 위와 같이 배열을 더해줄 수 있습니다.

```swift
static func componentsByOperators(from input: String) -> [String] {
    let componentsByAdd: [String]
    var componentsBySubtract: [String] = []
    var componentsByMultiply: [String] = []
    var componentsByDevide: [String] = []
    
    componentsByAdd = input.split(with: Operator.add.rawValue)
    
    for component in componentsByAdd {
        componentsBySubtract += component.split(with:
Operator.subtract.rawValue)
    }
    
    for component in componentsBySubtract {
        componentsByMultiply += component.split(with:
Operator.multiply.rawValue)
    }
    for component in componentsByMultiply {
        componentsByDevide += component.split(with: Operator.devide.rawValue)
    }
    
    return componentsByDevide
}
```

</details>

배열을 더하기를 통해 합쳐줄 수 있다는 점을 알게 되어서 그 점을 이용해보았습니다.

<br/>

**코드03**

```swift
static func componentsByOperators(from input: String) -> [String] {
    var componentsByOperators = [input]
    
    for operateSymbol in Operator.allCases {
        var temporaryComponents: [String] = []
        for component in componentsByOperators {
            temporaryComponents += component.split(with:
operateSymbol.rawValue)
        }
        componentsByOperators = temporaryComponents
    }
    
    return componentsByOperators
}
```
`operator`가 caseIterable인 점을 이용해서 for문을 사용해서 더 간단하게 만들어보았습니다.


### 4. STEP02: 주어진 String을 연산자를 기준으로 분리하기

연산자를 기준으로 분리하는 기능에서 만약, "1+2--3*4/5"이라면 -3으로 분리되지 않는 문제가 생겼습니다. 
이는 `Operator`의 rawValue를 키보드에 있는 마이너스 연산자(-)를 사용해서 지정해주었기 때문에 생긴 문제였습니다. 플레이 그라운드에서 테스트 해본 결과 마이너스 연산자(-)와 UI에 있는 마이너스 기호(−)가 다르다는 것을 알게되었습니다.

그래서 `Operator`의 rawValue를 기존의 것에서 UI에 있는 기호들로 바꾸었습니다:
```swift
case add = "+"
case subtract = "−"
case divide = "÷"
case multiply = "×"
```
그러면서, 테스트 케이스의 String안에 있는 연산자 표시들도 위와 같이 바꾸었습니다. 
추가로 다음의 테스트 코드를 작성하여 음수가 분리되는 것을 확인했습니다:
```swift
func
test_input이1더하기마이너스2빼기3곱하기마이너스4나누기5일때_parse호출시_1과마이너스2와3과마이너스4와5가들어있는배열과더하기빼기곱하기나누기가들어있는배열의큐를반환한다() {
    //given
    let input = "1+-2−3×-4÷5"
    let expectedOperands = [1.0, -2.0, 3.0, -4.0, 5.0]
    let expectedOperator: [Operator] = [.add, .subtract, .multiply, .divide]
    
    //when
    let result = ExpressionParser.parse(from: input)
    
    //then
    XCTAssertEqual(expectedOperands, result.operands.data)
    XCTAssertEqual(expectedOperator, result.operators.data)
}
```


<br/>

## 7. 참고 링크
> - [Swift 공식문서 - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
> - [Swift 공식문서 - forEach(-:)](https://developer.apple.com/documentation/swift/sequence/foreach(_:))


<br/>

## 8. 아쉬운 점
### STEP01
다른 분들은 링크드리스트를 많이 사용하신 것 같은데, 저는 링크드리스트를 사용하지 않았던 점이 조금 아쉬웠습니다.

### STEP02
for-in문이 아닌 forEach를 사용해봤어도 좋았을 것 같습니다. 


### STEP03
이후 STEP에서 추가 예정



