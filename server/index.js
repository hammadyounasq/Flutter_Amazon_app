const express=require("express");
const mongosse=require("mongoose");
const authRoute=require("./routes/auth");
const adminRoute=require("./routes/admin");
const pR=require("./routes/product");
const userRouter = require("./routes/user");

const PORT=process.env.PORT || 3000;
const app=express();

const DB="mongodb+srv://hammad:hammad@cluster0.lekztu8.mongodb.net/?retryWrites=true&w=majority";
app.use(express.json());
app.use(authRoute);
app.use(adminRoute);
app.use(userRouter);
app.use(pR);


mongosse
.connect(DB)
.then(()=>{
    console.log("Connection Successful");
})
.catch((e)=>{
    console.log(e);
});


app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected at port ${PORT}`);
});