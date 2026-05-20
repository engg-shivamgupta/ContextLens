# ContextLens — Intelligent Document & Data Chat

ContextLens is an advanced RAG (Retrieval-Augmented Generation) application that lets you interact with documents and databases using natural language. Powered by Google Gemini, Groq inference, and vector search, it delivers accurate, context-aware answers from uploaded files and connected data sources.

## Modular RAG Architecture

ContextLens is built on a scalable modular RAG framework for precise retrieval and coherent responses. The system comprises **6 main components**:

1. **Orchestrator (RAG Service):** Coordinates the workflow between user input, retrieval, and generation.
2. **Document Ingestion Engine:** Parses, cleans, and segments PDF, DOCX, and TXT files.
3. **Embedding Service:** Converts text chunks into vector embeddings for semantic search.
4. **Vector Store (Pinecone):** High-performance similarity search and context retrieval.
5. **Parent-Child Indexing Service:** Advanced indexing to improve retrieval quality.
6. **Generation Service (Gemini/Groq):** Synthesizes answers from retrieved context.

### Parent & Child Indexing

To overcome limitations of standard chunking, ContextLens uses **parent-child indexing**:

- **Child chunks:** Small, dense segments (~300 chars) for accurate semantic search.
- **Parent documents:** Larger context blocks linked to child chunks.
- **Retrieval logic:** When a child chunk matches a query, the system returns its **parent document** so the LLM gets full, coherent context.

## Key Features

### Advanced RAG Engine

- **Chat with documents:** Upload PDFs, DOCX, or text and ask questions in plain language.
- **Transparent AI:** View **Vector Scores (V)** and **Resonance Scores (R)** for retrieval explainability.
- **Strict scoring:** Local reranker (`ms-marco-MiniLM-L-12-v2`) prioritizes accuracy over recall.
- **HyDE:** Hypothetical Document Embeddings improve search relevance.

### Database Intelligence & Visualization

- **Text-to-SQL:** Connect a database and ask questions in English.
- **Auto-visualization:** Generates bar, line, or pie charts from query results.
- **Schema awareness:** Extracts and understands database structure.
- **SQL safety:** Validator blocks destructive queries and enforces syntax rules.

### Performance & Security

- **Multi-model support:** Google Gemini 2.5 for reasoning, Groq (Llama 3) for fast responses.
- **Authentication:** User accounts with secure session handling.
- **Chat history:** Persistent sessions to revisit conversations.
- **Responsive UI:** React and Tailwind CSS, mobile-friendly.

## Technology Stack

- **Frontend:** React, Vite, Tailwind CSS, Recharts
- **Backend:** Python, FastAPI
- **AI/LLM:** Google Gemini, Groq
- **Vector DB:** Pinecone
- **Database:** MongoDB Atlas (chat history), PostgreSQL/MySQL (analytics)
- **Deployment:** Vercel (frontend), Render (backend)

## Environment

Set `VITE_API_URL` and `VITE_APP_NAME=ContextLens` for the frontend. Configure API keys and database URLs in the backend `.env` (see `api/README.md` and `frontend/README.md`).
