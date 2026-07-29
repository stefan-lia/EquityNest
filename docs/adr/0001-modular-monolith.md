# ADR 0001: Start EquityNest as a modular monolith

## Status

Accepted

## Context

EquityNest needs clear business boundaries, asynchronous processing, provider integrations, and a simple local developer experience. It is a portfolio project whose initial scope does not justify the operational cost of independently deployed services.

## Decision

Build a single deployable application with separate Web, Application, Domain, Infrastructure, and Contracts projects. Enforce dependency direction through project references. Use in-process boundaries first; introduce external messaging and separately deployable services only when a concrete need proves the boundary.

## Consequences

The solution is quick to run, test, and understand while still demonstrating modular design. Future extraction remains possible, but modules must avoid direct database coupling and preserve explicit contracts.
