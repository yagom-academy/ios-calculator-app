# 계산기

## 0. 목차
1. [소개](#1.-소개)
2. [팀원](#2.-팀원)
3. [타임라인](#3.-타임라인)
4. [시각화된 프로젝트 구조](#4.-시각화된-프로젝트-구조)
5. [실행 화면](#5.-실행-화면)
6. [트러블 슈팅](#6.-트러블-슈팅)
7. [핵심 경험](#7.-프로젝트-수행-중-핵심-경험)
8. [참고 링크](#-8.-참고-링크)

## 1. 소개
큐 타입을 이용한 계산기 프로젝트입니다.

<br>



## 2. 팀원
| 애종 | 
| --- | 
| <img src= https://i.imgur.com/l2Lwg5b.jpg width=150>| 
| @jonghancha | 

<br>

## 3. 타임라인
[STEP-1]
- 220921: 단위 테스트 타깃 `CalculatorModelTests` 추가
- 220921: 배열을 이용한 Queue 타입 구현
    - Queue에 element를 추가하는 enqueue
    - Queue에서 추가된 순서대로 삭제하는 dequeue
- 220922: Test naming들을 given, when, then이 포함된 구체적인 이름으로 변경
- 220922: branch를 따로 파서 LinkedList를 이용해 Queue 구현
- 220923: tearDown메서드내부 sut의 nil처리과정 삭제





<br>

## 4. 시각화된 프로젝트 구조
### UML

![](https://i.imgur.com/gcBQeKg.png)

- 입력받는 숫자와 연산자를 담을 queue는 숫자와 연산자 모두를 담아야 하기 때문에 [String]
타입으로 구현했습니다.
- enqueue()에서는 append메서드를 사용해 queue에 element를 추가해주고
- dequeue()에서는 queue.isEmpty가 참일 경우 return nil, 거짓일 경우 큐에 element가 존재한다는 뜻이기 때문에 removeFirst()메서드를 실행해주었습니다.

<br>

## 5. 실행 화면(기능 설명)


<br>


## 6. 트러블 슈팅
### Unit Test의 추가
- 기존 프로젝트에는 UnitTest가 없던 상태로 생성되었기 때문에 제가 새로 UnitTest Target을 생성해주어야 했습니다. 하지만 무슨 이유에서인지 @testable import하는 과정에서 계속 오류가 발생했고,![](https://i.imgur.com/46uIaJD.png)

 구글링도 해보고 다른 캠퍼들의 코드를 봐도 오류의 이유를 찾기 어려워 캠프 서포터즈 분께 질문드렸더니, Test Target관련해 Xcode자체적으로 오류가 발생하기도 한다고 전해들었습니다. CalculatorTests라는 네이밍으로 내부적으로 오류를 발생시킨다고 판단해 새로 CalculatorModelTests라는 Target을 생성해주니 정상 작동 하였습니다.
 

### 큐를 어떻게 구현할지에 대한 고민
- 큐는 FIFO의 특징을 가진다고 배웠습니다. 즉, append된 순서대로 dequeue작업이 이루어져야 한다는 것입니다. 큐를 공부하기 위해 자료구조와 시간복잡도에 대한 내용을 잠깐 봤지만 금방 이해될 것 같은 내용은 아니었습니다. 
- 그래서 엄밀히 말하면 dequeue작업이 O(1)을 보장하지 못하는 배열을 이용해 구현을 먼저 해보자 판단했습니다. 큐에 대해 정확히 알지 못하는 상황이라 배열이라는 아는 기능을 통해 구현해보는 것이 우선 도움이 될 것 같았기 때문입니다. 이렇게 한 덕분에 큐에 대해 좀 더 이해할 수 있었고, 시간이 남는다면 LinkedList를 공부하고 이용해 큐를 구현해보고 싶습니다.


<br>

## 7. 프로젝트 수행 중 핵심 경험

- TDD 시작하기
    - Test Target 추가하기
- Queue 자료구조의 이해와 구현
- List 자료구조 직접 구현해보기
  

<br>

## 8. 참고 링크

* [API Design Guidlines](https://swift.org/documentation/api-design-guidelines/)
* [Swift Style Guide](https://google.github.io/swift/)
* [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
* The Swift Programming Language (Swift 5.7)
    - [Enumerations](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
    - [Initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
    - [Access Control](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
    - [Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
    - [Protocol](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

---
[🔝 맨 위로 이동하기](#계산기)
