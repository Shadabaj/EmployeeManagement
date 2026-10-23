# Employee Management System

An ASP.NET Core MVC application for managing employee records, backed by SQL Server and organized into data-access, model, and repository projects.

## Overview

- MVC employee-management interface.
- Employee data access through a dedicated DAL project and repository layer.
- SQL Server schema and stored-procedure scripts in `database.sql`.
- Shared model classes in the `Models` project.
- Profile-file helper and number-to-words service in the web application.

## Technology stack

- C# and ASP.NET Core MVC on .NET 8
- SQL Server
- Entity Framework Core
- Repository pattern
- Razor views, Bootstrap, and static files

## Solution structure

~~~text
.
├── NeoStart.sln
├── NeoStart/       # MVC web application, controllers, views and file helpers
├── DAL/            # Database context and entity classes
├── Models/         # Application models
├── Repository/     # Repository contracts and implementations
└── database.sql    # Schema and stored procedures
~~~

## Prerequisites

- .NET 8 SDK
- SQL Server or SQL Server LocalDB
- A development database created from the provided SQL script

## Local setup

1. Clone the repository and open `NeoStart.sln` in Visual Studio 2022 or a compatible IDE.
2. Review `database.sql`. It targets a database named in its opening `USE` statement; create that development database or change the statement to your local database name before executing it.
3. Configure `ConnectionStrings:DbConnection` locally in `NeoStart/appsettings.json`, environment variables, or .NET user secrets. The committed connection string is intentionally blank.
4. Restore dependencies and build:

~~~powershell
dotnet restore .\NeoStart.sln
dotnet build .\NeoStart.sln --configuration Release
~~~

5. Set `NeoStart` as the startup project and run it from Visual Studio, or use:

~~~powershell
dotnet run --project .\NeoStart\UI.csproj
~~~

## Configuration and security

Never commit real connection strings, database passwords, file-storage credentials, or employee personal data. Use local secrets or environment variables for connection settings. Review file-upload and profile-image paths before exposing the app publicly.

The application handles employee information, so authorization, validation, secure file handling, and protection of personal identifiers should be reviewed before any production deployment.

## Development notes

A generated SQL script and local database are required; the repository does not include a portable database backup. Build and manually verify the primary employee workflows after configuring a development database.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for branch, change, and review expectations.

## License

No license file is currently included. Add an explicit license before inviting others to reuse or redistribute the project.
