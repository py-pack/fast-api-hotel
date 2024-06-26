from datetime import datetime

from fastapi import Request, Depends
from jose import jwt, JWTError

from app.config import settings
from app.exception import TokenAbsentException, IncorrectTokenException, TokenExpiredException, UserIsNotPresentException, UserIsNotAdminException
from app.users.dao import UserDAO
from app.users.models import User


def get_token(request: Request) -> str:
    token = request.cookies.get("booking_access_token")
    if not token:
        raise TokenAbsentException
    return token


async def get_current_user(token: str = Depends(get_token)):
    try:
        payload: dict = jwt.decode(token, settings.SECRET_KEY, settings.ALGORITHM)
    except JWTError as err:
        raise IncorrectTokenException

    expire: int = payload.get("exp")
    if (not expire) or (expire < datetime.utcnow().timestamp()):
        raise TokenExpiredException

    user_id: str = payload.get("sub")
    if not user_id:
        raise UserIsNotPresentException

    user = await UserDAO.find_by_id(int(user_id))
    if not user:
        raise UserIsNotPresentException

    return user


async def get_current_admin_user(current_user: User = Depends(get_current_user)) -> User:
    if current_user.role != 'admin':
        raise UserIsNotAdminException

    return current_user
