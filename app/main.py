from fastapi import FastAPI, Query, Depends
from typing import Optional, List, Dict, Union
from datetime import date

from pydantic import BaseModel

from app.users.router import router as router_users
from app.bookings.router import router as router_booking

app = FastAPI()

app.include_router(router_users)
app.include_router(router_booking)


class SHotel(BaseModel):
    adress: str
    name: str
    start: int


class SHotelSearchArgs:
    def __init__(
        self,
        location: str,
        date_from: date,
        date_to: date,
        has_spa: Optional[bool] = None,
        start: Optional[int] = Query(None, ge=1, le=5),
    ):
        self.location = location
        self.date_from = date_from
        self.date_to = date_to
        self.has_spa = has_spa
        self.start = start


@app.get("/hotels")
def get_hotels(
    search_args: SHotelSearchArgs = Depends()
) -> list[dict[str, Union[str, int]]]:
    hotels = [
        {
            "adress": "st. Gagarina, 1, Altay",
            "name": "Super Hotel",
            "start": 4
        },
    ]
    return hotels


class SBooking(BaseModel):
    room_id: int
    date_from: date
    date_to: date


@app.post("/bookings")
def get_bookings(booking: SBooking):
    pass
