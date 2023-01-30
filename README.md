
# ➕➖ 계산기 프로젝트➗✖️


## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)


</br>

## 1. 소개
> 계산기 어플리케이션입니다. 
프로젝트 수행 조건에 의해 사칙연산자의 우선 순위는 무시합니다.


</br>

## 2. 팀원

|[Christy](https://github.com/christy-hs-lee)|
| :--------: |
|<img height="180px" src="https://i.imgur.com/kHLXeMG.png">|


</br>

## 3. 타임라인
### 프로젝트 진행 기간
**23.01.24 ~ 23.02.03** 

|날짜|타임라인|
| :-------: | :-------: |
|23.01.24 (화)|TDD 학습, 공식 문서 읽기|
|23.01.25 (수)|공식 문서 읽기, Queue 구현하기|
|23.01.26 (목)|CalculatorItemQueue 구현하기|
|23.01.27 (금)|STEP1 PR|
|23.01.30 (월)| |
|23.01.31 (화)| |
|23.02.01 (수)| |
|23.02.02 (목)| |
|23.02.03 (금)| |


</br>

## 4. 프로젝트 구조

- ### 폴더 구조
```

 Calculator
 ├── Calculator
 │   ├── AppDelegate
 │   ├── SceneDelegate
 │   ├── ViewController
 │   ├── CalculatorItemQueue
 │   └── CalculatorItem
 └── CalculatorItemQueueTests
     └── CalculatorItemQueueTests

```

</br>

- ### UML
![](https://i.imgur.com/x7XbUJW.png)


</br>


## 5. 실행 화면(기능 설명)

- 추후 추가 예정

</br>

## 6. 트러블 슈팅
### 1. 자료구조와 Queue의 구현 방법
이번 스텝을 시작하며 가장 먼저 학습한 부분입니다. 
Queue를 구현하는 방법으로 `Array`, `Double Stack`, `Linked List`가 있음을 알았습니다. 각 구현 방식에 따른 장점과 단점을 비교하며 가장 이상적인 `Linked List`를 사용하여 구현하고자 했습니다. 하지만 학습이 많이 부족한 탓에 완성된 결과물을 만들 수 없었습니다😥 그래서 우선적으로 `Array`를 사용하여 구현했습니다. 추후 `Linked List`에 대한 학습을 충분히 진행하고 리팩토링하려고 합니다.

</br>

### 2. Class와 Struct
`CalculatorItemQueue`를 구현하기에 앞서 가장 먼저 한 고민은 "`class`와 `struct`중 어떤걸 사용할까?" 였습니다. 하지만 공식 문서를 참고하여 상속, 참조가 사용되지 않아 `CalculatorItemQueue`를 `struct`로 구현했습니다.
 

</br>


## 7. 참고 문서
> - [Swift 공식문서 - XCTAssert](https://developer.apple.com/documentation/xctest)
> - [Unit Test - 야곰닷넷](https://yagom.net/courses/unit-test-%EC%9E%91%EC%84%B1%ED%95%98%EA%B8%B0/)
> - Swift Data Structure and Algorithms 도서


</br>
