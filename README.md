
# ➕➖ 계산기 프로젝트➗✖️


## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고 문서](#7-참고-문서)


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
|23.01.30 (월)| STEP1 리팩토링 |
|23.01.31 (화)| UML 분석, split 구현 |
|23.02.01 (수)| parse 구현 및 테스트 코드 작성 |
|23.02.02 (목)| STEP2 PR, ViewController 구현 |
|23.02.03 (금)| 계산기 기능 구현 |


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
 │   ├── CalculateItem
 │   ├── Extension
 │   ├── Formula
 │   ├── Operator
 │   └── ExpressionParser
 └── CalculatorItemQueueTests
 │   └── CalculatorItemQueueTests
 └── FormulaTests
 │   └── FormulaTests
 └── OperatorTests
     └── OperatorTests
     
```

</br>

- ### UML

<details>
<summary>STEP 1</summary>
<div markdown="1">

![](https://i.imgur.com/ZI4S6Ux.png)

</div>
</details>


<details>
<summary>STEP 2</summary>
<div markdown="1">


![](https://i.imgur.com/gHdC47F.png)

</div>
</details>



</br>


- ### 프로젝트 수행 경험

<details>
<summary>STEP 1</summary>
<div markdown="1">

- [ ]  TDD 시작하기
    - [ ]  기존의 프로젝트에 Test Target 추가
- [ ]  Queue 자료구조의 이해와 구현
- [ ]  List 자료구조 직접 구현해보기(선택)
    - [ ]  리스트를 활용하여 Queue 구현(선택)

</div>
</details>

<details>
<summary>STEP 2</summary>
<div markdown="1">

- [ ]  UML을 기반으로 한 코드구현
- [ ]  숫자와 연산자 입력에 큐 활용
- [ ]  TDD를 기반으로 코드 작성하기(선택)

</div>
</details>

<details>
<summary>STEP 3</summary>
<div markdown="1">

- [ ]  IBOutlet / IBAction의 활용
- [ ]  스택뷰의 활용
- [ ]  스크롤뷰의 활용

</div>
</details>

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

### 3. UML 분석
제시된 UML만 보고 구현해야 하는 기능들과 관계들이 파악하기 너무 어려웠습니다. `split`과 `componentsByOperators`는 서로 어떤 차이점이 있을까, 어떤 inpu을 받아 어떻게 return을 하는가, 메서드 내부에는 어떤 기능이 있어야 할까 등 너무나 많은 고민의 연속이었습니다. 고민을 하다 해결이 되지 않는 부분들을 캠퍼들과 이야기 하며 해결했습니다

</br>

### 4. 적절한 고차 함수의 사용
프로젝트를 진행하며 `componentsByOperators`에서 입력값을 숫자와 연산자로 분리하는 과정이 있었습니다. 해당 과정을 구현하기위해 적절한 고차 함수의 사용이 필요했습니다. `map`, `flatMap`, `filter`, `reduce`, `compactMap` 등 다양한 고차 함수를 공부했습니다. 그 중 `flatMap`, `reduce`를 사용하여 구했습니다. 
- `flatMap` : 배열에 있는 옵셔널을 제거하여 새로운 배열을 생성한다
- `reduce` : 배열의 각 요소를 순차적으로 처리하여 하나의 값으로 결합한다.
- `filter` : 배열에서 특정 조건을 만족하는 요소를 추출하여 새로운 배열을 생성한다.

</br>

### 5. split의 기준
값이 입력되면 숫자와 연산자로 분리하는 과정이 필요했습니다. 이 과정에서 처음에는 사칙연산을 사용하여 구분해 주었지만 음수의 값이 들어오는 경우 음수와 연산기호 빼기가 구분되지 않는 문제를 발경했습니다. 그러던 중 계산기 view에 있는 연산기호를 보았습니다. 또한 음수의 `-`와 연산자`-`가 서로 다름을 파악했습니다. 연산자`-`의 경우 유니코드였고, 해당 기호를 입력받아 Int에 적용하면 음수의 값이 아닌 에러가 발생하는 것을 알아냈습니다. 따라서 연산기호 `+, −, ÷, ×` 로 split을 할 수 있었습니다.

</br>


## 7. 참고 문서
> - [Swift 공식문서 - XCTAssert](https://developer.apple.com/documentation/xctest)
> - [Unit Test - 야곰닷넷](https://yagom.net/courses/unit-test-%EC%9E%91%EC%84%B1%ED%95%98%EA%B8%B0/)
> - [UML 분석](https://www.nextree.co.kr/p6753/)
> - [Swift 공식문서 - 고차함수 관련](https://developer.apple.com/documentation/swift/sequence/flatmap(_:)-jo2y)
> - Swift Data Structure and Algorithms 도서


</br>
