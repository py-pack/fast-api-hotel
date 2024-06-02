from datetime import date

from fastapi import APIRouter, Depends
from app.bookings.dao import BookingDAO
from app.bookings.schemas import SBooking
from app.exception import RoomCannotBeBoredException
from app.users.models import User
from app.users.dependencies import get_current_user

router = APIRouter(
    prefix="/bookings",
    tags=["bookings"],
)


@router.get("/")
async def get_bookings(user: User = Depends(get_current_user)) -> list[SBooking]:
    return await BookingDAO.find_all(user_id=user.id)


@router.post("/")
async def add_booking(
    room_id: int,
    date_from: date,
    date_to: date,
    current_user: User = Depends(get_current_user),
):

    booking = await BookingDAO.add(user_id=current_user.id, room_id=room_id, date_from=date_from, date_to=date_to)
    if not booking:
        raise RoomCannotBeBoredException
