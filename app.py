from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    # Intentional error: undefined_variable is not defined
    return undefined_variable

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)