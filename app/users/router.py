from fastapi import APIRouter, HTTPException, status, Response

from app.users.dao import UserDAO
from app.users.schemas import SUserAuth
from app.users.auth import get_password_hash, create_access_token

router = APIRouter(
    prefix="/auth",
    tags=["Auth & Пользователи"],
)


@router.post("/register")
async def login(user_data: SUserAuth):
    exist_user = await UserDAO.find_one_or_none(email=user_data.email)
    if exist_user:
        raise HTTPException(status_code=500)

    hashed_password = get_password_hash(user_data.password)
    await UserDAO.add(email=user_data.email, hashed_password=hashed_password)


@router.post("/login")
async def login(response: Response, user_data: SUserAuth):
    user = await UserDAO.authenticate_user(user_data.email, user_data.password)

    if not user:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED)

    access_token = create_access_token({"sub": user.id})
    response.set_cookie("booking_access_token", access_token, httponly=True)
    return access_token
