const express = require('express');

const app = express();
const port = process.env.PORT || 3000;

app.get('/hello', (req, res) => {
    res.json({ hello: 'world!!' });
});

app.listen(port, () => {
    console.log(`listening to port ${port}`);
});
