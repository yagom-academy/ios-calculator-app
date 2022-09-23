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
  - UnitTest

- Class Diagram

![계산기1_Step1_클래스다이어그램](https://user-images.githubusercontent.com/102534252/191909633-6a9af418-3408-4409-94eb-2466461f0b02.png)

## 🌲 Tree

```
JuiceMaker
├── Controller
│   ├── AppDelegate.swift
│   ├── ViewController.swift
│   └── SceneDelegate.swift
│   └── Info.plist
├── Model
│   ├── CalculateItem.swift
│   └── CalculatorItemQueue.swift
└── View
    ├── Assets.xcassets
    │   ├── AccentColor.colorset
    │   │   └── Contents.json
    │   ├── AppIcon.appiconset
    │   │   └── Contents.json
    │   └── Contents.json
    └── Base.lproj
        ├── LaunchScreen.storyboard
        └── Main.storyboard
```

## 👀 고민한 점

### Step 1

- "FruitStore가 관리하는 과일의 종류 : 딸기, 바나나, 파인애플, 키위, 망고"를 `tuple`을 사용할지, `Dictionary`를 사용하여 구현할지 고민해 보았습니다.
  - Fruit 타입의 값과 재고 수량을 묶어서 사용할 수 있는 딕셔너리를 사용하는 것으로 결정하였습니다.

- FruitStore 초기화 시 초기재고 10개를 적용하는 방법에 대해서 고민했습니다.
  - 처음에는 `var stock: [Fruit : Int] = [.strawBerry : 10, .banana : 10, .pineApple : 10, .kiwi : 10, .mango : 10]` 처럼 딕셔너리에 초기값을 할당하는 방법을 생각해봤지만, 매직넘버를 사용하지 않는 방법을 고민하다`init(initialFruitCount: Int)`으로 파라미터를 받아 설정하도록 변경하였습니다.

- `Juice` enum에서 프로퍼티로 recipe를 받아오는 방법과 JuiceMaker 구조체 안에서 메서드로 recipe를 반환하는 방법에 대해 고민해보았습니다. enum에서 프로퍼티를 사용하는 방법을 공부해보고 익숙해지기 위해서 이번에는 enum의 프로퍼티를 사용해 보았습니다.

- 각 과일의 수량 n개를 변경하는 기능에 대해 Int값을 받아서 연산하는 함수를 생각해 보았으나, 스토리 보드상에 보여지는 재고 수정 화면이 `+`/`-`로 구현되어 있는 것을 확인하여 `addToInventory`와 `removeToInventory`으로 분리하여 구현하였습니다. 

- 현재 재고를 확인하는 방법으로 `checkStock`함수를 구현하였는데, 기능을 함수로 구분지어 놓고 사용할지 또는 딕셔너리에서 값을 그대로 갖고 와서 사용할지 고민해 보았습니다.

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
          

## 📱 실행 화면

#### > 동작화면 구현시 추가 예정

## ❓ 트러블 슈팅 & 고민한 것

### Step 1

- Queue 타입을 제네릭? or String?
  - 최종적으로 String으로 선택 (두가지 모두 가능하지만 제네릭을 사용할 경우 다운캐스팅이 필요함)
- Dequeue시 배열이 빈 경우 에러가 발생
  - if문을 사용하여 count값이 0보다 클 경우에만 removeFirst(), 그 외 경우 nil 반환
- setUpWithError함수에서 sut을 매번 초기화해주기 때문에, tearDownWithError에서 다시 nil로 초기화 하지않아도 됨!
- UnitTest함수명을 작성할 때 어떻게 지어야할지 정확한 개념이 안잡혀서 ~~~확인하는 기능으로 작성
  - 명세서 작성하는 스타일과 동일하게 작성하면 됨!
    - ex. enqueue가 되면 count가 enqueue된 데이터 갯수만큼 변경되어야한다!

---

[🔝 맨 위로 이동하기](
