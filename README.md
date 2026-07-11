# SkinCheck AI

SkinCheck AI is a mobile-first beauty and skincare tracking platform designed as an end-to-end software engineering project. The product combines a premium Flutter experience with a FastAPI backend, PostgreSQL persistence, product lifecycle tracking, skincare routine logging, progress photos, feedback collection, and future AI-assisted insights.

## Project Status

Current implementation covers:
- Sprint 0 product discovery and system architecture
- Sprint 1 design system and authentication scaffold
- Sprint 2 beauty dashboard foundation

## Core Vision

The application helps users:

- manage makeup and skincare products
- track opened dates and expiration windows
- build consistent skincare routines
- save makeup looks and progress photos
- collect structured product feedback
- receive safe, non-medical beauty guidance

The system is intentionally designed to avoid medical diagnosis claims.

## Architecture

### Frontend

- `Flutter`
- `Material 3`
- premium beauty design system
- authentication flow scaffold
- beauty dashboard screen and section widgets
- reusable UI components

### Backend

- `FastAPI`
- `SQLAlchemy`
- `PostgreSQL 17`
- JWT authentication
- password hashing
- dashboard summary endpoint

### Testing

- `pytest` for backend API tests
- `flutter_test` for widget tests

## Repository Structure

```text
backend/
  app/
  tests/
  requirements/
frontend/
  lib/
  test/
docs/
```

## Sprint 1 Deliverables

### Frontend

- `ThemeData`, `AppColors`, `AppTypography`
- reusable widgets:
  - `PrimaryButton`
  - `SecondaryButton`
  - `BeautyCard`
  - `ProductCard`
  - `ReminderCard`
  - `ProgressCard`
  - `SearchBar`
  - `BottomNavigation`
  - `CustomTextField`
  - `Avatar`
  - `Badge`
  - `Chip`
- auth screens:
  - `Login`
  - `Register`
  - `Forgot Password`
  - `Profile Setup`
  - `Permission Screen`

### Backend

- `POST /auth/register`
- `POST /auth/login`
- `GET /users/me`
- `PUT /users/profile`
- `users` and `user_profiles` models

## Sprint 2 Deliverables

### Frontend

- `DashboardScreen`
- `DashboardHeader`
- `ExpiringProductsCard`
- `RarelyUsedProductsCard`
- `FavoriteCarousel`
- `RoutineProgressCard`
- `LatestLookCard`
- `ProgressReminderCard`
- `ForumHighlightsCard`
- loading, empty, and error states for dashboard
- dashboard integrated into the main navigation shell

### Backend

- `GET /dashboard/summary`
- future-ready dashboard response schema
- authenticated dashboard summary service
- dashboard API test coverage

### Product/UX

- today dashboard wireframe description
- expiring products section description
- rarely used products section description
- favorites carousel description
- skincare progress description
- latest look description
- progress reminder description
- forum highlights description

## Local Setup

### Backend

```powershell
cd backend
py -3.13 -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements/dev.txt
Copy-Item .env.example .env
```

Set your database connection in `.env`:

```env
DATABASE_URL=postgresql+psycopg://postgres:YOUR_PASSWORD@localhost:5432/skincheck_ai
```

Create the database:

```sql
CREATE DATABASE skincheck_ai;
```

Run the backend:

```powershell
uvicorn app.main:app --reload
```

Run backend tests:

```powershell
pytest
```

### Frontend

```powershell
cd frontend
flutter create .
flutter pub get
flutter run -d chrome
```

Run widget tests:

```powershell
flutter test
```

If Windows desktop support is preferred:

```powershell
flutter run -d windows
```

## API Summary

### Auth

- `POST /auth/register`
- `POST /auth/login`

### User

- `GET /users/me`
- `PUT /users/profile`

### Dashboard

- `GET /dashboard/summary`

## Documentation

- [Sprint 0 Product Discovery](docs/sprint-0-product-discovery.md)
- [Sprint 1 Runbook](docs/sprint-1-runbook.md)
- [Sprint 2 Beauty Dashboard](docs/sprint-2-beauty-dashboard.md)

## Roadmap

- Sprint 3 makeup product diary
- Sprint 4 product expiration tracking
- Sprint 5 notifications
- Sprint 6 usage counter
- Sprint 7 favorites
- Sprint 8 look journal
- Sprint 9 skincare routine
- Sprint 10 progress tracking
- Sprint 11 feedback system
- Sprint 12+ recommendations, forum, analytics, and AI modules

## Notes

- Current frontend contains the Sprint 1 auth shell and Sprint 2 dashboard UI with mock dashboard data on the client side.
- Current backend creates tables from SQLAlchemy metadata on startup.
- Dashboard backend currently returns safe placeholder and future-ready summary data until later product, routine, and look tables are fully implemented.
- Alembic migrations can be added in the next step.
