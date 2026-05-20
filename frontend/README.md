# ContextLens Frontend

A modern React application for intelligent document and database conversations.

## Features

- Modern, clean UI
- Secure JWT authentication
- Multi-format document support (PDF, DOCX, HTML, MD, TXT)
- Chat with conversation history
- Session management
- Fully responsive design
- Built with React 19 + Vite + Tailwind CSS v4

## Quick Start

### Prerequisites

- Node.js 18+ or Bun
- ContextLens API running on http://localhost:8000

### Installation

```bash
bun install
# or
npm install

bun dev
# or
npm run dev
```

The app will be available at http://localhost:5173

### Build for Production

```bash
bun run build
# or
npm run build
```

## Environment Variables

Create a `.env` file:

```env
VITE_API_URL=http://localhost:8000
VITE_APP_NAME=ContextLens
```

## Available Pages

- `/` — Landing page
- `/login` — User login
- `/signup` — User registration
- `/chat` — Chat interface (protected)
- `/documents` — Document management (protected)

## Tech Stack

- React 19.1
- Vite 7.1
- Tailwind CSS 4.0
- React Router 7
- Axios

## Documentation

- [Design System](docs/DESIGN_SYSTEM.md)
- [Frontend Documentation](docs/FRONTEND_DOCUMENTATION.md)

## License

MIT
