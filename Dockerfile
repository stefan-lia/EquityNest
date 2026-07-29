FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

COPY ["EquityNest.sln", "."]
COPY ["Directory.Build.props", "."]
COPY ["src/EquityNest.Application/EquityNest.Application.csproj", "src/EquityNest.Application/"]
COPY ["src/EquityNest.Contracts/EquityNest.Contracts.csproj", "src/EquityNest.Contracts/"]
COPY ["src/EquityNest.Domain/EquityNest.Domain.csproj", "src/EquityNest.Domain/"]
COPY ["src/EquityNest.Infrastructure/EquityNest.Infrastructure.csproj", "src/EquityNest.Infrastructure/"]
COPY ["src/EquityNest.Web/EquityNest.Web.csproj", "src/EquityNest.Web/"]
COPY ["tests/EquityNest.Application.Tests/EquityNest.Application.Tests.csproj", "tests/EquityNest.Application.Tests/"]
COPY ["tests/EquityNest.Domain.Tests/EquityNest.Domain.Tests.csproj", "tests/EquityNest.Domain.Tests/"]
RUN dotnet restore "EquityNest.sln"

COPY . .
RUN dotnet publish "src/EquityNest.Web/EquityNest.Web.csproj" --configuration Release --no-restore --output /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "EquityNest.Web.dll"]
