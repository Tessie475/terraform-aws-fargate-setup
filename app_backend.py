from flask import Flask, request, render_template, g
import sqlite3

app = Flask(__name__)
DATABASE = 'guestbook.db'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

@app.route('/')
def index():
    cur = get_db().cursor()
    cur.execute("SELECT * FROM entries")
    entries = cur.fetchall()
    return render_template('index.html', entries=entries)

@app.route('/post', methods=['POST'])
def post_entry():
    db = get_db()
    db.execute("INSERT INTO entries (content) VALUES (?)", (request.form['content'],))
    db.commit()
    return 'Success!'

if __name__ == "__main__":
    app.run(debug=True)
