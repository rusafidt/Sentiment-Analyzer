import { type NextRequest, NextResponse } from "next/server"

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    // Forward request to your backend
    const backendUrl = process.env.API_BASE_URL || "http://localhost:8000"
    const res = await fetch(
      `${backendUrl}/predict`,  // 👈 proxy to backend
      {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
      }
    )

    if (!res.ok) {
      return NextResponse.json(
        { error: "Backend error" },
        { status: res.status }
      )
    }

    const data = await res.json()
    return NextResponse.json(data)
  } catch (error) {
    console.error("[v0] Proxy error:", error)
    return NextResponse.json({ error: "Failed to connect to backend" }, { status: 500 })
  }
}
