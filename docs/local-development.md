# Local development

## Prerequisites

- .NET SDK 9.0.305 or a later 9.0 patch release
- Docker Desktop (optional; required only for container execution)

## Run from source

```powershell
dotnet restore EquityNest.sln
dotnet build EquityNest.sln --configuration Release --no-restore
dotnet test EquityNest.sln --configuration Release --no-build
dotnet run --project src/EquityNest.Web
```

The web application uses the local ASP.NET Core development profile. Do not add secrets to `appsettings*.json`; use `dotnet user-secrets` when a feature needs local credentials.

## Run in a container

```powershell
docker compose up --build
```

The containerised web host listens on `http://localhost:8080`.

## Demo data

`docs/demo-data/household.json` is the initial fictional dataset specification. Until Phase 1 introduces persistence and seeding, it is documentation only. All future demo fixtures must remain fictional.
