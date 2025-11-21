# Uber Hits

Uber Hits is a tongue-in-cheek Ruby on Rails application inspired by Uber Eats. Instead of delivering meals, users can browse, book, and review professional fighters for appearances, sparring sessions, or events. The app combines interactive maps, availability search, and user-generated reviews to help fight enthusiasts find the perfect hire.

## Key Features
- **Fighter marketplace** – browse geocoded fighter profiles, filter by name or availability, and inspect stats such as fighting style, weight class, and hourly pricing.
- **Booking workflow** – create events with preferred fighters, set start times and durations, manage pending/accepted statuses, and track upcoming or past gigs.
- **Reviews & ratings** – leave bilateral reviews once an event finishes; fighters display average ratings and review counts.
- **Availability management** – fighters can define recurring weekly availability as well as ad-hoc slots (see `app/models/fighter_weekly_availability.rb` and `app/models/fighters_availability.rb`).
- **Dashboard** – authenticated users (Devise) can manage their fighter profile, bookings, and reviews.

## Architecture & Stack
- **Ruby 3.1.2 / Rails 7.1** (`Gemfile`) using Hotwire (Turbo + Stimulus) and import maps.
- **PostgreSQL** data store configured through `config/database.yml` with Active Record migrations.
- **Action Mailer & Devise** handle authentication flows and email-ready notifications.
- **Active Storage + Cloudinary** for fighter/user photos; development environment defaults to the Cloudinary service (`config/environments/development.rb`).
- **Stimulus Map controller + Mapbox GL JS** to render fighter location maps (`app/javascript/controllers/map_controller.js`).
- **Geocoder** converts fighter addresses into latitude/longitude coordinates (`app/models/fighter.rb`).
- Docker images are built via the included `Dockerfile` and orchestrated through Compose files for production-like and development workflows.

## External Services & Environment Variables
The application expects several environment variables at runtime. Copy `.env.example` to `.env` and update it with your secrets.

| Variable | Required | Description |
| --- | --- | --- |
| `RAILS_MASTER_KEY` | Production only | Unlocks encrypted credentials required by Rails (`config/environments/production.rb:19-22`). |
| `DATABASE_URL` | Yes | Connection string for the Postgres database when running in containers (`config/database.yml`). |
| `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB` | Production Compose | Credentials for the bundled Postgres service; defaults match `.env.example`. |
| `MAPBOX_API_KEY` | Yes | Exposed to the map Stimulus controller to render Mapbox tiles in fighter list/detail pages. |
| `CLOUDINARY_URL` | Yes | Active Storage Cloudinary connection string for media uploads (`config/storage.yml`). |
| `REDIS_URL` | Optional | URL for Action Cable when deploying with Redis (`config/cable.yml`). |

## Running the App
Both production-style and development Compose stacks are provided plus a helper `Makefile`. Ensure Docker (and the Compose plugin) is installed.

1. **Bootstrap environment**
   ```bash
   cp .env.example .env
   # edit .env with your real credentials before starting containers
   ```

2. **Production-like stack** (precompiled assets, master key required)
   ```bash
   make prod-up        # build images, start web + db
   make prod-logs      # tail logs
   make prod-down      # stop containers and remove network
   ```
   The Rails server listens on http://localhost:3000 by default. The `db` service keeps its data in the `postgres-data` volume.

3. **Development stack** (live code reload, auto-seeded database)
   ```bash
   make dev-up         # mounts the source tree and runs `bin/rails server`
   make dev-logs
   make dev-down
   ```
   The development Compose file (`docker-compose.dev.yml`) mounts your working directory into the container for instant reloads, uses a trust-auth Postgres instance, accepts optional Mapbox/Cloudinary keys via normal shell env vars, and runs `bin/dev-entrypoint` which applies migrations plus seeds demo data the first time it boots (delete `tmp/development_seeded` to reseed).

4. **Tests & maintenance**
   ```bash
   docker compose -f docker-compose.dev.yml run --rm web bin/rails test
   docker compose -f docker-compose.dev.yml run --rm web bin/rails db:migrate
   ```

## Additional Notes
- The Docker entrypoint (`bin/docker-entrypoint`) automatically runs `db:prepare` when the Rails server boots, keeping schema state in sync.
- If you prefer running Rails without Docker, ensure Ruby 3.1.2, Bundler, Postgres, and Yarn/Node (for asset tooling) are installed, then execute `bin/setup` followed by `bin/rails server`.
- For real-time Action Cable features, add a Redis service and set `REDIS_URL`. The default Compose files do not include Redis, but `config/cable.yml` already references the environment variable.

Enjoy the chaos of ordering fighters on demand!
