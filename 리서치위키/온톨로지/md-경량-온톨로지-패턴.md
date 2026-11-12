---
title: md 파일 기반 경량 온톨로지 패턴
domain: 온톨로지
confidence: 중간
updated: 2026-11-12
---

# md 파일 기반 경량 온톨로지 패턴

## 공개 사례
- **Karpathy LLM Wiki**: 원본 / LLM이 관리하는 위키 / 스키마 파일 3층 → [[LLM-위키-패턴]]
- **Basic Memory**
  - 파일 1개 = 엔티티 1개
  - 프론트매터 + `- [category] 사실` 형식 관찰 기록 + `관계타입 [[대상]]` 형식의 타입 있는 위키링크
  - 파일이 원본, DB는 파생 인덱스
  - 출처: https://docs.basicmemory.com/concepts/knowledge-format
- **Obsidian 속성**
  - 속성 타입은 볼트 전체에서 이름당 하나. 노트 타입 개념은 없음
  - 타입별 필수 필드는 규칙이나 린터로 강제해야 함
  - 출처: https://www.dsebastien.net/the-complete-guide-to-obsidian-properties/ , https://forum.obsidian.md/t/my-vault-template-typed-pages-enforced-wikilinks-and-a-linter-that-keeps-the-graph-honest/116248
- **schema.org 차용**: DefinedTerm, Person, Organization 등을 타입 이름으로 쓸 수 있음. LLM 정확도가 오른다는 근거는 미확인 https://schema.org/DefinedTerm

## 팔란티어 → md 매핑 (제안)

| 팔란티어 | md 경량판 |
|---|---|
| Object Type | `type:` 프론트매터 + 타입별 폴더 |
| Property | 타입별 필수 프론트매터 키 |
| Link Type | `관계: [[대상]]` 형식의 타입 있는 위키링크 |
| Action | Claude Code 스킬·명령 |
| Function | 스킬 안의 판정 로직(체크리스트) |
| Writeback | 피드백 md 생성 + log 추가 + 기준 버전 갱신 |
| 보안 | 쓰기 권한 규칙 |

- 구성 요소 원뜻은 [[팔란티어-온톨로지-구성]]

## 관련
- [[엔티티-타입-초안]] / [[온톨로지-실패-패턴]] / [[Claude-Code-구현-스펙]]
