# Umbrella One Repo

The project is to show possibility to use a shared connection poll for
several umbrella applications. The idea is to have an umbrella application
which holds a database connection (`Repo`) and migrations for all projects.
The application which holds a database connections is `apps\db`

Migrations for all projects have to be stored in the `apps\db`. The reason is that
migrations are connected to to the `Repo` configuration. It is possible to configure 
a custom migrations directory (instead of `priv/repo/migrations`) but it is not 
possible to configure more then one `migrations` directory.

## Umbrella applications

### `apps/db`
  The application:
- contains a database connections: `Db.Repo`
- contains migrations for 2 applications: `apps/contacts` and `apps/dealers`. To distinguish 
  applications migration the are prefixed with `contacts` and `dealers` 
  for `apps/contacts` and `apps/dealers` respectively. 
- does not contain any implementation, including `Ecto` schemas.
  
### `apps/contacts`
  The application:
- contains a sample `Contact` model. 
- contains a `Contact` `Ecto` schema and tests.
- it does not contain a database connection (`Ecto` repo). The `Db.Repo` is used.
- the `Contact` migration is stored in the `apps/db` application.  
  
### `apps/dealers`
  The application:
- contains a sample `Dealer` model. 
- contains a `Dealer` `Ecto` schema and tests.
- it does not contain a database connection (`Ecto` repo). The `Db.Repo` is used.
- the `Dealer` migration is stored in the `apps/db` application.  

## Advantages
- Shared connection pool is used for all umbrella applications.
 
## Disadvantages
- All umbrella applications has to use the same database.
- All umbrella applications migrations are stored in the same directory which migth cause a mess.
 
