---
name: approve
description: 대기 중인 기준 변경안을 승인권자에게 보여 주고, 승인된 것만 기준에 반영한다. 승인권자가 직접 실행한다.
disable-model-invocation: true
---

# 최종 승인

- 이 명령은 사람이 직접 부를 때만 돈다
- 기준 파일(`brain/criteria/`, `brain/anchor/`)에 쓸 수 있는 유일한 길이다

## 절차

1. `loop/proposals/`에서 `status: 대기`인 카드를 이번 주 묶음부터 5건까지 보여 준다. 카드마다 바꿀 내용, 근거 사례, 달라지는 것을 한 화면에 싣는다
2. 카드마다 승인 / 반려 / 보류를 묻는다. 답을 받기 전에는 아무것도 고치지 않는다
3. 승인이 하나라도 있으면 `loop/approvals/OPEN` 파일을 만든다 (보호 장치를 여는 표시)
4. 승인된 카드를 하나씩 반영한다
   - `brain/criteria/`의 해당 항목만 고친다. 파일을 통째로 다시 쓰지 않는다
   - 새 기준이면 `brain/criteria/_template.md` 양식으로 만들고 `status: 승인`으로 둔다
   - 항목의 `version`을 올리고 `updated`를 오늘로 바꾼다
   - `/record` 대조 결과에 따라 `helpful` / `harmful` 숫자를 맞춘다
   - `brain/anchor/`가 비어 있으면(첫 승인) 승인본을 그대로 복사해 넣는다
5. `loop/changelog.md`에 변경을 한 줄씩 넣고 `brain/index.md`의 버전과 기준 목록을 맞춘다
6. 카드의 `status`와 `decided`, 결정 이유를 적는다. 반영된 패턴은 `loop/patterns.md`에서 `반영`, 반려된 것은 `기각`으로 바꾼다
7. `loop/approvals/OPEN`을 지운다. 중간에 멈췄더라도 반드시 지운다
8. `loop/approvals/YYYY-MM-DD.md`에 이번 결정(카드 id와 결과)을 남긴다

## 되돌리기

- "되돌려"라고 하면 `loop/changelog.md`에서 해당 변경을 찾아 이전 문구로 돌리고, 되돌린 사실을 새 줄로 적는다. 기록을 지우지는 않는다

## 하지 않는 것

- 승인받지 않은 카드를 반영하지 않는다
- 카드에 없는 내용을 함께 고치지 않는다
- `brain/anchor/`의 기존 파일을 고치지 않는다
