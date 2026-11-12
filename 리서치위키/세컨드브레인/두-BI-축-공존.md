---
title: 두 BI 축 공존 (비즈니스 인텔리전스 + 브랜드 아이덴티티)
domain: 세컨드브레인
confidence: 낮음
updated: 2026-11-12
---

# 두 BI 축 공존

- 두 축을 한 위키에 합친 실제 사례는 미확인. 각 축의 선행 사례만 있음

## 선행 사례 (사실)
- **brand.md**: 프로젝트 루트에 CLAUDE.md와 나란히 두는 브랜드 md 스펙 (신생) https://brand-md.pages.dev/
- **Frontify**: 기계가 읽는 브랜드 가이드를 AGENTS.md에 비유 https://www.frontify.com/en/guide/brand-guidelines-for-ai
- **보이스 프로필**: 400~700단어, 좋은 예문과 나쁜 예문을 함께 둠 https://www.mindstudio.ai/blog/brand-context-folder-claude-code-consistent-outputs (벤더 블로그)
- **dbt MetricFlow**: 지표를 YAML로 정의. LLM에게 SQL 대신 정의된 지표·차원만 넘겨 환각을 줄임 https://docs.getdbt.com/blog/semantic-layer-cortex

## 설계 (제안)
- **네임스페이스**: 폴더 2축 + `axis` 태그
- **지표 페이지**: 정의, 산식, 출처, 담당, 갱신 주기
- **브랜드 페이지**: 규칙 + Do / Don't 예문
- **교차 링크**
  - 지표 명칭은 용어집 하나만 참조해 표기를 통일
  - 결정 페이지는 근거(intel)와 표현 규칙(brand)을 양방향 링크

## 관련
- [[폴더-구조-권고안]] / [[엔티티-타입-초안]]
