# 🧮 iOS-calculator-app

> 📅 프로젝트 기간 2022.03.14 ~</br>
🎓 팀원 : [@mmim](https://github.com/JoSH0318) / 👑 리뷰어 : [@엘림](https://github.com/lina0322)

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [UML](#uml)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [STEP 2](#step-2)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [기술의 장단점](#기술의-장단점)
    
## 프로젝트 소개 및 기능


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## UML
![ic_Step2_class_diagram](https://user-images.githubusercontent.com/88810018/158505149-f94c95e5-610d-44dd-9814-ffa31814ddba.jpeg)

## [STEP 1]
### 🤔고민한점
- 고민한점 ❓ / 트러블슈팅 ❗️
#### 1️⃣ Queue(Linked Queue vs Double Stack Queue)
- ❓swift는 Queue 형태의 저장 구조를 지원하지 않는다. 따라서 Queue 구현에 있어 고민을 했다. 
- ❓이번 프로젝트에 필요한 기능은 1) 마지막 값에 값을 추가, 2) 첫번째 값을 시간복잡도 O(1)인 제거, 이 두가지로 판단된다.
- ❓첫번째 고려한 방법으로 Linked List를 이용한 Linked Queue: 배열에 노드를 할당함으로써 그 위치를 파악하고 추가/삭제를 해주는 방식이다. 노드에는 값과 그다음 노드의 노드 값이 있다. 하지만 이번 프로젝트는 배열의 마지막에 값추가 + 배열의 첫번째 값을 제거 해주는 Queue의 기능만 필요하다. 따라서 약간의 불필요한 코드가 발생한다 생각했고, 적합하지 않다고 생각했다. 만약 이번 프로젝트에 중간 값을 넣거나 제거해야하는 기능이 필요하다면 적합했을 것 같다.
- ❓두번째 고려한 방법으로 Double Stack을 이용한 Queue: 두개의 stack을 만들어주어 마지막에 값을 넣을 때는 정방향 배열에 삽입, 첫번째 값을 제거할 때는 reverse를 이용하여 역방향 배열을 만들어주고 그것의 마지막 값을 반환한다. reverse 메서드의 시간복잡도가 O(1)이기 때문에 가능한 방법이다.
- ❗️이러한 근거로 Double Stack을 사용한 Queue를 사용하였다.

#### 2️⃣ 접근제어
- ❓처음에는 `var inputStack: [Element]`, `var outputStack: [Element]`만 존재했다. 문제는 테스트할 때 생겼다. 올바른 값이 있는지를 확인하기 위해 배열에 subscript 문법으로 접근했다.
- ❓하지만 private한 두 변수에 접근할 수 없었다. 생각해보니 값이 이 후에 프로젝트를 진행함에 있어 첫번째값과 마지막값의 조건(숫자인가, 연산자인가)에 따라 동작이 나뉠수도 있을 거라는 생각이 들었고, 또한 배열에 직접 접근하는 것이 접근제어에 있어 옳은 방향이 아니라고 판단했다. 
- ❗️array의 first, last, isEmpty, count method와 같은 기능을 만들어서 내부적으로 배열의 상태를 확인해주는 코드를 추가했다.
- ❗️test 코드에서 직접 배열에 접근하지 않고, first, last, isEmpty, count를 이용하여 값을 확인했다.

---
### 📝배운개념
- Queue
- Linked List
- Linked Queue
- Double Stack
- protocol

---
## [STEP 1]
### 🤔고민한점
- 고민한점 ❓ / 트러블슈팅 ❗️
### 📝배운개념

---
## 기술의 장단점

---
## commit 규칙
> 커밋 제목은 최대 50자 입력
> 본문은 한 줄 최대 72자 입력

### **Commit 제목 규칙**
- ✅[chore]: 코드 수정, 내부 파일 수정
- ✨[feat]: 새로운 기능 구현
- 📐[style]: 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
- ➕[add]: Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
- 🔨[fix]: 버그, 오류 해결
- ⚰️[del]: 쓸모없는 코드 삭제
- 📝[docs]: README나 WIKI 등의 문서 개정
- 💄[mod]: storyboard 파일,UI 수정한 경우
- ✏️[correct]: 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
- 🚚[move]: 프로젝트 내 파일이나 코드의 이동
- ⏪️[rename]: 파일 이름 변경이 있을 때 사용합니다.
- ⚡️[improve]: 향상이 있을 때 사용합니다.
- ♻️[refactor]: 전면 수정이 있을 때 사용합니다
- 🔀[merge]: 다른브렌치를 merge 할 때 사용합니다.

### **Commit Body 규칙**
- 제목 끝에 마침표(.) 금지
- 한글로 작성

### **브랜치 이름 규칙**
ex) 5_mmim90, STEP2, STEP3, STEP2-dev 

