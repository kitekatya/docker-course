FROM mcr.microsoft.com/dotnet/aspnet:8.0
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /src
COPY ["WebApp/WebApp.csproj", "WebApp/"]
RUN dotnet restore "WebApp/WebApp.csproj"
COPY . .
WORKDIR "/src/WebApp"
RUN dotnet build "WebApp.csproj" -o /build

RUN dotnet publish "WebApp.csproj" -o /publish

COPY  /publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]
