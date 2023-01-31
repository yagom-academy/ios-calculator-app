# 계산기🔢

## 목차
1. [소개](#1-소개)
2. [팀원](#2-팀원)
3. [타임라인](#3-타임라인)
4. [프로젝트 구조](#4-프로젝트-구조)
5. [실행화면(기능 설명)](#5-실행-화면기능-설명)
6. [트러블슈팅](#6-트러블-슈팅)
7. [참고링크](#7-참고-링크)
8. [아쉬운점](#8-아쉬운-점)

<br/>

## 1. 소개
숫자와 연산자를 터치하여 계산을 진행할 수 있는 어플입니다. 


<br/>

## 2. 팀원

|⭐️Rhode|
| :--------: | 
|<img height="180px" src="https://i.imgur.com/XyDwGwe.jpg">|
|그렇지만 어쩌겠습니까 해내야죠|



</br>

## 3. 타임라인
### 프로젝트 진행 기간
**23.01.24 (화) ~ 23.01.20 (금)** 

|날짜|타임라인|
| :-------: | :-------: |
|01.24 (화) | **STEP01**: CalculatorTests 유닛 테스트 구현, CalculatorItemQueue 구현 |
|01.25 (수) | **STEP01**: dequeue와 enqueue에 대한 테스트 케이스 추가, PR |
|01.26 (목) | **STEP01**: data프로퍼티 수정, isEmpty메서드 프로퍼티로 수정, **STEP01 Merge** |
|01.27 (금) | **STEP02**: Operator 열거형, ExpressionParser 열거형, Formula 구조체 틀 구현, OperatorTests 유닛 테스트 구현 |

<br/>

## 4. 프로젝트 구조
### 클래스 다이어그램
**STEP01**
![](https://i.imgur.com/b4dEFJN.png)

**STEP02**
![](https://i.imgur.com/4zHupQ6.png)



<br/>

## 5. 실행 화면(기능 설명)
이후 STEP에서 추가 예정

</br>

## 6. 트러블 슈팅
### 1. CalculatorItemQueue를 struct로 구현하는 것이 옳은가?
다음과 같은 이유로 `CalculatorItemQueue`을 struct로 구현했습니다.

값을 참조해야하는 경우 class로 구현하는 것을 권장한다.
상속을해야하는 경우 class로 구현하는 것을 권장한다.
타입캐스팅을 사용해야하는 경우 class로 구현하는 것을 권장한다.
위 세가지의 이유가 아니라면 일반적으로 struct로 구현하는 것을 애플의 guideline에서는 권장한다.
참조, 상속, 타입캐스팅 모두 사용할 일이 없어서 struct로 구현하는 것이 맞다고 판단했습니다. 




<br/>

## 7. 참고 링크
> - [Swift 공식문서 - Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)


<br/>

## 8. 아쉬운 점
### STEP01
다른 분들은 링크드리스트를 많이 사용하신 것 같은데, 저는 링크드리스트를 사용하지 않았던 점이 조금 아쉬웠습니다.

### STEP02
이후 STEP에서 추가 예정

<br/>
