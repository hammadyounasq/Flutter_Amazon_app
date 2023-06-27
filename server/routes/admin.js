const express=require('express');
const adminRouter=express.Router();
const { Product } = require('../models/product');
const admine= require("../middlewares/admin");
const User = require('../models/user');
const Order=require('../models/order');

adminRouter.post("/admin/add-product",admine ,async(req,res)=>{

try{
    const { name, description, images, quantity, price, category } = req.body;
    let product = new Product({
        name,
        description,
        images,
        quantity,
        price,
        category,
      });
product=await product.save();
res.json(product);

}catch(e){
    res.status(500).json({error:e.message})
}

});

adminRouter.get("/admin/get-product",admine,async(req,res)=>{
try{
    product=await Product.find({});
    res.json(product);

}catch(e){
    res.status(500).json({error:e.message});
}

});

adminRouter.post("/admin/delete-product",admine,async(req,res)=>{
    try{
        const{id}=req.body;
        let products=await Product.findByIdAndDelete(id);
       
        res.send("all went well");

        
    }catch(e){
        res.status(500).json({error:e.message});
}

    });
    adminRouter.get('/admin/get-orders',admine,async(req,res)=>{
        try{
            const orders=await Order.find({});
            res.json(orders);

        }catch(e){
            res.status(500).json({error:e.message});

        }
    });
    adminRouter.post("/admin/change-order-status",admine,async(req,res)=>{
        try{
            const{id,status}=req.body;
            let order=await Order.findById(id);
            order.status=status;
            order=await order.save();
            res.json(order);
    
            
        }catch(e){
            res.status(500).json({error:e.message});
    }
    
        });


        adminRouter.get('/admin/analytics',admine,async(req,res)=>{
            try{
                const orders=await Order.find({});
                let totalEarnings=0;
                for(let i=0;i<orders.length;i++){
                    for(let j=0;j<orders[i].products.length;j++){
                        totalEarnings+=orders[i].products[j].quantity * orders[i].products[j].product.price;   
                    }                  
                }
                let modileEarnings=await fetchCategoryWiseproduct('Mobiles');
                let essentialsEarnings=await fetchCategoryWiseproduct('Essentials');
                let appliancesEarnings=await fetchCategoryWiseproduct('Appliances');
                let booksEarnings=await fetchCategoryWiseproduct('Books');
                let fashionEarnings=await fetchCategoryWiseproduct('Fashion');

                let earning={
                    totalEarnings,
                    modileEarnings,
                    essentialsEarnings,
                    appliancesEarnings,
                    booksEarnings,
                    fashionEarnings
                };
                res.json(earning);
            }catch(e){
                res.status(500).json({error:e.message});
            }
        });

        async function fetchCategoryWiseproduct(category){
            let earnigs=0;
            let categoryOrders=await Order.find({
                'products.product.category':category,
            });
            for(let i=0;i<categoryOrders.length;i++){
                for(let j=0;j<categoryOrders[i].products.length;j++){
                    earnigs+=categoryOrders[i].products[j].quantity * categoryOrders[i].products[j].product.price;   
                }                  
            }
            return earnigs;
        }


module.exports=adminRouter ;