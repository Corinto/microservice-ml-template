import os

import requests
from fastapi import FastAPI, HTTPException
from logzero import logger

app = FastAPI()

@app.get("/")
def root():
    return {"message": "A small app to trigger the ad sales forecast service."}

app = FastAPI()

def a_true_function():
	return True

if __name__ == '__main__':

	pass


