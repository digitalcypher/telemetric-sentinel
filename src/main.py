from fastapi import FastAPI
from pydantic import BaseModel

class TelemetryEvent(BaseModel):
    status: str

app = FastAPI()

telemetry_events = []

@app.post("/")
async def receive_telemetry(event: TelemetryEvent):
    telemetry_events.append(event)
    return {"message": "Telemetry event received."}

@app.get("/telemetry")
async def get_telemetry():
    return telemetry_events
