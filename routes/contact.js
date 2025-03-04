const express = require('express');
const router = express.Router();
const path = require('path');

// Define a route
// http://localhost:3000/contact
router.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../public', 'contact.html'));
});

module.exports = router;