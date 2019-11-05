FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out
RUN dotnet dev-certs https --clean
RUN dotnet dev-certs https -t

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
COPY --from=build-env /app/out .
EXPOSE 5000 5001
ENTRYPOINT ["dotnet", "testeMVC.dll"]