const express = require('express')
const app = express();

app.get('/', (req, res) => {
    res.json({ message: "Hello World from Docker!"})
})


const { PORT = 5000 } = process.env;

const listener = () => console.log(`Listening on Port ${PORT}!`);
app.listen(PORT, listener);