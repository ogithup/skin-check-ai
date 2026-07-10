from sqlalchemy import select
from sqlalchemy.orm import Session

from app.core.security import create_access_token, get_password_hash, verify_password
from app.models.user import User, UserProfile


class AuthError(ValueError):
    pass


def register_user(db: Session, email: str, password: str) -> tuple[User, str]:
    existing = db.scalar(select(User).where(User.email == email.lower()))
    if existing:
        raise AuthError("Email already registered.")

    user = User(email=email.lower(), password_hash=get_password_hash(password))
    user.profile = UserProfile()
    db.add(user)
    db.commit()
    db.refresh(user)
    return user, create_access_token(str(user.id))


def login_user(db: Session, email: str, password: str) -> tuple[User, str]:
    user = db.scalar(select(User).where(User.email == email.lower()))
    if not user or not verify_password(password, user.password_hash):
        raise AuthError("Invalid credentials.")
    return user, create_access_token(str(user.id))
