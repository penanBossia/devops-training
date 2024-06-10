from flask import Flask # type: ignore
from logging.config import dictConfig
import os
from pymongo import MongoClient # type: ignore

dictConfig({
    'version': 1,
    'formatters': {'default': {
        'format': '[%(asctime)s] %(levelname)s in %(module)s: %(message)s',
    }},
    'handlers': {'wsgi': {
        'class': 'logging.StreamHandler',
        'stream': 'ext://flask.logging.wsgi_errors_stream',
        'formatter': 'default'
    }},
    'root': {
        'level': 'INFO',
        'handlers': ['wsgi']
    }
})

current_env = os.environ.get("ENVIRONMENT", default=None)

app = Flask(__name__)

if (current_env is not None):
    if (current_env == "local"):
        app.config.from_pyfile('./settings/local.py')
    elif (current_env == "prod"):
        app.config.from_pyfile('./settings/prod.py')
    else:
        raise RuntimeError("Unknown env")
    

client = MongoClient('mongodb', 27017, username='mongodb', password='mongodb')
db = client.pythondb
product = db.product

@app.route("/", methods=['GET'])
def hello_world():
    return "<p>" + app.config["MESSAGE"] + "</p>"


@app.route("/products", methods=['GET'])
def getProducts():
    products = []
    cursor = product.find()
    app.logger.info("zaaaaaaaa")
   
    
    for record in cursor:
        app.logger.warning("zooooooooo")
        r = {}
        r['id'] = record['id']
        r['title'] = record['title']
        r['price'] = record['price']
        products.append(r)

    return products