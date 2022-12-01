console.log('Hello World');

const PORT = 3000;

const express = require('express');
const app = express();

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected to port ${PORT} hello`);
});