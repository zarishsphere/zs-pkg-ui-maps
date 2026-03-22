# PRD — `zs-pkg-ui-maps`

> **Document Class:** PRD | **Version:** 1.0.0 | **Status:** Bootstrapping
> **Repository:** [https://github.com/zarishsphere/zs-pkg-ui-maps](https://github.com/zarishsphere/zs-pkg-ui-maps)
> **Layer:** Layer 1C — Frontend Packages | **Catalog #:** 35
> **License:** Apache 2.0 | **Governance:** RFC-0001

---

## 1. Overview

OpenLayers 10.3 wrappers — health facility maps, catchment zone display, outbreak location mapping.

---

## 2. Repository Metadata

- **Name:** `zs-pkg-ui-maps`
- **Organization:** [https://github.com/zarishsphere](https://github.com/zarishsphere)
- **Language / Runtime:** TypeScript 5.8 / React 19
- **Visibility:** Public
- **License:** Apache 2.0
- **Default Branch:** `main`
- **Branch Protection:** Required (2-owner review for critical paths)

---

## 3. Platform Context

This repository is part of the **ZarishSphere** sovereign digital health operating platform — a free, open-source, FHIR R5-native system for South and Southeast Asia.

**Non-negotiable constraints:**
- Zero cost — all tooling must use genuinely free tiers
- FHIR R5 native — all clinical data modelled as FHIR R5 resources
- Offline-first — must work without network connectivity
- No-coder friendly — GUI-first, template-driven
- Documentation as Code — all decisions in GitHub

---

## 4. Goals & Objectives

- Provide a reusable, typed TypeScript package for OpenLayers 10.3 wrappers
- Zero duplication across ZarishSphere frontend microfrontends
- Versioned with semantic-release

## 5. Functional Requirements

| ID | Requirement | Priority |
|----|------------|---------|
| F-01 | TypeScript strict mode, zero `any` types | P0 |
| F-02 | Vitest unit tests with >80% coverage | P0 |
| F-03 | Storybook stories for all components (UI packages) | P1 |
| F-04 | Tree-shakeable ESM exports | P0 |
| F-05 | WCAG 2.2 AA compliant (UI components) | P0 |

## 6. Repository Tree


```
zs-pkg-ui-maps/
├── README.md
├── LICENSE
├── package.json
├── tsconfig.json
├── .eslintrc.json
├── vitest.config.ts
├── .gitignore
├── .github/
│   ├── CODEOWNERS
│   └── workflows/
│       └── ci.yml
├── src/
│   ├── index.ts                       # Package entry point
│   └── (implementation files)
├── tests/
│   └── (test files)
└── docs/
    └── README.md
```


### CI/CD (`.github/workflows/ci.yml`)

```yaml
name: CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '22', cache: 'pnpm' }
      - run: pnpm install --frozen-lockfile
      - run: pnpm typecheck && pnpm lint && pnpm test && pnpm build
```

## 9. Ownership & Governance

| Role | GitHub User |
|------|-------------|
| Platform Lead | `@arwa-zarish` |
| Technical Lead | `@code-and-brain` |
| DevOps Lead | `@DevOps-Ariful-Islam` |
| Health Programs | `@BGD-Health-Program` |

All changes go through Pull Request → 1+ owner review → CI pass → merge.
Breaking changes require RFC + ADR.

---

## 10. Definition of Done

- [ ] All listed files exist with content
- [ ] CI pipeline passes (test + lint + security)
- [ ] README.md reflects current state
- [ ] OpenAPI / AsyncAPI spec present (services only)
- [ ] At least 1 integration test using testcontainers-go (Go) or Playwright (UI)
- [ ] No secrets committed (GitGuardian verified)
- [ ] CODEOWNERS file present
- [ ] Linked to CATALOGS.md and TODO.md

---

*This PRD is the canonical source of truth for this repository's purpose, structure, and requirements.*
*Changes require a PR against this file with owner approval.*
