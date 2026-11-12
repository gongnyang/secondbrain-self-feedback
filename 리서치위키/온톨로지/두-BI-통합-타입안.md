---
title: 두 BI 통합 타입안
domain: 온톨로지
confidence: 낮음
updated: 2026-11-12
---

# 두 BI 통합 타입안

- 전체가 (제안). 근거 문헌 없음

| 상위 타입 | 네임스페이스 | 하위 예 | 교차 관계 |
|---|---|---|---|
| Term (용어) | `term:` | 정식어, 동의어 | `has_forbidden_variant` → Rule |
| Metric (지표) | `bi:metric:` | 매출총이익률 | `displayed_as` → Format |
| Entity (사업 대상) | `bi:entity:` | 고객, 프로젝트 | `measured_by` → Metric |
| Format (표기) | `brand:fmt:` | 단위, 소수점, 통화 | `applies_to` → Metric |
| Voice (톤) | `brand:voice:` | 보고서 톤, 대외 톤 | `used_in` → Channel |
| Token (시각) | `brand:token:` | 색, 폰트 | - |
| Rule (금지·필수) | `rule:` | 금지어, 필수 표기 | `constrains` → Term / Format |

- 공통 속성: id, label, definition, status, owner, since, replaced_by
- 타입 수 상한: 상위 7개 이하, 하위 포함 20개 내외. 근거 문헌 없는 경험칙. 상시 컨텍스트 200줄 예산에서 역산한 값

## 두 BI가 만나는 지점
- 지표(Metric) ↔ 표기(Format): 같은 숫자를 항상 같은 단위·소수점으로 씀
- 용어(Term) ↔ 규칙(Rule): 정식어 1개, 나머지는 금지

## 열린 문제
- 이 7개(지표·표기 중심)와 [[엔티티-타입-초안]]의 7개(원칙·기준·사례 중심)는 서로 다른 안. 합치면 상한 7개를 넘음
- 정리 방향 (제안): 온톨로지에는 이 표의 7개만 두고, 원칙·기준·사례·피드백은 세컨드브레인 쪽 항목 유형으로 넘김 → [[온톨로지와-세컨드브레인-분리]]

## 관련
- [[두-BI-선행-구조]] / [[두-BI-축-공존]] / [[전역규칙-운용]]
