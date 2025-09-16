FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine


FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /src
COPY ["WebApp/WebApp.csproj", "WebApp/"]
RUN dotnet restore "WebApp/WebApp.csproj"
COPY . .
WORKDIR "/src/WebApp"
RUN dotnet build "WebApp.csproj" -o /build

RUN dotnet publish "WebApp.csproj" -o /publish

EXPOSE 8080
ENTRYPOINT ["dotnet", "/publish/WebApp.dll"]
