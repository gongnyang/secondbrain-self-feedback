---
title: 단일 HTML 배선도 구현 메모
domain: 시각화
confidence: 중간
updated: 2026-11-12
---

# 단일 HTML 배선도 구현 메모

- **좌표**: viewBox 고정(예: 1200×675), 8px 그리드에 스냅, 노드 중심 좌표는 상수표로 관리 (판단)
- **연결선**: path의 H/V 명령으로 직교선, 꺾이는 곳만 작은 반경으로 둥글게
- **화살촉**: `<marker>`에 `orient="auto-start-reverse"`, 선 색과 맞춤
- **애니메이션**
  - `stroke-dashoffset`은 학습 루프 1개에만, 4~6초 주기
  - `prefers-reduced-motion: reduce`이면 끔 https://web.dev/articles/prefers-reduced-motion
- **인쇄**
  - `@media print`에서 애니메이션 정지
  - `print-color-adjust: exact` (+ `-webkit-` 접두사)
  - 브라우저 인쇄 설정이 이 속성보다 우선함 https://developer.mozilla.org/en-US/docs/Web/CSS/print-color-adjust
- **테마**: CSS 변수 + `prefers-color-scheme` + `data-theme` 토글. SVG fill/stroke도 `var()`로

## 관련
- [[스타일-시안-5종]] / [[감점-요소]]
