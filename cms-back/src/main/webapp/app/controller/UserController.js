Ext.define("AM.controller.UserController",{
    extend:"Ext.app.Controller" ,
    init:function(){
       this.control({
            'userlist button[id=save]':{
                click:function(o){
                    var grid = o.ownerCt.ownerCt;
                    var data = grid.getSelectionModel().getSelection();
                    if(data.length == 0 ){
                        alert("您至少需要选择一条数据！");
                    }else{
                        //1、先得到id的数据(name)
                        var st = grid.getStore();
                        var ids = [];
                        Ext.Array.each(data,function(record){
                            ids.push(record.get('name'));
                        });
                        Ext.Msg.alert('要操作的数据',ids);
                    }
                }
            }
       });
    },
    views:[
        'List'
    ],
    stores:[
        'Users'
    ],
    models:[
        'User'
    ]
});