# 계산기 README
프로젝트 기간: 2022/09/19 ~ 2022/09/30(2주)
팀원: [rhovin](https://github.com/yuvinrho) / 리뷰어: [라자냐](https://github.com/wonhee009)


## 🪧 목차
- [프로젝트 소개](#프로젝트-소개)
- [개발환경](#개발환경)
- [타임라인](#타임라인)
- [UML](#uml)
- [실행 화면](#실행-화면)
- [트러블 슈팅](#트러블-슈팅)
- [레퍼런스](#레퍼런스)

## 💻 프로젝트 소개
계산기 앱

## 🛠 개발환경
[![swift](https://img.shields.io/badge/swift-5.7-orange)]() [![xcode](https://img.shields.io/badge/Xcode-14.0-blue)]()

## 📆 타임라인
- 1주차 : 계산기 모델 구현
    - CalculatorItemQeueue 정의
    - Operator 정의
    - Formula 정의
    - ExpressionParser 정의
    - CalculatorError 정의
    - 구현한 타입 테스트 진행
 
## 📊 UML
![](https://i.imgur.com/qDTkJIh.png)

## 📱 실행화면
추후 넣을 예정

## 🎯 트러블 슈팅
- CalculatorItemQueue 타입안에 요소가 CalculatorItem 프로토콜 준수하도록 하기
    - 제네릭은 모든 타입을 사용할 수 있는 함수나 타입을 만들 수 있고, 특정 타입만 사용할 수 있게 제약을 설정할 수 있다.
    ```swift
    struct CalculatorItemQueue<CalculateItem> {}
    ```
    
## 📚 레퍼런스
[Swift Programming Language - Generic](https://docs.swift.org/swift-book/LanguageGuide/Generics.html#ID186)
