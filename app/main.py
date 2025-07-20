from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, EmailStr

app = FastAPI()


class Feedback(BaseModel):
    email: EmailStr
    message: str

@app.post("/feedback")
def submit_feedback(feedback: Feedback):
    # Here you would normally process or store the feedback.
    # For demo, just echo back success.
    return {"status": "success", "email": feedback.email, "message": feedback.message}
