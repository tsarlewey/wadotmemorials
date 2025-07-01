import csv
import json

with open('WDOT Memorial Info.csv', 'r') as csv_file:
    reader = csv.DictReader(csv_file)
    data = list(reader)

with open('memorials.json', 'w') as json_file:
    json.dump(data, json_file, indent=2)