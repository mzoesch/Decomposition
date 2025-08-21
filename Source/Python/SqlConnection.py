import sqlite3
from pathlib import Path


class SqlConnection:

    def __init__(self, db_path: Path, auto_connect=True):
        self.db_path: Path = db_path

        if auto_connect and not self.db_path.is_file():
            raise ValueError("Database file does not exist at the specified path.")

        self.connection = None
        self.cursor = None

        if auto_connect:
            self.connect()

    def is_connected(self) -> bool:
        return self.connection is not None and self.cursor is not None

    def connect(self) -> None:
        if self.is_connected():
            print('WARNING: Connection already established.')
            return None

        self.connection = sqlite3.connect(self.db_path)
        self.cursor = self.connection.cursor()
        print(f'Connected to database at {self.db_path}.')

        return None

    def close(self) -> None:
        if not self.is_connected():
            print('WARNING: No connection to close.')

        self.connection.close()
        print('Connection closed.')

        self.connection = None
        self.cursor = None

        return None

    def execute_ro(self, query: str, params: tuple = ()) -> None:
        if not self.is_connected():
            raise RuntimeError("Cannot execute query. No active database connection.")

        self.cursor.execute(query, params)

        return None

    def execute_rw(self, query: str, params: tuple = ()) -> None:
        if not self.is_connected():
            raise RuntimeError("Cannot execute query. No active database connection.")

        self.cursor.execute(query, params)
        self.connection.commit()

        return None

    def fetchall(self) -> list:
        if not self.is_connected():
            raise RuntimeError("Cannot fetch results. No active database connection.")

        return self.cursor.fetchall()
