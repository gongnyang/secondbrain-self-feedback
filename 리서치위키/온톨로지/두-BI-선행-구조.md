---
title: 두 BI의 선행 구조 (지표 정의 / 브랜드 규칙)
domain: 온톨로지
confidence: 중간
updated: 2026-11-12
---

# 두 BI의 선행 구조

## 비즈니스 인텔리전스 쪽: 지표를 한 곳에서 정의
- **dbt MetricFlow**: semantic model(엔티티, dimension, measure)과 metric을 YAML로 정의, 쿼리 시점에 SQL 생성 https://docs.getdbt.com/docs/build/about-metricflow
- **LookML**: "single source of truth", Git 버전 관리, view에 dimension/measure 정의 https://cloud.google.com/looker-modeling
- **Cube**: measure(정량)와 dimension(속성). 이름은 cube 안에서 유일 https://docs.cube.dev/reference/data-modeling/dimensions
- md로 줄이는 안 (판단)
  - 지표 1개 = 파일 1개 또는 표 1행
  - 필드: id, 정의문, 산식, 단위, 집계 주기, 원천, 소유자, 상태
- 비즈니스 용어집·데이터 카탈로그 출처는 미확인

## 브랜드 아이덴티티 쪽: 규칙을 기계가 읽게
- **W3C DTCG Format 2025.10**: 디자인 토큰 첫 안정판(2025-10-28). `$value` / `$type`. W3C 표준 트랙은 아님 https://www.w3.org/community/reports/design-tokens/CG-FINAL-format-20251028/
- **Style Dictionary v4**: DTCG `$type` 지원. v3 포맷과 한 인스턴스에서 섞어 쓸 수 없음 https://style-dictionary-v4.netlify.app/info/tokens
- **Vale**: 문체 규칙을 YAML로. substitution(교체 매핑)과 existence(금지어) https://docs.vale.sh/topics/styles , https://posthog.com/handbook/wizard-and-docs/vale
- **LLM용 보이스 가이드**: 성격 3~5단어, 허용·금지 어휘, 좋은 예와 나쁜 예 https://dotdigital.com/blog/how-to-create-a-brand-voice-guide-that-ai-can-actually-use/
- 미확인: "금지어 리스트로 오프브랜드 출력 60~70% 감소" 수치, Writer·Jasper 공식 스펙

## 관련
- [[두-BI-통합-타입안]] / [[두-BI-축-공존]]
