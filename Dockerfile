FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ws2.csproj Program.cs .
RUN dotnet restore ws2.csproj
#RUN dotnet build ws2.csproj -c Release -o /app/build

#FROM build AS publish
RUN dotnet publish ws2.csproj -c Release -o /app/publish

EXPOSE 8080

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "ws2.dll"]