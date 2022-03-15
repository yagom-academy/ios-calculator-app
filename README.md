# 🧮 iOS-calculator-app

> 📅 프로젝트 기간 2022.03.14 ~</br>
🎓 팀원 : [@mmim](https://github.com/JoSH0318) / 👑 리뷰어 : 

## 목차

- [프로젝트 소개 및 기능](#프로젝트-소개-및-기능)
- [UML](#uml)
- [STEP 1](#step-1)
    + [고민한점](#고민한점)
    + [배운개념](#배운개념)
- [트러블슈팅](#트러블슈팅)
- [기술의 장단점](#기술의-장단점)
    
## 프로젝트 소개 및 기능


## 개발환경 및 라이브러리

[![swift](https://img.shields.io/badge/swift-5.0-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.0-blue)]()

## UML
![Class Diagram (1)](https://user-images.githubusercontent.com/88810018/158320839-b2ae2b30-2210-4ec8-b135-164d9555b6c8.png)

## [STEP 1]
### 고민한점
#### Queue(Linked Queue vs Double Stack Queue)
- swift는 Queue 형태의 저장 구조를 지원하지 않는다. 따라서 Queue 구현에 있어 고민을 했다. 
- 이번 프로젝트에 필요한 기능은 1) 마지막 값에 값을 추가, 2) 첫번째 값을 시간복잡도 O(1)인 제거, 이 두가지로 판단된다.
- 첫번째 고려한 방법으로 Linked List를 이용한 Linked Queue: 배열에 노드를 할당함으로써 그 위치를 파악하고 추가/삭제를 해주는 방식이다. 노드에는 값과 그다음 노드의 노드 값이 있다. 하지만 이번 프로젝트는 배열의 마지막에 값추가 + 배열의 첫번째 값을 제거 해주는 Queue의 기능만 필요하다. 따라서 약간의 불필요한 코드가 발생한다 생각했고, 적합하지 않다고 생각했다. 만약 이번 프로젝트에 중간 값을 넣거나 제거해야하는 기능이 필요하다면 적합했을 것 같다.
- 두번째 고려한 방법으로 Double Stack을 이용한 Queue: 두개의 stack을 만들어주어 마지막에 값을 넣을 때는 정방향 배열에 삽입, 첫번째 값을 제거할 때는 reverse를 이용하여 역방향 배열을 만들어주고 그것의 마지막 값을 반환한다. reverse 메서드의 시간복잡도가 O(1)이기 때문에 가능한 방법이다.
- 이러한 근거로 Double Stack을 사용한 Queue를 사용하였다.
 
### 배운개념
- Queue
- Linked List
- Linked Queue
- Double Stack
---
## 트러블슈팅

---
## 기술의 장단점

---

