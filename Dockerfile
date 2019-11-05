FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

COPY ./publish .
ENTRYPOINT ["dotnet", "testeMVC.dll"]