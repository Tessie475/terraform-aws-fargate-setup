import sqlite3

conn = sqlite3.connect('guestbook.db')
c = conn.cursor()

c.execute('''CREATE TABLE entries
             (id INTEGER PRIMARY KEY, content TEXT)''')

conn.commit()
conn.close()
