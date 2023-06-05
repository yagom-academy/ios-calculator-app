# 계산기 [STEP 1]
> 프로젝트에 단위 테스트(Unit Test)를 위한 타깃이 있습니다.
> 계산기가 입력받은 숫자와 연산자는 연산큐에 쌓이게 됩니다.
> 사칙연산 계산을 위한 큐(Queue) 타입(CalculatorItemQueue)가 있습니다.
> CalculatorItemQueue에서 다루는 요소는 CalculateItem 프로토콜을 준수합니다.
> CalculateItem 프로토콜은 빈 프로토콜입니다.

## 📚 목차
- [자기소개](#-자기-소개)
- [타임라인](#-타임라인)
- [실행화면](#-실행화면)
- [트러블 슈팅](#-트러블-슈팅)
- [참고자료](#-참고자료)

## 🧑‍💻 자기 소개
|<img src="https://github.com/devKobe24/BranchTest/blob/main/IMG_5424.JPG?raw=true" width="200" height="200"/>|
| :-: |
| [**Kobe**](https://github.com/devKobe24) |

## ⏰ 타임라인
프로젝트 진행 기간 | 23.05.30.(화) ~ 23.06.02.(금)

| 날짜 | 진행 사항 |
| -------- | -------- |
| 23.05.30.(화)     | MVC 형태로 폴더 구성 정리 및 파일 이동.<br/>CalculatorItemQueue 파일 생성, Node 파일 생성 및 클래스 생성, CalculatorTestsPlan 생성, CalculatorItemQueueTests 파일 생성, CalculatorNodeTests 파일 생성.<br/>Node 클래스 생성 테스트 구현.<br/>Node 클래스 value 프로퍼티에 제네릭 타입이 들어가는 테스트 추가.<br/>Node 파일 삭제, CalculatorNodeTests 파일 삭제, CalculatorTestsPlan 수정.<br/> |
| 23.05.31.(수)     | 배열에 숫자를 담는 함수 생성.<br/>배열에 값이 들어가는것을 확인하기 위한 테스트 생성 및 확인.<br/>enqueue로 함수명 수정.<br/>배열에서 값이 빠지는 기능 테스트 [RED]<br/>enqueue에 반환값 생성<br/>배열에서 값이 빠지는 기능 테스트 [GREEN]<br/>배열에 요소가 없을때 peek 함수를 호출하면 nil을 반환한다 테스트[RED]<br/>배열에 요소가 없을 때 peek 함수를 호출하면 nil을 반환한다 [GREEN]<br/>clear 함수를 호출시 배열의 요소가 모두 비워졌을때 true를 반환한다 테스트[RED]<br/>clear 함수를 호출시 배열의 요소가 모두 비워졌을때 true를 반환한다[GREEN]<br/>clear 함수 수정 [BLUE]|
| 23.06.02.(금)     | CalculatorItemQueue 코드 수정, CalculatorItemQueueTests 테스트 삭제.<br/>elements 요소를 가져오기 위한 함수 생성.<br/>enqueue 함수 호출시 배열에 요소가 담긴다 [GREEN]<br/>enqueue 여러번 호출시 테스트 성공[GREEN]<br/>빈 배열에 dequeue시 nil 반환 테스트 [RED]<br/>where 구문 추가, Equatable 채택, dequeue 로직 변경.<br/>dequeue 호출시 배열에서 요소가 하나씩 빠짐[GREEN]<br/>peek 함수 호출시 nil 반환.<br/>peek 함수 호출시 첫 번째 요소를 가져온다.<br/>clear 함수 호출 테스트 [GREEN]<br/>불필요한 extension 삭제.<br/>README 작성|


## 📺 실행화면
- 계산기 Unit Test 실행 화면 <br>
<img src = "https://github.com/devKobe24/images/blob/main/TDD.gif?raw=true" width = 500>

## 🔨 트러블 슈팅 
1️⃣ **배열 VS 연결 리스트** <br>
🔒 **문제점** <br>
큐(Queue)를 구현하는데 방법이 여러가지가 있었습니다. 
그 여러가지 방법 중 배열과 단방향 연결 리스트를 이용한 방법이 있었습니다.
처음에는 단방향 연결 리스트를 이용하여 큐를 구현하였습니다.
큐를 구현하던 중 제네릭과 TDD 그리고 단방향 리스트에 대한 정확한 이해도가 부족했습니다.
그로 인하여 큐를 구현하는데 문제가 생겼습니다.

🔑 **해결방법** <br>
배열을 이용하여 큐를 구현하는 방법으로 방향을 선회하였습니다.
일단 배열을 이용하여 큐를 구현하는 방법으로 큐를 구현하면서 큐에 대한 이해도를 높이려 했습니다.
이후 단방향 리스트에 대해 공부했습니다.
또한 TDD와 제네릭 타입에 대한 공부도 함께 하였습니다.
현재는 배열을 이용한 방법으로 큐를 구현하여 해결하였으며 추후에는 단방향 연결 리스트로 리팩토링 할 계획입니다.


2️⃣ **TDD와 Unit Test** <br>
🔒 **문제점 2** <br>
TDD를 시도할 때 의존성 주입에 대한 개념과 Test Double에 대한 학습이 미흡했습니다.
그래서 테스트용 로직을 큐 구조체 내부에 구현했습니다.
때문에 주객전도와 같은 현상이 일어났습니다.

🔑 **해결방법** <br>
Test Double을 이용해 Mock Object를 만들어서 해당 객체에만 의존성을 주입해 객체의 생성과 의존성 설정을 자신이 아닌 외부에서 처리하도록 하려합니다.
외부에서 의존성을 주입받게된다면 특정 구현에 강하게 결합받지 않고, 코드의 유연성과 재사용성이 증가하므로 단위 테스트시 Mock Object를 쉽게 주입하여 테스트할 수 있을것으로 생각됩니다.


3️⃣ **코드의 단순화** <br>
🔒 **문제점 3** <br>
로직을 만들 때 코드를 조금 더 단순화해서 만들어야 하는데 일단 생각나는대로 적는 습관이 있는것 같습니다.
그로 인해 한 줄로 쓰여질 코드도 2~3줄이 되는 현상이 발생합니다.

```swift!
if elements != [] {
    return elements.removeFirst()
    } else {
    return nil
}
```

🔑 **해결방법** <br>
삼항 연산자 혹은 고차함수를 사용해야겠다는 생각을 했습니다.
그리고 나쁜 습관인 일단 생각나는대로 구현하는 습관보다 코드를 어떻게 하면 단순화할 수 있을지에 대해 고민하고 코드를 써가는 습관을 길러야 겠다는 생각도 했습니다.

이번 해결 방법은 원비께서 제안해주신 삼항 연산자를 적극 활용해봤습니다.
```swift!
elements.isEmpty ? nil : elements.removeFirst()
```


🤔 **고민했던 점** <br>
- 큐를 구현하는데 있어서 배열, 단방향 리스트, 더블 스택 구조등 다양한 방법이 있어서 무엇을 선택하고 어떻게 구현해야 할지 가장 고민했습니다.
- TDD의 경우 처음 RED를 어떻게 발생시켜야 하는지 몰라서 고민을 많이 했습니다.
- 의존성 주입에 대한 개념에 대해 고민했습니다.
- 코드의 단순화에 대해 고민했습니다.
- 제네릭 타입이 무엇이고 어떤 상황에 쓰이며 장.단점에 대해서 고민했습니다.


## 📑 참고자료
- [제네릭](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
- [TDD & Unit Test](https://yagom.net/courses/unit-test-%ec%9e%91%ec%84%b1%ed%95%98%ea%b8%b0/)
- [클래스와 구조체](https://bbiguduk.gitbook.io/swift/language-guide-1/structures-and-classes)
- [단방향 리스트로 큐를 구현했을 때의 장점, 큐의 구현이 동적인 이유, 동작 방식, 테일 포인터](https://github.com/devKobe24/TIL/blob/main/TIL/230601(3)_TIL.md)
- [프로토콜](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/)
- [Extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions/)

