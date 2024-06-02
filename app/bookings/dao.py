from datetime import date

from sqlalchemy import select, and_, or_, func, insert

from app.bookings.models import Booking
from app.database import async_session_maker
from app.dau.base import BaseDAO
from app.rooms.models import Room


class BookingDAO(BaseDAO):
    model = Booking

    @classmethod
    async def add(
        cls,
        user_id: int,
        room_id: int,
        date_from: date,
        date_to: date,
    ):
        """
        WITH booked_rooms as (
            select *
            from bookings
            WHERE room_id = 1
              and (date_from >= '2023-05-15' and date_from <= '2023-06-20')
              or (date_from <= '2023-05-15' and date_to > '2023-05-15')
        )
        select rooms.quantity - count(booked_rooms.room_id)
        from rooms
                 left join booked_rooms.room_id = rooms.id
        where rooms.id = 1

        group by rooms.id;
        """

        async with async_session_maker() as session:
            booked_rooms = select(Booking).where(
                and_(
                    Booking.room_id == room_id,
                    or_(
                        and_(
                            Booking.date_from >= date_from,
                            Booking.date_from <= date_to,
                        ),
                        and_(
                            Booking.date_from <= date_from,
                            Booking.date_to > date_from,
                        ),
                    ),
                )
            ).cte("booked_rooms")

            """
            select rooms.quantity - count(booked_rooms.room_id)
            from rooms
                     left join booked_rooms.c.room_id = rooms.id
            where rooms.id = 1
            group by rooms.id;        
            """

            smtp_rooms_left = select(
                (Room.quantity - func.count(booked_rooms.c.room_id)).label("rooms_left")
            ).select_from(Room).join(
                booked_rooms, booked_rooms.c.room_id == Room.id, isouter=True
            ).where(Room.id == room_id).group_by(Room.id)

            rooms_left = await session.execute(smtp_rooms_left)
            count_rooms_left: int = rooms_left.scalar()

            if count_rooms_left < 1:
                return None

            stmp_price = select(Room.price).filter_by(id=room_id)
            price = await session.execute(stmp_price)
            price: int = price.scalar()

            add_booking = insert(Booking).values(
                user_id=user_id,
                room_id=room_id,
                date_from=date_from,
                date_to=date_to,
                price=price,
            ).returning(Booking)

            new_booking = await session.execute(add_booking)
            await session.commit()
            return new_booking.scalar()
