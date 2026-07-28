# EquityNest.Domain

The domain project contains EquityNest's business language and rules.

## Responsibilities

- Aggregates, entities, value objects, and domain events
- Financial invariants and calculations
- Mortgage amortisation and overpayment rules
- Domain-specific exceptions and policies

## Rules

- This project must not depend on the web, application, infrastructure, database, or messaging projects.
- Keep the model framework-agnostic.
- Prefer explicit value objects for money, dates, rates, and identifiers where they protect important business rules.
