# EquityNest.Infrastructure

The infrastructure project provides technical implementations used by the application.

## Responsibilities

- Database persistence and migrations
- Implementations of application interfaces
- External financial-data providers, including a demo provider and optional Moneybase adapter
- Messaging, outbox processing, scheduled jobs, email, caching, and file storage
- Observability integrations

## Rules

- Depend on the application abstractions rather than pushing infrastructure concepts into the domain.
- Keep provider-specific models and credentials isolated here.
- Make import and message handlers idempotent, resilient, and observable.
