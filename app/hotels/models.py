from sqlalchemy import Column, String, Integer, JSON

from app.database import Base


class Hotel(Base):
    __tablename__ = 'hotels'

    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    location = Column(String, nullable=False)
    service = Column(JSON, nullable=False)
    rooms_quantity = Column(Integer, nullable=False)
    image_id = Column(Integer)
