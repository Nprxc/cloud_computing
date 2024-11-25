import json
import os
import psycopg2

from azure.identity import DefaultAzureCredential
from azure.storage.blob import BlobServiceClient
from azure.core.exceptions import HttpResponseError

from fastapi import FastAPI, HTTPException


app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/examples")
def read_examples():
    try:
        conn = psycopg2.connect(
            host=get_environment_variable("DATABASE_HOST"),
            port=get_environment_variable("DATABASE_PORT", "5432"),
            database=get_environment_variable("DATABASE_NAME"),
            user=get_environment_variable("DATABASE_USER"),
            password=get_environment_variable("DATABASE_PASSWORD"),
            connect_timeout=1,
        )

        cur = conn.cursor()
        cur.execute("SELECT * FROM examples")
        examples = cur.fetchall()
        return {"examples": examples}
    except psycopg2.OperationalError as error:
        raise HTTPException(status_code=500, detail=str(error))


def get_environment_variable(key, default=None):
    value = os.environ.get(key, default)

    if value is None:
        raise RuntimeError(f"{key} does not exist")

    return value


@app.get("/quotes")
def read_quotes():
    try:
        account_url = get_environment_variable("STORAGE_ACCOUNT_URL")
        default_credential = DefaultAzureCredential(process_timeout=2)
        blob_service_client = BlobServiceClient(account_url, credential=default_credential)

        container_client = blob_service_client.get_container_client(container=get_environment_variable("STORAGE_CONTAINER"))
        quotes = json.loads(container_client.download_blob("quotes.json").readall())
    except HttpResponseError as error:
        raise HTTPException(status_code=500, detail=str(error))

    return {"quotes": quotes}

@app.post("/initialize-database")
def initialize_database():
    """
    Initialize the database by creating the 'examples' table and inserting a default record.
    This should be used cautiously in production environments.
    """
    try:
        # Connexion à la base de données
        conn = connect_to_db()
        cur = conn.cursor()

        # Création de la table si elle n'existe pas
        create_table_query = """
        CREATE TABLE IF NOT EXISTS examples (
            id SERIAL PRIMARY KEY,
            description TEXT
        );
        """
        cur.execute(create_table_query)

        # Insertion des données si elles n'existent pas
        insert_data_query = """
        INSERT INTO examples (description)
        SELECT 'Hello world!'
        WHERE NOT EXISTS (
            SELECT 1 FROM examples WHERE description = 'Hello world!'
        );
        """
        cur.execute(insert_data_query)

        # Validation des changements
        conn.commit()

        cur.close()
        conn.close()

        return {"message": "Database initialized successfully"}
    except psycopg2.Error as error:
        raise HTTPException(status_code=500, detail=f"Error initializing database: {str(error)}")
