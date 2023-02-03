const express = require("express");
const http = require("http");
const app = express();
const port = process.env.PORT || 5000;
const server = http.createServer(app);
const io = require("socket.io")(server);

//middleware

app.use(express.json());

io.on("connection", (socket)=>{
    console.log("connected");
    console.log(socket.id, "has joined");
    socket.on("signin", (msg)=>{
        console.log(msg);
    });
});

server.listen(port, ()=>{
    console.log("server started at port", port);
});

