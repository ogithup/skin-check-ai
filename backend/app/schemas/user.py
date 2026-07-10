from datetime import datetime

from pydantic import BaseModel, ConfigDict, EmailStr


class UserProfileUpdate(BaseModel):
    display_name: str | None = None
    skin_type: str | None = None
    avatar_url: str | None = None
    beauty_goal: str | None = None


class UserProfileResponse(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    display_name: str | None
    skin_type: str | None
    avatar_url: str | None
    beauty_goal: str | None


class UserResponse(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: int
    email: EmailStr
    is_active: bool
    created_at: datetime
    profile: UserProfileResponse | None
