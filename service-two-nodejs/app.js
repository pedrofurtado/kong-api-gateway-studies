const express = require('express')
const app = express()
const os = require('os')
const bodyParser = require('body-parser')
const fetch = require('node-fetch')

app.use(bodyParser.json())

function make_response(req, res, text) {
  fetch(`http://kong:8001/consumers/${req.headers['x-consumer-id']}/basic-auth`, {
    method: 'GET',
    headers: {
      "Content-Type": "application/json"
    }
  })
  .then(r => r.json())
  .then(r => {
    res.json({
      result: text,
      hostname: os.hostname(),
      request_data: {
        env: req.env,
        params: req.params,
        body: req.body,
        query_string: req.query,
        consumer_infos: r,
        headers: req.headers,
      }
    })
  })
}

app.get('/', (req, res) => {
  make_response(req, res, 'Service Two - NodeJS - GET homepage')
})

app.post('/', (req, res) => {
  make_response(req, res, 'Service Two - NodeJS - POST homepage')
})

app.get('/hey', (req, res) => {
  make_response(req, res, 'Service Two - NodeJS - GET hey')
})

app.listen(3000, () => {
  console.log('Service Two - NodeJS - App started')
})
