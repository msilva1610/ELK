from flask import Flask 

app = Flask(__name__)  

@app.route("/") 
def hello():     
    return "<h1>Demo via Nginx with uWSGI!</h1><br><h3 style='color:blue'>Hello There!</h1>"  

if __name__ == "__main__":     
    # application.run(host='127.0.0.1', port=9001) 
    app.run(host='0.0.0.0')