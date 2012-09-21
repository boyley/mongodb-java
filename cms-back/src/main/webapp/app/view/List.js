Ext.define('AM.view.List' ,{
    extend: 'Ext.grid.Panel',
    title:'MVC 例子',
    frame:true,
    width:600,
    height:200,
    alias : 'widget.userlist',
    title : 'All Users',
    columns:[//列模式
        {text:'姓名',dataIndex:'name',width:100},
        {text:'年龄',dataIndex:'age',width:100},
        {text:'邮件地址',dataIndex:'email',width:400,
            field:{
                xtype:'textfield',
                allowBlank:false
            }}
    ] ,
    tbar:[{ xtype: 'button',id:'save', text: '保存',iconCls:'icon-save' }],//
    dockedItems:[{
        xtype:'pagingtoolbar',
        store:'Users',//Ext.data.StoreManager.lookup('user_store'),
        dock:'bottom',
        displayInfo:true
    }],
    selType: 'cellmodel',
    plugins: [
        Ext.create('Ext.grid.plugin.CellEditing', {
            clicksToEdit: 2
        })
    ],
    selType:'checkboxmodel',
    multiSelect:true,
    store:'Users',
    initComponent:function(){
        this.callParent(arguments);
    }
});
