# 계산기

## 📖 목차
1. [소개](#-소개)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [트리 다이어그램](#-트리-다이어그램)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

## 🌱 소개

`Gundy`의 iOS 계산기 프로젝트입니다.

## 📆 타임라인

<details>
<summary>STEP 1</summary>

220920
- 프로토콜 CalculateItem
    - 빈 프로토콜 `CalculateItem` 추가
- 구조체 CalculatorItemQueue
    - 프로토콜 `CalculateItem`를 준수하는 구조체 `CalculatorItemQueue` 추가
    - 구현하지 않고 이름과 타입만 존재하는 프로퍼티와 메서드 작성
    - `CalculatorItemQueueTest`의 테스트에 따라 각 프로퍼티와 메서드 수정 반복
- 테스트 클래스 CalculatorItemQueueTest
    - 구조체 `CalculatorItemQueue`의 유닛테스트를 위한 클래스 `CalculatorItemQueueTest` 추가
    - `CalculatorItemQueue`의 프로퍼티와 메서드를 검증하는 테스트 메서드 작성
    - 테스트를 통해 수정된 프로퍼티와 메서드에 대해서 추가 테스트 메서드 작성
    
</details>
<details>
<summary>STEP 1 Feedback 반영</summary>

220921
- 구조체 CalculatorItemQueue
    - `CalculatorItemQueue` 구조체 자체가 아닌 `CalculatorItemQueue`가 다루는 요소가 `CalculateItem` 프로토콜을 준수하도록 수정
    - 동작을 수행하지 않고 값을 반환하는 메서드를 연산 프로퍼티로 수정
    - 크래시 등의 위험 요소 배제를 위해 `dequeue` 메서드 내부 코드 수정
- 테스트 클래스 CalculatorItemQueueTest
    - `CalculatorItemQueue` 수정에 따른 코드 수정
    - 테스트 메서드에 `given`, `when`, `then` 주석 추가
- Array
    - extension을 통해 배열의 첫번째 요소를 옵셔널로 반환하는 `popFirst`메서드 추가
</details>
<details>
<summary>STEP 2</summary>

220922
- Double
    - extension을 통해 프로토콜 `CalculateItem` 채택
- 구조체 CalculatorItemQueue
    - 내부 요소를 `CalculateItem` 프로토콜을 준수하는 제네릭 타입으로 수정
- 열거형 Operator
    - 각 연산자를 정의하는 열거형 `Operator` 추가
    - 두 Double 인자를 받아 덧셈, 뺄셈, 나눗셈, 곱셈의 연산을 하는 `add`, `subtract`, `divide`, `multiply` 메서드 추가
    - case에 따라 메서드를 호출해 결과를 반환하는 `calculate` 메서드 추가
- 구조체 Formula
    - 연산대상 큐와 연산자 큐를 프로퍼티로 갖는 구조체 `Formula` 추가
    - `operands` 프로퍼티와 `opreators` 프로퍼티의 내부 요소로 연산한 결과를 반환하는 `result` 메서드 추가
- 열거형 ExpressionParser
    - 문자열이 주어지면 문자열을 쪼개서 `Formula` 타입의 인스턴스를 생성하는 열거형 `ExpressionParser` 추가
    - 문자열을 연산자 기준으로 분해하여 문자열 배열로 반환하는 `componentsByOperators` 메서드 추가
    - `componentsByOperators` 메서드를 호출하여 나온 배열로 `operands`를, 문자열에 있는 연산자를 통해 만든 배열로 `operators`를 전달하여 `Formula` 타입의 인스턴스를 반환하는 `parse` 메서드 추가
- 에러 열거형 FormulaError
    - 계산 과정 및 `Formula` 타입에서 발생할 수 있는 에러를 정의한 에러타입 `FormulaError` 추가
- 테스트 클래스 CalculatorItemQueueTest
    - `CalculatorItemQueue` 수정에 따른 내부 코드 수정
</details>


## 👀 시각화된 프로젝트 구조
![](https://i.imgur.com/QpYUATn.png)

## 🌳 트리 다이어그램
```
├── Calculator
│   ├── Calculator
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   ├── AccentColor.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── AppIcon.appiconset
│   │   │   │   └── Contents.json
│   │   │   └── Contents.json
│   │   ├── Base.lproj
│   │   │   ├── LaunchScreen.storyboard
│   │   │   └── Main.storyboard
│   │   ├── CalculatorItemQueue.swift
│   │   ├── Error
│   │   │   └── FormulaError.swift
│   │   ├── ExpressionParser.swift
│   │   ├── Extension
│   │   │   ├── ArrayExtension.swift
│   │   │   ├── DoubleExtension.swift
│   │   │   └── StringExtension.swift
│   │   ├── Formula.swift
│   │   ├── Info.plist
│   │   ├── Operator.swift
│   │   ├── Protocol
│   │   │   └── CalculateItem.swift
│   │   ├── SceneDelegate.swift
│   │   └── ViewController.swift
│   ├── Calculator.xcodeproj
│   │   ├── project.pbxproj
│   │   ├── project.xcworkspace
│   │   │   ├── contents.xcworkspacedata
│   │   │   ├── xcshareddata
│   │   │   │   └── IDEWorkspaceChecks.plist
│   │   │   └── xcuserdata
│   │   │       └── Jun.xcuserdatad
│   │   │           └── UserInterfaceState.xcuserstate
│   │   ├── xcshareddata
│   │   │   └── xcschemes
│   │   │       ├── Calculator.xcscheme
│   │   │       └── CalculatorItemQueueTests.xcscheme
│   │   └── xcuserdata
│   │       └── Jun.xcuserdatad
│   │           ├── xcdebugger
│   │           │   └── Breakpoints_v2.xcbkptlist
│   │           └── xcschemes
│   │               └── xcschememanagement.plist
│   └── CalculatorItemQueueTests
│       └── CalculatorItemQueueTests.swift
└── README.md

```

## 💻 실행 화면



## ❓ 트러블 슈팅

<details>
<summary>큐 데이터 구조의 구현</summary>

Swift에는 Collection 타입이 있어서 지금껏 사용해본 적 없는 데이터 구조를 구현하는 것이 쉽지않았습니다. `isEmpty`등을 메서드로 만들지 연산 프로퍼티로 만들지 결정하기는 쉽지 않았습니다. 메서드로 만들어도, 연산 프로퍼티로 만들어도 기능상의 문제는 없었을 것이기 때문입니다. 하지만 Swift에 이미 구현되어있는 Collection 타입들을 보면 `isEmpty`등은 메서드가 아닌 연산 프로퍼티로 구현되어있었습니다. 이를 통해 '동작을 하지않고 값을 반환하는 경우'를 모두 연산 프로퍼티로 작성하는 기준을 세워서 그 구분을 명확히 하였습니다.
</details>
<details>
<summary>유닛 테스트를 위한 큐 요소의 타입</summary>

'프로토콜을 준수하는 타입'이 요소인 큐를 테스트하는 데에는 여러 방법이 있을 것입니다. 하지만 해당 프로토콜이 '빈 프로토콜'이어야한다면 여러 고민이 생깁니다. 값의 비교를 통해 테스트를 진행하는 방식이 더욱 명확하기 때문에 결국 제네릭타입에서 특정 타입을 고르도록 해야했습니다. 이를 String 타입을 선택했는데, 계산기라는 도구에서 입력할 수 있는 값은 비단 숫자만이 아니기 때문입니다. 숫자는 물론 연산기호도 포함할 수 있는 문자열이 더 다양한 상황을 검증할 수 있으리라고 생각해 String을 통해 유닛테스트를 거쳐 구조체 `CalculatorItemQueue`을 작성하였습니다.
</details>
<details>
<summary>사용하지 않는 메서드</summary>

UML상에 있는 모든 요소는 그대로 구현되어야 하기때문에 extension을 통해 String에 `split(with target: Character)` 메서드를 추가하였습니다. 하지만 이 메서드를 호출해야할법한 부분은 UML 상에서 나와있지는 않았지만 열거형 `ExpressionParser`의 `componentsByOperators` 메서드였습니다. 하지만 오히려 `split` 메서드를 호출하면 더욱 과정이 복잡해지기때문에 다른 로직을 사용하기로 하였습니다. `split` 메서드 자체를 수정할 수도 있었지만 매개변수의 타입을 변경하는 것은 UML과는 달라지게 되므로 수정하지 않았습니다. 결국 `split` 메서드는 사용하지 않는 메서드로 남게되었습니다.
</details>
        
## 🔗 참고 링크

- Swift Language Guide
    - [Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
    - [Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
    - [Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)


---

[🔝 맨 위로 이동하기](#계산기)
