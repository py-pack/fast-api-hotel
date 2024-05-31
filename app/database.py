from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.orm import DeclarativeBase, sessionmaker

from app.config import settings

engine = create_async_engine(
    settings.DATABASE_URL,
    echo=True,
)

async_session_maker = sessionmaker(
    engine,
    class_=AsyncSession,  # Указываем что должен будет использоваться ассинхронное подключение
    expire_on_commit=False,  # не рвать связь после транзакции
)


class Base(DeclarativeBase):  # базовый класс для миграций
    pass
