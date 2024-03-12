from flask import Flask, request, jsonify
import sys

app = Flask(__name__)

def print_stdout(msg):
    print(msg, file=sys.stdout, flush=True)

HTTP_LIST_OF_METHODS = ['GET', 'HEAD', 'POST', 'PUT', 'DELETE', 'CONNECT', 'OPTIONS', 'TRACE', 'PATCH']

@app.route('/', methods=HTTP_LIST_OF_METHODS)
def homepage():
    body_json = None
    try:
      body_json = request.get_json(force=True)
    except Exception as e:
      body_json = None

    ratelimit_views_incr_by = request.args.get('views_incr_by', 0)
    ratelimit_videos_incr_by = request.args.get('videos_incr_by', 0)

    header_value = f"videos={ratelimit_videos_incr_by}, views={ratelimit_views_incr_by}"

    print_stdout(header_value)

    return jsonify({
      "a_message": "Service Three Python - Homepage - " + request.method,
      "b_query_string": request.args,
      "c_body": body_json,
      "d_headers": dict(request.headers)
    }), 200 , {'X-My-Custom-Rate-Limit-Counter': header_value}

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
