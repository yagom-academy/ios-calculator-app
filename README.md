## 💾 계산기 프로젝트

- 프로젝트 기간: [3주] 2021-11-08(월) ~ 2021-11-26(금)

- Contributor: 예거(@Jager-yoo)

- Reviewer: 흰(@daheenallwhite)

<br>

## 📱 기능 시연

- 기본 상태 (숫자 0 만 존재하는 상태) 에서는 `[0] 버튼`이나 `[00] 버튼`을 눌러도 숫자가 추가되지 않습니다.

- 기본 상태에서는 `[연산자] 버튼`을 변경할 수 있습니다.

- 입력창에 `소수점(Decimal Point)`이 이미 존재한다면, `[.] 버튼`을 눌러도 소수점이 다시 찍히지 않습니다.

- 불필요한 소수는 자동으로 삭제됩니다. (ex. 25.000 -> 25 / 100.25 -> 100)

- `[=] 버튼`으로 출력되는 결과값에는 `천단위 콤마(,)`가 적용됩니다.

- 숫자 0 으로 나누는 경우, `NaN`이 출력되고, NaN 에는 어떤 연산을 적용해도 다시 NaN 이 출력됩니다.

- 누적된 연산이 화면 길이를 넘어가면, 새로운 연산이 추가될 때마다 `화면이 스크롤의 최하단으로 이동`합니다.
동시에 `스크롤 인디케이터`가 반짝이며 사용자에게 스크롤의 존재를 알립니다.

- 사용자는 터치로 `스크롤` 기능을 사용할 수 있으며, 누적된 연산 기록을 확인할 수 있습니다.

- `[CE] 버튼`을 누르면 입력창의 숫자가 0 으로 초기화됩니다.

- `[AC] 버튼`을 누르면 입력창 숫자 뿐만 아니라, 누적된 모든 연산과 StackView 가 초기화됩니다.

- 모든 버튼에는 [Selection 햅틱 피드백](https://developer.apple.com/documentation/uikit/uiselectionfeedbackgenerator)을 적용하여, 사용자의 버튼 터치 경험을 향상시켰습니다.

https://user-images.githubusercontent.com/71127966/143849158-e35a7fb0-395b-4ce5-863f-7fc73358be99.mp4

<br>

## 📍 UML

![image](https://user-images.githubusercontent.com/71127966/143765070-8d787531-afd3-445c-9ab8-38d29577908f.png)

- <계산기> 프로젝트의 요구사항에서 제시된 전체 `UML`을 준수하며 개발했으며, 추가된 내용은 `클래스 다이어그램`에 추가해서 직접 그렸습니다.

- CalculateItemQueue 구조체의 `제네릭`이 프로토콜을 준수하고 있지만, 이는 외부에서 주입되는 요소이기 때문에, UML 에서 `실체화 관계`(Realization)로 연결하지 않았습니다.

- 반면 Operator 와 Double 타입은 CalculateItem 프로토콜을 준수하고 있으므로 `실체화 관계`로 연결했습니다.

- Formula 구조체의 프로퍼티는 CalculateItemQueue 타입을 참조하므로 `직접 연관 관계`(Directed Association)로 연결했습니다.

- ExpressionParser 열거형의 `parse` 메서드가 Formula 타입을 생성하고 리턴하기 때문에, Formula 구조체와 `의존 관계`(Dependency)로 연결했습니다.
parse 메서드의 호출이 끝나면 Formula 구조체와의 관계가 마무리됩니다.

- private, private(set) 접근제어가 붙은 프로퍼티나 메서드에는 `-` 기호를 붙였습니다. internal 접근제어는 아무 기호도 붙이지 않았습니다.

- 타입 프로퍼티/메서드(static)에는 `밑줄(underline)`이 들어간다는 걸 [UML Class Diagrams Reference](https://www.uml-diagrams.org/class-reference.html) 에서 확인했습니다.
그래서 ExpressionParser 열거형의 두 메서드에는 밑줄을 적용했습니다.

- 요구사항을 살펴보다가, CalculateItem 프로토콜과 Double extension 의 클래스 상자 제목 부분이 _**이탤릭체(italic)**_ 로 되어있는 걸 발견했습니다.
[UML Class Diagrams Reference](https://www.uml-diagrams.org/class-reference.html) 을 검색해보니, `추상화 클래스`의 제목은 _이탤릭체_ 로 표기한다는 내용이 있더라구요.
위 UML 에서, CalculateItem 프로토콜과 Double extension 은 둘 다 비어있고 추상화를 위해서만 사용되므로, _이탤릭체_ 로 표기했습니다.
  - > [Abstract Class] The name of an abstract class is shown in italics.

<br>

## 🛠 중요 구현 내용

### ✅ 자주 호출되는 상수를 기본 타입의 extension 의 타입 프로퍼티로 선언

- 네임스페이스를 위한 열거형을 따로 만들지 않고, 기본 타입의 `extension`을 활용해 호출 시 가독성을 높였습니다.

- ViewController 뿐만 아니라, 모든 파일에서 `하드코딩`을 단 한 번도 사용하지 않았습니다.

```swift
extension Character {
    static let whiteSpace: Character = " "
}

extension String {
    static let empty: String = ""
    static let zero: String = "0"
    static let decimalPoint: String = "."
    static let decimalComma: String = ","
    static let negativeSign: String = "-"
}
```

<br>

### ✅ ViewController 세팅에 필요한 메서드는 별도 열거형의 타입 메서드로 분리

- `NumberFormatter 세팅`, `Label Attributes 세팅`, `스크롤 하단 이동 메서드`, `햅틱 피드백 메서드` 와 같이 굳이 ViewController 에 위치할 필요가 없는 메서드를 별도의 열거형 파일로 분리했습니다.

```swift
enum CalculatorSetting {
    static func formatNumber(_ input: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .halfUp
        return numberFormatter.string(for: input) ?? String.empty
    }
    ...
}
```

<br>

### ✅ 비슷한 기능의 버튼은 하나의 @IBAction 메서드에 연결

- 대표적으로, 계산기의 `[1 ~ 9] 숫자 버튼`을 하나의 IBAction 메서드에 연결하고 파라미터로 들어오는 `UIButton` 타입의 `currentTitle 프로퍼티`를 활용해서 어떤 숫자 버튼이 눌려도 대응이 가능하도록 구현했습니다.

<p align="center"><img src="https://user-images.githubusercontent.com/71127966/143768821-7731fa0b-af8a-48e0-b9cd-4e583e24d82f.png" width="60%"></p>

```swift
@IBAction func tappedOperandButton(_ button: UIButton) {
    guard var operandLabelText = operandLabel.text,
          let buttonTitle = button.currentTitle else { return }
        
    if operandLabelText == String.zero {
        operandLabelText = String.empty
    }
        
    operandLabel.text = "\(operandLabelText)\(buttonTitle)"
}
```

<br>

### ✅ Scroll Indicator 의 가시성을 높이고 숫자를 가리지 않도록 attributes 변경

- 스토리보드에서 ScrollView 의 `indicatorStyle` 을 `white`로 변경하여 어두운 배경에서 눈에 더 잘 띄는 흰색으로 변경했습니다.

- 스토리보드에서 `scrollIndicatorInsets` 프로퍼티에 Right 350pt 부여해서 Scroll Indicator 가 숫자를 가리지 않도록 화면의 왼쪽으로 이동시켰습니다.

<p align="center"><img width="60%" alt="Scroll Indicator 더 잘 보이게 변경" src="https://user-images.githubusercontent.com/71127966/143805516-4204c52e-89f4-42e0-ba3f-bf1b6a310ea4.png"></p>

<br>

### ✅ 나눗셈 메서드에서 숫자 0 으로 나누는 경우, 에러를 던지기 보다는 Double.nan 을 반환하도록 구현

- 0 으로 나누는 경우, 에러를 던지기 보다는 간단하게 `Double.nan`이 반환되도록 만들어서 코드 가독성을 높였습니다.

- 숫자 0 을 표현할 때, 하드코딩을 피하기 위해 `Double.zero`를 사용했습니다.

- Double.nan 을 String 타입으로 출력하면 "nan" 이 나오지만, `numberFormatter` 를 통해 numberStyle 프로퍼티를 `decimal`로 설정하면 String 타입으로 출력 시, `"NaN"` 으로 나옵니다.

```swift
private func divide(_ lhs: Double, _ rhs: Double) -> Double {
    switch rhs {
    case .zero:
        return Double.nan
    default:
        return lhs / rhs
    }
}
```

<br>

### ✅ 빈 프로토콜과 제네릭 타입을 활용하여, 특정 타입만 인스턴스로 만들어질 수 있도록 구현

```swift
// 빈 프로토콜 CalculateItem 선언
protocol CalculateItem {}

// Double 타입의 extension 만들어서 프로토콜 준수시킴
extension Double: CalculateItem {}

// Operator 열거형 프로토콜 준수시킴
enum Operator: CalculateItem {
    case ...
}

// '제네릭'이 프로토콜을 준수하게 만들어서, Double 타입과 Operator 타입만 들어올 수 있도록 구현
struct CalculatorItemQueue<Element: CalculateItem> {
    private(set) var queue: [Element] = []
    ...
}
```
