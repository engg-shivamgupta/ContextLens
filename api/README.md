# ContextLens API

A FastAPI backend for ContextLens — modular RAG with JWT authentication, document chat, text-to-SQL, and visualization.

## Features

- JWT-based authentication
- Modular RAG with 6 core modules (indexing, pre-retrieval, retrieval, post-retrieval, generation, orchestration)
- Pinecone vector database
- Google Gemini and Groq for embeddings and generation
- Text-to-SQL and database visualization

## Project Structure

```
api/
├── main.py                 # FastAPI application entry point
├── controller/             # Business logic layer
├── lib/                    # Configuration and utilities
├── routes/                 # API endpoints
├── schema/                 # Pydantic models
├── service/                # External service integrations
└── requirements.txt        # Python dependencies
```

## Setup

1. Install dependencies:

```bash
uv sync
```

2. Configure environment variables in `.env`:

```bash
JWT_SECRET_KEY=your-secret-key
PINECONE_API_KEY=your-pinecone-key
GOOGLE_API_KEY=your-google-key
DATABASE_URL=your-mongodb-url
```

3. Run the application:

```bash
uv run python main.py
```

The API will be available at `http://localhost:8000`

## API Endpoints

### Authentication

- `POST /auth/signup` — Register a new user
- `POST /auth/login` — Login and get access token
- `GET /auth/me` — Current user (protected)

### RAG Operations

- `POST /rag/index-document` — Index a document (protected)
- `POST /rag/query` — Query documents (protected)
- `GET /rag/health` — RAG service health check

See `docs/API_DOCUMENTATION.md` for the full reference.
