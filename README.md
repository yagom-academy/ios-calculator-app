## 📚 제목
계산기

## 📖 소개
ios 계산기 앱을 구현한 프로그램 입니다.


<br/>

**프로젝트를 구현하며 사용해본 것**
- TDD
- UML 
- LinkedList

## 🧑🏻‍💻 팀원

|                        제이푸시                         |
|:---------------------------------------------------------:|
| <img width="180px" src="https://i.imgur.com/JqEDLOf.jpg"> |


## ⏰ 타임라인: 프로젝트의 주요 진행 척도

**STEP1**
- 9월 19일
    - 프로젝트 요구사항 분석
    - 요구사항 기반으로 UML 작성

- 9월 20일
    - TDD 테스트 파일생성
    - `CalculatorItemQueue` LinkedList로 구현
    - `Node` 구현
    - `CalculateItem` 구현

- 9월 22일
    - 코드 리뷰 기반 리팩토링 진행
        - TDD 컨벤션 수정


## 🛠 시각화된 프로젝트 구조(다이어그램 등)
<img src="https://i.imgur.com/EoFFmfA.png" width="70%">

## 🖥 실행 화면(기능 설명)
이후 추가

## 🔥 트러블 슈팅

### 프로젝트 요구사항 이해

프로젝트 요구사항에서 제시한 `Queue내에서 다루는 요소는 CalculateItem 프로토콜을 준수한다`<br/>
의 요소는 메서드라고 생각해서 프로토콜 내에 calculate() 등의 계산메서드를 넣고 준수하려 함. <br/>
이후 제시된 UML에서 Queues내에서 다루는 요소란 말 그대로 큐 내의 값 타입을 프로토콜로 준수하라는 뜻이어서 수정.<br/>
프로젝트 요구사항을 이해하는 것은 중요하다..

### 테스트 하고 싶은 메서드가 private일 때

테스트의 가장 기본적인 원칙은 테스트 코드와 실제코드의 분리.<br/>
만약 private를 제거해서 테스트를 해준다면 테스트의 의미가 없어짐.<br/>
private가 되어야 한다면 다른 메서드에서 사용되는 것이 분명하니 직접접근을 하지 않고 테스트

## 🔗 참고 링크

[Unit tests best practices in Xcode and Swift](https://www.avanderlee.com/swift/unit-tests-best-practices/) <br/>
[Unit Test 작성하기 - 야곰 닷넷](https://yagom.net/courses/unit-test-작성하기/) <br/>
[TDD는 설계 방법론이 아니다](https://gyuwon.github.io/blog/2019/03/03/tdd-is-not-a-design-methodology.html)
