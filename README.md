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
숫자와 연산자를 터치하여 계산을 진행할 수 있는 어플입니다. 키패드 위에 현재 입력중인 숫자와 연산자를 보여줍니다. 연산자 버튼을 누를 때마다 연산하고자 하는 값과 연산하려는 연산자를 현재 입력중인 값 위에 띄워줍니다. 연산시 연산자 우선순위를 무시합니다. 


<br/>

## 2. 팀원

|⭐️Rhode|
| :--------: | 
|<img height="210px" src="https://i.imgur.com/XyDwGwe.jpg">|
|그렇지만 어쩌겠습니까 해내야죠|



</br>

## 3. 타임라인
### 프로젝트 진행 기간
**23.01.24 (화) ~ 23.02.03 (금)** 

|날짜|타임라인|
| :-------: | ------- |
|01.24 (화) | **STEP01**: CalculatorTests 유닛 테스트 구현, CalculatorItemQueue 구현 |
|01.25 (수) | **STEP01**: dequeue와 enqueue에 대한 테스트 케이스 추가, PR |
|01.26 (목) | **STEP01**: data프로퍼티 수정, isEmpty메서드 프로퍼티로 수정, **STEP01 Merge** |
|01.27 (금) | **STEP02**: Operator 열거형, ExpressionParser 열거형, Formula 구조체 틀 구현, OperatorTests 유닛 테스트 구현 |
| 01.29 (일) | **STEP02**: FormulaTests 유닛 테스트 구현, Formula 구조체 구현, String 익스텐션 구현, ExpressionParserTests 유닛 테스트 구현 |
| 01.30 (월) | **STEP02**: ExpressionParser 열거형 구현, FormulaTests 유닛테스트 추가, Operator rawValue UI에 있는 값으로 수정 |
|01.31 (화) | **STEP02 Merge**, **STEP03**: insertString 메서드, insertOperatorSign 메서드, setCurrentNumber 메서드, displayCurrentNumber 메서드, displayCurrentOperator 메서드, resetCurrentNumber 메서드, initializeCurrentOperator 메서드, allClear 메서드, clearEntry 메서드, calculate 메서드, displayResult 메서드, convertSign 메서드, CircleButton 클래스 구현 |
|02.01 (수) | **STEP03**: String extension insertComma 프로퍼티, String extension floorIfZero 프로퍼티, NameSpace 열거형 구현, tapDotButton 메서드, insertOperationSign 메서드, displayResult 메서드, resetCurrentNumber 메서드, calculate 메서드 수정 |
|02.02 (목) | **STEP03**: componentsByOperators 메서드 수정 |
|02.03 (금) | **STEP03**: OperateStackView 클래스 구현, tapCEButton 메서드, tapNumberButton 메서드, displayPreviousOperands 메서드, removePreviousOperands 메서드, allClear 메서드, floorIfZero 프로퍼티, tapNumberButton 메서드 수정, 은닉화 진행 |

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
             └── ViewController    
````


### 클래스 다이어그램

<details>
<summary>STEP01</summary>
    
<img height="600px" src="https://i.imgur.com/b4dEFJN.png">
    
</details>

<details>
<summary>STEP02</summary>
    
<img height="600px" src="https://i.imgur.com/PUf6yZm.png">
    
</details>

**STEP03**

<img height="600px" src="https://i.imgur.com/DUnXuDY.png">


<br/>

## 5. 실행 화면(기능 설명)

| AC | CE | ⁺⁄₋ |
| -------- | -------- | -------- |
| ![](https://i.imgur.com/6AJU5VV.gif) | ![](https://i.imgur.com/2AvGpd6.gif)  | ![](https://i.imgur.com/oIYDt3o.gif)  |



| ÷0 | 음수 연산 | 소수 연산 |
| -------- | -------- | -------- |
| ![](https://i.imgur.com/Hud395U.gif) | ![](https://i.imgur.com/b1InoWJ.gif) | ![](https://i.imgur.com/X6ZP5GI.gif)|


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

### 5. STEP03: UIStackView 쌓기
UIStackView를 코드를 통해 쌓는 법을 잘 이해하지 못했습니다. 구현하기 위한 방법은 다음과 같습니다.

>1. `UIStackView`를 상속하는 클래스 구현하기
>2. `UILabel`을 반환하는 클래스 내부의 메서드 구현하기
>3. '2.'을 통해 생성한 `UILabel`을 해당 스택뷰에 더해주는 메서드 구현하기: `addArrangedSubview`사용
>3. `init`을 통해 초기화 해주기: '3.'에서 구현한 메서드 호출
>4. `ViewController` 내부에서 `StackView` 인스턴스 생성하는 메서드 구현: '1.'에서 구현한 클래스 인스턴스화
>5. '4.'의 메서드에서 넣고 싶은 `View`에 `stackView` 인스턴스 더해주기
>6. `StackView`를 추가하고 싶은 곳에서 '4.'의 메서드 호출

코드를 통해 보면 다음과 같습니다:

```swift
private func displayPreviousOperands() {
    let operateStackView = OperateStackView(operatorText: currentOperatorLabel.text,
operandsText: currentNumberLabel.text?.floorIfZero)
    verticalStackView.addArrangedSubview(operateStackView)
}
```

```swift
class OperateStackView: UIStackView {
    init(operatorText: String?, operandsText: String?) {
        super.init(frame: .zero)
        configure()
        loadView(operatorLabelText: operatorText, operandsLabelText: operandsText)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadView(operatorLabelText: String?, operandsLabelText: String?) {
        addArrangedSubview(makeLabel(labelText: operatorLabelText))
        addArrangedSubview(makeLabel(labelText: operandsLabelText))
    }
    
    private func configure() {
        axis = .horizontal
        alignment = .fill
        distribution = .fill
        spacing = 8
    }

    private func makeLabel(labelText: String?) -> UILabel {
        let label = UILabel()
        label.text = labelText
        label.textAlignment = .right
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }
}
```

### 6. STEP03: 스크롤뷰를 최하단으로 내리기
다음과 같은 코드를 사용해서 스크롤뷰를 최하단으로 내렸습니다:
```swift
scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height), animated: true)
```
그런데, 스택뷰가 하나씩 누락되는 문제가 생기고 있었습니다.

> 문제 파악 후 리팩토링하여 트러블 슈팅 마저 작성할 예정:
> `layoutIfNeeded()`를 사용하여 리팩토링 할 수 있을 것 같습니다.


### 7. STEP03: `3.03-.103` 연산하기
`3.03-1.03`을 연산했을 때, `1.9999999999999998`이 나타납니다. 플레이그라운드에서 해당 연산을 해보았습니다:
![](https://i.imgur.com/CzvrIc6.png)
플레이 그라운드에서 연산 하였을 때도 같은 결과가 나오는 것을 봐서 `Double` 타입이 갖는 한계라고 볼 수도 있을 것 같습니다.

> 문제 파악 후 리팩토링하여 트러블 슈팅 마저 작성할 예정

### 8. STEP03: 17개 이상의 숫자 입력하기
![](https://i.imgur.com/iSbPwlZ.gif)
위 그림과 같이 1을 17번 이상 입력하면 2가 찍히고, 20번 입력하면 쉼표를 찍기 위한 넘버 포매터가 적용되지 않습니다.
브레이크를 찍어보니 이 부분(String extension의 20번째 줄)에서 2가 들어가게 되는 것 같습니다:
```swift
return numberFormatter.string(from: NSNumber(value: intValue)) ?? self
```
> 문제 파악 후 리팩토링하여 트러블 슈팅 마저 작성할 예정


### 9. STEP03: info파일 옮기기
info파일을 옮겼습니다:
<img height="300px" src="https://i.imgur.com/7m7vIJ9.png">


그러니 `Build input file cannot be found: '/Users/jinahpark/Desktop/yagom/ios-calculator-app/Calculator/Calculator/Info.plist'. Did you forget to declare this file as an output of a script phase or custom build rule which produces it?` 라는 에러가 뜨며 Build가 되지 않았습니다:
![](https://i.imgur.com/1TZveO8.png)

다음과 같이 `Calculator - Build Settings`에서 `Info.plist File`의 주소를 `Calculator/Resources/Info.plist`로 수정하니 정상적으로 Build되었습니다:
![](https://i.imgur.com/dKiXXpe.png)

<br/>

## 7. 참고 링크
> - [Swift 공식문서 - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
> - [Swift 공식문서 - forEach(-:)](https://developer.apple.com/documentation/swift/sequence/foreach(_:))
> - [Swift 공식문서 - UIView](https://developer.apple.com/documentation/uikit/uiview)
> - [Swift 공식문서 - UIStackView](https://developer.apple.com/documentation/uikit/uistackview)
> - [Swift 공식문서 - UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
> - [Swift 공식문서 - addArrangedSubview(_:)](https://developer.apple.com/documentation/uikit/uistackview/1616227-addarrangedsubview)
> - [Swift 공식문서 - dropLast(_:)](https://developer.apple.com/documentation/swift/string/droplast(_:))


<br/>

## 8. 아쉬운 점
### STEP01
다른 분들은 링크드리스트를 많이 사용하신 것 같은데, 저는 링크드리스트를 사용하지 않았던 점이 조금 아쉬웠습니다.

### STEP02
for-in문이 아닌 forEach를 사용해봤어도 좋았을 것 같습니다. 


### STEP03



