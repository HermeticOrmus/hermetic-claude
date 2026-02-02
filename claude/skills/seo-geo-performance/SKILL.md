# SEO, GEO & Performance Optimization Skill

Comprehensive audit and optimization for Next.js applications covering Search Engine Optimization (SEO), Generative Engine Optimization (GEO), and performance best practices.

---

## When This Skill Activates

- User requests SEO, GEO, or performance optimization
- User mentions "optimize for search engines" or "AI crawlers"
- User wants to improve Core Web Vitals or page speed
- Keywords: "sitemap", "robots.txt", "meta tags", "OG images", "caching"

---

## The Three Pillars

### 1. SEO (Search Engine Optimization)

**Essential Files:**
- `robots.txt` - Crawler directives
- `sitemap.xml` or `sitemap.ts` - Page index for crawlers
- Metadata with canonical URLs, OG/Twitter images

**Checklist:**
- [ ] `metadataBase` set in root layout
- [ ] Canonical URLs via `alternates.canonical`
- [ ] OpenGraph images (1200x630px)
- [ ] Twitter card images
- [ ] JSON-LD structured data (Organization, FAQ, etc.)
- [ ] robots metadata with googleBot settings
- [ ] Semantic HTML (proper heading hierarchy)
- [ ] Alt text for all images

### 2. GEO (Generative Engine Optimization)

**Purpose:** Make content accessible to AI assistants (ChatGPT, Claude, Perplexity)

**robots.txt AI Crawler Allowances:**
```text
# AI Crawlers - Allow for GEO
User-agent: GPTBot
Allow: /

User-agent: ChatGPT-User
Allow: /

User-agent: Google-Extended
Allow: /

User-agent: Anthropic-AI
Allow: /

User-agent: ClaudeBot
Allow: /

User-agent: PerplexityBot
Allow: /
```

**Content Structure for AI:**
- Clear, factual content
- Well-structured headings
- FAQ sections (great for AI extraction)
- Authoritative citations and sources

### 3. Performance

**next.config.ts Optimizations:**
```typescript
const nextConfig: NextConfig = {
  // Image optimization
  images: {
    formats: ["image/avif", "image/webp"],
    deviceSizes: [640, 750, 828, 1080, 1200, 1920],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
    minimumCacheTTL: 31536000, // 1 year
  },

  // Experimental optimizations
  experimental: {
    optimizeCss: true,
  },

  async headers() {
    return [
      // Static assets - immutable cache
      {
        source: "/images/:path*",
        headers: [{ key: "Cache-Control", value: "public, max-age=31536000, immutable" }],
      },
      // Videos - long cache with revalidation
      {
        source: "/videos/:path*",
        headers: [{ key: "Cache-Control", value: "public, max-age=2592000, stale-while-revalidate=86400" }],
      },
    ];
  },
};
```

**Component Optimizations:**
- Use `memo()` for frequently rendered components
- Use `useMemo()` for expensive calculations
- Use `useCallback()` for stable function references
- Lazy load below-the-fold content
- Optimize images (WebP/AVIF, proper sizing)

---

## Audit Workflow

### Step 1: Check Current State
```bash
# Check for robots.txt
cat public/robots.txt

# Check for sitemap
ls -la src/app/sitemap* public/sitemap*

# Review metadata in layout
grep -A 30 "export const metadata" src/app/layout.tsx
```

### Step 2: Analyze Images
```bash
# Find large images
find public -name "*.png" -o -name "*.jpg" | xargs ls -lh | sort -k5 -h | tail -20
```

### Step 3: Check Performance Components
- Look for ResizeObserver usage (can be expensive)
- Count component instances (too many = performance issue)
- Check for memoization on expensive components

### Step 4: Implement Fixes
1. Create/update `public/robots.txt`
2. Create `src/app/sitemap.ts`
3. Add `metadataBase` and canonical URLs to layout
4. Configure image optimization in `next.config.ts`
5. Add cache headers for static assets
6. Memoize expensive components

---

## Quick Commands

```bash
# Create sitemap.ts for Next.js 14+
cat > src/app/sitemap.ts << 'EOF'
import type { MetadataRoute } from "next";

export default function sitemap(): MetadataRoute.Sitemap {
  const baseUrl = "https://example.com";
  const now = new Date();

  return [
    { url: baseUrl, lastModified: now, changeFrequency: "weekly", priority: 1 },
    // Add all pages...
  ];
}
EOF
```

---

## Metadata Template

```typescript
export const metadata: Metadata = {
  metadataBase: new URL("https://example.com"),
  title: "Page Title | Brand",
  description: "Description for search results (150-160 chars)",
  alternates: {
    canonical: "/",
  },
  openGraph: {
    title: "Page Title | Brand",
    description: "Description for social sharing",
    url: "https://example.com",
    siteName: "Brand Name",
    locale: "en_US",
    type: "website",
    images: [
      {
        url: "/images/og-image.png",
        width: 1200,
        height: 630,
        alt: "Description of image",
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    images: ["/images/og-image.png"],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
};
```

---

## Resources

- [Google Search Central](https://developers.google.com/search)
- [Next.js SEO](https://nextjs.org/docs/app/building-your-application/optimizing/metadata)
- [Schema.org Structured Data](https://schema.org/)
- [Core Web Vitals](https://web.dev/vitals/)

---

*v1.0.0 | Created: 2026-01-14*
