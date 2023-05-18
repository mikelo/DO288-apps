from fastapi import FastAPI

app = FastAPI()

@app.post("/endpoint")
async def endpoint(data: dict):
    print(data)
    return {"message": data}
