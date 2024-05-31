from app.bookings.models import Booking
from app.dau.base import BaseDAO


class BookingDAO(BaseDAO):
    model = Booking
