# 🧮 계산기
> 사칙연산 계산을 수행하는 계산기를 만드는 프로젝트입니다.

**프로젝트 진행 기간** | 23.05.29.(월) ~ 23.06.09(금)

## 📂 목차
- [프로젝트 멤버](#-프로젝트-멤버)
- [타임 라인](#-타임-라인)
- [시각화 구조](#-시각화-구조)
- [트러블 슈팅](#-트러블-슈팅)
- [프로젝트 회고](#-프로젝트-회고)
- [참고 문서](#-참고-문서)

## 🧑‍💻 프로젝트 멤버
| <img src="https://hackmd.io/_uploads/B1I0iwo42.jpg" width="180"/> | 
| :-: |
| [<img src="https://hackmd.io/_uploads/SJEQuLsEh.png" width="30"/> **Yetti**](https://github.com/iOS-Yetti)|
Contact: yechan123456@gmail.com

## ⏳ 타임 라인
##### 중요 커밋 위주로 작성하였습니다.

#### 2023/05/31(수)
- **feat**: CalculatorItemQueue타입 생성 및 Queue자료구조 구현
- **feat**: Queue 프로토콜 생성 후 Queue 기능 구현
#### 2023/06/01(목)
- **feat**: enQueue메서드 테스트진행 및 기능 구현
- **feat**: deQueue메서드 테스트진행 및 기능 구현
- **feat**: peek메서드 테스트진행 및 기능 구현
- **feat**: clear메서드 테스트진행 및 기능 구현
#### 2023/06/03(금)
- **refactor**: peek 메서드 조건문 수정
#### 2023/06/05(월)
- **feat**: 큐에 저장하는 타입을 제네릭으로 변경 및 큐 내부의 객체에서 CalculateItem 채택하도록 extension추가
- **feat**: 열거형 Operator와 ExpressionParser, 구조체 Formula, 익스텐션 String 구현
#### 2023/06/08(목)
- **feat**: ExpressionParser 열거형 내부의 parse, componentsByOperators 메서드 구현
#### 2023/06/08(목)
- **feat**: result메서드 기능 구현
- **feat**: CalculatorError타입 구현 및 extension String에 split메서드 추가

## 👀 시각화 구조
### UML 클래스 다이어그램
![계산기 Step2 다이어그램 drawio](https://github.com/iOS-Yetti/ios-calculator-app/assets/100982422/1124bb56-c04b-48d2-9fc5-018a05f57d7a)

## 🛠️ 트러블 슈팅

### 1. Double Stack Queue 구조 이해 및 구현

**❓ 문제점**
> 처음 `Double Stack Queue`를 구현하고자 할 때 `Double Stack Queue`에 대한 이해가 부족해 `enQueueStack`과 `deQueueStack`을 "하나의 큐"로 인식하지 못하고 "enQueue와 deQueue를 시행하는 역할"이라고 인식하여 잘못된 로직을 짜게 되었습니다. 아래 로직을 보게되면 `deQueueStack`으로 옮겨준 요소들을 다시 `enQueueStack`으로 넣어주고 있어서 비효율적인 로직이 되게 됩니다.
```swift
mutating func deQueue() -> String? {
     deQueueStack = enQueueStack.reversed()
     let deQueueElement = deQueueStack.popLast()
     enQueueStack = deQueueStack.reversed()
     return deQueueElement
    }
```
**❗️ 해결 방법**
> 다시 `Double Stack Queue`에 대해 공부해보니 2개의 배열로 하나의 큐를 만든다는 점을 알게되었고 최종적으로 deQueue메서드를 이렇게 수정해주었습니다.
```swift
mutating func deQueue() -> String? {
    if deQueueStack.isEmpty {
        deQueueStack = enQueueStack.reversed()
        enQueueStack.removeAll()
        }
        return deQueueStack.popLast()
    }
```

### 2. 제네릭 타입 활용

**❓ 문제점**
> String타입만 받을 수 있는 큐로 구현하였을 때는 연산자와 피연산자를 구분하여 연산을 실행하는 과정이 복잡해지는 문제점이 있었습니다.
```swift
struct CalculatorItemQueue: DoubleStackQueue {
    private var enqueueStack: [String] = []
    private var dequeueStack: [String] = []
```

**❗️ 해결 방법**
> 연산자는 Operator타입을, 피연산자는 Double타입를 사용할 수 있도록 제네릭을 사용해서 CalculatorItemQueue에 들어오는 값을 유연하게 만들어주었습니다. 추가적으로 타입 매개변수를 통해 CalculateItem프로토콜을 채택하는 값들만 들어올 수 있게 만들어 주었습니다.
```swift
struct CalculatorItemQueue<T: CalculateItem>: DoubleStackQueue {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
```

## 🤔 프로젝트 회고


#### 프로젝트를 진행하며 깨달은 것
- 내가 모르는게 정확히 뭔지 파악할 수 있는 능력을 기르자!
- 질문을 많이, 그리고 잘 하는법을 연구하자!
- 내가 지금 작성해야 할 코드가 무엇인지, 어떤 기능이 있어야 하는지 정리를 하고 코드를 작성하자!

## 📚 참고 문서
- https://iamcho2.github.io/2021/10/04/Swift-dequeue
- https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
- https://docs.swift.org/swift-book/LanguageGuide/Extensions.html
