from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.orm import DeclarativeBase, sessionmaker

DB_HOST = "localhost"
DB_PORT = 5454  # потому что запущено через докер, я там поменял порт БД

DB_NAME = "hotel"
DB_USER = "postgres"
DB_PASS = "postgres"

DATABASE_URL = f"postgresql+asyncpg://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

angine = create_async_engine(
    DATABASE_URL,
)

async_session_maker = sessionmaker(
    engine=angine,
    class_=AsyncSession,  # Указываем что должен будет использоваться ассинхронное подключение
    expire_on_commit=False,  # не рвать связь после транзакции
)


class Base(DeclarativeBase):  # базовый класс для миграций
    pass
