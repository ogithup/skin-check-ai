from pydantic import BaseModel


class DashboardProductItem(BaseModel):
    id: str
    brand: str
    name: str
    subtitle: str
    status: str


class DashboardRoutineItem(BaseModel):
    title: str
    progress_label: str
    completed_steps: int
    total_steps: int


class DashboardLookItem(BaseModel):
    title: str
    note: str
    image_url: str | None = None


class DashboardReminderItem(BaseModel):
    title: str
    message: str
    level: str


class DashboardForumItem(BaseModel):
    title: str
    excerpt: str
    tag: str


class DashboardSummaryResponse(BaseModel):
    expiring_products: list[DashboardProductItem]
    rarely_used_products: list[DashboardProductItem]
    favorite_products: list[DashboardProductItem]
    today_routine: DashboardRoutineItem | None
    latest_look: DashboardLookItem | None
    progress_reminders: list[DashboardReminderItem]
    forum_highlights: list[DashboardForumItem]
