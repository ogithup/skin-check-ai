from app.models.user import User
from app.schemas.dashboard import (
    DashboardForumItem,
    DashboardLookItem,
    DashboardProductItem,
    DashboardReminderItem,
    DashboardRoutineItem,
    DashboardSummaryResponse,
)


def build_dashboard_summary(user: User) -> DashboardSummaryResponse:
    display_name = user.profile.display_name if user.profile and user.profile.display_name else "Beauty Explorer"

    return DashboardSummaryResponse(
        expiring_products=[],
        rarely_used_products=[],
        favorite_products=[],
        today_routine=DashboardRoutineItem(
            title=f"{display_name}'s morning routine",
            progress_label="No routine steps yet",
            completed_steps=0,
            total_steps=0,
        ),
        latest_look=DashboardLookItem(
            title="Your latest look will appear here",
            note="Create a makeup look in the next sprint to populate this card.",
            image_url=None,
        ),
        progress_reminders=[
            DashboardReminderItem(
                title="Progress photo check-in",
                message="Add your first skincare progress reminder after Sprint 10 is active.",
                level="info",
            )
        ],
        forum_highlights=[
            DashboardForumItem(
                title="Community highlights are coming soon",
                excerpt="Forum insights will appear here once community features land in a later sprint.",
                tag="Coming Soon",
            )
        ],
    )
