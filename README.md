# EquityNest

EquityNest is a household finance application for budgeting, financial insights, and mortgage overpayment planning. It is being built as a modular .NET application to demonstrate production-oriented backend and web-development practices.

## Solution structure

| Project | Purpose |
| --- | --- |
| `src/EquityNest.Web` | ASP.NET Core web host and user interface. It handles HTTP requests, authentication, composition, and presentation. |
| `src/EquityNest.Domain` | Core business concepts and rules. It contains no infrastructure or framework concerns. |
| `src/EquityNest.Application` | Use cases, orchestration, commands, queries, and interfaces required by the application. |
| `src/EquityNest.Infrastructure` | Implementations for persistence, messaging, external providers, and other technical integrations. |
| `src/EquityNest.Contracts` | Stable contracts shared at boundaries, such as API request/response models and integration messages. |
| `tests/EquityNest.Domain.Tests` | Unit tests for financial and domain rules. |
| `tests/EquityNest.Application.Tests` | Tests for application use cases and orchestration. |

## Dependency direction

```text
Web -> Application -> Domain
Web -> Infrastructure -> Application -> Domain
Application -> Contracts
Infrastructure -> Application + Domain
```

The domain remains independent. Technical concerns depend inward on the business model; the business model does not depend on databases, web frameworks, or messaging technologies.

## Planned capabilities

- Household membership, authentication, and role-based access
- Accounts, transaction imports, categories, budgets, and recurring payments
- Provider integrations behind a common financial-data abstraction
- Event history, asynchronous processing, analytics, and reporting
- Mortgage amortisation and overpayment scenario planning

## Getting started

```powershell
dotnet restore EquityNest.sln
dotnet build EquityNest.sln --configuration Release --no-restore
dotnet test EquityNest.sln --configuration Release --no-build
dotnet run --project src/EquityNest.Web
```

For prerequisites, container execution, and the demo-data policy, see [local development](docs/local-development.md).

## Architecture decisions

Initial decisions are recorded in [architecture decision records](docs/adr):

- [ADR 0001 — Modular monolith](docs/adr/0001-modular-monolith.md)
- [ADR 0002 — Safe fictional demo data](docs/adr/0002-safe-fictional-demo-data.md)

The planned delivery sequence is maintained in [the implementation roadmap](docs/implementation-phases.md).

## Current status

Phase 0 is complete: the solution has documented boundaries, local development guidance, quality rules, container execution, CI, ADRs, and a fictional demo-data specification. The next feature phase is authentication and the household-finance MVP.
