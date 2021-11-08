- [➕ 계산기](#---------)
- [키워드](#키워드)
- [Reviewers](#Reviewers)
- [STEP 1 : Queue **타입 구현**](#STEP-1--Queue-타입-구현)
    + [고민했던 것](#1-1-고민했던-것)
    + [의문점](#1-2-의문점)
    + [Trouble Shooting](#1-3-Trouble-Shooting)
    + [배운 개념](#1-4-배운-개념)
    + [PR 후 개선사항](#1-5-PR-후-개선사항)

# ➕ 계산기

1. 프로젝트 기간: 2021.11.08 - 2021.11.19
2. Grounds Rules
    - 10시에 스크럼 시작
    - 프로젝트가 중심이 아닌 학습과 이유에 초점을 맞추기
    - 의문점을 그냥 넘어가지 않기
    - Time Rule
        - 아침: 10시
        - 점심시간: 12시~ 1시
        - 저녁시간: 6시~7시
        - 프로젝트 최대 시간: 9시 ~ 최대 9시 30분 까지!
3. 커밋 규칙
    - 단위 : 기능단위
    - 커밋 Convention: Karma Style

# 키워드
- `Array` `LinkedList`
- `Queue` `Stack`
- `Generic` `Element`
- `TDD` `Unit Test`
- `Assert`

# Reviewers

* [lina0322](https://github.com/lina0322)

# STEP 1 : **Queue 타입 구현**
- 자료구조 Queue 타입을 구현합니다.

# UML

![](https://i.imgur.com/pwLcl0n.jpg)

## 1-1 고민했던 것
- Queue를 DoubleStack과 LinkedList를 이용하여 두가지를 구현해보았다. 배열로도 구현할 수 있지만 enqueue 작업이 시간복잡도가 O(1)이 걸려서 비효율적이다. 
- Generic타입을 사용할 때 Element로 명시해주었다. 이유는 T로 명시해줄 수도 있지만 어떤 타입이 들어갈지 명확하지 않기 때문에 좀더 직관적으로 보일 수 있도록 요소라는 뜻을 담은 Element를 명시했다. 

## 1-2 의문점
- Queue를 배열로 구현해도 괜찮을까? 
- Array에 제네릭 타입은 어째서 Element일까? 

## 1-3 Trouble Shooting

### 1. Array에 제네릭 타입이 Element가 기재되어있는 경우
- `상황` 자료구조를 공부하다가 제네릭을 사용한 예제 코드들을 살펴보니 `<T>`로 작성되어있는 경우가 있고, `<Element>`를 사용한 경우가 있는데 둘의 차이가 궁금해졌다. 
    
![](https://i.imgur.com/POuRbFM.png)
    
- `이유` 공식문서 Generic 부분에서 `Naming Type Parameters` 부분을 살펴보니 이름이 없는 것과 이름이 있는 Element는 차이가 없지만 파라미터와 타입 사이의 관계를 가지고 있을때 명확함을 주기 위해 사용한다고 한다. 그러나 관계가 없는 상황에서는 `T`, `U`, `V` 를 주로 사용한다고 한다. 
- `해결` Array와 마찬가지로 Queue나 LinkedList도 요소들이 서로 관계가 있다고 생각하여, 타입 내부에 제네릭 타입`<T>`을 Element라고 명시해주었다. 

## 1-4 배운 개념
- Element의 용도
- 자료구조 (Array, LinkedList, Queue, Stack)
- 알고리즘의 시간도와 Big-O
