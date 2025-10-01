"use client"

import { useState } from "react"
import { Button } from "@/components/ui/button"

type Result = { sentiment: string; score: number }

export default function SentimentAnalyzer() {
  const [text, setText] = useState("")
  const [result, setResult] = useState<Result | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [raw, setRaw] = useState<any>(null)

  const handleSubmit = async () => {
    if (!text.trim()) return
    setLoading(true)
    setResult(null)

    try {
      const response = await fetch("/api/predict", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ text }),
      })

      const data = await response.json()

      // Map whatever the backend returns to { sentiment, score }
      const sentiment =
        data?.sentiment ??
        data?.label ??
        data?.prediction ??
        data?.result?.sentiment ??
        "unknown"

      const scoreRaw =
        data?.score ??
        data?.confidence ??
        data?.probability ??
        data?.result?.score ??
        0

      const score =
        typeof scoreRaw === "number"
          ? (scoreRaw > 1 ? scoreRaw / 100 : scoreRaw) // accept 0–1 or 0–100
          : 0

      setResult({ sentiment, score })
    } catch (e) {
      console.error("[v0] Error analyzing sentiment:", e)
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="min-h-screen bg-black text-white flex flex-col">
      <main className="flex-1 flex items-center justify-center px-4 py-16">
        <div className="w-full max-w-2xl space-y-12">
          <div className="text-center space-y-4">
            <h1 className="text-5xl md:text-7xl font-bold tracking-tight text-balance">Sentiment Analyzer</h1>
            <p className="text-lg text-muted-foreground">Analyze the emotional tone of any text with AI precision</p>
          </div>

          <div className="space-y-6">
            <textarea
              value={text}
              onChange={(e) => setText(e.target.value)}
              placeholder="Enter your text here to analyze its sentiment..."
              className="w-full h-40 px-6 py-4 bg-card border border-border rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-white/20 transition-all resize-none text-lg"
            />

            <Button
              onClick={handleSubmit}
              disabled={loading || !text.trim()}
              className="w-full h-14 bg-white text-black hover:bg-white/90 active:scale-[0.98] active:shadow-[0_0_40px_rgba(255,255,255,0.5)] font-medium text-lg rounded-lg transition-all duration-300 hover:shadow-[0_0_30px_rgba(255,255,255,0.3)] disabled:opacity-50 disabled:cursor-not-allowed disabled:hover:shadow-none disabled:active:scale-100"
            >
              {loading ? "Analyzing..." : "Analyze Sentiment"}
            </Button>
          </div>

          {error && (
            <div className="bg-red-950/40 border border-red-800 rounded-lg p-4 text-sm">
              {error}
            </div>
          )}

          {result && (
            <div className="space-y-6 animate-in fade-in slide-in-from-bottom-4 duration-500">
              <div className="bg-white text-black border border-zinc-200 rounded-lg p-8 space-y-6">
                {/* Sentiment Label */}
                <div className="text-center space-y-2">
                  <p className="text-sm text-zinc-500 uppercase tracking-wider">Detected Sentiment</p>
                  <p className="text-4xl font-bold capitalize">{result.sentiment}</p>
                </div>

                {/* Confidence Score */}
                <div className="space-y-3">
                  <div className="flex justify-between items-center">
                    <p className="text-sm text-zinc-500 uppercase tracking-wider">Confidence Score</p>
                    <p className="text-lg font-semibold">{Math.round(result.score * 100)}%</p>
                  </div>
                  {/* Progress Bar */}
                  <div className="w-full h-3 bg-zinc-200 rounded-full overflow-hidden">
                    <div
                      className="h-full bg-black transition-all duration-700 ease-out rounded-full"
                      style={{ width: `${Math.max(0, Math.min(100, Math.round(result.score * 100)))}%` }}
                    />
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* Optional: Raw JSON debug panel (toggle/remove later) */}
          {raw && (
            <pre className="bg-zinc-900/60 border border-border rounded-lg p-4 text-xs overflow-x-auto">
{JSON.stringify(raw, null, 2)}
            </pre>
          )}
        </div>
      </main>

      <footer className="py-8 text-center">
        <p className="text-sm text-muted-foreground">Powered by RFDCruze</p>
      </footer>
    </div>
  )
}

/** Safely parse JSON for error responses */
async function safeJson(res: Response) {
  try { return await res.json() } catch { return await res.text() }
}
