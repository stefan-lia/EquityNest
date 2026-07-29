# EquityNest implementation roadmap

This is the implementation guide for EquityNest. Work through the phases in order unless a task says otherwise. Keep the app runnable and tested after every meaningful change.

## Engineering principles

- Start as a modular monolith; do not introduce microservices merely to demonstrate them.
- Keep dependencies pointing inward: Web and Infrastructure depend on Application; Application depends on Domain and Contracts; Domain remains independent.
- Introduce advanced patterns only when a feature needs them.
- Never commit personal financial data, tokens, credentials, or production connection strings.
- Keep a fictional seeded demo and a demo financial-data provider so the project is independently runnable.
- Record material design choices as ADRs in `docs/adr/`.

## Recommended order

1. Phase 0 — Foundation
2. Phase 1 — Household-finance MVP
3. Phase 5 — Mortgage planning
4. Phase 4 — External integrations
5. Phase 2 — CQRS and event history
6. Phase 3 — Messaging and background work
7. Phase 6 — Analytics and reporting
8. Phase 7 — Production readiness and portfolio polish

This order creates a useful, distinctive product before introducing infrastructure whose value would be hard to demonstrate.

## Phase 0 — Foundation and project story

**Objective:** Establish a runnable solution, development workflow, and documented architecture.

**Work:** Confirm boundaries in the root README; add formatting/analyzers; add CI to build, test, and check formatting; create `docs/adr/`; add fictional seed data; document local setup; add Docker Compose as local dependencies are introduced.

**Done when:** `dotnet build EquityNest.sln` and `dotnet test EquityNest.sln` succeed from a clean clone, the web host starts with documented commands, and project responsibilities are clear from the READMEs.

## Phase 1 — Secure household-finance MVP

**Objective:** Deliver a usable, secure baseline for household finances.

**Work:**

- Add authentication with ASP.NET Core Identity or external OpenID Connect.
- Model households and roles: Owner, Member, Viewer.
- Implement accounts, transactions, payees, categories, budgets, and recurring transactions.
- Support manual transaction entry and CSV import.
- Build a responsive dashboard with balances, recent activity, monthly income/spend, and budget progress.
- Add filtering, pagination, validation, audit fields, and server-side authorisation policies.

**Done when:** users only see their household data; transactions and monthly totals are accurate; imports fail safely without partial corruption; critical finance and authorisation paths have automated tests.

## Phase 2 — CQRS, event history, and projections

**Objective:** Create an auditable history for material financial changes and efficient dashboard/report read models.

**Work:**

- Identify aggregates: `Household`, `Account`, `Transaction`, `Budget`, and `Mortgage`.
- Define immutable events, e.g. `TransactionImported`, `TransactionCategorised`, `BudgetCreated`, and `BudgetLimitChanged`.
- Persist append-only event history for appropriately scoped aggregates.
- Build projections for dashboard, budget, and reporting queries.
- Implement an outbox for events that must leave the transaction boundary.
- Add user-visible audit timelines.

**Done when:** material changes include actor, timestamp, and immutable history; promised projections can be rebuilt; reprocessing cannot duplicate outcomes.

## Phase 3 — Messaging and background processing

**Objective:** Reliably process slow and asynchronous work outside HTTP requests.

**Work:** Add MassTransit and RabbitMQ locally (optional Azure Service Bus deployment); consumers for imports, recurring-payment detection, category suggestions, reports, and notifications; Quartz.NET or Hangfire schedules; retries, idempotency, correlation IDs, dead-letter handling, and job status UI.

**Done when:** imports and reports survive retries without duplicate records; failures are visible; background work does not make the UI unresponsive.

## Phase 4 — External financial-data integrations

**Objective:** Integrate financial data safely while retaining a complete no-credentials demo mode.

**Work:**

- Define `IFinancialDataProvider` in Application.
- Implement deterministic demo and CSV providers.
- Add a Moneybase adapter only when authorised API access and scopes are available.
- Use user secrets locally and a managed secret store when hosted.
- Add rate-limit handling, timeouts, retries, correlation IDs, idempotent imports, health/status views, and provider contract tests.

**Done when:** the demo works without third-party credentials; provider failure cannot leak secrets or duplicate imports; provider DTOs stay in Infrastructure.

## Phase 5 — Mortgage and overpayment planning

**Objective:** Deliver the distinctive planning feature with thoroughly tested financial calculations.

**Work:** Model principal, rate, term, payment frequency, start date, fees, and fixed-rate periods; generate amortisation schedules; support regular and lump-sum overpayments; compare no-overpayment, reduced-term, reduced-payment, and custom scenarios; show interest saved, revised payoff date, charts, and saved snapshots; document assumptions and rounding.

**Done when:** standard examples calculate to agreed precision; scenarios accurately show payoff/interest differences; calculation logic has extensive tests for edge cases and rate changes; UI describes results as estimates, not financial advice.

## Phase 6 — Analytics and reporting

**Objective:** Turn household data into useful insight and shareable reports.

**Work:** Add cash-flow, net-worth, category-spend, budget-variance, and recurring-payment reports; mortgage-progress and interest-saved analytics; asynchronous CSV/XLSX/PDF export; optionally safe scheduled delivery; analytical views built from projections rather than write models.

**Done when:** reports agree with source transactions and document date/currency assumptions; downloads are secure; data cannot cross household boundaries.

## Phase 7 — Production readiness and portfolio polish

**Objective:** Make the project safe to operate and compelling to evaluate.

**Work:** Add structured logs, OpenTelemetry tracing/metrics, health checks, dashboard; rate limiting, security headers, authorisation tests, backup/retention plan; infrastructure as code; public fictional-data demo; a short walkthrough; architecture diagrams, screenshots, and explicit tradeoff documentation.

**Done when:** an evaluator can clone, run, test, and understand the project without external financial access; failures are actionable; no real data/secrets are public; documentation explains the deliberately scoped modular-monolith, event history, and messaging decisions.

## Definition of done for every feature

- Follows the documented dependency direction and has clear domain ownership.
- Validates inputs and returns safe, useful errors.
- Enforces authorisation server-side.
- Covers critical paths with automated tests.
- Emits adequate logs/telemetry for failure diagnosis.
- Updates documentation and demo data when behaviour changes.
