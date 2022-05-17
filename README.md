# 계산기

###### tags: `README`

## 프로젝트 저장소
> 프로젝트 기간 2022-05-16 ~ 2022-05-27
> 팀원: [@borysarang](https://github.com/yusw10) 
리뷰어: [@Cory]()

---
# 목차
- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [그라운드 룰](#그라운드-룰)
    - [활동시간](##활동시간)
    - [참고문서](##참고문서)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)
- [핵심경험](#핵심경험)
- [기능설명](#기능설명)
- [STEP 1](#STEP-1)
    - [고민한점](#STEP-1-고민한점)
    - [배운 개념](#STEP-1-배운개념)
    - [Review](#STEP-1-Review)
    - [Update](#STEP-1-Update)
---

# 프로젝트 소개
계산기 어플리케이션의 제작
---
# UML  
**[ClassDiagram]**
![](https://i.imgur.com/Bagv701.png)

</br>
**[Seauqence Diagram]**
![]()
</br>
**[Flowchart]**
![]()


---

# 키워드
- Queue
- List
- TDD
- LinkedList
- GenericType
- @Equatable

---
# 그라운드 룰

## 활동 시간
- 10시에는 일어나기
- 작성 단위별로 커밋 하기
- 몰랏던 것, 고민했던 것 정리해두기


## 프로젝트 진행 장소
+ 내 방
+ 카페


## 컨벤션
1. Swift 코드 스타일 : [스위프트 API 가이드라인](https://gist.github.com/godrm/d07ae33973bf71c5324058406dfe42dd) 
2. 커밋 메시지 : Karma Code Convention 준수
3. 커밋 단위 : function별 Commit

---
# 프로젝트 참고 사항
## 참고 문서
[Equatable](https://developer.apple.com/documentation/swift/equatable/)
[Generic 활용하여 커스텀 클래스 구현](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
## 참고 웹페이지

---
# 핵심경험
- [x] Swift API Design Guide에 따른 이름짓기
- [x] queue 구현 및 활용
- [x] LinkedList 구현 및 활용
- [x] TDD로 개발

---
# 기능설명

---
# [STEP 1]

## STEP 1 고민한 점

### TDD의 커밋
지난 활동학습 및 야곰닷넷의 Unit Test강좌를 들으며 테스트 주도 개발이라는 개발론을 공부할 수 있었습니다. [실패하는 테스트 -> 리팩토링 -> 테스트성공]의 루틴으로 정확한 단위 기능들을 구현해나간다는 취지도 이해했습니다. 다만 이번에 실제로 TDD를 따르며 Queue를 구현해보았는데 TDD시에 어떻게 커밋을 해야하는지 막막했습니다.(테스트, 리팩토링, 성공 마다 커밋인지 / 아니면 기능별로 한루틴마다 커밋인지)
특히 큐를 구현할 때 느낀점이, 기능끼리 연관이 되어있을 경우 다른 테스트를 할 수가 없어서 어떻게 진행하는지 감이 잘 안왔습니다(enqueue를 구현하지 않으면 내부 queue를 직접 대입해서 하는것인지.)

### Equtable
 자료구조를 구현하는과정중에 linkedList의 poplast, 또는 head나 tail에 정상적으로 인스턴스가 삽입되었는지 확인을 하려고 했습니다. 확인하던 중 XCTAssertEqual은 값타입만 비교가 가능하고 인스턴스를 비교하려면 Equtable 프로토콜을 상속받고 `==` 메서드를 오버라이딩 해야한다고 이해했습니다. 하지만 실제 더 큰 규모의 테스트에서는 같은 인스턴스인지를 비교할 경우가 많을것 같은데 이부분은 전부 Equtable을 상속받고 하는건지, 아니면 인스턴스 반환값을 테스팅할때 다른 기법이 있는건지 궁금합니다(현재 코드에서는 각 Node의 value로 비교하였습니다)

### Queue
다른 언어와 다르게 swift는 언어차원에서 queue를 구현해주지 않음을 이번에 처음 알았습니다. 후에 알고리즘 등 사용할 요소가 무궁무진하기에 이번에 공부를하게 되었습니다. 
 저는 두가지 배열을 사용하여 큐를 구현한 DoubleStackQueue를 구현해보았습니다. 그 이유로는, removeFirst()라는 배열의 메서드를 사용하여 간편하게 구현할 수 있었지만 복잡도가 n이라 좀 더 나은 방법이라고 많은 글에서 소개를하는 방법을 채택했습니다.
 다만 궁금한 점이 복잡도가 O(1)인 경우와 O(n)인 경우를 놓고 본다면 당연히 O(1)이 되도록 하는게 옳겠지만 이런 수준의 리팩토링이 **실제 어플리케이션에서 유의미한 성능 향상을 낼 수 있는지** 궁금했습니다. 

## STEP 1 배운개념


## STEP 1 Review

## STEP 1 Update
