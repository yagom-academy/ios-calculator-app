# 🧮 계산기 리팩토링 ➕➖➗✖️🟰
## 💬 소개
> 기존 계산기와는 다르게 연산자 우선 순위를 무시하지만 `Queue`타입을 활용한 스택뷰와 레이블을 활용하여 계산 내역을 표시해주는 계산기를 각자 작성한 코드를 병합 후 리팩토링하였습니다.

</br>

## 🔖 목차 

1. [팀원](#1.)
2. [타임 라인](#2.)
3. [다이어그램](#3.)
4. [폴더 구조](#4.)
5. [고민한 부분](#5.)
6. [트러블 슈팅](#6.)
7. [실행 화면](#7.)
8. [참고 링크](#8.)
9. [팀 회고](#9.)


---

</br>

<a id="1."></a>

## 1. 🎙️ 팀원

|[Mary ♒️](https://github.com/MaryJo-github)         |        [Karen ♉️](https://github.com/karenyang835)        |
| :----------------------------------------------------------: | :------------------------------------------------------: |
| <img src="https://i.imgur.com/8mg0oKy.jpg" width="130" height="165"/> | <Img src="https://avatars.githubusercontent.com/u/124643896?v=4" width="150"/> |

</br>

<a id="2."></a>

## 2. ⏰ 타임 라인

### <프로젝트 진행 기간>
#### 2023.06.12. ~ 2023.06.16.

|**날 짜**|**내 용**|
|:-:|-|
| 2023.06.12.    | 📝 프로젝트에서 필요로 하는 핵심기능 공부<br>    |
| 2023.06.13.    | 🆕 프로젝트에서 명시한 UML을 기반으로 각자 작성한 코드를 병합 <br>    |
| 2023.06.14.    | 🆕 스토리보드의 UI연결과 기능 구현<br>    |
| 2023.06.15.    | 🛠️ 전체적인 코드 리팩토링<br>    |
| 2023.06.16.    | ✍️ README 작성<br>    |

</details>


</br>

<a id="3."></a>

## 3.📊 다이어그램
![image](https://github.com/karenyang835/ios-calculator-app/assets/124643896/d0d09855-3bf5-4ba6-a12b-108eb7b0ed95)


</br>


<a id="4."></a>

## 4. 📂 폴더 구조

```
.
├── Calculator
│   ├── Model
│   │   ├── CalculatorItemQueue
│   │   │   ├── CalculatorItemQueue.swift
│   │   │   ├── LinkedList.swift
│   │   │   └── Node.swift
│   │   ├── CalculatorItemQueue.swift
│   │   ├── ExpressionParser.swift
│   │   ├── Formula.swift
│   │   ├── LinkedList.swift
│   │   ├── Operator.swift
│   │   └── Protocol
│   │       └── CalculateItem.swift
│   ├── View
│   │   ├── Assets.xcassets
│   │   ├── Base.lproj
│   │   │   ├── LaunchScreen.storyboard
│   │   │   └── Main.storyboard
│   │   └── Extension
│   │       └── UIScrollView+.swift
│   ├── Controller
│   │   ├── AppDelegate.swift
│   │   ├── MainViewController.swift
│   │   └── SceneDelegate.swift
│   ├── Error
│   │   └── FormulaErrors.swift
│   ├── Extension
│   │   ├── Double+.swift
│   │   └── String+.swift
└── └── Info.plist
```

---

<a id="5."></a>

## 5. 🤔 고민한 부분

### 1️⃣ 코드 병합
- `Queue`타입은 둘 다 단방향 `LinkedList`로 구현을 해서 병합시 수월했습니다. 연산자 부분도 거의 동일한 코드였기에 하나로 통합하는데 큰 문제는 없었으나 그 외의 부분은 서로 다른 코드이기에 어떻게 병합을 해야될 지 고민이 많이 되었습니다. 병합하기 전 코드 방향성을 먼저 정하고 나서 나아가는게 좋을 것 같아 협의 후 고민 끝에 코드의 방향성을 가독성과 확장성에 중점을 두고 코드를 병합 했습니다. 

### 2️⃣ View 분리
- `MainViewController`의 `createFormulaLabel`과 `createSubStackView` 메서드는 `MVC`구조 중 `View`에 해당하는 것 같아 메서드의 위치를 고민하였습니다. 하지만 메서드만 `View` 그룹으로 분리하기에는 어색하다고 판단하여 결과적으로는 `ViewController` 내에 `extension`으로 분리해주었습니다.

</br>

<a id="6."></a>

## 6. 🚨 트러블 슈팅
### 1️⃣ scrollView AutoLayout
**⛔️ 문제점**
- `scrollView`와 `stackView`는 `intrinsic size`를 가지지 않기때문에 크기를 알 수 없어서 `layout` 잡는 데 문제가 발생하였습니다.

**✅ 해결 방법 1**
- 다음과 같이 제약을 추가하였습니다.
    ```swift
    stackView.width = superView.width  // 여기에서 superView = scrollView
    stackView.height = 24 @ 50
    stackView.height = Frame Layout Guide.height @ 1
    ```
- 해당 방법은 화면에 보여지는 것에는 문제가 없었으나, 휴대폰 기종에 따라 사이즈가 다르기때문에 제약을 상수값으로 주는 것은 위험할 수 있습니다. 따라서 다른 방안을 추가로 찾아보았습니다.

**✅ 해결 방법 2**
- 상수값으로 제약을 주는 것 대신 `stackView` 안에 `intrinsic size`를 가지고 있는 `Label`을 넣어줌으로써 `scrollView`와 `stackView`의 크기가 정해지도록 하였습니다.
- 이 외 `stackView`의 제약은 다음과 같습니다.
    ```swift
    stackView.width = superView.width
    stackView.height = scrollView.height @ 100
    stackView.height = Frame Layout Guide.height @ 1
    ```

➡️ 최종적으로, 방법 1은 문제가 발생할 가능성이 있기 때문에 방법 2를 채택하였습니다.

### 2️⃣ 연산자만 누르고 "=" 버튼을 눌렀을 때 오류 or 사용자의 실수

**⛔️ 문제점**
- 계산기에서 연산자만 입력이 들어왔을 때 해당 상황을 입력오류로 인식해서 사용자에게 오류 문구를 출력해줄 것인지 아니면 사용자의 실수로 인식해서 기본값인 `0`으로 반환을 해줄지 여부로 서로의 의견이 충돌되었습니다.

**✅ 해결 방법**
- `=`을 눌렀을 때 `0`을 반환해주는지 오류로 볼 지를 두고 근거를 두자면 계산기앱이 팝업창을 별도로 띄워주는 앱이 아니기에 오류로 보지 않고, 입력할 때 마다 기본 값인 `0`이 깜빡 깜빡 한다는 건 값이 들어온다는 것이니 `0`을 반환해주는 것이 맞는 구현이라고 생각했습니다.


### 3️⃣ `componentsByOperators` 메서드
**⛔️ 문제점**
- `componentsByOperators` 메서드를 구현할 때 `String` 타입에 확장 메서드로 정의해뒀던 `split`을 활용할지, `components`를 활용할지 여부로 의견이 충돌하였습니다.

**✅ 해결 방법**
- `split`을 이용한 방법
 `String` 타입의 확장 메서드인 `split`을 이용하여 `componentsByOperators`를 구현하면 다음과 같습니다.
  ``` swift
  private static func componentsByOperators(from input: String) -> [String] {
    return Operator.allCases.reduce([input]) { resultArray, operatorItem in
        resultArray.map { $0.split(with:operatorItem.rawValue) }.flatMap { $0 }
  }
  
  extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
  }
  ```
- `components`을 이용한 방법
    ``` swift
    static private func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases
                                .map { String($0.rawValue) }
                                .joined()
        return input.components(separatedBy: CharacterSet(charactersIn: operators))
    }
    ```
  ➡️ `split`을 이용한 방법은 고차함수를 활용해서 코드량은 줄었지만 너무 많은 고차함수들을 사용하여 가독성이 좋지 않다고 판단하였습니다. 따라서 저희는 `components(separatedBy:)` 메서드를 사용하는 것으로 결정하였습니다.
---

</br>

<a id="7."></a> 

## 7.📱실행 화면

| AC버튼 | CE버튼 |
| :--------: | :--------: |
|<img src="https://github.com/karenyang835/pr-exercise/assets/124643896/8b1ad771-9e9a-4059-9318-35ab0c981340" style="zoom:70%;" />|<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/36c83710-a752-4881-8b22-2835b722f151" style="zoom:70%;" />|

| 5 나누기 3 | ÷  |
| :--------: | :--------: | 
|<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/a5a66154-b8ce-4010-b01c-18231ebe227c" style="zoom:70%;" />|<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/219e2bea-6895-41ed-bb9c-1846148d5221" style="zoom:70%;" />|
  
| +/-버튼 | 천단위 구분기호 |
| :--------: | :--------: | 
|<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/703f8eff-0408-499e-9257-1c52afa50d16" style="zoom:70%;" />|<img src="https://github.com/karenyang835/pr-exercise/assets/124643896/7ec9a790-cf14-4969-9a08-6250cef452dd)" style="zoom:70%;" />|

|자동스크롤 | dot 예외처리 |
| :--------: | :--------: | 
|<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/9fa9e83b-43fd-4eeb-bf06-e62869cb3f8c" style="zoom:70%;" />|<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/a8cbe9e9-b6a5-4051-ba8f-a8a18a610ee4" style="zoom:70%;" />|

---

</br>

<a id="8."></a> 

## 8. 🔗 참고 링크
🍎 [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)<br>
🍎 [The Swift Language Guide - Protocol](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/)<br>
🍎 [The Swift Language Guide - Extension](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions/)<br>
🍎 [The Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)<br>
🍏 [Apple Developer - NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)<br>
🍏 [Apple Developer - CGPoint](https://developer.apple.com/documentation/corefoundation/cgpoint/)<br>
🍏 [Apple Developer - UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview)<br>

---
</br>


<a id="9."></a>

## 9. 💌 팀 회고

### 👏🏻 우리팀이 잘한 점
- 항상 서로 배려하며 존중해줬습니다.
- 프로젝트에서 요구하는 사항을 놓치는 부분 없이 만족시키려고 노력했습니다.
- 충분한 학습 후에 프로젝트를 진행했습니다.


### 👊🏻 우리팀이 개선할 점
- 열정과다로 컨디션 조절이 원활하지 못했습니다.


</br>
    

### 💜 서로에게 좋았던 점 피드백

#### Dear. Mary
- 코드의 스토리텔링 능력이 뛰어나십니다.
    - 코드 설명해주시는데 예시를 들어가시면서 이해하기 쉽게 설명해주셨고 왜 그렇게 코드를 작성하게 되셨는지도 명확하게 설명해주셨습니다.
- 팀원으로서 부족한 부분을 채워주려고 노력하셨고, 잘 이끌어주셨습니다.
- 상냥함과 배려심으로 부드러운 카리스마를 지니고 계십니다.
- 이유 있는 코드를 작성하실 줄 아는 분이신 것 같아 배우고 싶습니다.

#### Dear. Karen
- 프로젝트 과제 수행에 대한 열정이 대단하십니다.
- 넘치는 배려와 칭찬으로 전반적인 팀 분위기를 좋은 방향으로 이끌어주셨습니다.
- 모르는 부분을 정확히 이해하려고 노력하시는 모습이 멋있었습니다.
- 코드를 이해하고 수정하는 능력이 뛰어나신 것 같습니다.

</br>
    

### :pray: 서로에게 아쉬웠던 점 피드백
#### Dear. Mary
- 너무 짧은 기간 같이 프로젝트 진행해서 아쉬움이 큽니다.


#### Dear. Karen
- 프로젝트에 몰입하시다보니 수면을 충분히 취하시지 못하셨던 것 같습니다. 프로젝트 진행에는 정말 많은 도움이 되었으나 건강이 약간 걱정되었습니다.🥹


</br>
