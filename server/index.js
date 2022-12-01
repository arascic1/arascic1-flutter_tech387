console.log('Hello World');

const PORT = 3000;

const express = require('express');
const authRouter = require("./routes/auth.js");
const app = express();

app.use(authRouter);

/*
app.get('/hello-world', (req, res) => {
    // res.send('hello world');
    res.json({ val: "zdravo" });
});

app.get('/', (req, res) => {
    res.json({ AhmedRascic: "Ahmed Raščić" });
})
*/

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected to port ${PORT} hello`);
});