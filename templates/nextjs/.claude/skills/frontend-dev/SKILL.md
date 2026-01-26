---
name: frontend-dev
description: Use when writing or modifying React/Next.js components, styling with Tailwind, or following project coding standards. Covers architecture patterns, design system usage, and code conventions.
---

# Frontend Development Skill

Guidance for React/Next.js development with best practices.

## When to Use
- Creating new components
- Modifying existing UI
- Implementing designs
- Working with styling

## Component Creation Checklist

### 1. Determine Component Type
- **Server Component** (default): No interactivity needed
- **Client Component**: Uses hooks, events, or browser APIs

### 2. File Structure
```tsx
// components/feature/ComponentName.tsx

import { type ReactNode } from 'react'
import { cn } from '@/lib/utils'

interface ComponentNameProps {
  children?: ReactNode
  className?: string
  // other props
}

export function ComponentName({
  children,
  className,
  ...props
}: ComponentNameProps) {
  return (
    <div className={cn('base-classes', className)} {...props}>
      {children}
    </div>
  )
}
```

### 3. Styling Guidelines

#### Tailwind Best Practices
- Use design system tokens (not arbitrary values)
- Responsive: `sm:`, `md:`, `lg:`, `xl:`
- State: `hover:`, `focus:`, `active:`, `disabled:`
- Dark mode: `dark:`

#### Common Patterns
```tsx
// Flex centering
<div className="flex items-center justify-center">

// Grid layout
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">

// Responsive text
<p className="text-sm md:text-base lg:text-lg">

// Interactive states
<button className="bg-blue-500 hover:bg-blue-600 active:bg-blue-700
                   disabled:opacity-50 disabled:cursor-not-allowed">
```

### 4. Accessibility Checklist
- [ ] Semantic HTML elements
- [ ] ARIA labels where needed
- [ ] Keyboard navigation works
- [ ] Focus states visible
- [ ] Color contrast sufficient
- [ ] Images have alt text

## Data Fetching Patterns

### Server Component (Preferred)
```tsx
// app/users/page.tsx
async function UsersPage() {
  const users = await fetchUsers() // Direct fetch, no useEffect
  return <UserList users={users} />
}
```

### Client Component
```tsx
'use client'

import useSWR from 'swr'

function UserProfile({ userId }: { userId: string }) {
  const { data, error, isLoading } = useSWR(`/api/users/${userId}`)

  if (isLoading) return <Skeleton />
  if (error) return <ErrorMessage error={error} />
  return <Profile user={data} />
}
```

## Form Handling

### With react-hook-form
```tsx
'use client'

import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { formSchema, type FormData } from './schema'

function ContactForm() {
  const form = useForm<FormData>({
    resolver: zodResolver(formSchema),
    defaultValues: { name: '', email: '' }
  })

  async function onSubmit(data: FormData) {
    // handle submission
  }

  return (
    <form onSubmit={form.handleSubmit(onSubmit)}>
      {/* form fields */}
    </form>
  )
}
```

## Performance Patterns

### Lazy Loading
```tsx
import dynamic from 'next/dynamic'

const HeavyComponent = dynamic(() => import('./HeavyComponent'), {
  loading: () => <Skeleton />
})
```

### Image Optimization
```tsx
import Image from 'next/image'

<Image
  src="/image.jpg"
  alt="Description"
  width={800}
  height={600}
  priority={isAboveFold}
/>
```

## Output

After creating/modifying components:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
COMPONENT SUMMARY

Created/Modified: ComponentName
Location: components/feature/ComponentName.tsx
Type: Server/Client Component

Features:
- [list key features]

Dependencies:
- [list any new imports]

Usage:
<ComponentName prop="value" />
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
