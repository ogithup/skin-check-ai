from fastapi import APIRouter, Depends

from app.api.deps import get_current_user
from app.models.user import User
from app.schemas.dashboard import DashboardSummaryResponse
from app.services.dashboard import build_dashboard_summary

router = APIRouter()


@router.get("/summary", response_model=DashboardSummaryResponse)
def get_dashboard_summary(current_user: User = Depends(get_current_user)) -> DashboardSummaryResponse:
    return build_dashboard_summary(current_user)
