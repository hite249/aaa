<%@ include file="/WEB-INF/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
    html, body {
        width: 100%;      /*provides the correct work of a full-screen layout*/ 
        height: 100%;     /*provides the correct work of a full-screen layout*/
        overflow: hidden; /*hides the default body's space*/
        margin: 0px;      /*hides the body's scrolls*/
    }		
    div.controls {
			margin: 0px 10px;
			font-size: 14px;
			font-family: Tahoma;
			color: #404040;
			height: 80px;
		}
</style>
<script>
var bottomGrid, topGrid, dhxWins, w1,f1,f2, dbConGrid;
var data={
	    rows:[
	        { id:1, data: ["2","red1", "red", "33","asdf","asdf"]},
	        { id:2, data: ["2","red1", "red", "33","asdf","asdf"]}
	    ]
	};


	function gridClickEvent(id, ind){
		if(id.indexOf("table")!=-1){
			var aud = new AjaxUtilDx("db/tableinfo",dbConGrid)
			aud.setCallbackSuccess(returnTableInfo);
			aud.send();
		}
	}
	function clickEvent(id){
		if(id=="load"){
			var au = new AjaxUtil("/user/userlistaction","it_mode");
			au.setCallbackSuccess(returnList);
			au.send();
		}else if(id=="adddb"){
			w1.show();
		}else if(id=="submit"){ 
			var aud = new AjaxUtilDx("db/add",f1)
			aud.setCallbackSuccess(returnDBList);
			aud.send();
		}else if(id=="condb"){
			var rowId = dbConGrid.getSelectedRowId();
			if(rowId==null){
				alert("연결하실 디비를 선택해주세요");
				return;
			}else{
				var aud = new AjaxUtilDx("db/condb",dbConGrid)
				aud.setCallbackSuccess(returnTableList);
				aud.send();
			}
		}else if(id=="selectdb"){
			var au = new AjaxUtil("db/select");
			au.setCallbackSuccess(returnDBList);
			au.send();
		}else if(id=="runsql"){
			var aud = new AjaxUtilDx("db/runsql",f2)
			aud.setCallbackSuccess(returnResultList);
			aud.send();
		}else if(id=="cancelsql"){
			
		}
	}
	
	function returnResultList(list){
		var error = list.error;
		if(error){
			alert(error);
			return;
		}
		var datas = list.data;
		var columns = list.columns;
    	var strs = "<?xml version='1.0' encoding='utf-8'?>";
		strs += '<rows>';
		var header = '<head>';
		var rows = "";

    	for(i=0; i<datas.length;i++){
    		var obj = datas[i];
    		rows += "<row id='r" + (i+1) + "'>";
    		for(var key in obj){
    			if(i==0){
    				header += '<column width="80" type="ro" align="center" sort="str">' + key + '</column>';
    			}
    			rows += '<cell align="center">' + obj[key] +'</cell>';
    		}
    		rows += "</row>";
    	}	
    	header += '</head>';
    	strs += header;
    	strs += rows;
		strs += '</rows>';
		bottomGrid.parse(strs, "xml");
	}
	function returnTableInfo(list){
		var datas = list.data;
    	var strs = "<?xml version='1.0' encoding='utf-8'?>";
		strs += '<rows>';
    	for(i=0; i<datas.length;i++){
    		strs += "<row id='r" + (i+1) + "'>";
    		strs += '<cell image="folder.gif">' + datas[i].column_name +'</cell>';
    		strs += '<cell>' + datas[i].data_type +'</cell>';
    		strs += '<cell>' + datas[i].character_maximum_length +'</cell>';
    		strs += '<cell>' + datas[i].is_nullable +'</cell>';
    		strs += "</row>";
    	}	
    	strs += "</rows>";
    	topGrid.clearAll();
    	topGrid.parse(strs,"xml");
	}
	function returnDBList(list){
		var datas = list.data;
    	var strs = "<?xml version='1.0' encoding='utf-8'?>";
		strs += '<rows>';
    	for(i=0; i<datas.length;i++){
    		strs += "<row id='r" + (i+1) + "'>";
    		strs += '<cell image="folder.gif">' + datas[i].dinum +'</cell>';
    		strs += '<cell>' + datas[i].dbname +'</cell>';
    		strs += '<cell>' + datas[i].id +'</cell>';
    		strs += "</row>";
    	}	
    	strs += "</rows>";
    	dbConGrid.clearAll();
    	dbConGrid.parse(strs,"xml");
	}
	
	function returnTableList(list){
		var datas = list.data;
		var rowId = dbConGrid.getSelectedRowId();
    	for(i=0; i<datas.length;i++){
    		dbConGrid.addRow(rowId + '_table'+(i+1),' , ' + datas[i].tablename,i,rowId,null,true);
    	}	
	}
	function returnList(list){
		var datas = list.data;
    	var strs = "<?xml version='1.0' encoding='utf-8'?>";
		strs += '<rows>';
    	for(i=0; i<datas.length;i++){
    		strs += "<row id='r" + (i+1) + "'>";
    		strs += '<cell>' + datas[i].userid +'</cell>';
    		strs += '<cell>' + datas[i].username +'</cell>';
    		strs += '<cell>' + datas[i].age +'</cell>';
    		strs += '<cell>' + datas[i].admin +'</cell>';
    		strs += '<cell>' + datas[i].boardadmin +'</cell>';
    		strs += "</row>";
    	}	
    	strs += "</rows>";
		bottomGrid.clearAll();
		bottomGrid.parse(strs,"xml");
	}
	
	dhtmlxEvent(window,"load",function(){
	    var layout = new dhtmlXLayoutObject(document.body, "3L");
		dhxWins = new dhtmlXWindows();
		w1 = dhxWins.createWindow("w1", 20, 30, 270, 300);
        var formData = [
			{type: "settings", position: "label-left", labelWidth: 100, inputWidth: 120},
			{type: "block", inputWidth: "auto", offsetTop: 12, list: [
				{type: "input", label: "DB URL", value: "jdbc:mysql://127.0.0.1:3306/study_jsp", name:"url"},
				{type: "input", label: "Driver Name", value: "com.mysql.jdbc.Driver", name:"dbms"},
				{type: "input", label: "DB Name", value: "mine", name:"dbname"},
				{type: "input", label: "User Name", value: "root", name:"id"},
				{type: "password", label: "Password", value: "1234", name:"pwd"},
				{type: "button", value: "커낵터신규생성", name:"submit",offsetLeft: 70, offsetTop: 14}
			]}
		];
		f1 = w1.attachForm(formData, true);
		f1.attachEvent("onButtonClick",clickEvent);
		w1.attachEvent("onClose",function(win){
			w1.hide();
		});
		w1.hide();
		w1.setText("Add DB Connector");
		
	    layout.cells("a").setWidth(270);        //sets the width of the 'form' cell  
	    var aToolBar = layout.cells("a").attachToolbar();
	    aToolBar.addButton("adddb",1,"Add Conector");
	    aToolBar.addButton("condb",2,"Connection");
	    aToolBar.attachEvent("onClick", clickEvent);
	    dbConGrid = layout.cells("a").attachGrid(); 
	    dbConGrid.setImagePath(imgPath);
	    dbConGrid.setHeader("Num, DB Name, User Id",null
	    		,["text-align:center;","text-align:center;","text-align:center;"]);   
	    dbConGrid.setColTypes("tree,ro,ro");                 //sets the types of columns
	    dbConGrid.setInitWidths("70,100,*");   //sets the initial widths of columns
	    dbConGrid.setColAlign("center,center,center");  //sets the x alignment
	    dbConGrid.setColSorting("str,str,str");
	    dbConGrid.setColumnIds("dinum,dbname,id");
	    dbConGrid.init();
	    dbConGrid.attachEvent("onRowSelect",gridClickEvent)
	    
	    
	    layout.cells("a").setText("DataBase Connections");//sets the form's header  
	    layout.cells("b").hideHeader();      //hides the header of the 'chart' cell  
	    layout.cells("c").setText("Result");     //hides the header of the 'grid' cell  
	    var myTabbar = layout.cells("b").attachTabbar(); 
	    myTabbar.addTab("a1", "테이블 정보", null, null, true);
	    myTabbar.addTab("a2", "RUN SQL");
	    topGrid = myTabbar.tabs("a1").attachGrid();
	    topGrid.setImagePath(imgPath);
	    topGrid.setHeader("컬럼명, 자료형, 길이, 널가능여부",null
	    		,["text-align:center;","text-align:center;","text-align:center;","text-align:center","text-align:center"]);   
	    topGrid.setColTypes("ro,ro,ro,ro,ro");                 //sets the types of columns
	    topGrid.setInitWidths("100,150,230,230,*");   //sets the initial widths of columns
	    topGrid.setColAlign("center,center,center,center,center");  //sets the x alignment
	    topGrid.setColSorting("str,str,str,str,str");
	    topGrid.init();
	    var formData2 = [
			{type: "settings", position: "label-left", labelWidth: 100, inputWidth: 300},
			{type: "input", name: "sql", label: "SQL", value: "", rows:4,style:"height:300,width:300"},
			{type: "block", inputWidth: "auto",  list: [
					{type: "button", value: "Run", name:"runsql"},
					{type:"newcolumn"},
					{type: "button", value: "Cancel", name:"cancelsql"}
			]}
		];
	    f2 = myTabbar.tabs("a2").attachForm(formData2, true);
	    f2.attachEvent("onButtonClick",clickEvent);

	    var cToolBar = layout.cells("c").attachToolbar();
	    cToolBar.addButton("load","right","reLoad");
	    cToolBar.attachEvent("onClick", clickEvent);
	    
	    bottomGrid = layout.cells("c").attachGrid();
	    bottomGrid.setImagePath(imgPath);       //sets the path to the source images
	    bottomGrid.init();
	    //bottomGrid.parse(data, "json");
	    clickEvent('selectdb');
	});
</script>
<div id="winVP"></div>
<input type="hidden" name="mode" id="mode" value="list"/>
<body>
</body>
</html>