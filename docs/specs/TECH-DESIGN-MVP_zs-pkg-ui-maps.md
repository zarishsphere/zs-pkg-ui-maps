# TECH-DESIGN-MVP — `zs-pkg-ui-maps`

> **Document:** Technical Design (MVP) | **Version:** 1.0.0-mvp
> **Repository:** [https://github.com/zarishsphere/zs-pkg-ui-maps](https://github.com/zarishsphere/zs-pkg-ui-maps)
> **Layer:** Layer 1C | **Catalog #:** 35
> **Language:** TypeScript 5.8 | **License:** Apache 2.0

---

## Technical Summary

**OpenLayers 10.3 wrappers — health facility maps, catchment zone polygons, outbreak location pins.**

This document defines the **technical architecture, implementation design, complete repository tree, and acceptance criteria** for the MVP of `zs-pkg-ui-maps`.

---

## Build Configuration

### package.json (key fields)
```json
{
  "name": "@zarishsphere/zs-pkg-ui-maps",
  "version": "0.1.0",
  "type": "module",
  "exports": {
    ".": {
      "import": "./dist/index.js",
      "types": "./dist/index.d.ts"
    }
  },
  "scripts": {
    "build": "tsc",
    "test": "vitest run",
    "typecheck": "tsc --noEmit",
    "lint": "eslint src/"
  }
}
```

### tsconfig.json (key settings)
```json
{
  "compilerOptions": {
    "strict": true,
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "declaration": true,
    "declarationMap": true,
    "outDir": "./dist"
  }
}
```

## CI Pipeline

```yaml
name: CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v3
      - uses: actions/setup-node@v4
        with: {node-version: '22', cache: 'pnpm'}
      - run: pnpm install --frozen-lockfile
      - run: pnpm typecheck && pnpm lint && pnpm test && pnpm build
```

## Package Tree

```
zs-pkg-ui-maps/
├── README.md
├── LICENSE
├── package.json
├── tsconfig.json
├── .github/CODEOWNERS
├── .github/workflows/ci.yml
├── src/
│   ├── index.ts
│   ├── HealthMap.tsx
│   ├── layers/
│   │   ├── FacilityLayer.tsx
│   │   ├── CatchmentZoneLayer.tsx
│   │   └── OutbreakPinLayer.tsx
│   └── hooks/
│       └── useHealthMap.ts
└── tests/
```

---


## Owners & Governance

| Role | GitHub Handle | Responsibility |
|------|--------------|----------------|
| Platform Lead | `@arwa-zarish` | Final approval, RFC votes |
| Technical Lead | `@code-and-brain` | Architecture, Go/TS review |
| DevOps Lead | `@DevOps-Ariful-Islam` | CI/CD, infra, deployment |
| Health Programs | `@BGD-Health-Program` | Clinical content, country programs |

**PR Policy:** All changes via Pull Request. Minimum 1 owner review. CI must pass. No direct commits to `main`.


---

## MVP Acceptance Checklist

- [ ] All MVP files exist in repository with real content (not placeholders)
- [ ] CI pipeline passes on `main` branch
- [ ] No secrets, credentials, or PHI committed
- [ ] README.md reflects current state with setup instructions
- [ ] CODEOWNERS file present
- [ ] All MVP functional requirements verified manually or via automated tests
- [ ] Linked to `CATALOGS.md` and `TODO.md` in `zs-docs-platform`

---

*This document is the authoritative MVP specification for `zs-pkg-ui-maps`.*
*Changes require a Pull Request with at least 1 owner approval.*
