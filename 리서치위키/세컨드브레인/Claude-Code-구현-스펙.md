---
title: Claude Code 구현 스펙
domain: 세컨드브레인
confidence: 높음
updated: 2026-11-12
---

# Claude Code 구현 스펙

- 공식 문서 기준

## CLAUDE.md (전역규칙)
- 파일당 200줄 이하 권장
- `@path` import는 최대 4단계. 정리용일 뿐 컨텍스트는 그대로 소모
- `.claude/rules/*.md`에 `paths` 프론트매터를 달면 해당 파일 작업 때만 로드
- 출처: https://code.claude.com/docs/en/memory
- **CLAUDE.md는 강제 규칙이 아님**. 강제하려면 훅이 필요 (공식 문서 명시)

## 자동 메모리
- MEMORY.md는 첫 200줄 또는 25KB까지만 매 세션 로드. 주제 파일은 필요할 때 읽음
- 위키 index 설계의 참고 모델

## 스킬
- 위치: `.claude/skills/<name>/SKILL.md`
- 단계적 로드: name+description 상시 → 호출 시 본문 → 참조 파일은 필요할 때 → 스크립트는 실행만
- description+when_to_use는 1,536자에서 잘림. 본문 500줄 이하 권장
- 주요 필드: `disable-model-invocation`, `user-invocable`, `allowed-tools`, `context: fork`, `paths`, `hooks`
- 출처: https://code.claude.com/docs/en/skills

## 훅
- 이벤트: SessionStart, UserPromptSubmit, PreToolUse, PostToolUse, Stop, PreCompact, FileChanged 등
- exit 2 = 차단(PreToolUse) 또는 계속 작업 강제(Stop)
- `matcher: "Write|Edit"`로 쓰기 직후 lint 실행 가능
- 출처: https://code.claude.com/docs/en/hooks

## 설계 함의 (판단)
- 온톨로지 전역규칙은 CLAUDE.md 200줄 안에 들어가야 함. 나머지는 위키 본문으로 뺌
- "기준 파일은 승인 없이 못 고친다"는 규칙은 CLAUDE.md 문구로는 부족. PreToolUse 훅으로 막아야 실제로 강제됨 → [[승인-게이트]]

## 관련
- [[LLM-위키-패턴]] / [[폴더-구조-권고안]] / [[md-경량-온톨로지-패턴]]
