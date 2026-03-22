# PRD-MVP — `zs-pkg-ui-maps`

> **Document:** Product Requirements (MVP) | **Version:** 1.0.0-mvp
> **Repository:** [https://github.com/zarishsphere/zs-pkg-ui-maps](https://github.com/zarishsphere/zs-pkg-ui-maps)
> **Layer:** Layer 1C | **Catalog #:** 35
> **Language:** TypeScript 5.8 / React 19 | **License:** Apache 2.0

---

## Executive Summary

**OpenLayers 10.3 wrappers — health facility maps, catchment zone polygons, outbreak location pins.**

This document defines the **Minimum Viable Product (MVP)** scope for `zs-pkg-ui-maps` within the ZarishSphere sovereign digital health platform. It covers what must be built first, acceptance criteria, user stories, and the complete repository file structure.


### Platform Non-Negotiables (apply to every repository)

| Constraint | Rule |
|-----------|------|
| **Zero Cost** | All tooling, hosting, and services must use genuinely free tiers |
| **Open Source** | Apache 2.0 license; all code public |
| **FHIR R5 Native** | All clinical data modelled as FHIR R5 resources |
| **Offline-First** | Must function without network connectivity |
| **No-Coder Friendly** | GUI-first, template-driven, automatable |
| **Documentation as Code** | All decisions in GitHub via RFC/ADR |
| **Multi-tenant** | tenant_id scoping on all data operations |
| **HIPAA/GDPR** | AuditEvent on all PHI access; field-level encryption |

---

## Problem Statement

Health geospatial data requires specialized map components that overlay facility registries, catchment areas, and outbreak data on base maps.

## MVP Goals

1. Export typed, tree-shakeable ESM package
2. Vitest unit tests with >80% coverage
3. Zero TypeScript errors in strict mode
4. Storybook stories for all UI components
5. Importable by all ZarishSphere frontend microfrontends

## MVP Functional Requirements

| ID | Requirement | Acceptance Criteria | Priority |
|----|------------|---------------------|---------|
| M-01 | TypeScript strict mode, zero errors | `tsc --noEmit` passes | P0 |
| M-02 | Unit tests pass | `pnpm test` passes | P0 |
| M-03 | Named exports from index.ts | `import { X } from 'zs-pkg-ui-maps'` works | P0 |
| M-04 | WCAG 2.2 AA for UI components | axe-core passes in Storybook | P1 |
| M-05 | Carbon DS base used for UI | No custom CSS that duplicates Carbon | P0 |

## Exported API (MVP)

- `HealthMap component (OpenLayers base)`
- `FacilityLayer component`
- `CatchmentZoneLayer component`
- `OutbreakPinLayer component`
- `useHealthMap() hook`

## MVP Complete Repository Tree

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
