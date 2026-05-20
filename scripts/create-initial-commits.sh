#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if git rev-parse --verify HEAD >/dev/null 2>&1; then
  echo "Repository already has commits. Aborting."
  exit 1
fi

commit() {
  local msg="$1"
  shift
  git add "$@"
  git commit -m "$msg"
}

commit "chore: initialize ContextLens repository" \
  .gitignore README.md tests/README.md

commit "chore: add Render deployment config and dev script" \
  render.yaml dev.sh scripts/create-initial-commits.sh

commit "docs: add system architecture and chart config reference" \
  documentation/

commit "feat(api): add Python project metadata and environment template" \
  api/pyproject.toml api/requirements.txt api/uv.lock api/.gitignore api/.env.example

commit "feat(api): add configuration, security utilities, and schemas" \
  api/lib/ api/schema/

commit "feat(api): implement JWT authentication layer" \
  api/service/infrastructure/auth_service.py \
  api/service/infrastructure/user_service.py \
  api/controller/auth_controller.py \
  api/routes/auth.py

commit "feat(api): add MongoDB persistence service" \
  api/service/infrastructure/database_service.py

commit "feat(api): add embedding and Pinecone vector store services" \
  api/service/rag/embedding_service.py \
  api/service/rag/pinecone_service.py

commit "feat(api): integrate Gemini and Groq LLM providers" \
  api/service/rag/gemini_service.py \
  api/service/rag/groq_service.py

commit "feat(api): add reranking and parent-child chunk indexing" \
  api/service/rag/rerank_service.py \
  api/service/rag/parent_chunks_service.py

commit "feat(api): implement modular RAG orchestration pipeline" \
  api/service/rag/rag_service.py \
  api/controller/rag_controller.py \
  api/routes/rag.py

commit "feat(api): add document ingestion and user document routes" \
  api/service/features/file_processing_service.py \
  api/service/features/user_documents_service.py \
  api/routes/documents.py

commit "feat(api): add chat sessions and conversation endpoints" \
  api/service/features/chat_session_service.py \
  api/controller/chat_controller.py \
  api/routes/chat.py

commit "feat(api): add natural language to SQL query pipeline" \
  api/service/features/sql_generation_service.py \
  api/service/features/sql_analysis_service.py \
  api/controller/query_controller.py \
  api/routes/query_routes.py

commit "feat(api): add automatic database visualization service" \
  api/service/features/database_visualization_service.py \
  api/routes/visualization.py

commit "feat(api): add speech, PDF export, and usage monitoring" \
  api/service/features/speech_service.py \
  api/service/features/pdf_export_service.py \
  api/service/monitoring/usage_tracker.py \
  api/controller/speech_controller.py \
  api/routes/speech.py \
  api/routes/export.py

commit "feat(api): bootstrap FastAPI application with routers and lifecycle" \
  api/main.py

commit "docs(api): add backend README and API reference" \
  api/README.md api/docs/

commit "feat(frontend): scaffold React app with Vite, Tailwind, and layout" \
  frontend/package.json \
  frontend/package-lock.json \
  frontend/bun.lock \
  frontend/vite.config.js \
  frontend/tailwind.config.js \
  frontend/eslint.config.js \
  frontend/vercel.json \
  frontend/index.html \
  frontend/.gitignore \
  frontend/.env.example \
  frontend/README.md \
  frontend/docs/DESIGN_SYSTEM.md \
  frontend/src/main.jsx \
  frontend/src/App.jsx \
  frontend/src/index.css \
  frontend/src/utils/ \
  frontend/src/components/common/ \
  frontend/src/components/layout/ \
  frontend/public/ \
  frontend/src/assets/

commit "feat(frontend): add auth, RAG chat, documents, and database UI" \
  frontend/docs/FRONTEND_DOCUMENTATION.md \
  frontend/test-connection.js \
  frontend/src/context/ \
  frontend/src/hooks/ \
  frontend/src/services/ \
  frontend/src/components/auth/ \
  frontend/src/components/chat/ \
  frontend/src/components/documents/ \
  frontend/src/components/rag/ \
  frontend/src/components/database/ \
  frontend/src/components/notes/ \
  frontend/src/pages/

echo ""
echo "Created $(git rev-list --count HEAD) commits:"
git log --oneline
