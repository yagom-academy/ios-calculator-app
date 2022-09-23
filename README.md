
# 🧮 계산기

## 📖 목차
1. [팀 소개](#-팀-소개)
2. [Diagram](#-Diagram)
3. [폴더 구조](#-폴더-구조)
4. [타임라인](#-타임라인)
5. [트러블 슈팅](#-트러블-슈팅)
6. [기술적 도전](#-기술적-도전)
7. [참고 링크](#-참고-링크)

## 🌱 팀 소개
 |[Wonbi](https://github.com/wonbi92)|
 |:---:|
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/88074999?v=4">|

- `Wonbi`가 만든 계산기입니다!

## 👀 Diagram

### 🧬 Class Diagram

![](https://i.imgur.com/AcKleDQ.png)

## 🗂 폴더 구조
```
Calculator
├── Info
├── Model
│   ├── CalculatorItemQueue
│   ├── CalculateItem
│   └── Operator
├── View
│   ├── Main
│   ├── Assets
│   └── LaunchScreen
├── Controller
│   ├── AppDelegate
│   ├── SceneDelegate
│   └── ViewController
└── CalculatorTests
    └── CalculatorTests
```

## ⏰ 타임라인

### 👟 Step 1
- 더블 스택 큐를 활용한 `CalculatorItemQueue`타입 구현
- 계산 가능한 아이템만 채택하여 활용하도록 `CalculateItem`프로토콜 생성
- 연산자를 구분해주는 `Operator`열거형 타입 구현
- 테스트를 위한 `CalculatorTests`클래스 구현


## 🚀 트러블 슈팅
### Queue 자료 구조 구현
- 이전에 배우지 못했던 개념이라 처음부터 개념을 알아가는 과정이 어려워서 시간이 오래걸렸습니다.

- Queue 자료구조의 특징은 선입선출인데, swift의 배열이 가지고 있는 `append`와 `removeFirst`메서드로 구현 자체는 가능합니다. 하지만 `removeFirst`의 시간복잡도가 O(n)이기에 데이터의 값이 많아질수록 `dequeue` 속도가 점점 느려지는 단점이 있습니다.

- 이를 해결하기위해 여러가지 방법을 생각해보고 구현해보기로 하였습니다.

#### 처음에 생각했던 방법은..
- 처음 `dequeue`의 시간복잡도를 해결하기 위해 생각했던 방법은, `popLast()`메서드의 시간복잡도가 O(1)이라는 점을 이용해`reversed()`메서드를 활용하는 방법이었습니다. 기존 배열을 `reversed()`메서드를 통해 뒤집어 새로운 배열을 만든 후, `popLast()`를 해준 뒤, 다시 `reversed()`한 배열을 기존 배열로 다시 재설정 하는 방법이었습니다.
```swift
mutating func dequeue() -> CalculateItem {
    var reversedData = data.reversed()
    let element = reversedData.popLast()
    data = reversedData.reversed()
    
    return element
}
```
- 이 방법은 뭔가 새 배열을 임시로 복사하는 방법이라 시간복잡도는 어느정도 해결되지만, 공간복잡도가 많이 올라가는 느낌이 들었습니다.

- 그래서 구글링을 하던 중, 같은 원리를 이용하는대신 제가 생각한 방법보다 공간복잡도는 조금 더 줄인 DoubleStackQueue를 알게 되었습니다.

#### 더블 스택을 이용한 Queue 구현
- 배열 두개를 활용해 `dequeue`의 시간복잡도를 줄여주는 방법이었습니다. `dequeue`가 될 때 `output`이 비어있다면, `output`에 `input`을 뒤집어서 넣고, `output.popLast()`를 실행해주기만 하면 되는 방법이었습니다.
```swift
mutating func dequeue() -> CalculateItem? {
    if output.isEmpty {
        output = input.reversed()
        input.removeAll()
    }
    return output.popLast()
}
```
- 이 방법은 제가 생각한 방법보다 공간복잡도도 줄고, 시간복잡도 역시 줄여주는 방법이지만, `input`배열을 뒤집어서 넣어준 후, `removeAll()`메서드를 실행할 때, 이 메서드의 시간 복잡도가 O(n)이라는 단점이 있고, 배열을 두개를 가지고 있기 때문에 공간복잡도 역시 완전히 해결되지 않는 단점이 존재했습니다.

- 그렇다면, 하나의 배열만으로 이를 구현할 수 없을까 고민하면서 생각했던 방법은 포인터를 이용하는 것이었습니다.

#### 포인터를 이용한 Queue 구현
- 기본 배열과 `head`라는 포인터를 이용해 구현하는 방법입니다. `head`가 첫 항목에 해당하는 인덱스를 `Int`값으로 가지고 있고 `dequeue`를 호출했을 때 `head`인덱스에 해당하는 값을 반환해주고, 그자리에 `nil`을 넣어주는 방법이었습니다.
```swift
mutating func dequeue() -> CalculateItem? {
    guard head < data.count, let element = data[head] else { return nil }
    data[head] = nil
    head += 1
    
    if head >= 10 {
        data.removeFirst(head)
        head = 0
    }
    
    return element
}
```
- 하나의 배열을 사용하면서, 시간복잡도 역시 O(1)이었지만, 문제는 `nil`이었습니다. 기존에 구현해놓은 `isEmpty`와 `count`프로퍼티의 구현이 복잡해질 수밖에 없었습니다.
```swift
    var isEmpty: Bool {
        if count == 0 { return true }
        return false
    }
    
    var count: Int {
        data.count - head
    }
```
- 기존배열의 값을 지우는게 아니라 `nil`을 할당하기 때문에 이미 사라진 값인 `nil`이 카운트에 포함되어버리는 문제가 있었습니다.

- 또한 배열내부의 값이 사라지지 않고 `nil`이 여전히 공간을 차지하고 있기 때문에, 이 `nil`을 주기적으로 제거하지 않는다면, 배열의 크기가 점점 커지는 단점 역시 존재하였습니다. 

- 이를 해결하기위해 주기적으로(예제에서는 nil이 10개 이상일 때 입니다.)`nil`을 지워주는 로직이 필요한데, 이 로직역시 O(n)의 시간복잡도를 가지는 방법이기에 완벽하게 시간복잡도 문제가 해결되지 않는 문제도 있었습니다.

#### 결론
- 결론적으로, 저는 더블 스택 큐를 구현하기로 결정했습니다. 이 방법은 공간복잡도가 높은 단점이 있지만, 구현 난이도가 쉬워 빠르게 구현할 수 있는 장점이 있어서 채택하였습니다. 또 `output`배열이 비어있을 때 `removeAll()`메서드를 호출하기에 시간복잡도가 완벽히 O(1)은 아니지만, "*`output`배열이 비어있을 때*" 라는 조건이 있어 어느정도 수용 가능하다는 판단을 하였습니다.

## 🏃🏻 기술적 도전

### TDD
- TDD를 기반으로 코드를 짜보라는 요구사항을 만족하기 위해 일단 Xcode를 켰지만, 처음 사용하는 방법이라 익숙하지가 않아 선뜻 손이 가지 않는 문제가 있었습니다.

- 테스트 코드의 리스트를 만들어볼까도 생각해 봤고, 다른 캠퍼들과 이부분에 대해 이야기도 나누어 보았지만, 어떻게 해야 이 TDD를 제대로 활용할 수 있을지 답을 얻지 못했습니다. 동시에 이 방법은 여러번 시도하고 다른사람과 의견을 공유하면서 생기는 경험(소위 말하는 짬)이 많을 수록 더 잘 활용할 수 있겠다는 생각이 들었습니다.

- 이번 프로젝트의 경우, 요구사항을 만족하기 위해 어떤 테스트가 필요한지를 생각하고, 그 테스트를 먼저 구현한 다음, 그 테스트를 통과하게 하기 위해 코드를 짜는 방법으로 수행해 보았습니다. 물론 그 과정에서 테스트를 다시 고치는 상황이 발생하기도 하고, 코드를 먼저 구현하고 그에 맞는 테스트를 다시 구현하는 등, 뭔가 뒤죽박죽되어있는 느낌이 강하게 들었습니다.

- 이는 이 방식을 처음 접하면서 겪는 시행착오라 생각했고 이를 해결하는 방법은 많은 경험을 통해 익숙해지는 것이라 생각하였습니다.

## 🔗 참고 링크

[Swift Language Guide - Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

[Swift Language Guide - Extentions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
