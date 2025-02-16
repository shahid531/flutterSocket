//import express from "express";
//import { createServer } from "node:http";
//import { Server } from "socket.io";
//
//const app = express();
//const server = createServer(app);
//const io = new Server(server);
//
//io.on("connection", (socket) => {
//  console.log("a user connected");
//
//  // Listen for messages from the client
//  socket.on("message", (data) => {
//    console.log(`FROM CLIENT:- ${data}`);
//  });
//
//  // Send a welcome message to the client
//  socket.emit("message", "Welcome to the server!");
//
//  // Start emitting random values at an interval of 1 second
//  const interval = setInterval(() => {
//    const randomValue = Math.floor(Math.random() * 100) + 1; // Random value between 1 and 100
//    socket.emit("randomValue", randomValue); // Emit the random value to the client
//  }, 1000); // 1 second interval
//
//  // Handle client disconnection
//  socket.on("disconnect", () => {
//    console.log("a user disconnected");
//    clearInterval(interval); // Stop the interval when the client disconnects
//  });
//});
//
//server.listen(3000, () => {
//  console.log("server running at http://localhost:3000");
//});
