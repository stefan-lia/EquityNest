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
dotnet build EquityNest.sln
dotnet test EquityNest.sln
dotnet run --project src/EquityNest.Web
```

## Current status

This repository currently contains the solution scaffold and architectural boundaries. Features will be implemented incrementally, beginning with authentication and the household-finance MVP.
