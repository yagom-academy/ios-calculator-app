# 계산기 모둠 프로젝트 [나무, 제인, 허황]

#### 1. 프로젝트 기간 : 2021.11.22 - 2021. 11.26 [ 1주 ]
#### 2. Grounds Rules
**활동 시간** 
+ 평일 10:00 ~
+ 주말 개인공부, 이슈 정리

**스크럼 시간**
+ 오전 10시
 
**컨벤션**
+ Swift API Design Guidlines
 
**커밋 규칙**
+ 단위: 함수 단위
+ 커밋 컨벤션 : Karma Style
---

### 학습 키워드
+ `코드 병합`
+ `Delegate` `protocol`
+ `Custom View`
+ `Closure` `Functional Programming`
+ `Git`

---

## STEP 1 코드 병합
+ ### 구현 내용
**1. 코드 병합**

개인 프로젝트로 구현한 각자의 코드를 기능 단위로 병합하였습니다. 

+ ### 고민했던 점
**1. CalculatorItemQueue 구현 방식**

Double stack vs LinkedList
계산기의 요소인 연산자와 피연산자를 담는 타입을 구현한 방식이 달랐습니다. 그러나 두 방식의 시간복잡도가 O(1)로 차이가 없는데 Double stack 방식의 코드가 더 간단해서 Double stack 방식으로 구현하는 것을 선택했습니다.

**2.NaN 처리 방식**

Error throw vs Double.nan
0으로 나눗셈 연산을 수행할 때, 별도의 에러처리 없이 의도한 결과를 도출할 수 있기에 두 방법 중 nan을 반환하는 방법을 선택했습니다.
```swift
private func divide(lhs: Double, rhs: Double) -> Double {
     return rhs == .zero ? .nan : lhs / rhs
}
```
---
+ ### 트러블 슈팅
**1. Github PR 충돌** 

1. `yagom-academy:4-hwangjeha` 에는 지난 주에 작업한 허황의 개인 프로젝트가 머지되어있는 상황
2. 모둠 프로젝트로 야곰 아카데미 repository main branch에서 `4-najahwang-group` 브랜치를 생성하여 모둠원들의 코드를 합쳐서 커밋을 했고, `yagom-academy:4-hwangjeha` 에 머지를 하기위해 PR.
    - `4-najahwang-group` 브랜치는 야곰 아카데미 repository의 원본을 분기해서 만듦
    - `4-najahwang-group` 브랜치에 계산기 프로젝트 코드 병합 후 야곰 아카데미 repository의 `4-hwangjeha` 브랜치에 PR 요청
3. 충돌이 일어남

#### 충돌 원인
야곰 아카데미 repository의 4-hwangjeha와 허황 repository의 4-najahwang-group 커밋 로그가 일치하지 않아 문제가 발생했습니다.

#### 해결 방법
1st. 허황 repository에서 개인 프로젝트한 4-hwangjeha 브랜치와 모둠 프로젝트한 4-najahwang-group 브랜치 간의 충돌 해결
```
git checkout -b hwangjeha-4-najahwang-group 4-hwangjeha
git pull [https://github.com/hwangjeha/ios-calculator-app.git](https://github.com/hwangjeha/ios-calculator-app.git) 4-najahwang-group
```
1. 로컬에 새로운 브랜치(hwangjeha-4-najahwang-group)를 만드는 동시에 4-hwangjeha 를 가져와서,
1. 1의 브랜치에서 4-najahwang-group 를 풀 받는다. (일부러 충돌을 냄)
1. 소스트리로 충돌난 파일의 헤드들을 지워서 충돌 해결후 1의 브랜치인 hwangjeha-4-najahwang-group 에 커밋
1. 3을 원격 브랜치인 4-najahwang에 푸시
1. 야곰 아카데미 repository의 4-hwangjeha에 머지

2nd. 다시 야곰 아카데미 repository의 4-hwangjeha 브랜치에 PR해서 상황 해결


## STEP 2 리팩터링
+ ### 구현 내용
**1. 델리게이트 패턴 사용을 통해 객체 역할 분리**

기존에는 ViewController에서 1. 버튼 이벤트를 받고 2. 버튼 이벤트에 대해 처리하고 3. 처리한 내용을 뷰에 반영하고 4. 연산하고 5. 연산 결과를 반영까지 하여 너무 많은 기능을 담당하고 있었습니다. 그래서 연산을 담당하고 현재 입력중인 수식 데이터를 관리할 연산 객체, `Calculator`를 만들어 둘의 역할을 분리했습니다. 

`Viewcontroller`는 `Calculator` 객체를 소유하고, `Calculator` 객체는 `Viewcontroller`를 `CalculatorDelegate` 프로토콜을 통해 바라봅니다. `CalculatorDelegate` 프로토콜에는 뷰를 갱신하기 위해 호출할 수 있는 메서드가 정의되어있고, 이를 `Calculator`에 구현했습니다.

`Viewcontroller`에서 `Calculator` 객체를 초기화할 때 자신을 `calculator`의 `delelgate`에 주입합니다.( `calculator = Calculator(delegate: self)`)

이로써 `ViewController`는 이벤트를 받아 넘겨주기만 하고, 메시지를 받아 뷰를 업데이트하기만 하는 객체가 됩니다. 계산기의 핵심적인 기능은 Calculator가 담당하고, 화면에 보여주는 기능을 delegation으로 ViewController에게 위임한 구조입니다.

**2. 변경된 데이터를 프로퍼티 옵저버에서 delegate 메서드로 뷰에 반영**

Calculator는 전달받은 이벤트에 따라 상황에 맞게 자신의 수식 데이터 프로퍼티를 변경합니다. 변경된 내용을 다시 뷰에 반영할 때 일괄적으로 프로퍼티 옵저버를 통해 호출할 수 있도록 구현했습니다. 

```swift
private var currentOperator: String {
    didSet {
        delegate?.calculator(didChangeCurrentOperatorTo: currentOperator)
    }
}
```

반복되는 코드를 줄여줄 수도 있으며, 데이터 변경이 발생하면 뷰에 항상 해당 메세지를 보내는 것을 보장할 수 있다는 장점이 있습니다.

**3. DecimalNumberFormatter 역할 분리**

출력 형식을 가공하는 `NumberFormatter`를 연산 객체인 `Calculator` 클래스로부터 분리했습니다.

**4. 커스텀 뷰 생성(ExpressionStackView, CalculatorItemLabel)**

뷰 컨트롤러가 가지고 있던 view 팩토리 메소드를 별도의 Custom View 클래스로 분리했습니다.

**5. 함수형 프로그래밍**

함수 자체를 받을 수 있는 로직의 경우 클로저가 아닌 함수를 받도록 코드를 작성했습니다.
```swift
// 개선 전
let numbers = componentsByOperators(from: input).compactMap { Double($0) }
let operators = input.filter { Double($0.description) == nil }.compactMap { Operator.init(rawValue: $0) }
        
numbers.forEach { formula.operands.enqueue($0) }
operators.forEach { formula.operators.enqueue($0) }
```

```swift
// 개선 후
componentsByOperators(from: input).compactMap(Double.init).forEach(formula.operands.enqueue)
input.compactMap(Operator.init).forEach(formula.operators.enqueue)
```

---
+ ### 고민했던 점
**1. 저장 프로퍼티 클로저 사용**

클로저의 결과값을 상수를 선언하는 동시에 상수에 할당하여 NumberFormatter 인스턴스를 설정해주었습니다.

이 방법을 사용하면 따로 메서드를 만들어서 적용해주는 것보다 관련있는 코드를 한곳에 모아서 가독성이 향상된다는 장점이 있습니다.

- 클로저를 사용하는 방법
```swift
class DecimalNumberFormatter {
    static let shared: NumberFormatter = {
        var instance = NumberFormatter()

        instance.roundingMode = .ceiling
        instance.numberStyle = .decimal
        instance.maximumFractionDigits = 20

        return instance
    }()
}
```
- 메서드를 사용하는 방법
```swift
class DecimalNumberFormatter {
    static let shared: NumberFormatter = NumberFormatter()

    static func initFormatter() {
        shared.roundingMode = .ceiling
        shared.numberStyle = .decimal
        shared.maximumFractionDigits = 20
    }
}
```

**2. DecimalNumberFormatter 역할 분리**

numberFormatter 를 Calculator 클래스에서 따로 분리했습니다.
이전 코드에서는 Calculator 클래스가 numberFormatter을 프로퍼티로 가지고 있고, 이니셜라이저에서 numberFormatter의 속성들의 기본값을 설정해주는 방식을 사용했습니다. 그러나, 숫자 형식을 설정하는 기능을 가진 객체를 연산을 하는 기능을 담당하는 Calculator가 가지고 있어야하나? 라는 생각에 역할을 분리하였습니다.

분리 전 : Calculator 클래스의 프로퍼티로 존재
```swift
class Calculator {
    //코드 생략
    private let numberFormatter = NumberFormatter()
    
    init( 코드 생략 ) {
        //코드 생략
        self.initNumberFormatter()
    }
    
    // 코드 생략
    
    private func initNumberFormatter() {
        numberFormatter.roundingMode = .ceiling
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
    }
}
```

분리 후 : 별도의 클래스로 존재
```swift
class DecimalNumberFormatter {
    static let shared: NumberFormatter = {
        var instance = NumberFormatter()
        
        instance.roundingMode = .ceiling
        instance.numberStyle = .decimal
        instance.maximumFractionDigits = 20
        
        return instance
    }()
}

```



그리고, 추후 계산기의 기능이 확장되면 또 다른 numberFormatter가 필요할지도 모른다는 생각에 NumberFormatters 그룹을 생성하여 DecimalNumberFormatter을 넣어주었습니다.

**3. 커스텀 뷰 생성(ExpressionStackView, CalculatorItemLabel)**

커스텀 뷰를 만들 수 있는 두가지 방법을 생각해보았습니다.
1. 프로퍼티를 가진 커스텀 뷰
2. 메소드를 통한 subView 생성

두 방식 모두 프로퍼티나 이니셜라이져의 매개변수를 보고 어떤 subview를 가지는지 판단할 수 있고 동일한 동작을 하고 있습니다.

둘 중 프로퍼티를 가진 커스텀 뷰를 채택한 이유는
추후에 커스텀 뷰의 subview에 접근해야하는 기능이 추가된다면 프로퍼티를 가진 커스텀 뷰가 추가 기능에 대응하기 편하기 때문입니다.
``` swift
// 1. 프로퍼티를 가진 커스텀 뷰
class ExpressionStackView: UIStackView {
    private let operandLabel = CalculatorLabel()
    private let operatorLabel = CalculatorLabel()
    
    // 코드 생략
}
```

``` swift
// 2. 메소드를 통한 subView 생성
class ExpressionStackView: UIStackView {
    convenience init(operator: String, operand: String) {
        self.init()
        let operatorLabel = makeLabel(with: `operator`)
        let operandLabel = makeLabel(with: operand)
        setUpExpressionStackView(operator: operatorLabel, operand: operandLabel)
    }
    // 코드 생략
    private func makeLabel(with text: String?) -> UILabel {
        let label = UILabel()

        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.text = text

        return label
    }
}
```

**4. 양방향 델리게이트**

---
+ ### 트러블 슈팅
**1. Struct? forEach?**

forEach 구문에서 함수 자체를 매개변수로 받는 경우

```swift
struct CalculatorItemQueue<T>() {...}

let items = [1,2,3,4,5]
var queue = CalculatorItemQueue<Int>()
items.forEach { queue.enqueue($0) } // 문제 없음.

// items.forEach(queue.enqueue) //Partial application of 'mutating' method is not allowed 

```

forEach 구문에서 CalculatorItemQueue가 Struct라서 Partial application of 'mutating' method is not allowed 다음과 같은 컴파일 에러가 발생했습니다. (mutating 키워드는 명시되어 있습니다.)

따라서 CalculatorItemQueue를 Class로 변경해서 문제를 해결했습니다.

forEach를 클로저를 사용하면 클로저 내부에서 캡처가 일어나고 값 타입이 참조 타입으로 바뀌어 문제 없이 값 타입의 데이터를 변경할 수 있는게 아닌가 추측하고 있습니다.
