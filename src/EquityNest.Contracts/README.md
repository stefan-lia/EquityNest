# EquityNest.Contracts

The contracts project contains stable data shapes that cross system boundaries.

## Responsibilities

- Public API request and response models
- Integration-event contracts
- Versioned provider-facing contracts where sharing is appropriate

## Rules

- Keep contracts simple, serialisable, and backward-compatible where possible.
- Do not place domain behaviour or persistence concerns here.
- Treat changes as compatibility-sensitive once contracts are consumed outside the solution.
