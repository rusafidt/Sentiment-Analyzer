# Sentiment Analyzer Frontend

React frontend application for the Sentiment Analyzer project.

## Getting Started

This is a Next.js frontend application for the Sentiment Analyzer project.

1. **Install dependencies:**
   ```bash
   npm install
   # or
   pnpm install
   ```

2. **Create environment file:**
   Create a `.env.local` file in the frontend directory:
   ```
   API_BASE_URL=http://localhost:8000
   ```

3. **Start development server:**
   ```bash
   npm run dev
   # or
   pnpm dev
   ```

The frontend will run on `http://localhost:3000`

## Backend Integration

The backend API is available at `http://localhost:8000` with the following endpoints:

- `POST /predict` - Analyze sentiment
- `GET /demo` - Get demo results
- `GET /healthz` - Health check

## CORS Configuration

The backend is already configured with CORS to allow requests from `http://localhost:3000`.

## Project Structure

```
frontend/
├── public/          # Static files
├── src/            # Source code
│   ├── components/ # React components
│   ├── services/   # API service calls
│   ├── utils/      # Utility functions
│   └── App.tsx     # Main App component
├── package.json    # Dependencies
└── README.md       # This file
```

## Development Notes

- The backend should be running on port 8000
- Frontend will run on port 3000
- CORS is configured for development environment
