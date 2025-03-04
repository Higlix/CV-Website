const express = require('express');
const app = express();

app.use(express.static('public'))

// http://localhost:3000/
app.get('/', (req, res) => {

    // res.send('<h1>Hello, Express.js Server!</h1>');
    res.sendFile('public/index.html');
});

app.get('/app-ads.txt', (req, res) => {

    res.send()
});

// Include route files
const contactRoute = require('./routes/contact');

// Use routes
app.use('/contact', contactRoute);

const port = 3000;

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});