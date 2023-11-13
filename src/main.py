from secrets import token_hex
from json import dumps

random_bytes_file = "random_bytes.json"
num_bytes = 1024

with open(random_bytes_file, mode="w") as file:
    file.write(dumps({"num_bytes": num_bytes, "random_bytes": token_hex(num_bytes)}))
