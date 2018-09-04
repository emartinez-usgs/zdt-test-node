#!/usr/bin/env node

const express = require('express'),
      os = require('os');

const app = express();
const host = os.hostname();
const version = process.env.VERSION || 'unknown version';

app.get('/', (request, response) => {
  // Sleep a little to simulate latency
  setTimeout(() => {
    response.send(`[${host}] - OK (${version})`);
  }, 1250);
});


// standard
app.listen(process.env.PORT || 80);