# Node.js Project

## Overview
[Project description - update this after initialization]

## Tech Stack
- Runtime: Node.js
- Language: TypeScript/JavaScript
- Package Manager: npm/yarn/pnpm
- Testing: Jest/Vitest/Mocha
- Linting: ESLint + Prettier

## Commands

### Development
```bash
npm run dev
# or
npm start
```

### Build
```bash
npm run build
```

### Test
```bash
npm test
# Watch mode
npm test -- --watch
```

### Lint
```bash
npm run lint
# Fix issues
npm run lint:fix
```

### Type Check (TypeScript)
```bash
npm run typecheck
# or
npx tsc --noEmit
```

## Project Structure
```
src/
├── index.ts          # Entry point
├── lib/              # Core library code
├── utils/            # Utility functions
├── types/            # TypeScript type definitions
└── __tests__/        # Test files
```

## Code Conventions
- Use TypeScript strict mode
- Prefer `const` over `let`, avoid `var`
- Use async/await over .then() chains
- Single quotes for strings
- Semicolons required
- 2-space indentation
- Named exports preferred over default exports

## Important Files
- Entry: `src/index.ts`
- Config: `tsconfig.json`, `.eslintrc`, `package.json`
- Tests: `src/__tests__/` or `tests/`

## Environment
- Node version: Check `.nvmrc` or `package.json` engines
- Environment variables: See `.env.example`

## Patterns to Follow
- [Add project-specific patterns here]

## Notes
- [Add learnings and context here]

---
*Template from awesome-claude-code. Customize for your project.*
