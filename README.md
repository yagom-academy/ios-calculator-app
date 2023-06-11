# 🏦계산기

## 📖 목차
1. [🍀 소개](#-소개)
2. [👨‍💻 팀원](#-팀원)
3. [⏰ 타임라인](#-타임라인)
4. [👀 시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [💻 실행 화면](#-실행-화면)
6. [🧨 트러블 슈팅](#-트러블-슈팅)
7. [📚 참고 링크](#-참고-링크)
8. [👥 회고](#-회고)

</br>

## 🍀 소개
민트가 만든 계산기. <br>
사용자는 숫자패드와 기호를 눌러 정수와 실수의 사칙연산을 할 수 있습니다.

</br>

## 👨‍💻 팀원
| MINT |
| :--------: |
| <Img src = "https://hackmd.io/_uploads/SyW7zfDUn.jpg"  width="200" height="200"> |
|[Github Profile](https://github.com/mint3382) |


</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.05.29.| - `Unit Test` 공부 |
|2023.05.30.| - `enqueue`, `dequeue`, `popLastStack` 함수 구현 <br> - TDD 사용 |
|2023.05.31.| - `count`, `isEmpty`, `first`, `last` 연산 프로퍼티 구현 <br> - `enqueue`, `dequeue` 함수 리펙토링 <br> - `popLastStack` 함수 삭제 <br> - `test` 리펙토링 |
|2023.06.01.| - `enqueue`, `dequeue` 함수 리펙토링 <br> - `test` 리펙토링 <br> - `first`, `last` 연산 프로퍼티 리펙토링 |
|2023.06.02.| - `static`, `UML`공부 |
|2023.06.04.| - `UML` 이해 후 정리 <br> - 수도코드 작성 |
|2023.06.05.| - `ExpressionParser`, `Operator`, `Formula` 구현 |
|2023.06.06.| - `Formulatests`, `ExpressionParserTests`, `CalculatorErrors` 구현 |
|2023.06.07.| - 컨벤션 및 네이밍 수정 |
|2023.06.08.| - `NumberFormatter` 공부, 구현 <br> - `Scroll View` 공부, 구현 |
|2023.06.09.| - `IBAction` 구현 <br> - 자동 스크롤 기능 구현 |
|2023.06.10.| - 예외사항 수정 <br> - `NumberFormatter` 파라미터 타입 수정 |
|2023.06.11.| - 예외사항 수정 <br> - 네이밍 및 컨벤션 수정 <br> - `Operator` 계산 타입 수정 |


</br>

## 👀 시각화된 프로젝트 구조
### File Tree
````
Calculator
    ├── Extension
    │   ├── String+
    │   └── Double+
    ├── Model
    │   ├── CalculatorItemQueue
    │   ├── CalculateItem
    │   ├── Formula
    │   ├── Operator
    │   ├── ExpressionParser
    ├── View
    │   ├── LaunchScreen
    │   ├── Main
    ├── Controller
    │   ├── AppDelegate
    │   ├── SceneDelegate
    │   ├── CalculateViewController
    ├── Resource
    │   ├── Assets
    │   ├── Info
    ├── CalculatorTests
        ├── TestPlan
        ├── ExpressionParserTests
        ├── FormulaTests 
        ├── CalculatorItemQueueTests
````


### Class Diagram
<img width="800" src= "https://hackmd.io/_uploads/rJApOw7v2.jpg" >
</p>
</br>

## 💻 실행 화면 

| AC 버튼 | CE 버튼 | +/- 버튼 |
|:--------:|:--------:|:--------:|
|<img src="https://hackmd.io/_uploads/ByiQ3SmPh.gif" width="250">|<img src="https://hackmd.io/_uploads/Hy6UnBmPn.gif" width="250">|<img src="https://hackmd.io/_uploads/BJyO3Hmwh.gif" width="250">|

| 정수 연산 | 소수 연산 | 실수 연산 |
|:--------:|:--------:|:--------:|
|<img src="https://hackmd.io/_uploads/ryu8ArmD2.gif" width="250">|<img src="https://hackmd.io/_uploads/HJFH0HmP2.gif" width="250">|<img src="https://hackmd.io/_uploads/SkPV0HXPn.gif" width="250">|

| ÷ 0 | 10 ÷ 3 | 5 ÷ 3 |
|:--------:|:--------:|:--------:|
|<img src="https://hackmd.io/_uploads/Hy090Smv3.gif" width="250">|<img src="https://hackmd.io/_uploads/rJkh0BXvn.gif" width="250">|<img src="https://hackmd.io/_uploads/B1i3CHXDn.gif" width="250">|

| 0버튼 예외처리 | 20자릿수 예외처리 | 결과값 예외처리 |
|:--------:|:--------:|:--------:|
|<img src="https://hackmd.io/_uploads/B1RXkUXwh.gif" width="250">|<img src="https://hackmd.io/_uploads/SJJr1L7w2.gif" width="250">|<img src="https://hackmd.io/_uploads/ByJ8yLQwn.gif" width="250">|

| 연산이 길어질 경우 자동 스크롤 | 피연산자 라벨 숫자가 커질 경우 decimal 양식 | dot으로 끝날 경우 수식 표현 |
|:--------:|:--------:|:--------:|
|<img src="https://hackmd.io/_uploads/SkbbxLXP3.gif" width="250">|<img src="https://hackmd.io/_uploads/SJxll87wn.gif" width="250">|<img src="https://hackmd.io/_uploads/Syb1g8QP2.gif" width="250">|

</br>

## 🧨 트러블 슈팅

1️⃣ **Queue 구현 자료구조 선택: Double Stack vs Linked_List** <br>
-
🔒 **문제점** <br>
`Queue`를 구현하는 방법들은 여러가지가 있습니다.

본인 이전의 정보와 다음의 정보를 알고 있는 `linked list`라는 구조의 방법이 있습니다. `enqueue`시 마지막 `node`인 `TAIL`에 새로 추가된 `node`를 잇고, `dequeue`시 맨 처음의 `node`인 `HEAD`의 정보를 반환하면서 `HEAD`의 위치를 다음 `node`로 전환하는 방법을 사용합니다.

`stack` 2개를 사용해 구현하는 `Double Stack`이라는 구조의 방법 또한 있습니다. 두 개의 스택용 배열을 만들어서 `enqueueStack`에서는 요소의 추가(`enqueue`의 기능)만, `dequeueStack`에서는 선입선출을 맞춰 요소 반환(`dequeue`의 기능)만을 담당하게 하여 사용합니다.

이 중 계산기의 기능을 위해 `Queue`를 구현할 때, 어떤 방법을 선택할지에 대한 고민이 있었습니다.


🔑 **해결방법** <br>
계산기의 기능을 위함에는 `Double Stack`이 더 맞는 것 같아 `Double Stack`으로 구현하였습니다. 

`linked list`는 `node`라는 곳에 단순한 본인의 `data` 뿐만 아니라 다음 차례의 `node`의 주소값을 알고 있는 구조입니다. 끊임없이 연결되어 있는 구조이고 `HEAD`와 `TAIL`을 설정해주면 손쉽게 처음과 끝을 알 수 있고, 내용을 변경할 수 있습니다. 때문에 `array`에서 구현되는 `removeFirst()`와는 다르게 `HEAD`만 옮겨서 1번 자리를 가리키는 것이 바뀔 뿐 배열의 내용을 앞으로 당길 필요가 없기에 시간복잡도가 O(n)이 되는 경우가 없어서 빠릅니다. 또한 중간에 데이터A를 넣고 싶을 때 넣고 싶은 부분의 앞의 노드의 다음 노드에 대한 정보를 A에 대한 노드로 바꾸고, A 노드에서 다음 노드에 대한 정보를 기존에 넣고 싶었던 부분의 뒤의 노드로 변경해주면 됩니다. 이처럼 데이터를 중간에 삽입하는 것에 큰 장점이 있습니다.

`Double stack`은 `dequeueStack`이 비어있는 경우 `enqueueStack`을 뒤집어주어야 하는 일이 있어서 시간 복잡도는 조금 더 높을 수 있지만 배열을 이용한 구현이기에 원한다면 인덱스를 통한 접근을 빠르게 할 수 있습니다.

계산기의 경우 큐의 구현이기에 중간에 데이터를 추가해 줄 필요가 없습니다. `linked-list`를 사용한다면 `enqueue`를 할 때마다 매번 `node`를 생성하고 할당하여 `TAIL`과 연결짓는 작업을 해주어야 하는데 `double stack`은 단순히 `enqueueStack`에 `append`만 해주면 되고, `dequeue`를 할 때도 `linked-list`는 기존 HEAD에서 데이터를 저장하여 반환한 후 `HEAD`가 가리키고 있는 `node`를 다음 `node`로 변경하는 작업을 해주어야 하는데 `double stack`에서는 이미 `dequeueStack`에 있다면 단순히 배열의 마지막 요소를 꺼내기만 하는 것이기에 해야하는 작업이 더 적고 구조가 간단하다는 생각이 들어 `double stack`으로 구현한 것을 남겼습니다.


<br>

2️⃣ **Double Stack: enqueue와 dequeue시 시간 복잡도** <br>
-
🔒 **문제점** <br>
초반 `dequeue`를 할 때 항상 `enqueueStack`을 `dequeueStack`에 `reversed()` 해준 후 `popLast()`를 하고 다시 `enqueueStack`에 `reversed()` 해주는 방법을 사용했습니다. 그러자 매번 시간복잡도가 O(n)으로 `array`의 `removeFirst()`를 사용해주는 것과 다를 바 없는 결과가 나왔습니다. 
```swift
    dequeueStack = reversedStack(enqueueStack)
    let output = backwardStack.popLast()
    enqueueStack = reversedStack(dequeueStack)
```

🔑 **해결방법** <br>
한번 `enqueueStack`을 `reversed()`하여 `dequeueStack`에 넣게 되면 기존의 `enqueueStack`의 내용은 지우고 `dequeueStack`에만 남겨, `dequeueStack`이 비어서 꺼낼 요소가 없을 때까지 `reversed()`할 필요 없이 마지막 요소를 꺼내는 작업만 할 수 있도록 변경하였습니다. 매번 `reversed()` 해주는 것이 아니라 필요한 순간에만, 한번씩 해주기에 시간 복잡도를 줄일 수 있었습니다. 
```swift
mutating func dequeue() -> T? {
        guard isEmpty == false else {
            return nil
        }
        
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        
        return dequeueStack.removeLast()
    }
```


<br>

3️⃣ **TDD_private** <br>
-
🔒 **문제점** <br>
`private` 키워드를 사용하면 `Unit Test`에서도 해당 프로퍼티나 메서드를 사용할 수 없습니다. 때문에 테스트를 할 때는 `private`를 제거하고, 테스트가 끝난 후에 다시 `private`을 붙여주었습니다. 그러니 최종적인 `test문`들에 빨간 에러가 뜨는 일들이 발생하였는데 특히 `enqueue` 메서드가 제대로 동작하였는지를 알아보기 위해 `private enqueueStack`의 내용을 비교하는 과정에서 문제들이 생겼습니다.

```swift
 XCTAssertEqual(sut.enqueueStack, [10, 20])
```

🔑 **해결방법** <br>
테스트는 은닉화를 하였음에도 오류 없이 잘 돌아가야합니다. 때문에 `private` 키워드를 붙이더라도 해당 프로퍼티나 메서드를 확인할 수 있는 다른 방법을 생각해야 했습니다. `count` 프로퍼티를 활용하여 `enqueue` 메서드가 동작하였을 때 `count`의 값이 올라갔는지 확인하는 방법으로 변경하여 해결하였습니다.

```swift
//when
let result = sut.count
        
//then
XCTAssertEqual(result, 2)
```

<br>

4️⃣ **Scroll View 구현** <br>
-
🔒 **문제점** <br>
`ScrollView`는 스크롤뷰 안에 `StackView`가 있고 그 스택뷰 안에 `SubStackView`가 있는 형식입니다. 계산기의 수식이 서브 스택뷰의 라벨로 표시되면서 스택뷰로 들어가고, 스택뷰는 스크롤뷰의 안에 있기에 끊임없이 늘어나더라도 스크롤을 통해 내용들을 전부 확인할 수 있습니다. 처음 스크롤뷰를 본 순간 매번 새롭게 수식 라벨이 추가되어야 하는데 스토리보드만으로는 구현하기 힘들지 않을까, 라는 생각을 했습니다. 때문에 스크롤뷰와 스택뷰의 구현부터 코드로 해야하나 하는 고민을 했습니다. 또한 스크롤뷰에 새로운 수식이 추가될 때마다 해당 수식을 확인할 수 있게 자동스크롤이 되어야 하는데 기존 코드에서는 최신 것 직전의 수식까지만 보이도록 한칸 덜 내려가는 문제가 있었습니다. 

```swift
private func setCurrentFormulaViewOnScroll(_ `operator`: String, _ operand: String) {
        currentFormulaStackView.addArrangedSubview(makeCurrentFormulaLabelStackView(`operator`, operand))
        
        currentFormulaScrollView.setContentOffset(CGPoint(x: 0, y: currentFormulaScrollView.contentSize.height - currentFormulaScrollView.bounds.height), animated: true)
    }
```

🔑 **해결방법** <br>
서브 스택뷰만 코드로 매번 생성하여 `IBOutlet`으로 연결한 스택뷰 안에 넣어주는 방법으로 해결하였습니다. 
```swift
private func makeCurrentFormulaLabelStackView(_ `operator`: String, _ operand: String) -> UIStackView {
        let operatorLabel: UILabel = {
            let label = UILabel()
            
            label.text = `operator`
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .white
            
            return label
        }()
        
        let operandLabel: UILabel = {
            let label = UILabel()
            
            label.text = operand.replacingOccurrences(of: ",", with: "")
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .white
            
            return label
        }()
        
        let subStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operatorLabel,operandLabel])
            
            stackView.spacing = 8
            stackView.alignment = .bottom
            
            return stackView
        }()
        
        return subStackView
    }
```
자동 스크롤의 경우는 서브 스택뷰를 스택뷰에 추가한 후의 기준이 아니라 추가하기 전을 기준으로 `CGPoint`를 잡아서, `layoutIfNeeded()`를 통해 강제적으로 추가한 후의 기준을 불러와 위치를 잡게 하여 해결했습니다. 
```swift
private func setCurrentFormulaViewOnScroll(_ `operator`: String, _ operand: String) {
        currentFormulaStackView.addArrangedSubview(makeCurrentFormulaLabelStackView(`operator`, operand))
        
        currentFormulaScrollView.layoutIfNeeded()
        currentFormulaScrollView.setContentOffset(CGPoint(x: 0, y: currentFormulaScrollView.contentSize.height - currentFormulaScrollView.bounds.height), animated: true)
    }
```
<br>

5️⃣ **NumberFormatter 구현** <br>
-
🔒 **문제점** <br>
`Double`을 `String`으로 바꾸는 형식으로 작성하였더니 피연산자를 눌러서 라벨에 추가할 때마다 `decimal` 양식에 맞춰 3자리수 마다 `comma`가 찍혀야 하는데 이 경우 `String -> Double -> String`으로 매번 바꾸어야 하는 문제가 있었습니다.

🔑 **해결방법** <br>
기존에 `Double`의 `extension`으로 두었던 `NumberFormatter`를 `ViewController` 내부의 함수로 구현하여 `String -> String` 형식으로 전환하였습니다. 
> _조금 더 좋은 방법이 있을 것 같기에 추후에 다시 리펙토링 할 예정입니다._

```swift
private func formattingNumber(_ input: String) -> String {
        let formatter = NumberFormatter()
        let number = NSDecimalNumber.init(string: input)

        formatter.maximumSignificantDigits = 15
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.usesSignificantDigits = true
        
        return formatter.string(from: number) ?? "NaN"
    }
```

<br>

6️⃣ **부동소수점 오류** <br>
-
🔒 **문제점** <br>
`Double`은 최대 16자리까지만 정확한 수를 저장할 수 있습니다. 그러나 주어진 과제의 표현 가능한 자릿수는 20이기에 `maximumSignificantDigits`를 20으로 주었더니 온전한 계산을 하지 못하였습니다. 또한 `Double`과 `Double`의 계산을 하고 있었기에 소수점 자리 계산 역시 근사값끼리의 계산 때문에 정확한 결과가 나오지 않았습니다.
````
10 ÷ 3 = 3.333333333334528
0.1 + 0.2 = 0.3000000000512
````
🔑 **해결방법** <br>
문제의 해석을 다르게 해보았습니다. 결과값으로 표현될 수 있거나 입력값으로 넣을 수 있는 자릿수는 20으로 해석해여 `maximumSignificantDigits`을 15로 제한하였고 기존 `Operator`에서 `Double`끼리의 연산 부분을 `NSDecimalNumber`에서의 `Decimal`끼리의 연산으로 변경하여 해결하였습니다.

```swift
private func add(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: Decimal(lhs) + Decimal(rhs)).doubleValue
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: Decimal(lhs) - Decimal(rhs)).doubleValue
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        guard rhs != 0 else {
            return .nan
        }
        return NSDecimalNumber(decimal: Decimal(lhs) / Decimal(rhs)).doubleValue
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return NSDecimalNumber(decimal: Decimal(lhs) * Decimal(rhs)).doubleValue
    }
```

<br>

7️⃣ **깔끔한 분기처리** <br>
-
🔒 **문제점** <br>
여러가지 예외들을 처리하느라 한 함수에 굉장히 많은 조건문을 작성하게 되었습니다. `flag`도 4,5개 정도로 과하게 있어서 코드를 타인이 읽고 해석하기가 매우 어려웠습니다. 예외사항들에 대한 분기 처리에 대한 문제였습니다.

🔑 **해결방법** <br>
한가지 버튼에 밀어넣지 않고 예외적이게 될 수 있는 버튼 마다 따로 `IBAction` 함수를 선언하여 해결하였습니다. `0, 00, . `을 숫자와 분리하였더니 과한 조건문들과 `flag`를 줄일 수 있었습니다. 또한 `flag`를 두어 `property Observer`를 사용하던 부분을 함수로 빼서 선언만 하면 되도록 수정하였습니다. 한결 가독성을 높일 수 있었습니다.

```swift
@IBAction func tappedDotButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText.contains(".") == false,
              isCalculated == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "."
    }
```

<br>

## 📚 참고 링크
- [🍎Apple Docs: reversed](https://developer.apple.com/documentation/swift/array/reversed())
- [🍎Apple Docs: popLast](https://developer.apple.com/documentation/swift/array/poplast())
- [🍎Apple Docs: removeLast](https://developer.apple.com/documentation/swift/array/removelast())
- [🍎Apple Docs: NSDecimalNumber](https://developer.apple.com/documentation/foundation/nsdecimalnumber)
- [🍎Apple Docs: CustomStringConvertible](https://developer.apple.com/documentation/swift/customstringconvertible)
- [🍎Apple Docs: Data Formatting](https://developer.apple.com/documentation/foundation/data_formatting)
- [🍎Apple Docs: ScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)
- [🍎Apple Docs: StackView](https://developer.apple.com/documentation/uikit/uistackview)
- [🍎Apple Docs: replacingOccurrences(of:with:)](https://developer.apple.com/documentation/foundation/nsstring/1412937-replacingoccurrences)
- [🍏Apple Docs_Archive: NSFormatter](https://developer.apple.com/library/archive/documentation/LegacyTechnologies/WebObjects/WebObjects_3.5/Reference/Frameworks/ObjC/Foundation/Classes/NSFormatter/Description.html#//apple_ref/occ/instm/NSFormatter/stringForObjectValue:)
- [📘blog: NumberFormatting](https://www.swiftbysundell.com/articles/formatting-numbers-in-swift/)
- [📘blog: layoutIfNeeded](https://zeddios.tistory.com/359)
</br>

## 👥 회고
- [회고 링크](https://github.com/mint3382/ios-calculator-app/wiki)
