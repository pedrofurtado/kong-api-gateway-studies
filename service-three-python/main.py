from flask import Flask, request, jsonify

app = Flask(__name__)

HTTP_LIST_OF_METHODS = ['GET', 'HEAD', 'POST', 'PUT', 'DELETE', 'CONNECT', 'OPTIONS', 'TRACE', 'PATCH']

@app.route('/', methods=HTTP_LIST_OF_METHODS)
def homepage():
    body_json = None
    try:
      body_json = request.get_json(force=True)
    except Exception as e:
      body_json = None

    return jsonify({
      "a_message": "Service Three Python - Homepage - " + request.method,
      "b_query_string": request.args,
      "c_body": body_json,
      "d_headers": dict(request.headers)
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
