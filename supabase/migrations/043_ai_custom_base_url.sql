-- ============================================================
-- 043_ai_custom_base_url
--
-- Adds optional base URLs to ai_configs so the OpenAI provider
-- adapter and embeddings can target any OpenAI-compatible API
-- (OpenRouter, Groq, Together, Fireworks, Ollama, etc.) instead
-- of api.openai.com.
--
--   base_url            — for chat completions (generateOpenAi)
--   embeddings_base_url — for embeddings (embedTexts)
--
-- They are separate because a user may route chat through
-- OpenRouter but embeddings through OpenAI (or vice versa).
-- When NULL, the adapter's hardcoded default is used.
--
-- Idempotent — safe to re-run.
-- ============================================================

ALTER TABLE ai_configs
  ADD COLUMN IF NOT EXISTS base_url TEXT;

ALTER TABLE ai_configs
  ADD COLUMN IF NOT EXISTS embeddings_base_url TEXT;
