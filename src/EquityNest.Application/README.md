# EquityNest.Application

The application project coordinates use cases without owning technical implementation details.

## Responsibilities

- Commands, queries, handlers, and application services
- Authorisation decisions at use-case boundaries
- Transaction boundaries and orchestration
- Interfaces for persistence, clocks, messaging, and external financial-data providers
- Mapping between contracts and domain objects where appropriate

## Rules

- Depend on `EquityNest.Domain` and `EquityNest.Contracts` only.
- Define interfaces here when a use case needs technical capability; implement them in Infrastructure.
- Do not contain HTTP, database-provider, or message-broker code.
