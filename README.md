# 계산기

## 0. 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [시각화된 프로젝트 구조](#4-시각화된-프로젝트-구조)
5. [실행 화면](#5-실행-화면)
6. [트러블 슈팅](#6-트러블-슈팅)
7. [핵심 경험](#7-프로젝트-수행-중-핵심-경험)
8. [참고 링크](#8-참고-링크)

## 1. 소개
간단한 계산기 프로그램입니다.

<br>

## 2. 팀원
<div align="center">

| zhilly |
| :---: |
| <img src=https://user-images.githubusercontent.com/99257965/190572502-b7a41ed7-3c1b-44af-8b03-77d7e49d4705.png width=150> |
| @zhilly11 |

</div>


<br>

## 3. 타임라인
[STEP-1]
 - 220920
     - 요구사항 기반의 UML 작성
     - 프로젝트 소스파일 그룹화
     - CalculatorItemQueue 및 CalculateItem 파일 생성
     - Test파일 생성
     - test case를 작성하면서 통과할 수 있도록 소스코드 작성
 - 220922
     - test case 리팩토링

[STEP-2]
 - 220923
     - 모델의 저장 방식을 배열 -> LinkedList로 변경
     - UML 기반의 코드 작성
 - 220926
     - TDD 방식으로 Model파일들 작성
 - 220927
     - 리팩토링 

[STEP-3]
 - 220929
     - 리팩토링
     - MainViewController, CalculatorController 소스 작성
 - 220939
     - 버튼에 대한 기능 구현
     - 버그 수정
     - 요구사항에 따른 소스코드 수정


<br>

## 4. 시각화된 프로젝트 구조
### File Tree

```bash
.
├── View
│   └── MainViewController.swift
├── Controller
│   └── CalculatorController.swift
├── Model
│   ├── CalculatorItemQueue.swift
│   ├── ExpressionsParser.swift
│   ├── Formula.swift
│   ├── Node.swift
│   └── Operator.swift
├── Protocol
│   └── CalculateItemProtocol.swift
├── Extension
│   ├── Double+Extensions.swift
│   └── String+Extensions.swift
├── Delegate
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Base.lproj
│   ├── LaunchScreen.storyboard
│   └── Main.storyboard
└── Info.plist

```

### UML
<p align=center>
<img src= https://i.imgur.com/OgvFd2j.jpg width=800>
</p>

<br>

## 5. 실행 화면



| 실행화면 1 | 실행화면 2 | 실행화면 3 |실행화면 4 |
| :--------: | :--------: | :--------: | :--------: |
|<img src= https://i.imgur.com/ERXf0yi.gif width=300>|<img src= https://i.imgur.com/5nQ0Apt.gif width=300>|<img src= https://i.imgur.com/ZkdAbXA.gif width=300>|<img src= https://i.imgur.com/2UgbhgH.gif width=300>|
| 사칙연산 수행이 가능합니다. | 숫자의 3자리마다 콤마를 표시해 줍니다.| 소수의 연산도 가능합니다. | 계산할 수 없는 값이 입력되면 특수한 값을 표시해 줍니다. |



## 6. 트러블 
<details>
    <summary>Unit Test & TDD</summary>

처음 작성시 `given-when-then` 구조를 지키지 않아 가독성과 테스트 컨벤션들이 맞지 않았습니다. 그래서 test case가 어떤 경우에 어떤 결과로 이어지는지 알아보기 힘들었습니다. 그래서 리뷰어의 조언대로 나름의 규칙을 만들어 test case들을 리팩터링 진행했습니다.
- 메서드 이름만으로도 충분히 어떤 테스트인지 이해할 수 있어야 한다.
- `given-when-then`의 구조를 지켜야 한다.
- `given-when-then`이외의 일은 하지 않게 작성해야 한다.
- 실제 코드가 영향을 받지 않게한다.
- 숫자 앞이나 중간중간 `-`를 넣어 가독성을 높인다.
</details>

<details>
    <summary>CalculatorItemQueue 내부 구현 array -> linked list 수정</summary>

1. queue는 pop연산시 빈번한 데이터의 이동이 일어납니다.
2. queue 같은 경우 맨 앞의 원소를 제거해야 하기 때문에 array를 사용해서 구현하면 O(n)의 복잡도가 소요됩니다. 왜냐하면 제거하고 뒤의 요소들을 재배치 해줘야 하기 때문이죠. 1번과 비슷한 이유입니다.
3. Linked List는 삽입/삭제에 O(1)이 소요됩니다. 즉 제거된 뒤의 요소 재배치 필요하지 않습니다.

따라서 Linked List 선택했습니다! (+ swift로 구현해보고 싶은 이유도,,)
</details>
    
    
<details>
    <summary>MVC 패턴으로 구현</summary>

MVC 구조를 최대한 지켜보고자 각각의 역할만 최대한 수행할 수 있도록 구현했습니다. 
- `MainViewController` : 
    - 최대한 보여지는 부분만 책임질 수 있도록 작성했습니다
    - 사용자에게 입력받은 값들은 `CalculatorController`로 보내서 처리합니다.
- `CalculatorController` :
    - 사용자에게 입력받은 값들을 처리해 `Formula`모델에 저장하는 역할을 합니다.
    - 사용자의 입력 컨트롤의 대부분을 담당합니다.
- `Formula` :
    - Controller에서 가공된 데이터들을 기반으로 비즈니스 로직을 수행합니다.
    - 수행한 값을 Controller에서 전달 받고 Controller는 View에 전달합니다. 

하지만 MVC 구조를 사용하니까 사용자에게 보여줄때만 NumberFormatter를 활용 할 수 있어서 오류가 나지 않고 구현 할 수 있었습니다. 기능분리의 장점이라고 생각합니다!
    
처음 MVC 패턴을 이용하여 작성하다 보니 Controller의 양이 방대해지고, View 와 Controller의 강결합이 되어있다고 생각이 되었습니다.
SOLID 원칙이 제대로 지켜지지 않았다는 생각이 들어서 더 많은 공부와 연습이 필요하다고 생각합니다.
</details>
    
<br>

## 7. 프로젝트 수행 중 핵심 경험
- TDD 기반의 프로그래밍
- Queue의 이해, 구현, 활용
- Linked List의 이해, 구현, 활용
- MVC 패턴 적용
- UIScrollView 활용
- UIStackView 활용
- IBOutlet/IBAction/IBOutletCollection 활용
- UML 기반의 코드 작성
- 고차함수 활용

<br>

## 8. 참고 링크

[The Swift Programming Language](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)

[Unit Test 작성하기 - 야곰 닷넷](https://yagom.net/courses/unit-test-%EC%9E%91%EC%84%B1%ED%95%98%EA%B8%B0/)

[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)

---
[🔝 맨 위로 이동하기](#계산기)
