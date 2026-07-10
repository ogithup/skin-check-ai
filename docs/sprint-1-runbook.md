# Sprint 1 Runbook

## Scope

Sprint 1 delivers:

- Premium beauty design system scaffold in Flutter
- Authentication endpoints in FastAPI
- `users` and `user_profiles` database models
- Basic backend API tests
- Basic Flutter widget tests

## Project Structure

```text
backend/
frontend/
docs/
```

## Backend Setup

1. Create a virtual environment.
2. Install dependencies from `backend/requirements/dev.txt`.
3. Copy `backend/.env.example` to `backend/.env`.
4. Update `DATABASE_URL` for your local PostgreSQL 17 instance.
5. Start the API with Uvicorn.

Example commands:

```powershell
cd backend
py -3.13 -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements/dev.txt
Copy-Item .env.example .env
uvicorn app.main:app --reload
```

Default local API:

- `http://127.0.0.1:8000`
- docs: `http://127.0.0.1:8000/docs`

## PostgreSQL Setup

Recommended version:

- `PostgreSQL 17.x`

Create a database:

```sql
CREATE DATABASE skincheck_ai;
```

Default connection string format:

```text
postgresql+psycopg://postgres:YOUR_PASSWORD@localhost:5432/skincheck_ai
```

## Backend Test Run

```powershell
cd backend
.venv\Scripts\Activate.ps1
pytest
```

## Flutter Setup

1. Install Flutter SDK.
2. Run `flutter doctor`.
3. Open the `frontend/` folder.
4. Fetch packages and run the app.

Example commands:

```powershell
cd frontend
flutter pub get
flutter run
```

## Flutter Test Run

```powershell
cd frontend
flutter test
```

## Implemented API Endpoints

- `POST /auth/register`
- `POST /auth/login`
- `GET /users/me`
- `PUT /users/profile`

## Current Limitations

- Forgot password is UI-only in this sprint.
- Frontend has design system scaffold and auth flow shell, not production state management.
- Alembic migration files are not added yet; tables are created from SQLAlchemy metadata on startup.
