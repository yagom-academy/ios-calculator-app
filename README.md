# 🧮 계산기
> 사칙연산 계산을 수행하는 계산기를 만드는 프로젝트입니다.

**프로젝트 진행 기간** | 23.05.29.(월) ~ ing

## 📂 목차
- [프로젝트 멤버](#-프로젝트-멤버)
- [타임 라인](#-타임-라인)
- [시각화 구조](#-시각화-구조)
- [트러블 슈팅](#-트러블-슈팅)
- [참고 문서](#-참고-문서)

## 🧑‍💻 프로젝트 멤버
| <img src="https://hackmd.io/_uploads/B1I0iwo42.jpg" width="120"/> | 
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

## 👀 시각화 구조
### UML 클래스 다이어그램
![step1 UML drawio](https://github.com/iOS-Yetti/ios-calculator-app/assets/100982422/a91400d4-29ca-4c87-92dc-b95503817dbf)

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

## 📚 참고 문서
- https://iamcho2.github.io/2021/10/04/Swift-dequeue
- https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
- https://docs.swift.org/swift-book/LanguageGuide/Extensions.html
