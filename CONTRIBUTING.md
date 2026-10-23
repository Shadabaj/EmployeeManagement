# Contributing

1. Create a focused branch from the current `main` branch.
2. Keep code changes limited to a single concern.
3. Do not commit build output, local IDE state, credentials, or real employee information.
4. Update documentation when setup instructions or behavior change.
5. Run the Release build and test the affected employee workflows against a development database.
6. Open a pull request with a summary, validation steps, and known limitations.

## Build check

~~~powershell
dotnet restore .\NeoStart.sln
dotnet build .\NeoStart.sln --configuration Release
~~~

## Commit message examples

- `feat: add employee search`
- `fix: validate profile image paths`
- `docs: clarify database setup`
- `chore: remove generated files`
