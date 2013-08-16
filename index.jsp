<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" 
 import= "javax.xml.parsers.DocumentBuilder"
import= "javax.xml.parsers.DocumentBuilderFactory"
import ="javax.xml.parsers.ParserConfigurationException"
import= "javax.xml.xpath.XPath"
import ="javax.xml.xpath.XPathConstants"
import ="javax.xml.xpath.XPathExpression"
import ="javax.xml.xpath.XPathExpressionException"
import ="javax.xml.xpath.XPathFactory"

import= "org.w3c.dom.Document"
import= "org.w3c.dom.Node"
import="org.w3c.dom.NodeList"
import ="org.xml.sax.SAXException"

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Janitor Monkey</title>

<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/style.css" rel="stylesheet" media="screen">

<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/hmacsha1.js"></script>
<script src="js/awssigner.js"></script>
<script src="js/helper.js"></script>
<script src="js/scratchpad.js"></script>
<script type="text/javascript">
  function addEvent(){
    var url ="api/v1/janitor";
    var eventType = document.getElementById('eventType').value;
    console.log(eventType);
    var resourceId = document.getElementById('resourceId').value;
    console.log(resourceId);
    var data=JSON.stringify({"eventType":eventType,"resourceId":resourceId});
    var text="";
    $.ajax({
    type:"POST",
    url:url,
    data:data,
    async:false,
    success:function(data){
    console.log(data);
   
 
    $.each(data,function(key,val){
      if(key=="eventTime"){
        var date = new Date(val);
        val = date.toUTCString();
      }
          
      text+=key+" : "+val+"<br>";  
    });
   
    
    },
    dataType:'json'
  });
  if(text=="")
    text="<strong>Fail to add event</strong>";
  else
    text = "<strong>Scuccessfully to add event</strong><br>" +text;
  $('#return').html(text);


 
    


  }
 
</script>
</head>

<body>
  <div class="event">
    <h3 > New Event </h3>
      <div class="well">
        <center>
           <select id='eventType' class="form-control" style="width:200px;margin:10px;display:inline">
              <option value="OPTOUT"> Remove marking</option>
              <option value="OPTIN"> Add marking</option>
            </select>
            <input class="form-control" type="text" id='resourceId' placeholder='Resource id' style="width:200px;display:inline">
            <button class="btn btn-primary" type="button"  onclick="addEvent()" style="margin:20px;width:100px">Submit</button>
        </center>
        <br>
        <div id="return" class="alert fade in"></div>
      </div>

     
      

  </div>
  <div style="width:700px;margin:auto">
  <hr>
  <footer class="foot">
    © Janitor Monkey GUI Version 1.0 by CM 
  </footer>
 
</body>
</html>