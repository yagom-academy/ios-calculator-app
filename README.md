### 계산기 프로젝트
> 프로젝트 기간 2022.03.14 ~ 2022.
팀원 : [@malrang](https://github.com/kinggoguma) / 리뷰어 : [도미닉](https://github.com/AppleCEO)

- [실행화면](#실행화면)
- [UML](#uml)
- [STEP 1 기능 구현](#step-1-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)
- [STEP 2 기능 구현](#step-2-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)
- [STEP 3 기능 구현](#step-3-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)

## 실행화면

![Mar-27-2022 16-59-31](https://user-images.githubusercontent.com/88717147/160272509-a37b9cef-ff23-47a8-98ea-4f1c99a0f519.gif)

## UML

Step1 더블스택 큐

![asd](https://user-images.githubusercontent.com/88717147/158518548-08c96f45-b77e-429b-837f-5b28fc6d0fa5.png)

Step2 UML
![큐](https://user-images.githubusercontent.com/88717147/158963736-420edddb-d8fe-49b7-a873-97df97c18d74.jpeg)


## STEP 1 기능 구현
1. 더블 스택 큐
- resetQueue() 저장된 모든 데이터를 삭제 해주는 메서드
- enQueue() 큐 배열의 마지막에 데이터를 저장해주는 메서드
- deQueue() 큐 배열의 처음 데이터를 제거, 반환 해주는 메서드

2. 링크드 리스트 큐
- removeAll() 저장된 모든 노드 를 제거해주는 메서드
- removeFirst() 저장된 처음 노드 를 제거해주는 메서드
- append() 새로운 노드를 마지막 노드로 추가해주는 메서드


## 고민했던 것들
1. Queue 구현
- Queue 에 대한 예시를 찾아보니 배열 하나로 구현하는방법, 배열 두개로 구현하는 방법, 링크드 리스트를 이용한 방법 등이 있었다.
- 배열로 구현하게되면 배열은 stack(LIFO)방식으로 저장되기 때문에 처음 저장한 값을 제거 하게되면 배열에 저장된 element 갯수 만큼 인덱스 위치를 -1 씩 해주어야해서 시간 복잡도가 늘어난다는것을 알게 되었다.
- 그렇다면 순서가 있는 컬렉션 타입 말고 다른 것으로 구현시켜주면 삭제해주더라도 -1 해주는 과정이 없어 시간복잡도 면에서 유리하지 않을까? 생각하여 다른 타입으로 구현하는것을 고민함
2. 프로토콜 활용 방법
- 큐 배열 에서 활용될 프로토콜 채택 방법을 어떻게 해야할지 고민함.
- 큐 에서 사용될 Element가 프로토콜을 채택 하게끔 해야할지.
- 프로토콜을 채택한 타입만 배열에 넣어 사용해야할지.
```swift
struct CalculatorItemQueue<Element: CalculateItem> {
    private var addStack: [Element] = []
    private var subStack: [Element] = []
    }
```
```swift
struct CalculatorItemQueue {
    private var addStack: [CalculateItem] = []
    private var subStack: [CalculateItem] = []
    }
```
3. 큐 배열에 element가 여러개일때 deQueue 를 한번만 실행한후 enQueue 를 실행할경우
```swift
    mutating func deQueue() -> CalculateItem? {
        if subStack.isEmpty {
            subStack = addStack.reversed()
            addStack.removeAll()
        }
        return subStack.popLast()
    }
```
- 이부분은 고민하다 계산기 프로젝트에서는 이대로 사용해도 괜찮을것 같아..수정하지않았다..
- 계산기 특성상 deQueue를 호출하면 배열에있는 모든 element를 제거 하기전까지 enQueue 기능을 사용할수 없기 때문에 이번 프로젝트에서는 문제가 될것같지 않았다..!

4. 온전한 링크드 리스트 와 프로젝트에서 사용될 링크드 
처음 더블스택 큐 를 채택 한 이유는 계산기 프로젝트에 비해 링크드 리스트 를 구현하는것이
덩치가 너무큰 것을 구현하는것이 아닐까?
생각이들어 더블스택 큐 를 채택 했으나 
링크드 리스트 를 활용해보며 이부분에대해서 똑같은 고민이 생겨 온전한 링크드 리스트 를 만들어 사용하기보다 기능을 축소시켜 이번 프로젝트에서만 사용할수있게끔 덩치를 줄여 구현해야 할지 고민함.

## 배운 개념
- unit-test
- 자료구조 Queue
- generic
- linked-List

## STEP 2 기능 구현
- enum Operator
    - calculate() Operator case 의 값에 따라 매개변수들을 연산하는 메서드
    - add() 매개변수를 2개 받아 값을 더해주는 메서드
    - sub() 매개변수를 2개 받아 값을 차감하는 메서드
    - divide() 매개변수를 2개 받아 값을 나눠주는 메서드
    - multiply() 매개변수를 2개 받아 값을 곱해주는 메서드
- struct Formula
    - result() 저장된 연산자와 피연산자를 활용해 값을 연산해주는 메서드
- enum ExpressionParser
    - parse() String 타입의 매개변수를 연산자와 피연산자로 구분하여 저장된 Formula 를 반환하는 메서드
    - componentsByOperators() String 타입의 값을 공백을 기준으로 분리시켜주는 메서드
    
## 고민했던 것들
1. 기존 구현해 두었던 링크드 리스트 를 구조체로 변경해야할지 고민함.
단순하게만 보았을때는 class 와 struct 는 저장방식이 다르기때문에 struct로 수정하는것이 기능이 더 효율적일것이다 라고 생각 했으나 struct 로 변경하게되면 mutating 키워드를 사용하여 값을 전체적으로 복사하여 새로운 인스턴스를 만들게 된다.
그렇다면 이번 프로젝트에서 연산을 할때마다 mutating 으로 프로퍼티의 값이 변경되기 때문에 연산횟수가 많아질수록 성능이 저하될것으로 생각하였다.
struct 를 사용하는것과 class 에 final 키워드를 작성하는것 두가지중 어떤것이 성능이 더좋을지 고민함 
2. ExpressionParser parse 코드의 가독성
어떤 코드가 더 이해하기 쉬운 코드인지 고민함.
1번 예시
```swift
 mutating func result() -> Double {
        var result = operands.removeFirst() ?? .nan
        
        while let oper = operators.removeFirst(), let rhs = operands.removeFirst() {
            result = oper.calculate(lhs: result, rhs: rhs)
        }
        return result
    }
```
2번 예시
```swift
mutating func result() -> Double {
        var result = operands.removeFirst() ?? .zero
        
        while operators.isEmpty == false {
            guard let rhs = operands.removeFirst() else { return result}
            guard let `operator` = operators.removeFirst() else { return .nan }
            result = `operator`.calculate(lhs: result, rhs: rhs)
        }
        return result
    }
```
## 배운 개념
defer
forEach 내부에서의 return 구문
else 를 남발하였을때 생기는 불편함
while let 을 이용한 옵셔널바인딩
early return
early continue
early break

## PR 후 개선사항
1. else 구문 분리
기존 코드
```swift
    static func parse(from input: String) -> Formula {
        
        let componentsString = componentsByOperators(from: input)
        var values = LinkedQueue<Double>()
        var oper = LinkedQueue<Operator>()
        
        componentsString.forEach{
            if let number = Double($0) {
                values.append(newNode: number)
            } else if let convertOper = Operator(rawValue: Character($0)) {
                oper.append(newNode: convertOper)
            }
        }
        return Formula(operands: values, operators: oper)
    }
```
변경후 코드
```swift
    static func parse(from input: String) -> Formula {
        
        let componentsString = componentsByOperators(from: input)
        var operands = LinkedQueue<Double>()
        var operators = LinkedQueue<Operator>()
        
        for value in componentsString {
            
            if let number = Double(value) {
                operands.append(newNode: number)
                continue
            }
            
            if let convertOper = Operator(rawValue: Character(value)) {
                operators.append(newNode: convertOper)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
```
코드의 양은 더 늘어났으나 조금더 이해하기 편하도록 if - else 구문을 분리시킴.

## STEP 3 기능 구현
- ViewController
    - didTapOperand() 계산기 UI 의 숫자 버튼을 누르면 해당 숫자가 저장되는 메서드
    - didTapOperator() 계산기 UI 의 연산자 버튼을 누르면 해당 연산자가 저장되고 스크롤뷰에 스택뷰가 추가되는 메서드
    - didTapDot() 계산기 UI 의 소수점 버튼을 누르면 입력된 숫자 뒤에 소수점이 붙는 메서드
    - changeSign() 입력된 숫자의 부호를 바꾸어 저장하는 메서드
    - didTapEqualSign() 지금까지 입력된 숫자와 연산자를 입력받아 계산하여 결과를 보여주는 메서드
    - didTapAC() 기존 입력하여 저장된 숫자와 연산자들의 정보를 제거하는 메서드
    - didTapCE() 가장 마지막 입력된 숫자를 제거하는 메서드
- ViewController extention
    - removeHistory() 스크롤 뷰에 추가된 스택뷰, 입력되어 저장된 숫자와 연산자를 제거해주는 메서드
    - numberFormatter() 저장된 숫자를 .demica(십진법 표기)스타일로 변경후 반환해주는 메서드
    - pushStackView() 스택뷰와 레이블2개를 생성해 스택뷰 에 레이블 2개를 넣어주는 메서드
- UIScrollView extention
    - scrollToBottom() 스택뷰가 추가될경우 스크롤뷰가 추가된 높이만큼 viewPort 를 내려주는 메서드
    
## 고민했던 것들
1. UI를 통해 입력된 값을 저장하는방법
2. 저장된 숫자와 연산자를 스택뷰에 추가하는방법
3. 저장된 숫자와 연사자를 연산하는 방법
4. 입력값에 소수점이 추가되었을 경우 넘버포메터를 적용하지 않는방법

## 배운 개념
1. AutoLayOut
2. ScrollView
3. StackView
4. Formatter
5. NumberFormatter
6. frame 과 bound 의 차이

## PR 후 개선사항
1. early return 되는 조건문 병합

변경전
```swift
 if inputOperand.count >= 16 {
    return
 }

 if inputOperand == "0" && buttonLabel == "0" {
    return
 }
```
변경후
```swift
if inputOperand.count >= 16 || inputOperand == "0" && buttonLabel == "0" {
    return
 }
```
