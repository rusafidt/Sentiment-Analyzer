import "./globals.css";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Sentiment Analyzer",
  description: "Analyze the emotional tone of any text with AI precision",
  icons: { icon: "/favicon.ico" },   // put favicon.ico in /public
  openGraph: {
    title: "Sentiment Analyzer",
    description: "Try it free – analyze text sentiment instantly with AI",
    images: ["/desert-dunes.png"],   // your image in /public
  },
    generator: 'v0.app'
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
