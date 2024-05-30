from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.orm import DeclarativeBase, sessionmaker

from app.config import settings

angine = create_async_engine(
    settings.DATABASE_URL,
)

async_session_maker = sessionmaker(
    engine=angine,
    class_=AsyncSession,  # Указываем что должен будет использоваться ассинхронное подключение
    expire_on_commit=False,  # не рвать связь после транзакции
)


class Base(DeclarativeBase):  # базовый класс для миграций
    pass
