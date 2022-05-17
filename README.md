# 계산기 프로젝트 저장소
> 팀원: @BaekGom

# 목차
* [프로젝트 소개](#프로젝트-소개)
* [키워드](#키워드)
* [STEP 1 고민한점 및 해결방안](#STEP-1-고민한점-및-해결방안-🤔)
    - [배운개념](#배운개념)

![스크린샷 2022-05-17 오후 5 11 15](https://user-images.githubusercontent.com/94192712/168765246-19673337-e6c8-4cd3-8e2d-9ee31277db71.png)
# 프로젝트 소개
계산기를 구현하는 프로젝트 입니다.


# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()


# 키워드  
`Queue`
`Unit Test`
`TDD`


## 코딩 컨벤션
Swift 코드 스타일 : [스위프트 API 가이드라인](https://www.swift.org/documentation/api-design-guidelines/)
커밋 Title 규칙

* feat = 주로 사용자에게 새로운 기능이 추가되는 경우
* fix = 사용자가 사용하는 부분에서 bug가 수정되는 경우
* docs = 문서에 변경 사항이 있는 경우
* style = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
* refactor = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
* test = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
* chore = 별로 중요하지 않은 일을 수정하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

현재 시제를 사용, 이전 행동과 대조하여 변경을 한 동기를 포함하는 것을 권장 문장형으로 끝내지 않기
* commitTitle 과 body 사이는 한 줄 띄워 구분하기
* commitTitle line의 글자수는 50자 이내로 제한하기
* commitTitle line의 마지작에 마침표(.) 사용하지 않기
* commitBody는 72자마다 줄 바꾸기
* commitBody는 어떻게 보다 무엇을,왜 에 맞춰 작성하기

네이밍 규칙
* 기타 코딩 컨벤션
    * 네이밍 가이드 최대한 준수하기!
    * [네이밍 가이드 한글 번역본](https://minsone.github.io/swift-internals/api-design-guidelines/)

# [STEP 1] 기능 및 코드 설명 🙂
- isEmpty: 큐가 비어있는지 확인하는 프로퍼티
- peek: 가장 앞에있는 큐가 무엇인지 알려줍니다
- enQueue: 큐 끝에 새로운 큐를 추가
- deQueue: 가장 먼저 들어온 앞의 큐 제거하고 제거한 큐 반환하기

# [STEP 1] 고민한점 및 해결방안 🤔
### 고민한점
### 테스트를 세분화:
- 테스트 세분화를 생각하면 할수록 점점 많아지는거 같습니다. 그러다 보니 끝이 없어서 제 생각선에서 일어날수 있는일들을 절충해서 세분화를 해습니다 

### 배운개념 💡

- Queue 
    * 일반적인 하나의 스택을 사용해서 하는 방법이 있고 두개의 스택(deQueue,enQueue) 따로 스택을 만들어서 하는 방법도 있다

- target 설정
    * 테스트 파일과 파일간의 타겟 설정을 하지않으면 오류가 발생합니다.
