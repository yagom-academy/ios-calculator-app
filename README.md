
# 📱ios-calculator

> 📅 프로젝트 기간 2022.03.14 ~ </br>
🎓 리뷰이 : [@marisol](https://github.com/marisol-develop) / 👑 리뷰어 : [@hyunable]

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [UML](#uml)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 3](#step-3)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [트러블슈팅](#트러블슈팅)
- [기술의 장단점](#기술의-장단점)
    
## 프로젝트 소개 및 기능



## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## UML
![](https://i.imgur.com/DVuMu9l.png)


## [STEP 1]
### 고민한점
#### Queue 구현 방식 : Linked List vs Double Stack vs Array
Queue는 먼저 넣은 데이터가 먼저 나오는 FIFO(First-In_First_Out)의 구조로 저장하는 컴퓨터 자료 구조의 하나이다. 계산기 프로젝트를 위해 먼저 넣은 숫자가 먼저 나오도록하는 Queue의 방식을 사용해야 하는데, swift에서는 Queue 자료 구조를 제공하고 있지 않아 직접 만들어줘야 했다.
어떤 방식으로 Queue를 구현할지 3가지로 고민했다.
- Linked List
- Double Stack
- Array

계산기가 작동할 때 중간에 숫자를 삽입하거나 삭제할 필요가 없기 때문에, Linked List의 장점이 사용되지 않는다고 생각했다.
Double Stack과 Array 중 고민하던 중, 하나의 Array로 더 간단히 구현할 수 있는 Array를 선택해서 구현해보았다.

### 배운개념
- Queue
- Linked List
- Unit Test
- TDD

---
## 트러블슈팅

---

## 기술의 장단점
- Linked List
    - Linked List는 각 노드가 데이터와 포인터를 가지고 한 줄로 연결되어 있는 방식으로 데이터를 저장하는 자료 구조를 의미한다. Array와 다르게 위치가 흩어져있기 때문에 서로 연결되어 있어야 한다. 
    - 장점 : Linked List는 포인터를 바꾸는 방식으로 중간에 노드를 삽입/삭제가 시간복잡도O(1)으로 가능하다는 장점이 있다. 
    - 단점: 하지만 특정 위치의 데이터를 검색하는 데에는 O(n)의 시간이 걸린다는 단점이 있다.
- Double Stack
    - Double Stack을 통해 2개의 Stack을 사용하여 queue를 구현할 수도 있다. 각각의 Stack이 enqueue와 dequeue를 전담한다. enqueue stack에는 append를 통해 값을 추가하고, dequeue stack은 enqueue stack의 요소들을 거꾸로 정렬하여 dequeue Stack에 넣어주고, pop하여 dequeue한다.
    - 장점 : enqueue stack의 마지막 요소가 dequeue stack의 첫번째 요소가 되기 때문에 dequeue시 요소들이 앞으로 당겨지는 비용이 쓰이지 않아 시간복잡도가 O(1)이 된다.
    - 단점 : 구현이 복잡하다.
- Array
    - 장점 : enqueue시 append만 해주면 되기 때문에 enqueue의 시간복잡도는 O(1)이다
    - 단점 : 첫번째 요소를 dequeue 해야하기 때문에 로직을 바꾸지 않으면 첫번째 요소를 dequeue하고 나머지 요소들을 앞으로 당기는 비용이 들어 시간복잡도가 O(n)이다.
---

#### **Commit 규칙**
> 커밋 제목은 최대 50자 입력
> 본문은 한 줄 최대 72자 입력

#### **Commit 제목 규칙**
- [chore] : 코드 수정, 내부 파일 수정
- [feat] : 새로운 기능 구현
- [style] : 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
- [add] : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
- [fix] : 버그, 오류 해결
- [del] : 쓸모없는 코드 삭제
- [docs] : README나 WIKI 등의 문서 개정
- [mod] : storyboard 파일,UI 수정한 경우
- [correct] : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- [move] : 프로젝트 내 파일이나 코드의 이동
- [rename] : 파일 이름 변경이 있을 때 사용합니다.
- [improve] : 향상이 있을 때 사용합니다.
- [refactor] : 전면 수정이 있을 때 사용합니다
- [merge]: 다른브렌치를 merge 할 때 사용합니다.

#### **Commit Body 규칙**
- 제목 끝에 마침표(.) 금지
- 한글로 작성

#### **브랜치 이름 규칙**
ex) ic_5_marisoldeveop, ic_5_marisoldeveop_2, ic_5_marisoldeveop_3





