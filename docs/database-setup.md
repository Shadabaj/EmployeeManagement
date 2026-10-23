# Database setup

The repository includes `database.sql` with SQL Server schema objects and stored procedures.

1. Use a local or otherwise disposable development database.
2. Review the script's initial `USE` statement and change it to the database you created if needed.
3. Review the script before execution and run it with an account permitted to create the listed schema, tables, functions, and stored procedures.
4. Set `ConnectionStrings:DbConnection` in a local configuration source; do not commit the populated setting.
5. Verify the connection from the application before using real data.

Do not run the script against a production database without a reviewed migration and backup plan.
