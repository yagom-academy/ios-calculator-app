
## Calculator II README

### 0.목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)
5. [실행 화면](#5-실행-화면)
6. [트러블 슈팅](#6-트러블-슈팅)
7. [핵심 경험](#7-핵심-경험)

### 1. 소개
MVC 패턴을 적용한 계산기 프로그램입니다!

### 2. 팀원
| zhilly | Gundy |
| :---: | :---: |
| <img src=https://user-images.githubusercontent.com/99257965/190572502-b7a41ed7-3c1b-44af-8b03-77d7e49d4705.png width=150> | <img src=https://i.imgur.com/CIybtaG.png](https://user-images.githubusercontent.com/99257965/194458318-66340f04-2217-4e86-90c5-5ba47dcf2a79.png) width=150> |
| @zhilly11 | @Gundy93 |


### 3. 타임라인
[STEP-1]
- 221004
    - 콜라보레이터 추가
    - 서로 코드 설명
    - 모델 파일 추가
    - 모델 파일 병합
    - View, Controller 코드 병합
    - 테스트 파일 수정

[STEP-2]
- 221006
    - numberFormatter 및 레이블 표시방식 리팩토링
    - View와 Controller의 의존성 및 결합도 약화
    - name space 추가

### 4. 시각화된 프로젝트 구조
#### 4.1 UML
![CalculatorUML (7)](https://user-images.githubusercontent.com/99257965/194458233-92ca350b-4b73-41ef-a824-44d257f65397.jpg)


#### 4.2 Tree
```bash
.
├── Calculator
│   ├── Base.lproj
│   │   ├── LaunchScreen.storyboard
│   │   └── Main.storyboard
│   ├── Controller
│   │   ├── CalculatorController.swift
│   ├── Delegate
│   │   ├── AppDelegate.swift
│   │   └── SceneDelegate.swift
│   ├── Extension
│   │   ├── Double+Extensions.swift
│   │   └── String+Extensions.swift
│   ├── Info.plist
│   ├── Model
│   │   ├── CalculatorItemQueue.swift
│   │   ├── Constants.swift
│   │   ├── Error
│   │   │   └── FormulaError.swift
│   │   ├── ExpressionsParser.swift
│   │   ├── Formula.swift
│   │   ├── FormulaLabel.swift
│   │   ├── FormulaStackView.swift
│   │   ├── Node.swift
│   │   └── Operator.swift
│   ├── Protocol
│   │   ├── CalculateItemProtocol.swift
│   │   ├── CalculatorControllerProtocol.swift
│   │   └── CalculatorViewDelegate.swift
│   └── View
│       └── CalculatorView.swift
└── CalculatorTests
    ├── CalculatorItemQueueTests.swift
    ├── ExpressionParserTests.swift
    ├── FormulaTests.swift
    ├── OperatorTests.swift
    └── StringSplitTests.swift
```

### 5. 실행 화면
- 소수 입력시

|기존|수정|
|:-:|:-:|
|![image](https://cdn.discordapp.com/attachments/1024185372512636948/1027776177152208926/015b19916fa02e60.gif) | ![image](https://cdn.discordapp.com/attachments/1024185372512636948/1027776176766328862/a25a7a287784edab.gif) |
|0이 아닌 숫자를 입력시에만 입력 숫자 레이블 업데이트가 이루어진다.|0 및 어떤 버튼의 입력시에도 즉각적인 레이블 업데이트가 이루어진다.|

### 6. 트러블 슈팅
<details>
<summary>NumberFormatter의 부분 적용</summary>
    
기존에는 `0.`이나 `0.000`, `0.0100` 이런 숫자들이 키패드로 입력되지 않았었습니다.
그래서 고민하다가 정수, 점, 소수 부분 3가지로 나눠 적용하는 방식으로 진행했습니다.
하지만 또 이렇게 진행 하다보니 scroll view에 추가될 때 필요없는 부분들 까지 입력되는 문제가 생겼습니다. 그래서 `makeStackView()` 메서드에서 `NumberFormatter`를 통해 한 번 더 가공해서 값을 넣어줬습니다.
</details>
<details>
<summary>UILabel 의존성 문제</summary>
    
`Controller`부분에서 view에 있는 label들을 직접 수정하는 부분이 있어서 싱글톤 패턴을 사용하면 `view`와 `controller`에서 같은 친구를 가지고 계속 가공을 하면 되는 것이 아닐까? 라는 생각에 리팩토링을 시작했습니다. 하지만 UILabel을 직접 싱글톤 클래스로 설정했을 때 원하는대로 동작하지 않았고, 결국 프로토콜을 이용해 `Controller`는 직접 `View`를 가지지 않고 `View`가 준수하고 있는 `MainViewControllerDelegate`프로토콜을 통해 `View`에 접근함 따라서 의존성 역전을 지키게 되었습니다.
</details>

### 7. 핵심 경험
- 같은 UML기반으로 작성된 코드병합
- SOLID 원칙을 생각해보며 코드 작성
- 매직 리터럴 없는 코드 작성
- 코드 리팩토링
