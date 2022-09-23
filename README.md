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

- Queue 타입을 제네릭? or String?
  - 최종적으로 String으로 선택 (두가지 모두 가능하지만 제네릭을 사용할 경우 다운캐스팅이 필요함)


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

- Dequeue시 배열이 빈 경우 에러가 발생
  - if문을 사용하여 count값이 0보다 클 경우에만 removeFirst(), 그 외 경우 nil 반환
- setUpWithError함수에서 sut을 매번 초기화해주기 때문에, tearDownWithError에서 다시 nil로 초기화 하지않아도 됨!
- UnitTest함수명을 작성할 때 어떻게 지어야할지 정확한 개념이 안잡혀서 ~~~확인하는 기능으로 작성
  - 명세서 작성하는 스타일과 동일하게 작성하면 됨!
    - ex. enqueue가 되면 count가 enqueue된 데이터 갯수만큼 변경되어야한다!

---

[🔝 맨 위로 이동하기](
