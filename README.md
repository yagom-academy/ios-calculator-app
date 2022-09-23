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


[STEP-3]



<br>

## 4. 시각화된 프로젝트 구조
### File Tree

```bash
.
├── Calculator
│   ├── Base.lproj
│   │   ├── LaunchScreen.storyboard
│   │   └── Main.storyboard
│   ├── Controller
│   ├── Delegate
│   │   ├── AppDelegate.swift
│   │   └── SceneDelegate.swift
│   ├── Model
│   │   └── CalculatorItemQueue.swift
│   ├── Protocol
│   │   └── CalculateItemProtocol.swift
│   └── View
│       └── MainViewController.swift
├── Calculator.xcodeproj
└── CalculatorTests
    └── CalculatorItemQueueTests.swift

```

### UML
#### STEP-1
<p align=center>
<img src= https://i.imgur.com/PqwxKu4.png width=400>
</p>

<br>

## 5. 실행 화면


<br>


## 6. 트러블 슈팅
### Unit Test & TDD
처음 작성시 `given-when-then` 구조를 지키지 않아 가독성과 테스트 컨벤션들이 맞지 않았습니다. 그래서 test case가 어떤 경우에 어떤 결과로 이어지는지 알아보기 힘들었습니다. 그래서 리뷰어의 조언대로 나름의 규칙을 만들어 test case들을 리팩터링 진행했습니다.
- 메서드 이름만으로도 충분히 어떤 테스트인지 이해할 수 있어야 한다.
- `given-when-then`의 구조를 지켜야 한다.
- `given-when-then`이외의 일은 하지 않게 작성해야 한다.
- 실제 코드가 영향을 받지 않게한다.
- 숫자 앞이나 중간중간 `-`를 넣어 가독성을 높인다.


<br>

## 7. 프로젝트 수행 중 핵심 경험
- TDD 기반의 프로그래밍
- Queue의 이해, 구현, 활용

<br>

## 8. 참고 링크

[The Swift Programming Language](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- [Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)

[Unit Test 작성하기 - 야곰 닷넷](https://yagom.net/courses/unit-test-%EC%9E%91%EC%84%B1%ED%95%98%EA%B8%B0/)


---
[🔝 맨 위로 이동하기](#계산기)
