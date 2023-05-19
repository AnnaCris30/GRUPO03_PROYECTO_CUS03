from flask import Flask, request,jsonify, send_file,render_template
from psycopg2 import connect, extras

app = Flask(__name__)
#key = Fernet.generate_key()

host = 'localhost'
database = 'cus09'
username = 'postgres'
password = 'Ana-301202'
port = 5432


def get_db_connection():
    conn = connect(host=host, database=database,
                   user=username, password=password, port=port)
    return conn

@app.get('/api/recaudacion')
def get_recaudacion():

    conn = get_db_connection()
    cur = conn.cursor(cursor_factory=extras.RealDictCursor)
    cur.execute("SELECT * FROM recaudacion")
    recaudaciones = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(recaudaciones)


@app.post('/api/recaudacion')
def create_recaudacion():
    new_recaudacion = request.get_json()
    dniResidente = new_recaudacion['dniResidente']    
    codAdministrador = new_recaudacion['codAdministrador'] 
    metodoPago = new_recaudacion['metodoPago']
    importe = new_recaudacion['importe']
    
    
    conn=get_db_connection()
    cur = conn.cursor(cursor_factory=extras.RealDictCursor)

    cur.execute("INSERT INTO recaudacion (metodoPago,importe,dniResidente,codAdministrador) VALUES (%s, %s, %s, %s) RETURNING *",
                (metodoPago,importe,dniResidente,codAdministrador))
    new_created_recaudacion = cur.fetchone()
    print(new_created_recaudacion)
    conn.commit()
    cur.close()
    conn.close()
    return jsonify(new_created_recaudacion)

@app.get('/')
def home():
    return render_template('index.html')


if __name__ == '__main__':
    app.run(debug=True)