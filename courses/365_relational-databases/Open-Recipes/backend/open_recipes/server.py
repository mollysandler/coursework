# generated by fastapi-codegen:
#   filename:  openapi.yaml
#   timestamp: 2023-10-24T00:41:23+00:00

from __future__ import annotations

from typing import Annotated, List, Optional

import uvicorn
from fastapi import Depends, FastAPI, Request
from pydantic import BaseModel

from open_recipes.api.auth import oauth2_scheme
from open_recipes.api.auth import router as auth_router
from open_recipes.api.ingredients import router as ingredient_router
from open_recipes.api.recipe_lists import router as recipe_list_router
from open_recipes.api.recipes import router as recipe_router
from open_recipes.api.tags import router as tag_router
from open_recipes.api.users import router as user_router
from open_recipes.models import Recipe

# class User(BaseModel):
#     username: str
#     email: str | None = None
#     full_name: str | None = None
#     disabled: bool | None = None


# class UserInDB(User):
#     hashed_password: str

app = FastAPI(
    title="Recipe Service API",
    version="1.0.0",
    description="API for managing recipes, ingredients, users, and reviews.",
)

app.include_router(user_router)
app.include_router(recipe_router)
app.include_router(ingredient_router)
app.include_router(tag_router)
app.include_router(
    auth_router,
)
app.include_router(recipe_list_router)


@app.get("/")
def read_root(token: Annotated[str, Depends(oauth2_scheme)]):
    return {"Hello": "World", "token": token}


# SMOKE TESTED


class SearchResults(BaseModel):
    recipe: List[Recipe]
    next_cursor: Optional[int]
    prev_cursor: Optional[int]


@app.post("/test-post")
async def test_post(request: Request):
    # Access query parameters from the URL
    query_params = dict(request.query_params)

    # Access data from the request body (assuming it's JSON)
    try:
        data = await request.json()
    except ValueError:
        data = None  # Set data to None if no JSON data is sent

    # Prepare the response data
    response_data = {
        "request_data": data,
        "query_parameters": query_params,
    }

    return response_data


if __name__ == "__main__":
    config = uvicorn.Config(app, port=3000, log_level="info", reload=True)
    server = uvicorn.Server(config)
    server.run()