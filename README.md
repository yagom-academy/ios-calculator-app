# ios-calculator-app
iOS 계산기 프로젝트 저장소
프로젝트 기간 2022.05.16 ~ 2022.05.27 </br>
팀원: 브래드(bradheo65)</br>
리뷰어: 도미닉

[STEP-01](#STEP-01)</br>

---

## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

---
## STEP-01
## 주차 별 학습

Step 01
> 05.16 (월) - UML, GroundRolue 작성, 단위 테스트 생성</br>
> 05.17 (화) - LinkedList 구현, enqueue, dequeue</br>
> 05.18 (수) - Step1 PR 작성</br>
> 05.19 (목) - reNaming, 리뷰 토대로 수정</br>
---

## PR
> Step01: https://github.com/yagom-academy/ios-calculator-app/pull/247#issue-1239584889

---
## 키워드
| #UML #TDD #Queue #Node #LinkedList

---
## UML
![](https://i.imgur.com/KBiQxNH.png))


---

## [STEP 1]

### 이번 스텝 수행 중 핵심 경험 체크
- [x] TDD 시작하기
    - [x] 기존의 프로젝트에 Test Target추가
- [x] Queue 자료구조의 이해와 구현
- [x] List 자료구조 직접 구현해보기(선택)
    - [x] 리스트를 활용하여 Queue 구현(선택
---
 
### STEP01 구현 내용
> Queue 타입 구현, 요구 사항에 맞는 UML 작성



### STEP01 진행하면서 고민한 점 🫠
---
1. Queue를 배열, 연결 리스트(단방향, 양방향) 중에서 어떤 것을 선택해서 구현해볼까??
    -    해당 프로젝트(계산기)에서는 리스트에 저장되어 있는 요소를 찾는 기능은 불필요하다는 생각이 들었습니다. 그래서 리스트의 요소를 넣거나, 빼줄떄 오버헤드가 발생되지 않도록 연결 리스트를 이용했습니다.

### STEP01 진행하면서 경험한 점 ✏️
---
1.    자료구조 개념에 대한 이해가 부족한 것 같아 다시 공부해보았습니다.<br>
    -    자료구조란?
    -     선형, 비선형
    -      큐
    -    배열, 연결 리스트(단방향, 양방향)

2.    프로젝트의 내용과는 다르지만 큐에 저장되어 있는 요소들을 직접 프린트 하거나, 어디에 저장(할당?)되어 있는지 보는 것에 대한 생각해 보았습니다.<br>
enqueue로 데이터를 넣었을 때 Linklist 저장한 요소들 입니다.<br>

- 디버그 영역
<img width="569" alt="image" src="https://user-images.githubusercontent.com/45350356/168982246-90973e1e-f4cd-4a98-bfeb-f0f19321d385.png">


- queue의 요소들을 빈 배열에 넣어 표현해보았습니다.

```swift
mutating func scanTest() {
    var linkedLists: [Any] = []
    
    while head != nuil {
        linkedList.append(head?.data as Any)
        head = hed?.next
    }
    print(linkedLists)
```
![image](https://user-images.githubusercontent.com/45350356/168981785-ec8e83e6-7e07-4023-bb73-2b4637a4f4cb.png)

3.    BreakPont 활용을 해볼수 있는 기회였습니다.
    -    n
    -     po

---

## 그라운드 룰 

### 👨‍👦‍👦 협업 방식
코드 작성 시 제약사항 준수
git commit 시 Karma Style 준수
짝 프로그래밍으로 코드 작성 시 부담 없이 작성 후 토의
순서도(전반적인 흐름)와 UML(세부적인 내용) 작성
의견이 있을 경우 자신 있게 말하기 - 자기의 코드가 아니라 우리의 코드 !!

### 📱 연락이 어려운 시간
업무시간: 10:00 ~ 19:00
Brad : 12:00 ~ 13:30, 18:00 ~ 19:30 연락 어려운 요일: (수, 토)


### ☎️ 소통 방법
기본적으로 디스코드를 사용
### 💻 코드 컨벤션
Swift Statements 형식 준수
### 🪵 브랜치 이름규칙
develop - 최종 코드 → develop에서 야곰 레포로 pr 보내고, 머지되면 main으로 이동
각 step 별로 브런치 생성 (ex. step01, step02, step03)
### ⌨️ 커밋 규칙
1. [타입] : 제목
제목은 최대 50 글자까지만 입력
2. 본문은 위에 작성
본문은 한 줄에 최대 72 글자까지만 입력
3. 꼬릿말은 아래에 작성: ex) #이슈 번호
- --- COMMIT END ---
   > [타입] :  리스트
   > feat  : 기능 (새로운 기능)
   fix     : 버그 (버그 수정)
   refact  : 리팩토링
   style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)
   docs    : 문서 (문서 추가, 수정, 삭제)
   test    : 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
   chore   : 기타 변경사항 (빌드 스크립트 수정 등)
   ---  
     > 제목 첫 글자를 대문자로
     제목은 명령문으로
     제목 끝에 마침표(.) 금지
     제목과 본문을 한 줄 띄워 분리하기
     본문은 "어떻게" 보다 "무엇을", "왜"를 설명한다.
     본문에 여러줄의 메시지를 작성할 땐 "-"로 구분
 ------------------
