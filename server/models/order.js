const mongoose=require('mongoose');
const{productSchema}=require('../models/product');

const orderSchema=mongoose.Schema({
    address: {
        type: String,
        required:true,
      },
      totalPrice: {
        type: Number,
        required:true,
      },
      products:[
        {
          product:productSchema,
          quantity:{
            type:Number,
            required:true,
          },
        },
      ],
      userId: {
        type: String,
        required:true,
      },
     orderedAt: {
        type: Number,
        required:true,
      },
     status: {
        type: Number,
        default:0,
      },

});

const Order=mongoose.model('Order',orderSchema);
module.exports=Order;