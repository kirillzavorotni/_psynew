'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = 'localhost';

// App
const app = express();
app.get('/', (req, res) => {
    res.send('Hello World!!!');
});

app.listen(PORT, () => {
    console.log('Example app listening on port 8080!')
});