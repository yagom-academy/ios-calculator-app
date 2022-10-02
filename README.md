# 🧮 계산기

## 📖 목차
1. [소개](#-소개)
2. [Tree](#-tree)
3. [고민한 점](#-고민한-점)
4. [타임라인](#-타임라인)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

## 🌱 소개

`mene` 가 만든 계산기 앱입니다.

- 사용자는 숫자와 연산기호를 터치하여 원하는 연산을 입력하고, 결과를 확인합니다
- 연산 버튼의 기능은 다음과 같이 작동합니다.
    - `AC(All Clear)`: 모든 연산 내역을 삭제합니다.
    - `CE(Clear Entry)`: 입력하던 숫자 또는 연산 결과를 삭제합니다.
    - `+/-` : 입력 중인 숫자의 부호를 변경합니다.
    - `=` : 연산 결과를 확인합니다.
- 연산자 우선순위는 무시하고 입력한 순서대로 처리합니다.

- KeyWords

  - `Queue`
      - `Array`, `Double Stack Queue`, `Linked List`
      - `Time complexity` - `O(1)`, `O(n)`
      - `enqueue`, `dequeue`, `peek`, `isEmpty`, `clear`
  - `Generic`, `Element`
  - `Protocol`, `extension`
  - `High Order Functions` - `map`, `reduce`, `filter`
  - `UML`
  - `TDD`, `unit test`
  - `numberFormatter`
  - `UIStackView`, `UIScrollView`

## 🌲 Tree

```
├── Calculator
│   ├── Base.lproj
│   ├── Controller
│   │   ├── AppDelegate.swift
│   │   ├── SceneDelegate.swift
│   │   └── CalculatorVC.swift
│   ├── Info.plist
│   ├── Model
│   │   ├── CalculateItem.swift
│   │   ├── CalculatorItemQueue.swift
│   │   ├── ExpressionParser.swift
│   │   ├── Formula.swift
│   │   └── Operator.swift
│   └── View
│       ├── Assets.xcassets
│       ├── CircleButton.swift
│       │   ├── AccentColor.colorset
│       │   │   └── Contents.json
│       │   ├── AppIcon.appiconset
│       │   │   └── Contents.json
│       │   └── Contents.json
│       └── Base.lproj
│           ├── LaunchScreen.storyboard
│           └── Main.storyboard          
└── CalculatorTests
    ├── CalculatorItemQueueTests.swift
    ├── ExpressionParserTests.swift
    └── FormulaTests.swift
```
 
## 👀 고민한 점

### Step 1

- Queue 자료구조를 어떻게 구현해야할 지 고민했습니다.
  - Array를 사용하여 구현하였다가 `dequeue` 할 때 `removeFirst`를 사용하면 시간복잡도가 O(n)으로 증가하는 문제 때문에 처음 값의 인덱스를 표시해주는 `head` 프로퍼티를 생성하여 dequeue시 nil을 할당해주고 `head`를 이동하는 방법으로 구현했습니다.
  - 리팩토링 시 `reversed`와 `removeLast`, `popLast`의 시간복잡도가 O(1)인 점을 이용하여 2개의 배열을 사용하는 `Double stack queue`로 변경하였습니다.
  - `Linked list`를 이용하여 구현하는 방법도 찾아보았으나 시간복잡도 측면에서는 O(1)로 동일하지만 공간복잡도 측면에서 더블스택이 효율적이라는 사실을 알게 되었습니다. 연결 리스트는 참조를 하기 때문에 더블 스택에 비해 메모리 접근 시간이 상대적으로 느리다는 단점이 있습니다.
  
- `Any`와 `String`중 어떤 것을 큐 테스트에 사용할지 고민해보았습니다.

    제네릭 타입으로 큐를 생성하고, 유닛테스트 시 처음에는 Any로 설정하고 진행하였지만 값을 비교하는 부분에서 `Equatable` 프로토콜을 준수하지 않아 `as?`를 이용하여 타입캐스트하다가 계산기에서는 Double 타입과 연산자를 나타낼 때 사용하는 String 타입으로만으로도 충분할 수 있을 것 같아서 String으로 선언하여 테스트 진행하였습니다.

- TDD를 프로젝트에 처음 사용해보아, 어떤 방법으로 TDD 진행해야 할 지 고민했습니다.
    - `1.실패하는 테스트케이스 작성` ➡️ `2.코드 구현부 작성` ➡️ `3. 여러가지 테스트 케이스에 대응할 수 있도록 리팩토링`의 사이클을 반복하며 구현하였습니다.

### Step 2

- UML 상의 메서드명만 보고 구현해야 해서 타입과 메서드간의 호출순서와 구현로직에 대해 고민해 보았습니다.
    
- 계산 시 0으로 나누는 경우를 어떻게 처리해야 할 지 고민해 보았습니다.
    - 아이폰 계산기에서 0으로 나누어보니 `"오류"`라는 문구가 크게 표시되는 것을 볼 수 있었는데 테스트 케이스의 결과값이 `infinity`로 표시되고 있어서 값이 `Double.infinity`인 경우에는 0으로 리턴하고 나머지 경우에는 나누어진 값을 리턴하도록 구현하였습니다.
    - 요구사항을 다시 확인해 보니 0으로 나누는 경우 "NaN"으르 보여주는 것으로 되어 있어 리팩토링 시 수정하였습니다.

- 고차함수를 사용해 보기 위해 고민해 보았습니다.
    - 그동안 잘 사용하지 않았던 고차함수를 사용해 보기 위해 고민해 보았습니다. 
        - `map`, `filter`, `reduce`, flatMap`, `compactMap`에 대해서 공부하였습니다.

### Step 3

- UIScrollView에서 `setContentOffset`메서드를 이용하여 새로운 식을 입력하는 경우 최하단으로 스크롤 이동 시, 마지막 StackView가 보이지 않는 문제에 대해 고민해 보았습니다.
    - 문제 해결을 위해 찾아보던 중 `View Drawing Cycle`에 대해서 알게 되었고 공부해 보았습니다.

- `numberFormatter`를 사용하여 3자리마다 ,가 표시되고 불필요한 소숫점 뒤쪽의 0을 노출하지 않도록 처리하였는데 소숫점 뒤에 바로 0이 붙어 있는 경우 (`12.0`) 자동으로 정수로 변환되어 노출되다가 0뒤에 숫자가 더해지면 한꺼번에 노출되는 문제를 해결하기 위해 고민해 보았습니다.
    
## ⏰ 타임라인

<details>
<summary>Step 1 타임라인</summary>
    
- **220919**
    - 파일 MVC 구조에 맞추어 재배치
    - `CalculatorItemQueue` 빈 구조체 생성하고 TDD를 위해 `CalculatorItemQueueTests` 파일에 타겟추가
    - 요구사항에 맞추어 빈 프로토콜 `CalculateItem` 추가
    - `CalculatorItemQueue`에서 `CalculateItem` 프로토콜 준수하고 프로퍼티 선언
  
- **220920**   
    - `CalculatorItemQueueTests`파일에서 `count` 메서드 테스트 케이스 구현
    - `CalculatorItemQueueTests` 파일에 `enqueue` 메서드 테스트 구현
    - `CalculatorItemQueueTests`파일에 `isEmpty` 메서드테스트 구현
    - `CalculatorItemQueueTests`파일에 `clear` 메서드 테스트 구현
    - `CalculatorItemQueueTests`파일에 `peek` 메서드 테스트 구현
    - Step1 PR 리뷰 요청
        - [PR보러가기](https://github.com/yagom-academy/ios-calculator-app/pull/314)

- **220921**
    - review 적용하여 리팩토링
    - `CalculatorItemQueue` 인덱스 제거하고 2개의 배열을 이용하여 Queue를 구현하도록 리팩토링
    - `CalculatorItemQueue`가 아닌 요소T가 `CalculateItem` 프로토콜 준수하도록 수정
    - `CalculatorItemQueueTests`파일에서 `count` 연산 프로퍼티로 변경하고 테스트 케이스에서 매직넘버 사용하지 않도록 수정
    - `CalculatorItemQueueTests`파일에서 `isEmpty` 연산 프로퍼티로 변경하고 테스트 케이스에서 매직리터럴 사용하지 않도록 수정
    - `CalculatorItemQueueTests`파일 테스트케이스에서 큐가 비어있는경우 `clear`메서드 호출 케이스 삭제하고 매직리터럴 제거
    - `CalculatorItemQueueTests`파일의 `enqueue` 테스트 케이스에서 매직리터럴 사용하지 않도록 수정
    - `CalculatorItemQueueTests`파일의 1dequeue1 케이스에서 반환타입 사용하지 않도록 `@discardableResult` 지정하고 매직리터럴 제거
    - `CalculatorItemQueueTests`파일의 `peek` 테스트 케이스에서 매직리터럴 제거, 코드 컨벤션 통일
    - `CalculatorItemQueue`에서 clear 메서드 구현방법 removeAll을 사용하도록 수정

</details>
    
<details>
<summary>Step 2 타임라인</summary>   
    
### Step 2

- **220922**
    - `Operator` enum 파일 생성
    - `CalculateItem` 파일에서 Double이 `CalculateItem` 프로토콜 채택하도록 수정
    - `Formula` 구조체 생성
    - `Operator` 파일 메서드 구현
    - `Fomula` 구조체 `result`메서드 구현
    - `Formula` 구조체의 `result`메서드 add부분 테스트케이스 작성 및 테스트
    - `Formula`파일의 `result` 메서드 구현 로직 수정
    - `Operator` 파일의 calulate 메서드 수정
    - `CalulatorTests` 폴더 생성하고 테스트폴더 이동
    - `Formula`파일의 `result`메서드 테스트코드 작성 및 테스트
    - `ExpressionParser` 열거형 파일 생성 및 Tests 코드 작성
    
- **220923**
    - ExpressionParser 구조체의 componentsByOperators 메서드 테스트 및 구현로직 수정
    - ExpressionParser의 parse메서드에서 operatorsQueue 직접 생성하도록 로직 수정
    - `String` 익스텐션 `split` 메서드 구현하고 CalculatorItemQueueTests에서 Double 사용
    - `Operator` 구조체의 `divide` 메서드에 0으로 나누었을때 처리하고 테스트케이스 추가
    - 테스트를 위해 풀어두었던 `ExpressionParser`의 `componentsByOperators`메서드 `private`으로 재설정
    - Step2 PR 리뷰 요청
        - [PR보러가기](https://github.com/yagom-academy/ios-calculator-app/pull/341)
    - 함수 한줄 리턴의 경우 return 키워드 제거

</details>
 
<details>
<summary>Step 3 타임라인</summary>   
    
### Step 3

- **220926**
    - 뷰컨트롤러 이름 `CalculatorVC`로 변경하고 UI초기화 하는 `resetAllUI` 함수 구현
    - 숫자패드 터치 시 `operandLabel`에 노출하는 `numberButtonTouchUp` 함수 구현
    - ac 버튼 클릭 시 화면을 리셋하는 `acButtonTouchUp` 함수 구현
    - 부호 변환하는 `convertPlusMinusButtonTouchUp` 함수 구현
    - 이미 소숫점이 입력되어 있는 경우 "."버튼을 클릭하여도 입력되지 않도록 리팩토링
    - 시작 시, 바로 .을 입력하는 케이스를 위해 최초 0을 입력하고 숫자 입력 시 0이 지워지도록 수정
    - 버튼 클릭 시 currentNumber에 담지 않고 레이블에만 출력하던 오류 수정
    - 아무것도 입력되지 않았을 때 .을 누르는 경우 "0."으로 표시되도록 수정
    - 계산식 추가를 위한 레이블을 생성하는 `makeOperatorLabel` / `makeOperandLabel` 함수 생성
    - 부호버튼 클릭 시 스크롤뷰에 스택뷰를 추가하는 `makeFormulaStackView` 함수 구현
    - 새로운 식 추가 시, 스크롤 하단으로 이동시켜주는 `scrollToBottom` 함수 구현
    - `=` 버튼 클릭 시 마지막 currentNumber값이 finalFormula에 저장되도록 수정
    - `touchUpOperatorButton` 함수에서 연산자부호가 값이 먼저 다 바뀐 후에 적용되도록 수정

- **220928**
    - 0 으로 나누었을때 Double.nan을 반환하도록 수정
    - `touchUpOperatorButton`함수에서 0일때 연산자 클릭 시 레이블 변경되도록 수정
    - 0 으로 나누는 경우 레이블에 "NaN" 노출되도록 수정
    - 자릿수 구분을 위한 numberFormatter 함수 구현
    - `touchUpDotButton`함수에서 마지막이`.` 일때 `.`표시되도록 수정
    - `touchUpEqualButton`함수에서 연산후 `=` 버튼을 다시 눌러도 재연산되지 않도록 수정
    - 버튼 원형으로 바꾸기 위한 CircleButton 클라스 생성하고 디자인 적용
    - Step3 PR 리뷰 요청
        - [PR보러가기](https://github.com/yagom-academy/ios-calculator-app/pull/381)
    
- **220930**
    - 소숫점 이하 숫자 표시를 위한 `noneNumberFormatter` 생성
    - 소숫점 뒤의 0이 노출되지 않는 문제 해결을 위해 정수부와 소수부를 분리하여 출력하도록 수정
    - `12.0`과 같이 소수점영역이 0인경우 정수값으로 표시되는 오류 수정
    - 결과값이 infinity이거나 Nan인 경우 "NaN"이 노출되도록 예외추가
    
- **221002**
    - 스택뷰 생성시 레이블을 만들어주는 작업을 `makeLabel` 하나로 변경하고 각각 호출하여 사용하도록 수정
    - touchUpEqualButton 함수에서 가독성을 위해 `!`대신 `.isEmpty == false`로 수정
    - CalculatorFormatter 싱글턴으로 생성하고 사용하도록 리팩토링
    - UIButton text extension 생성하여 적용
 
 </details>
    
## 📱 실행 화면

|![](https://i.imgur.com/ul1GNhv.gif)|![](https://i.imgur.com/uzJtPNO.gif)|![](https://i.imgur.com/PxvoK3V.gif)|![](https://i.imgur.com/K1ElZQp.gif)|
|:--:|:--:|:--:|:--:|
|1.`AC`버튼|2.=후<Br>`AC`버튼|3.`CE`버튼|4.=후<br>`CE`버튼|

|![](https://i.imgur.com/kjX5kZn.gif)|![](https://i.imgur.com/7lFgDrq.gif)|![](https://i.imgur.com/IkH47Tw.gif)|![](https://i.imgur.com/eE5UHOf.gif)|
|:--:|:--:|:--:|:--:|
|5.`+/-`버튼|6.`0`일때<br>`+/-`버튼|7.연산자버튼|8.`0`일때<br>연산자버튼|

|![](https://i.imgur.com/Ult2gxe.gif)|![](https://i.imgur.com/j4S78Ok.gif)|![](https://i.imgur.com/E6xRtoa.gif)|![](https://i.imgur.com/wsXKmir.gif)|
|:--:|:--:|:--:|:--:|
|9.연산결과 출력|10.연산결과 출력|11.연산을마치고<br>다시`=`터치|12.뒤에 0000 등 <br>불필요한 숫자노출안됨|

|![](https://i.imgur.com/2bjiL1p.gif)|![](https://i.imgur.com/FcgPc4j.gif)|![](https://i.imgur.com/8wXnCbX.gif)|![](https://i.imgur.com/10OiHBn.gif)|
|:--:|:--:|:--:|:--:|
|13.3자리마다 쉼표|14.`0`으로나누기<br>`NaN`|15.`0`일때<br>.5입력시0.5로입력|16.`.`2개찍히는지|

1. 여러번 값을 입력하고 `AC`버튼 클릭
2. 여러번 값을 입력하고 `=`후 `AC`버튼 클릭
3. 여러번 값을 입력하고 `CE`버튼 클릭
4. 여러번 값을 입력하고 `=`후 `CE`버튼 클릭
5. `+/-` 버튼 클릭 시 부호 반전
6. 0일때 `+/-`버튼 클릭하여도 작동안됨
7. 숫자 입력 중 연산자를 누르면 숫자입력 중지하고 다음 숫자 입력
8. 0일때 연산자 버튼 클릭 시 기호만 변경
9. `=` 누르면 연산결과 출력(2+3*3-1 의 연산결과는 14입니다.)
10. `=` 누르면 연산결과 출력(1+2-3*2-3/6 의 연산결과는 -0.5입니다.)
11. `=` 누르면 연산결과 출력(= 버튼을 눌러 연산을 마친 후 다시 =을 눌러도 이전 연산을 다시 연산하지 않습니다.)
12. 사용자에게 표시하는 숫자는 뒤에 0000등 불필요한 숫자가 나타나지 않음
13. 숫자는 3자리마다 쉼표(,)를 표기
14. 0으로 나누기에 대해서는 결과값을 `NaN`으로 표시
15. 숫자 0일때 `.`클릭하면 0.으로 표시
16. `.`이 2개 이상 찍히지 않도록 처리

## ❓ 트러블 슈팅

### Step 1

- Queue의 `clear` 메서드 구현 시, `removeAll`과 `빈배열([ ])`을 할당해주는 방법 중 어떤것을 사용할 지 고민했습니다.
    - [공식문서 - removeAll](https://developer.apple.com/documentation/swift/array/removeall(keepingcapacity:)-1er5) 에서는 removeAll의 시간복잡도가 `O(n)`으로 기술되어 있어서 removeAll과 빈 배열을 선언해주는 경우를 비교하는 코드를 작성하여 시간을 측정해 보았습니다
    ```swift
    var a: [Int] = []

    for num in 1...10000000 {
        a.append(1)
    }

    var b: [Int] = a

    processTimeA{ a.removeAll() }

    func processTimeA(closure: () -> ()){
        let start = CFAbsoluteTimeGetCurrent()
        closure()
        let processTime = CFAbsoluteTimeGetCurrent() - start
        print("경과 시간A: \(processTime)")
    }

    processTimeB{ b = [] }

    func processTimeB(closure: () -> ()){
        let start = CFAbsoluteTimeGetCurrent()
        closure()
        let processTime = CFAbsoluteTimeGetCurrent() - start
        print("경과 시간B: \(processTime)")
    }
    // 경과 시간A: 8.940696716308594e-06 ➡️ 0.0000089초
    // 경과 시간B: 0.008070945739746094 ➡️ 0.0080초

    // 두번째 테스트 결과
    // 경과 시간A: 5.9604644775390625e-06
    // 경과 시간B: 0.007903099060058594
    ```
    - `clear` 메서드 호출 시 `removeAll`을 사용하는 것이 `빈 배열 [ ]`을 새로 할당하는 것보다 약 1000배가량 빠른 속도를 나타내어 `removeAll`로 clear메서드를 구현하였습니다.

### Step 2

- ExpressionParser의 메서드 parse와 componentsByOperators의 구현방법에 대해 고민해 보았습니다.
    - 처음으로 생각했던 로직은 `"1+2+3+4"` 형식으로 들어온 계산식 String을 `componentsByOperators` 메서드에서 ["1", "+", "2", "+", "3", "+", "4" ] 하나의 String 배열로 반환하고 `parse` 메서드에서 Operator 타입의 연산자와 Double 배열로 변환하여 Formula를 생성하여 주고 Formula의 result메서드를 통하여 결과값을 반환받는 방법이라고 생각하고 구현을 하였습니다.
    - 하지만 componentsByOperators 메서드를 구현하면서 split이나 components를 사용하여 String을 잘라낼 때 separator를 포함하여 인덱스에 맞추어 반환하는 방법이 어려움을 깨닫고 components를 사용하여 숫자만 담긴 배열을 반환하고 parse메서드에서 가공하여 사용하도록 변경하였습니다.
    - 원래 생각했던 방식 `componentsByOperators`에서 연산자를 포함하여 String 배열로 반환하는 방식도 동료 캠퍼와 함께 구현하여 보았습니다.
    ```swift
    func componentsByOperators (from input: String) -> [String] {
    var inputCharacters: [Character] = [Character](input)
    var result: [String) = []
                 var currentElement: String = ""
                 while inputCharacters.isEmpty == false {
        if Operator (rawValue: inputCharacters.first!) != nil {
            if currentElement != "" {
                result.append(currentElement)
                currentElement = ""
            }
            result. append(String(inputCharacters.removeFirst()))
        } else {
            currentElement += String(inputCharacters.removefirst ())
        }
        if currentElement != "" {
            result. append(currentElement)
        }
        
        return result
    }
    ```

### Step 3

- 스크롤 뷰에서 `setContentOffset` 메서드를 이용하여 스택뷰를 추가하며 스크롤을 하단으로 이동 시, 맨 아래에서 하나 위로 이동하고 맨 마지막 스택뷰가 보이지 않는 문제를 해결하기 위해 고민해 보았습니다.
    - 한 칸만큼 더 내려가기 위해 (contentSize height - bounds height)에서 -20, +20 등으로 y축을 이동해보기도 했지만 해결되지 않았습니다.
    - 계속해서 해결 방법을 찾다가 `drawing cycle`에 대해 알게 되었고, 간단히 공부해 본 후에 `layoutIfNeeded` 메서드를 사용하여 해결하였습니다.

- 세자리마다 콤마를 찍어주고, 불필요한 소숫점 뒤의 0을 제거해 주기 위해 numberFormater를 사용하면서 `12.0`과 같이 입력되면 `12`정수형으로 변환되고 00000을 입력하여도 반응하지 않다가 0뒤에 숫자가 입력되는 순간 값이 노출되는 문제를 해결하기 위해 고민해 보았습니다.
    -  `minimumFractionDigits`을 설정하여 보았지만, 정수값 입력 시 불필요한 000이 뒤쪽에 노출되었습니다.
    -  `.`을 포함하는 경우 정수부와 소수부 2개의 스트링으로 분리하여 정수부에만 넘버 포매터를 적용하여 주고 `.`을 포함하여 다시 합쳐서 노출되는 방법으로 해결하였습니다.

    |![](https://i.imgur.com/8hEJKy6.gif)|![](https://i.imgur.com/LoOiVE3.gif)|
    |:--:|:--:|
    |오류 수정 전|오류 수정 후|

## 🔗 참고 링크

[Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)  
[Swift Language Guide - Extentions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)  
[Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)   
[Set Up and Tear Down State in Your Tests](https://developer.apple.com/documentation/xctest/xctestcase/set_up_and_tear_down_state_in_your_tests)  
[removeAll(keepingCapacity:)](https://developer.apple.com/documentation/swift/array/removeall(keepingcapacity:)-1er5)  
[Swift) 큐(Queue) 구현 해보기](https://babbab2.tistory.com/84)  
[Swift로 효율적인 dequeue 구현하기](https://iamcho2.github.io/2021/10/04/Swift-dequeue)  
[WWDC2017 - Engineering for Testability](https://devstreaming-cdn.apple.com/videos/wwdc/2017/414qr3121b1oieq/414/414_engineering_for_testability.pdf)  
[소프트웨어 테스팅과 스위프트에서의 Unit Testing](https://seizze.github.io/2020/01/08/%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4-%ED%85%8C%EC%8A%A4%ED%8C%85%EA%B3%BC-%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8%EC%97%90%EC%84%9C%EC%9D%98-Unit-Testing.html)  
[UIStackView 코드로 작성하기](https://velog.io/@sun02/UIStackView-%EC%BD%94%EB%93%9C%EB%A1%9C-%EC%9E%91%EC%84%B1%ED%95%98%EA%B8%B0)  
[Documentation Archive - iOS Drawing Concepts](https://developer.apple.com/library/archive/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/GraphicsDrawingOverview/GraphicsDrawingOverview.html)    
[Apple Developer Doc - UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)  
[Apple Developer Doc - NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)  
[오토레이아웃 정복하기 - 야곰닷넷](https://yagom.net/courses/autolayout/)  


---

[🔝 맨 위로 이동하기](#-계산기)
