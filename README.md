# ➕➖✖️➗🟰 계산기

## 📖 목차

1. [소개](#-소개)
2. [Tree](#-Tree)
3. [고민한 점](#-고민한-점)
4. [타임라인](#-타임라인)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

## 🌱 소개

`Dragon`이 만든 계산기 앱입니다.

- KeyWords
  - Queue
  - Operator
  - Formula
  - ExpressionParser
  - UnitTest

- Class Diagram

![image](https://user-images.githubusercontent.com/102534252/193206558-ffbb2bc3-85a9-40e4-ab08-cddf12da6763.png)

## 🌲 Tree

```
JuiceMaker
├── Info.plist
├── Controller
│   ├── AppDelegate.swift
│   ├── ViewController.swift
│   └── SceneDelegate.swift
├── Model
│   ├── Error
│   │   └── CalculatorError.swift
│   ├── Protocol
│   │   └── CalculateItem.swift
│   ├── Extension
│   │   └── String.swift
│   │   └── Double.swift
│   ├── Struct
│   │   └── CalculatorItemQueue.swift
│   │   └── Formula.swift
│   └── Enum
│       └── Operator.swift
│       └── ExpressionParser.swift
├── View
│    ├── Assets.xcassets
│    │   ├── AccentColor.colorset
│    │   │   └── Contents.json
│    │   ├── AppIcon.appiconset
│    │   │   └── Contents.json
│    │   └── Contents.json
│    └── Base.lproj
│        ├── LaunchScreen.storyboard
│        └── Main.storyboard
├── Controller
│    ├── AppDelegate.swift
│    ├── SceneDelegate.swift
│    └── ViewController.swift
└── CaclulatorTest
     ├── CalculatorItemQueueTests.swift
     ├── CalculatorTests.swift
     ├── ExpressionParserTests.swift
     ├── FormulaTests.swift
     └── OperatorTests.swift

```

## 👀 고민한 점

### Step 1

- Queue 타입을 제네릭? or String?
  - 최종적으로 String으로 선택 (두가지 모두 가능하지만 제네릭을 사용할 경우 다운캐스팅이 필요함)

### Step 2

- 고차함수를 사용하여, 숫자와 기호를 나누는 방법들에 대해서 고민
- UnitTest를 작성할 때 기본세팅이라던지, 테스트방법에 대해서 고민

### Step 3

- Step2까지 작성한 Model부분에 해당하는 코드들을 ViewController에서 어떻게 활용하는게 좋을지 고민해보았습니다...
  - 고민한 결과가 지금의 코드이지만 많이 부족하다고 생각됩니다ㅠ
- 부호변경 기능이 원하는대로 되지 않아 많은 고민을 해보았지만... 현재 저에게는 해결법이 보이지 않았습니다...

## ⏰ 타임라인

### Step1

- **220921**
  - Queue 자료구조 생성
    - isFull & capacity 메서드 삭제
  - UnitTestTarget 생성
    - setUpWithError & tearDownWithError 설정
    - Enqueue & Count 테스트함수 추가
    - Dequeue 테스트함수 추가
    - Peek 테스트함수 추가
    - Clear & isEmpty 테스트함수 추가
- **220922**
  - Step1 PR 리뷰 확인
    - [PR보러가기](https://github.com/yagom-academy/ios-calculator-app/pull/334)
- **220923**
  - Queue 네이밍 변경
  - Queue 기능에서 Dequeue관련 예외처리
  - UnitTest 메서드명 변경
- **220924**
  - Queue 네이밍 변경
  - UnitTest 메서드명 변경

### Step2

- **220925**
  - enum-Operator 구현
  - extension-Double 구현
  - extension-String 구현
  - struct-Formula 구현
  - enum-ExpressionParser 구현
  - UnitTest 추가
    - Operator관련 테스트
    - Formula관련 테스트
    - ExpressionParser관련 테스트
- **220926**
  - Step2 PR 리뷰 확인
    - [PR보러가기](https://github.com/yagom-academy/ios-calculator-app/pull/351)
- **220927**
  - 코드컨벤션 수정
  - Queue관련 코드 개선
  - Formula-While문 조건 컨벤션 수정
  - ExpressionParser-Operand에 포함된 공백을 제거해주는 코드 추가
- **220928**
  - 0으로 나눴을 경우 notaNumber 에러 출력되도록 변경
  - UnitTest 메서드명 변경
- **220929**
  - 0으로 나눴을 경우 invalidNumber 에러 출력되도록 변경
          

### Step3

- **220930**
  - 각 버튼 기능 구현
    - initCalculator 메서드 추가 (계산기관련값 초기화)
    - pushInput 메서드 추가 (연산식에 입력된 값 추가)
    - updateCalculatorStackView 메서드 추가 (StackView에 연산식 업데이트)
    - showResult 메서드 추가 (최종 저장되 연산식으로 연산 후 결과 도출)
    - Step3 PR 리뷰 확인
      - [PR보러가기](https://github.com/yagom-academy/ios-calculator-app/pull/375)

## 📱 실행 화면
https://user-images.githubusercontent.com/102534252/193212902-f6d260c0-7c87-432e-bf25-59b8d11b094d.mov


## ❓ 트러블 슈팅 & 어려웠던 점

### Step1

- Dequeue시 배열이 빈 경우 에러가 발생
  - if문을 사용하여 count값이 0보다 클 경우에만 removeFirst(), 그 외 경우 nil 반환
- setUpWithError함수에서 sut을 매번 초기화해주기 때문에, tearDownWithError에서 다시 nil로 초기화 하지않아도 됨!
- UnitTest함수명을 작성할 때 어떻게 지어야할지 정확한 개념이 안잡혀서 ~~~확인하는 기능으로 작성
  - 명세서 작성하는 스타일과 동일하게 작성하면 됨!
    - ex. enqueue가 되면 count가 enqueue된 데이터 갯수만큼 변경되어야한다!

### Step2

- sdk처럼 외부로 제공이 되는 모듈이 아닌 이상 internal로 접근제어자로 해주는 것이 좋음!
- isEmpty() == false 보다 !isEmpty()가 깔끔!
- 0으로 나눴을 경우 에러가 확인될 수 있도록 예외처리함! (invalidNumber)
- UnitTest 메서드명은 어렵다... 아래와 같이 명확하고 세세하게 작성해줘야할 것!
  - enqueue한 요소의 갯수만큼 증가해야한다
  - 곱셈이 연산되었을 때 input된 수들의 곱과 동일해야한다
  - add일때 lhs, rhs 숫자를 입력하면 덧셈값이 나와야함

### Step3

- Step3오면서 제가 작성한 코드이지만 저도 길을 잃은 느낌... 
- 해결되지 않은 부호변경 기능을 구현하기 위해서는 어떻게 접근하는게 좋을지...
- ViewController오면서 Model에 짜놓은 것들을 지금보다 어떻게 더 활용해야하는지 고민해봤는데, 모르겠음...
  - 해결되면 추가 작성 예정

---

## 📖 참고 링크

- 재미난 CS - [PART II](https://camp.yagom-academy.kr/camp/628f3c9086f2cb44234de041/boards/632406fc2b3d440eb03d0a23/articles/632407832b3d440eb03d0a27)
- [Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
- [Swift Language Guide - Extentions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
- [Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
- [Swift Language Guide - Closures(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
- [Swift Language Guide - Advanced Operators(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html)
- [Swift Language Guide - Inheritance(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Swift Language Guide - Subscripts(선택사항)](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)

[🔝 맨 위로 이동하기](# ➕➖✖️➗🟰 계산기)
