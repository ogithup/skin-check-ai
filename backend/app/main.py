from fastapi import FastAPI

from app.api.routers import auth, users
from app.core.config import get_settings
from app.core.database import Base, engine
from app import models  # noqa: F401


def create_app() -> FastAPI:
    settings = get_settings()
    app = FastAPI(title=settings.app_name, debug=settings.app_debug)

    Base.metadata.create_all(bind=engine)

    app.include_router(auth.router, prefix="/auth", tags=["auth"])
    app.include_router(users.router, prefix="/users", tags=["users"])

    @app.get("/health")
    def health() -> dict[str, str]:
        return {"status": "ok"}

    return app


app = create_app()
