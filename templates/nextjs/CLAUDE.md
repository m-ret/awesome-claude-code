# Next.js Project

## Overview
[Project description - update this after initialization]

## Tech Stack
- Framework: Next.js 14+ (App Router)
- Language: TypeScript
- Styling: Tailwind CSS
- State Management: [React Context / Zustand / Redux]
- Database: [Prisma / Drizzle / None]
- Authentication: [NextAuth / Clerk / None]

## Commands

### Development
```bash
npm run dev
# Opens http://localhost:3000
```

### Build
```bash
npm run build
```

### Production Start
```bash
npm run start
```

### Lint & Type Check
```bash
npm run lint
npx tsc --noEmit
```

### Database (if applicable)
```bash
npx prisma generate
npx prisma db push
npx prisma studio
```

## Project Structure
```
app/
├── layout.tsx           # Root layout
├── page.tsx             # Home page
├── globals.css          # Global styles
├── (auth)/              # Auth route group
│   ├── login/
│   └── register/
├── api/                 # API routes
│   └── [...]/route.ts
└── [feature]/           # Feature routes
    ├── page.tsx
    └── components/

components/
├── ui/                  # Base UI components
│   ├── button.tsx
│   └── input.tsx
├── forms/               # Form components
└── layout/              # Layout components

lib/
├── utils.ts             # Utility functions
├── db.ts                # Database client
└── auth.ts              # Auth utilities

types/
└── index.ts             # Shared types
```

## Code Conventions

### File Naming
- Components: PascalCase (`Button.tsx`)
- Utilities: camelCase (`formatDate.ts`)
- Pages: lowercase with hyphens (`user-profile/page.tsx`)

### Component Structure
```tsx
// 1. Imports
// 2. Types/interfaces
// 3. Component
// 4. Subcomponents (if small)
export function Component({ prop }: Props) {
  // hooks first
  // derived state
  // handlers
  // render
}
```

### Styling
- Use Tailwind CSS utility classes
- Custom classes in component's module.css if needed
- Follow design system tokens

### Server vs Client
- Default to Server Components
- Add 'use client' only when needed (hooks, events, browser APIs)
- Keep client components small and leaf-level

## Important Files
- Entry: `app/layout.tsx`, `app/page.tsx`
- Config: `next.config.js`, `tailwind.config.ts`, `tsconfig.json`
- Env: `.env.local` (never commit)

## Environment
- Node version: 18+
- Environment variables: See `.env.example`

## Patterns to Follow
- [Add project-specific patterns here]

## Notes
- [Add learnings and context here]

---
*Template from awesome-claude-code. Customize for your project.*
