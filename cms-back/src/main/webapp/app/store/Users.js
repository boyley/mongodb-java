//User的数据集合类
Ext.define("AM.store.Users",{
    extend:"Ext.data.Store",
    model:'AM.model.User' ,
    storeId:'user_store',
    pageSize: 15,
    proxy:{
        type:"ajax",
        url:'/user.json' ,
        reader:{
            type:"json",
            root:"user_list",
            totalProperty: 'total'
        },
        writer:{
            type:'json'
        }
    },
    autoLoad:true

});