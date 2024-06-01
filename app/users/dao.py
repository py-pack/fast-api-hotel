from typing import Optional

from app.dau.base import BaseDAO
from app.users.auth import verify_password
from app.users.models import User


class UserDAO(BaseDAO):
    model = User

    @classmethod
    async def authenticate_user(cls, email: str, password: str) -> Optional[User]:
        user = await cls.find_one_or_none(email=email)
        if user and verify_password(password, user.hashed_password):
            return user

        return None
