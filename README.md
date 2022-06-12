## 계산기2 - Derrick, Finnn

## [Step 01]

# 공부한 내용
> NaN, ExpressibleByArrayLiteral, UIStackView 

### NaN (feat. NumberFormatter)
> Not a number :
수치 연산을 할 때, 정상적인 값을 얻지 못할 때 출력되는 값
> 일반적으로는 'nan'를 출력하지만, NumberFormetter을 거칠 경우 'NaN'으로 변환된다.

```swift
print(Double.nan) // nan

let numberFormatter = NumberFormatter()
numberFormatter.string(from: NSNumber(Double.nan)) // NaN
```

> NumberFormatter :
숫자를 텍스트로 변환하면서 다양한 포멧 형식을 설정해줄 수 있는 클래스

```swfit
import Foundation

extension Double: CalculateItem {
    func removeTrailingZero() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesSignificantDigits = true
        // 소숫점 20자리로 제한
        numberFormatter.maximumSignificantDigits = 20
        // 숫자 형식을 demical 로 세팅
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
```

### ExpressibleByArrayLiteral
> 배열 리터럴을 사용할 수 있도록 해주는 기능으로 CalculatorItemQueue<Double>를 Default 값을 빈 배열로 설정하기 위해 사용하였습니다. 


```swift
struct Formula {
    var operands: CalculatorItemQueue<Double> = []
    var operators: CalculatorItemQueue<Operator> = []
}

extension CalculatorItemQueue: ExpressibleByArrayLiteral {
    convenience init(arrayLiteral elements: T...) {
        self.init()
        
        elements.forEach {
            self.enqueue($0)
        }
    }
}
    
```

### CalculatorStackView
> UIStackView내에 생성될 UILabel 파일로 분리하여 진행 하였습니다. 

```swift
final class CalculatorStackView: UIStackView {
    init(`operator`: String?, operand: String?) {
        super.init(frame: .null)
        setLabels(with: `operator`, and: operand)
        setDefaultAttribute()
    }
}
```

## [Step 02]
# 코드 리뷰 (작업 단위 피드백)

## 배경
[계산기 II 요구사항](https://camp.yagom-academy.kr/camp/61d414e5e4081120ba7884d2/projects/6279f92586f2cb44234dca46)

### Step 2 : 리팩터링
- 기존의 코드를 리팩터링 해봅니다.
- 리팩터링은 모둠끼리 자율로 진행합니다.
- 이름을 변경하고 싶은 요소가 있으면 이름을 변경합니다.
- 기능과 역할을 분리하고 싶은 타입을 분리해봅니다.
- 리팩터링을 진행하면서 지속적으로 유닛 테스트로 코드의 동작을 검증합니다.
- 제네릭을 활용하여 큐를 범용적인 타입으로 구현해봅니다.


## 작업 내용
- NaN이 결과값으로 반환되고 연산자 클릭시 NaN이 StackView로 올라가지 않는다
- 0.00 소수점에서 plusMinus Sign 버튼 클릭시에도 -0으로 되지 않도록 수정
- StackView를 Extension 파일로 따로 구현
- CalculatorViewController의 연산 기능 & Sign 기능 UITest


## 테스트 방법
UI관련 코드를 테스트하기 위해서 UI Test로 진행했습니다.
```swift
class CalculatorUITests: XCTestCase {
    func test_1과1을_더해서_2가나온다()
    func test_2과_4를_곱해서_8이_반환된다()
    func test_6을_3으로_나눠서_2를_반환한다()
    func test_3에서_10을_빼서_마이너스7를_반환한다()
    func test_3빼기_1_중_All_Clear_를_누르면_다_지워진다()
    func test_사칙연산중에_clear_entry_버튼으로_마지막_피연산자를_제거한다()
    func test_3_더하기_마이너스_3은_0을_반환한다()
    func test_10_나누기_0_은_NaN을_반환한다()
    func test_결과값_NaN이_반환되고_연산자클릭시_Stack에_쌓이지_않는다()
    func test_0에_minus부호가_붙지않는다()
    func test_0에서_소수점_00일때_마이너스부호가_붙지않는다()
}
```

## 리뷰 노트
> ViewController에서 UI상으로 작동한 부분들에 대한 Test 코드를 구현해보기 위해 노력하였습니다. 
1. UITest를 작성할 경우, app.buttons 또는 app.staticTexts 메서드 등으로 엘리먼트에 접근할 수 있었는데요, 만약 지금 계산기 프로젝트와 같이 동적으로 뷰를 생성하는 경우(ScrollView에 StackView를 생성)에는 해당 엘리먼트에 어떻게 접근할 수 있는지 궁금합니다 🤔

2. UITest 진행중에 OpteratorLabel = "" 빈 문자열로 설정 되있는 경우 app.staticTexts["OperatorLabel"]을 한 경우 해당 id를 찾지 못하는 상황이 있는데 왜 그런것 일까요?

3. 2번 질문에 대해서 저희가 얘기해 본 결과, Label 안에 String 값이 "" 과 같이 비어있는 경우에 내부적으로 앱 최적화를 위해서 해당 Label이 사용되기 전까지는 생성하지 않는다고 판단을 했습니다. (마치 lazy 처럼) 이렇게 생각하는 것이 맞을까요? 🙏


## 스크린샷
|0소수점|NaN|+-÷x|
|:-:|:-:|:-:|
|![](https://i.imgur.com/2WkrJVa.gif)|![NaN](https://i.imgur.com/mk8SGyA.gif)|![](https://i.imgur.com/WuP7fja.gif)
|

