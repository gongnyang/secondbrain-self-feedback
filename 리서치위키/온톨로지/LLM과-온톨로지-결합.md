---
title: LLM과 온톨로지 결합 (2024~2026)
domain: 온톨로지
confidence: 중간
updated: 2026-11-12
---

# LLM과 온톨로지 결합 (2024~2026)

## 검색 쪽
- **OG-RAG** (Microsoft, EMNLP 2025): 온톨로지에 고정한 하이퍼그래프에서 최소 하이퍼엣지만 컨텍스트로 넣음. 사실 recall +55%, 정답률 +40% 보고 https://arxiv.org/abs/2412.15235
- **GraphRAG**: 엔티티 그래프 → 커뮤니티 계층 요약 https://arxiv.org/abs/2404.16130

## 스키마를 가드레일로 쓰는 세 가지 방식
1. 프롬프트에 스키마를 넣음
2. JSON schema로 출력 강제
3. 추출 후 검증·교정
- OntoMetric (5개 타입, JSON schema + 룰 검증) https://arxiv.org/pdf/2512.01289
- Wikontic (domain-range 검증, 별칭 정규화) https://alphaxiv.org/abs/2512.00590
- 사후 임베딩 매핑 + 타깃 교정 https://arxiv.org/html/2605.29168

## LLM이 온톨로지를 유지할 때의 품질 문제
- 존재하지 않는 ID를 지어냄. ICD-10에서는 모든 모델이 고유 ID의 30% 이상을 지어냄 https://arxiv.org/pdf/2401.14931
- 어휘는 잘 복원하지만 계층 구조는 약함 https://arxiv.org/pdf/2609.26029
- 반복 오류와 들쭉날쭉한 품질 https://www.emergentmind.com/papers/2503.05388

## 설계 함의 (판단)
- LLM은 온톨로지 변경을 제안만 하고 직접 반영하지 않음 → [[온톨로지-변경-거버넌스]]
- 참조한 ID가 실제로 있는지 lint로 검사 → [[온톨로지와-세컨드브레인-분리]]

## 관련
- [[전역규칙-운용]] / [[온톨로지-실패-패턴]]
