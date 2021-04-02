# iOS Calculator App

## 캠퍼
[KangKyung](https://github.com/KangKyung)<br>
[Sunny](https://github.com/unme88)<br>
[Yun](https://github.com/blanche37)

## 기간
- 2021/03/22 ~ 2021/04/02

## 타임라인
- 3/22 (월) - 팀그라운드 룰 설정, UML학습
- 3/23 (화) - '이번 프로젝트를 수행함에 있어 꼭 읽고 참고해야 하는 문서'공부해서 각자 설명해주기
- 3/24 (수) - Event-driven Programming, Closure, Protocol, Delegation 학습
- 3/25 (목) - '이번 프로젝트를 수행함에 있어 꼭 읽고 참고해야 하는 문서'정리, SOLID 학습
- 3/26 (금) - '이번 프로젝트를 수행함에 있어 꼭 읽고 참고해야 하는 문서'정리, TWL작성

<br>

- 3/29 (월) - TDD 활동학습, Stack 자료구조 학습
- 3/30 (화) - 10진수 계산기 함수 구현
- 3/31 (수) - 플로우차트 & UML 작업, 오토레이아웃 예습
- 4/1 (목) - 오토레이아웃 활동학습, 2진수 계산기 함수 구현
- 4/2 (금) - 플로우차트 & UML 마무리 작업, Step 1 PR 제출

# Step 1 - 설계도
## FlowChart (Gliffy 이용)
![Calculate_Diagram](https://user-images.githubusercontent.com/38858863/113371735-043ca380-93a2-11eb-8a89-8244f0fed24a.png)

## UML (draw.io 이용)
![Calculate_UML](https://cdn.discordapp.com/attachments/823385681975443457/827386421472002078/unknown.png)

# Step 1 - 실행화면
![Screen](https://cdn.discordapp.com/attachments/823385681975443457/827386880936902666/unknown.png)

## Step 1 - 고민한 점
- Stack 자료구조를 최대로 활용하기위해 고민하였습니다.
- String 타입을 Int형 배열로 만들기 위해, StringProtocol을 extension하는 방법을 이용하였습니다.
- 구조 설계에 대해 깊게 고민했으나.. 아직 부족함을 느낍니다:cry:

## Step 1 - 해결되지 않은 부분
- 이진수의NOT연산을 진행하게되면, 공백을 0으로 인식하여 해당 부분이 전부 1로바뀌는 이슈가 있습니다.

## Step 1 - 조언을 얻고싶은 부분
- 자료구조 선택에 대한 조언을 받고싶습니다.
    - 계산기를 저희는 Stack 자료구조로 구현을 했는데요,
    - 혹시 List 자료구조로 구현한다면 (Stack 자료구조로 구현 했을때와 비교해서) 어떤 장/단점이 있을까요?
- FlowChart에 대한 피드백을 받고싶습니다.
    - 차트 그림을 알맞게 그렸는지 궁금합니다.
    - 그림을 보고, 설계에 대한 피드백을 받고싶습니다.
- UML에 대한 피드백을 받고싶습니다.
    - 각 상황에 따라 알맞은 화살표 사용한게 맞는지 궁급합니다.
    - 그림을 보고, 설계에 대한 피드백을 받고싶습니다.
- FlowChart의 방향에 대해 궁금합니다.
    - 플로우 차트를 가로 (좌우방향)로 그리는게 좋은가요?
    - 세로(상하방향)로 그리는게 좋은가요?
    - 블로그를 검색해보면 다들 의견이 달라서 헷갈립니다.
    - 현업에선 주로 어떤 방식으로 그리는지요? 그리고 그 이유는 뭔가요?
