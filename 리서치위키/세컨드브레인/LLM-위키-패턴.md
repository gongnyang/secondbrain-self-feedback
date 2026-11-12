---
title: Karpathy LLM 위키 패턴
domain: 세컨드브레인
confidence: 높음
updated: 2026-11-12
---

# Karpathy LLM 위키 패턴

- 원문: Karpathy gist "LLM Wiki", 2026-04-04 (4/3로 쓴 2차 출처도 있음) https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

## 3계층
- **raw**: 불변 원자료. LLM은 읽기만
- **wiki**: LLM이 쓰고 유지하는 md 페이지. 사람은 읽기만
- **schema**: CLAUDE.md / AGENTS.md. 구조와 워크플로 정의. 사람과 LLM이 함께 고침

## 3동작
- **ingest**: 소스 1건 요약 → 관련 페이지 갱신(1건당 10~15페이지) → index·log 기록
- **query**: index를 먼저 읽고 관련 페이지를 읽은 뒤 인용을 달아 답변. 좋은 답은 새 페이지로 다시 적재
- **lint**: 모순, 낡은 주장, 고아 페이지, 개념 페이지 누락, 교차링크 누락, 데이터 공백 점검

## 운영 규칙
- index.md: 카테고리별 링크 + 한 줄 요약. ingest 때마다 갱신
- log.md: 추가만 함. 접두어를 일정하게 붙여 검색 가능하게
- 규모: 소스 약 100건, 페이지 수백 개까지는 RAG 없이 index만으로 충분. 그 이상은 검색 도구 권장
- 프론트매터·명명 규칙은 원문에서 강제하지 않음

## 주의
- Karpathy 본인은 ingest를 1건씩 하며 직접 검토함. "사람 손 0" 운영은 원문 권장이 아님
- 이 프로젝트의 "수정 없이 스스로 쌓인다"는 요구와 차이가 있음 → 자동 적재 + [[승인-게이트]]로 보완 필요

## 파생 구현
- 원문 충실형: https://github.com/micuintus/llm-wiki
- Claude Code 플러그인: https://github.com/kfchou/wiki-skills
- "주장 단위 출처 고정이 원문의 공백"이라는 지적: https://kfchou.github.io/llm-wiki-google-okf/

## 관련
- [[폴더-구조-권고안]] / [[오염-방지-장치]] / [[md-경량-온톨로지-패턴]]
