## iOS 커리어 스타터 캠프

#### 계산기 프로젝트
## 🧮 프로젝트 소개
- 

## 📍 목차
#### 1. [팀원](#🧑🏻‍💻-1-팀원)
#### 2. [순서도](#🔖-2-순서도)
#### 3. [타임라인](#⏱-3-타임라인)
#### 4. [실행 화면(기능 설명)](#💻-4-실행-화면기능-설명)
#### 5. [트러블 슈팅](#🚀-5-트러블-슈팅)
#### 6. [참고 링크](#📎-6-참고-링크)

## 🧑🏻‍💻 1. 팀원
|미니|
|:----:|
|<img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/ikEGO8k.jpg">|
| <a href="https://github.com/leegyoungmin"> <center>*@leegyoungmin*</center></a>|

## 🔖 2. 순서도
### Class Diagram
![ClassDiagram](https://i.imgur.com/wL5syzU.jpg)

## ⏱ 3. 타임라인
<!-- : 시간 순으로 프로젝트의 주요 진행 척도를 표시 -->



## 💻 4. 실행 화면(기능 설명)
### 📌 STEP 1

### 📌 STEP 2

## 🚀 5. 트러블 슈팅
### 📌 STEP 1
- 트러블 슈팅
    1. Generic타입과 Protocol 타입

    ```swift
    protocol CalculateItem { }

    extension Int: CalculateItem { }
    extension Double: CalculateItem { }

    struct CalculatorItemQueue<Element: CalculateItem> {
        var inputStack: [Element] = []
        var outputStack: [Element] = []
        ...
    }

    ```

    - 처음에는 `CalculateItem`타입의 리스트 타입을 통해서 구현하였습니다.
    - 하지만, 테스트코드를 작성시 `Equtable` 프로토콜을 채택한 타입으로만 `XCAssert` 메서드를 활용할 수 있었습니다.
    - 그래서 제네릭 타입을 활용하고, `Equtable` 프로토콜을 이미 채택하고 있는 `Int`,`Double` 타입을 확장하여서 제네릭의 타입으로 지정할 수 있도록 하였습니다.
    
    2. LinkedList vs Double Stack
    - Swift에서 Queue를 구성하기 위해서 다양한 방법이 있는 것을 공부하였습니다.
    - 단순 배열을 통하여 구현하였을 경우, `removeFirst`메서드를 활용하여야 했습니다. `removeFirst`의 시간 복잡도는 O(n)의 복잡도를 가지게 됩니다. 그렇기 때문에 많은 데이터가 들어왔을 경우에는 성능적인 측면에서 부족할 수 있다고 생각하였습니다.
    - Linked List를 통하여 구현하였을 경우, 일반 배열을 활용하는 것보다는 deqeue 메서드에서 복잡도가 O(1)의 복잡도로 낮아지는 것을 확인할 수 있습니다. 하지만, 연결 리스트를 활용할 때에는 값,이전 노드의 참조, 다음노드의 참조의 값을 가지고 있어야 하기 때문에 메모리 소모가 크다고 판단하였습니다.
    - Double Stack을 활용하여서 구현하였을 경우에는 단순 배열에서 겪는 문제점과 연결 리스트에서의 단점을 가지고 있지 않기 때문에 이를 통해서 구현하였습니다.

- 궁금한 점
    - TDD를 통해서 Test Code를 작성하였습니다. 하지만, 어떤 테스트를 진행할 것인지 결정한 후 테스트 코드에 무작위성을 추가하기 위해서 테스트 코드 내부의 코드를 변경하였습니다.
    - 하지만, 무작위성을 추가하고 난 후, 테스트의 이름이 어떤 것을 테스트하고자 하는 것인지 명확하지 않은것 같습니다.
    - 테스트 코드에 이름을 무작위성을 추가한 네이밍으로 변경하고자 하는데 어떻게 접근하여야 하는지 모르겠습니다.

### 📌 STEP 3


## 📎 6. 참고 링크

