console.log("Hello World");

const PORT = 3000;
const DB = "mongodb+srv://arascic:test@cluster0.88wg03h.mongodb.net/?retryWrites=true&w=majority"

const express = require("express");
const authRouter = require("./routes/auth.js");
const mongoose = require("mongoose");

const app = express();
mongoose.connect(DB)
  .then(() => {
    console.log("Connection successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.use(express.json());
app.use(authRouter);

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected to port ${PORT} hello`);
});
