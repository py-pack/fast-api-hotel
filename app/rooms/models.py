from sqlalchemy import Column, Integer, ForeignKey, String, JSON

from app.database import Base


class Room(Base):
    __tablename__ = 'rooms'

    id = Column(Integer, primary_key=True, autoincrement=True)
    hotel_id = Column(Integer, ForeignKey('hotels.id'))
    name = Column(String)
    description = Column(String)
    price = Column(Integer)
    services = Column(JSON)
    quantity = Column(Integer)
    image_id = Column(Integer)
