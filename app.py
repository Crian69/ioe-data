import csv
from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/api/results/<int:year>')
def api(year: int):
    try:
        with open(f'./data/{year}.csv', encoding='utf-8') as csv_file: 
            csvReader = csv.DictReader(csv_file)
            return jsonify([data for data in csvReader])
    except FileNotFoundError:
        return jsonify({'error': 'result not found'})


app.run(host='0.0.0.0', port='5000')
