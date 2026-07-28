# EquityNest.Web

The ASP.NET Core entry point for EquityNest.

## Responsibilities

- Serve the web interface and HTTP endpoints
- Authenticate users and enforce authorisation policies
- Register application and infrastructure services in the dependency container
- Translate HTTP concerns into application commands and queries
- Provide health checks and operational endpoints

## Rules

- Keep business rules out of the web layer.
- Depend on `EquityNest.Application` for use cases.
- Reference `EquityNest.Infrastructure` only for application composition.
- Do not access persistence providers directly from pages or endpoints.
