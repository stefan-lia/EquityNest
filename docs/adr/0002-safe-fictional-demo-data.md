# ADR 0002: Use fictional data for all demos

## Status

Accepted

## Context

Financial information is sensitive. A public portfolio must be demonstrable without exposing household, provider, or credential data.

## Decision

All seeded data, screenshots, test fixtures, and hosted demonstrations will use fictional people, accounts, transactions, and mortgage details. Third-party provider connections are optional and must use locally configured secrets or managed secret stores.

## Consequences

The application remains runnable from a fresh clone. Examples may need maintenance as the domain evolves, but no private data should enter source control.
