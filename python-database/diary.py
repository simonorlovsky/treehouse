#!usr/bin/env python3
import datetime
from peewee import *

db = SqliteDatabase('diary.db')

class Entry(Model):
    """Entry model"""
    content = TextField()
    date = DateTimeField(default=datetime.datetime.now)

    def meta():
        database = db

def initialize():
    '''create database and table if they don't exist'''
    db.connect()
    db.create_tables([Entry], safe=True)

def menu_loop():
    '''show menu'''

def add_entry():
    '''add entry'''

def show_entry():
    '''show entry'''

def delete_entry(entry):
    '''delete entry'''

if __name__ == '__main__':
    initialize()
    menu_loop()
