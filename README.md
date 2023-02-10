# 계산기 :calling:

> 프로젝트 기간: 2023.02.06 ~ 2023.02.10
> 
> 팀원: 👨🏻‍💻[kaki](https://github.com/kak1x), 👨🏻‍💻[kokkilE](https://github.com/kokkilE) | 리뷰어: 👨🏻‍💻[그루트](https://github.com/Groot-94)
>


## 목차
1. [프로젝트 소개](#프로젝트-소개)
2. [타임라인](#타임라인)
3. [시각화된 프로젝트 구조](#시각화된-프로젝트-구조)
4. [실행 화면](#실행-화면)
5. [트러블 슈팅](#트러블-슈팅)
6. [참고 링크](#참고-링크)


# 프로젝트 소개

계산기 앱 병합 및 리팩토링

# 타임라인

- 23.02.06(월): Node, CalculaterItemQueue, Formula, ExpressionParser 병합
- 23.02.07(화): CalculatorViewController 병합
- 23.02.08(수): CalculatorViewController 리팩토링
- 23.02.09(목): CalculatorViewController 오류 수정 및 리팩토링, 테스트 케이스 수정

# 시각화된 프로젝트 구조

<details>
    <summary><big>폴더 구조</big></summary>

``` swift
Calculator    
├── Model
|   ├── Extension
|   |   ├── Double
|   |   └── String
|   ├── CalculateItem
|   ├── Node
|   ├── CalculatorItemQueue
|   ├── Operator
|   ├── Formula
|   └── ExpressionParser    
├── Controller
|   └── CalculatorViewController
└── View
    └── Main    
    
Test
├── CalculatorItemQueueTests    
|   └── CalculatorItemQueueTests
├── OperatorTests    
|   └── OperatorTests
├── StringTest    
|   └── StringTest
├── FormulaTests    
|   └── FormulaTests
└── ExpressionParserTests    
    └── ExpressionParserTests
``` 

</details>

<details>
    <summary><big>UML</big></summary>
    
![](https://i.imgur.com/nEWCtHz.png)
    
</details>

# 실행 화면

<details>
<summary><big>실행 화면</big></summary>

| AC는 모든 연산내역을 <br> 초기화한다. | CE는 현재 입력하던 숫자 <br> 혹은 연산결과만 삭제한다. | ⁺⁄₋ 버튼은 현재 입력한 <br> 숫자의 부호를 변환한다. |
| :-----: | :-----: | :-----: |
|<img src="https://i.imgur.com/3WsvKEv.gif" width=250>| <img src="https://i.imgur.com/jvbM4fN.gif" width=250>| <img src="https://i.imgur.com/ipFm98u.gif" width=250>|

| 숫자입력 중에 연산자(÷, ×, -, +)를 <br> 누르면 숫자입력을 중지하고 <br> 다음 숫자를 입력받는다. | 현재 숫자입력이 없는 상태인 <br> 0에서는 연산자를 반복해서 <br> 누르더라도 연산이 이루어지지 <br> 않고 연산자의 종류만 변경한다. | = 버튼을 누르면 입력된 연산을 <br> 한 번에 수행한다. <br>  연산자 우선순위는 <br> 무시되고 순차적으로 연산한다. |
| :-----: | :-----: | :-----: |
|<img src="https://i.imgur.com/FHFhdCh.gif" width=250>|<img src="https://i.imgur.com/6AAGQ4w.gif" width=250>|<img src="https://i.imgur.com/QsGq0zZ.gif" width=250>|
    

| 사용자에게 표시하는 숫자는 뒤에 <br> 0000 등 불필요한 숫자가 <br> 나타나지 않는다. <br> 숫자는 3자리마다 쉼표(,)를 표기한다. | 0으로 나누기에 대해서는 결과를 <br> NaN으로 표기한다. |
| :-----: | :-----: |
| <img src="https://i.imgur.com/UlnmLf6.gif" width=250>| <img src="https://i.imgur.com/Zq2N3FW.gif" width=250>|

</details>
    
# 트러블 슈팅 

## 병합 기준
### 1. Node
```swift
// kaki
final class Node<T> {
    weak var prev: Node?
    var data: T?
    var next: Node?
    
    init(_ data: T?) {
        self.data = data
    }
}
```
```swift
// kokkilE
final class Node<T> {
    private(set) var data: T
    var next: Node<T>?
    
    init(_ data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
```
- 본 프로젝트에서는 양방향 연결리스트로 구현하는 것에 대한 이점이 없다고 판단되어 kokkilE의 단방향 연결리스트 방식을 채택하였습니다.

### 2. Operator
``` swift
// kaki
    private func divide(lhs: Double, rhs: Double) -> Double {
        if rhs == .zero {
            return .nan
        }
        
        return lhs / rhs
    }
```

``` swift
// kokkilE
    private func divide(lhs: Double, rhs: Double) throws -> Double {
        if rhs == 0.0 {
            throw OperatorError.divideByZero
        }
        
        return lhs / rhs
    }
```

- 0나누기가 실행될 경우 `nan` 반환하는 것 외에 별도의 에러처리는 필요하지 않은데 `throws` 함수로 구현할 필요가 없다고 판단되어 에러 처리를 하지 않는 kaki의 코드를 채택하였습니다. 

### 3. CalculatorViewController 구조
``` swift
// kaki - 버튼의 타입별로 IBAction 메서드를 구현하여 처리하는 구조
@IBAction private func numberButtonTapped(_ sender: UIButton) { ... }
@IBAction private func operatorButtonTapped(_ sender: UIButton) { ... }
...
```
``` swift
// kokkilE - 한 개의 IBAction 메서드로 모든 버튼을 처리하는 구조
@IBAction private func touchUpCalculatorButton(sender: UIButton) {
    guard let inputFromButton = sender.titleLabel?.text else { return }
    
    processInput(from: inputFromButton)
}

private func processInput(from inputFromButton: String) {
    switch inputFromButton {
    case ButtonValue.AC:
        allClear()
    case ButtonValue.CE:
        clearEntry()
    case ButtonValue.SC:
        signChanger()
    case ButtonValue.add, ButtonValue.subtract, ButtonValue.divide, ButtonValue.multiply:
        processOperatorInput(inputFromButton)
    case ButtonValue.equal:
        processEqualSignInput()
        isOperateComplited = true
    case ButtonValue.dot:
        processDotInput(inputFromButton)
    default:
        if isOperateComplited {
            operandUILabel.text = DefaultValue.zero
            isOperateComplited = false
        }
        
        processNumberInput(inputFromButton)
    }
}
```
- 모든 버튼을 한 가지의 액션에 묶어 분기 처리를 해주는 방식보다는 비슷한 기능의 버튼끼리 묶어 따로 액션을 처리 해주는 방식이 성능과 가독성 면에서 더 좋다고 판단되어 kaki의 구조를 채택하였습니다.



# 참고 링크
* [Swift 공식문서](https://www.swift.org/)
* [Swift) 큐(Queue) 구현 해보기](https://babbab2.tistory.com/84)
* [Apple 개발자 문서 - FloatingPoint](https://developer.apple.com/documentation/swift/floatingpoint)
