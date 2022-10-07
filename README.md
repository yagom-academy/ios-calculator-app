# 계산기 II 

## iOS 커리어 스타터 캠프

### 계산기II 프로젝트 저장소

목차
1. [제목](#제목)
2. [소개](#소개)
3. [타임라인](#타임라인)
4. [트러블 슈팅](#트러블-슈팅)

# 제목
계산기II 프로젝트
## 소개
계산기를 구현하는 프로젝트 입니다.
|<img src="https://user-images.githubusercontent.com/71054048/188081997-a9ac5789-ddd6-4682-abb1-90d2722cf998.jpg" width=175>|<img src="https://i.imgur.com/ydRkDFq.jpg" width=200>|
|:---:|:---:|
|인호|하모|

## 타임라인
시간 순으로 프로젝트의 주요 진행 척도를 표시
| 날짜 | 중요 진행 상황 | 코드 관련 사항
|---|---|---|
|10/3| `STEP1` 시작, `인호`와 `하모`코드 병합 | `LinkedList`의 `isEmpty`프로퍼티로 수정, `Formula`타입의 `result`메서드 수정
|10/4| 코드 병합 및 리팩토링 | `guard`문 컨벤션 수정, 부호 변환 기능 버그 수정
|10/5| 코드 리팩토링 | 뷰컨트롤러의 접근권한 수정, `do-catch`구문 바디 수정, 스택뷰에 spacing추가, `layoutIfNeeded` 위치 수정
|10/6|`STEP2` 시작 및 리팩토링 | `LogStackView`의 이니셜라이저 수정, 소수점 뒤 0처리 로직 추가, `splitByDot`메서드 구현
|10/7| 코드 리팩토링 | `Formula`의 `result`리턴타입 `Double`로 수정, 테스트케이스 추가, `numberFormatter`인스턴스 생성 위치 수정

## 트러블 슈팅
### Custom StackView Class 구현
<details>
<summary>펼치기</summary>

- 커스텀한 StackView를 만들기 위해서 LogStackView 클래스를 선언하고 UIStackView를 상속받는다.
클래스 타입에서 이니셜라이저를 위임에 대한 규칙이 존재하는데

1. 지정된 이니셜라이저는 상위 클래스로 부터 지정된 이니셜라이저 구문을 호출해야 한다!!
2. 편의 이니셜라이저는 같은 클래스로 부터 다른 이니셜라이저를 호출해야만 한다.
3. 편의 이니셜라이저는 궁극적으로 지정된 이니셜라이저를 호출해야 한다.

#### UIStackView 지정된 이니셜라이저

- `init(frame: CGRect)`
    - UIView의 지정된 이니셜라이저이다. UIStackView는 UIView를 상속받고 있고 구현부를 보면 해당 이니셜라이저가 선언되어있는데 구현부에서 override가 생략되어있다고 생각을 된다.(이유 있음)
    - 지정된 프레임으로 할당된 View 객체를 초기화하고 반환하는 이니셜라이저이다.
    - 파라미터인 frame은 포인트로 측정된 View의 프레임이다. 프레임의 원점은 추가하려는 상위 뷰를 기준으로 하고 이 방법은 프레임 사각형을 사용하여 그에 따라 중심 및 경계 속성을 설정한다.
    - 프로그래밍 방식으로 View의 객체를 만드는 경우에 사용되는 UIView 클래스의 지정된 이니셜라이저이다.
    - 하위 클래스에서 재정의할 수 있고 구현 시작 시 super를 호출해야 한다.
- `init(coder: NSCoder)`
    - NSCoding 프로토콜은 해당 클래스의 인스턴스가 인코딩, 디코딩될 수 있도록 클래스가 구현해야 하는 두 가지 메서드를 선언하는데 그중 하나가  `init?(coder: NSCoder)` 이다.
    - 해당 프로토콜을 준수하는 클래스에서 프로토콜이 요구하는 이니셜라이저를 구현할 수 있는데 지정, 편의 이니셜라이저 모두 required 키워드를 붙여줘야한다.
    - 해당 이니셜라이저는 지정된 unarchiver의 데이터에서 초기화된 객체를 반환한다.
    - 인터페이스 빌더를 사용하여 인터페이스를 디자인하는 경우, nib 파일에서 view 객체를 로드할 때 해당 이니셜라이저를 사용하여 초기화한다.
    - nib 파일에 저장된 속성과 일치하도록 view의 속성을 수정한다.
    
    간단 요약하자면 첫번째 이니셜라이저는 코드로 뷰를 만들때, 두번째 이니셜라이저는 인터페이스 빌더로 뷰를 만들때라고 생각된다.
    

클래스에서는 안전 점검을 기반으로 2단계 초기화를 수행하는데 1단계 초기화의 경우 클래스 계층의 최상위 체인까지 도달하여 모든 프로퍼티가 값을 가지고 있다고 확인이 되어야 통과한다.
따라서 직접 만든 커스텀 클래스에서 상속계층에 있는 상위 클래스의 지정된 이니셜라이저를 호출해주어야한다.

☠️ 문제의 코드

```swift
final class LogStackView: UIStackView {
    private let operandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let operatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    init(operand: String, arithmeticOperator: String) {
        operandLabel.text = operand
        operatorLabel.text = arithmeticOperator
        super.init(arrangedSubviews: [operatorLabel, operandLabel])
        addSpacing()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addSpacing() {
        self.spacing = CalculatorConstant.logStackViewSpacing
    }
}
```

여기서 의문점은
`init(operand: String, arithmeticOperator: String)` 의 내부에 보면 `super.init(arrangedSubviews: [operatorLabel, operandLabel])` 를 호출하는게 보인다.
근데 해당 이니셜라이저의 구현부를 살펴보면 
```swift
public convenience init(arrangedSubviews views: [UIView])
```
편의 이니셜라이저이다.

규칙 1, 2번을 다시보면
지정된 이니셜라이저는 상위 클래스로 부터 지정된 이니셜라이저 구문을 호출해야 한다!!

편의 이니셜라이저는 같은 클래스로 부터 다른 이니셜라이저를 호출해야만 한다.
1, 2번 규칙을 정확하게 위배한다.
(이게 왜 되는 건지는 모르겠다..)

#### LogStackView 클래스의 초기화를 다양한 방법으로 구현.

첫번째는 이니셜라이저를 다 지워도 만들 수 있다!!
```swift
final class LogStackView: UIStackView {
    private let operandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let operatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
		func addStackView(operand: String, arithmeticOperator: String) {
        operandLabel.text = operand
        operatorLabel.text = arithmeticOperator
        
        self.addArrangedSubview(operatorLabel)
        self.addArrangedSubview(operandLabel)
        self.spacing = CalculatorConstant.logStackViewSpacing
    }

    func addSpacing() {
        self.spacing = CalculatorConstant.logStackViewSpacing
    }
}
```

모든 프로퍼티에 초기값을 제공하고 있고 초기화 구문을 제공하지 않았기 때문에 자동으로 모든 이니셜라이저를 상속받고 초기화가 가능하다!
```swift
import UIKit

final class LogStackView: UIStackView {
    private let operandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let operatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    convenience init(operand: String, arithmeticOperator: String) {
        self.init(frame: .zero)
        operandLabel.text = operand
        operatorLabel.text = arithmeticOperator
        [operatorLabel, operandLabel].forEach(addArrangedSubview(_:))
        addSpacing()
    }
    
    func addSpacing() {
        self.spacing = CalculatorConstant.logStackViewSpacing
    }
}
```

위 코드에서도 지정된 이니셜라이저가 없기 때문에 자동으로 상위 클래스의 이니셜라이저를 상속받게 된다.  
클래스의 초기화 상속, 초기화 2단계 프로세스등을 공부하여 문제를 해결할 수 있었다.

</details>

### ScrollView를 코드를 이용하여 밑으로 스크롤하는 기능
<details>
<summary>펼치기</summary>

- 계산기의 연산이 추가되면서 스크롤뷰의 내부 컨텐츠가 `scrollView`의 `bounds`를 초과하게 되는데, 이때 코드를 이용하여 `scrollView`의 맨하단을 보여주는 기능을 구현했다.

```swift
private func updateLogScrollViewContentOffset() {
    logScrollView.layoutIfNeeded()
    let contentOffset = CGPoint(
        x: 0,
        y: logScrollView.contentSize.height - logScrollView.bounds.height
    )
    logScrollView.setContentOffset(contentOffset, animated: true)
}
```
    
<img src="https://i.imgur.com/1ET9LA3.jpg" width=200>

- `setContentOffset`이라는 메서드로 스크롤뷰의 `contentOffset`을 설정해주는 것인데 이때 파라미터로 `CGPoint` 즉 x, y로 얼마만큼 오프셋 시킬건지를 전달받는다.
위 예제 그림과 똑같은데, 컨텐츠뷰의 높이와 스크롤뷰의 높이를 뺀값 만큼 offSet을 적용한다.

**layoutIfNeeded()메서드 사용**
- 스크롤뷰 내에 스택뷰를 추가하면서 뷰의 업데이트가 일어나는데, 일반적으로 뷰의 업데이트는 바로 적용되는게 아니라, 다음 drawing cycle을 기다린 후에 일괄적으로 적용된다.
- 이때 뷰를 바로 업데이트 하기 위해서는 `layoutIfNeeded`메서드를 이용해야 한다.
- `layoutIfNeeded`의 호출 위치에 대해서 의문인 점이 있었는데 아래 코드의 위치에서 호출해야하고, 주석부분에서 호출하면 적용이 되지 않는다.
그 이유는 이미 새로운 stackView가 scrollView에 추가가 되었고, 추가된 뷰 높이가 반영되도록 업데이트 후에 뷰의 높이 차를 이용하여 contentOffset을 계산해야하기 때문이다.
```swift
logScrollView.layoutIfNeeded()
let contentOffset = CGPoint(
    x: 0,
    y: scrollView.contentSize.height - scrollView.bounds.height
)
//logScrollView.layoutIfNeeded()
```
</details>

### `NumberFormatter`로 인해 소수점과 0이 사라지는 오류 수정
<details>
<summary>펼치기</summary>
  
- `12.00`과 같은 숫자가 입력중일때에 numberFormatter에 적용되는 과정에서 소수점이 사라져서 `12.001`같은 입력을 못하는 문제가 있었다.
- 이를 해결하기 위해 소수점을 포함하고 있다면 정수부분과 소수부분을 분리하여, 정수부분에 대해서만 numberFormatter를 적용하도록 수정했다.
- 정수부분과 소수부분을 분리하는 코드는 `StringExtension`으로 분리하여 구현했다..
```swift
if isDotButtonTapped {
    let (integerPart, decimalPart) = operand.splitByDot()

    operandLabel.text = integerPart.formatStyleToDecimal(numberFormatter) + CalculatorConstant.dot + decimalPart
} else {
    operandLabel.text = operand.formatStyleToDecimal(numberFormatter)
}

func splitByDot() -> (String, String) {
    guard self.contains(Character(CalculatorConstant.dot)) else {
        return (self, CalculatorConstant.blank)
    }
        
    let decimalNumberComponents = self.split(separator: Character(CalculatorConstant.dot),
                                                 omittingEmptySubsequences: false)
    let integerPart = decimalNumberComponents[0].description
    let decimalPart = decimalNumberComponents[1].description
        
    return (integerPart, decimalPart)
}
```

    
</details>

### 여러 피연산자 버튼의 `IBAction`관리 방법
<details>
<summary>펼치기</summary>
    
- `하모`의 코드에서는 피연산자 버튼이 구분되어야 하는 조건에 따라 분리되어 있어서 조건을 관리하기에는 용이하지만 중복되는 코드가 여러번 등장했다. (숫자버튼, 0버튼, 00버튼, 쉼표버튼)
- `인호`의 코드에서는 피연산자 버튼을 하나의 `IBAction`에 연결한 대신, 입력이 반영되는 부분의 코드가 방대해졌다.
- 방향성이 다른 두 코드를 합치기 위해 사용한 방법은 `인호`의 코드처럼 여러 피연산자를 하나의 `IBAction`에 연결하고 `Button`의 `tag`값이용하고, 조건을 확인해야 하는 부분에서는 `하모`의 코드처럼 연산 과정에 필요한 `Bool`타입 프로퍼티를 생성해서 상대적으로 간결하게 조건을 확인할 수 있게 됐다.

```swift
private var isDotButtonTapped: Bool = false
private var isFirstInput: Bool = true
private var isCalculated: Bool = false
    
@IBAction private func operandButtonTapped(_ sender: UIButton) {
    guard !isCalculated else {
        return
    }
        
    switch sender.tag {
    case 0 where !operand.isEmpty:
        updateOperandLabel(with: sender.tag.description)
    case 1...9:
        updateOperandLabel(with: sender.tag.description)
    case 10 where !operand.isEmpty:
        updateOperandLabel(with: CalculatorConstant.doubleZero)
    ...
    default:
        return
    }
        
    isFirstInput = false
}
```
    
</details>

### `switch`문의 `case`에 `where` 적용
<details>
<summary>펼치기</summary>

   - `switch`문의 `case`에서 조건을 확인하고 싶을때, 케이스 내부에서 확인하는 대신 `where`을 적용해서 더 간결하고 가독성이 좋게 수정했다.
```swift
//기존 코드
switch sender.tag {
    case 0:
        guard !operand.isEmpty else { return }
            
        updateOperandLabel(with: sender.tag.description)
    ...
    default:
        return    
}
//수정된 코드
switch sender.tag {
    case 0 where !operand.isEmpty:
        updateOperandLabel(with: sender.tag.description)
    ...
    default:
        return
}
```
 
    
</details>

### ExpressionParse parse메서드 내부 로직에 고차함수로 수정
<details>
<summary>펼치기</summary>
       
- `input`문자열을 분석하여 `operator`과 `operand`로 분리할때, 조건문과 반복문, 배열 변수 대신 `compactMap`, `filter`, `forEach`고차함수를 사용한다.
```swift
let splitArray = componentsByOperators(from: input)
        
splitArray.compactMap { Double($0) }
          .forEach { operands.enqueue($0) }
        
splitArray.filter { $0.count == 1 }
          .compactMap { Operator(rawValue: Character($0)) }
          .forEach { arithmeticOperators.enqueue($0) }
```

</details>

