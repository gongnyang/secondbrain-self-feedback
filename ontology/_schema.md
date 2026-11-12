# 온톨로지 스키마

- 타입은 7개. 늘리지 않는다
- 모든 항목은 프론트매터 + 본문 한 화면 이내
- 값 판단은 적지 않는다. 판단은 `brain/`에 적는다

## 공통 필드 (모든 타입)

| 필드 | 뜻 |
|---|---|
| `id` | `접두어:이름`. 영문 소문자와 `-`만 |
| `label` | 정식 명칭 (한글) |
| `definition` | 한 문장 정의 |
| `status` | `active` / `deprecated` / `removed` |
| `owner` | 관리 주체 |
| `since` | 등록일 |
| `replaced_by` | 폐기 시 후계 id |
| `sources` | 근거가 된 `intake/raw/` 경로 |

## 타입별 추가 필드

| 타입 | 접두어 | 추가 필드 | 관계 |
|---|---|---|---|
| 용어 | `term:` | `synonyms`, `forbidden` | `forbidden` → 규칙 |
| 지표 | `metric:` | `formula`, `unit`, `period`, `origin` | `displayed_as` → 표기, `measures` → 사업 대상 |
| 사업 대상 | `entity:` | `kind` | `measured_by` → 지표 |
| 표기 | `format:` | `pattern`, `example` | `applies_to` → 지표 |
| 톤 | `voice:` | `traits`, `do`, `dont` | `used_in` → 보고유형 |
| 시각 토큰 | `token:` | `value`, `kind` | |
| 규칙 | `rule:` | `kind`(금지/필수), `check` | `constrains` → 용어, 표기, 시각 토큰 |

## 항목 양식

```markdown
---
id: metric:example
label: 예시 지표
definition: 한 문장 정의
status: active
owner:
since: YYYY-MM-DD
sources: []
formula:
unit:
period:
displayed_as: format:example
---

- 보충 설명은 개조식으로 3줄 이내
```

## 폐기

- `active` → `deprecated` → `removed`. `deprecated`로 최소 한 주기를 둔다
- 폐기할 때 `replaced_by`를 채우고, 옛 명칭은 후계 항목의 `synonyms`로 옮긴다
