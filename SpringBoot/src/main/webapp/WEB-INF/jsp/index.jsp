<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title> jquery Ajax test </title>
  <script src="../static/js/jquery-1.11.1.min.js"></script>
  <script src="../static/js/xml-formatter.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
        var inputId = "";
        var outputId = "";
        var goto_url = "";
      $("#run_xml2json").click(function(){
          callXml2Json(); //클릭 이벤트로 callAjax 함수를 호출한다
      });

      $("#run_json2xml").click(function(){
          callJson2Xml(); //클릭 이벤트로 callAjax 함수를 호출한다
      });
      
    });     
  
	//<!-- callAjax 함수 등록     
	    function callXml2Json(){
	        $.ajax({
		        type: "post", //get, post 방식 선택
		        url : "/service/xml2json", //통신할 페이지 url
		        data : {
		        	xml2json : $('#xml2json').val(), //보낼 값
		        },
		        dataType: 'json',
		        success: function (resdata) {	
		        	$('#json2xml').val(JSON.stringify(resdata, null, 4));
			  	},
		        error: function(){
			        alert("Error");
			    }
	     	});
	    }

	
	    function callJson2Xml(){
	        $.ajax({
		        type: "post", //get, post 방식 선택
		        url : "/service/json2xml", //통신할 페이지 url
		        data: {
		        	json2xml : $('#json2xml').val(), //보낼 값
		        },
		        dataType: 'xml',
		        success: function (resdata) {
		        	var format = require('xml-formatter');
		        	var formattedXml = format(xmlToString(resdata));
		        	$('#xml2json').val(formattedXml);
			  	},
		        error: function(){
			        alert("Error");
			    }
	     	});
	    }
	    function xmlToString(xmlData) { 

	        var xmlString;
	        //IE
	        if (window.ActiveXObject){
	            xmlString = xmlData.xml;
	        }
	        // code for Mozilla, Firefox, Opera, etc.
	        else{
	            xmlString = (new XMLSerializer()).serializeToString(xmlData);
	        }
	        return xmlString;
	    }
  </script>

<title>Insert title here</title>
</head>
<body>
	<div class = conversion>
		<table border="1" cellspacing=0 cellpadding=0 width="1500" height="400">
			<tr>
				<td width=45% height=100%>
					<textarea class="xml2json" id="xml2json" 
						style="resize:none;width:98.3%;height:100%"></textarea>
				</td>
				<td width=10%>
					중앙 여백 ㅇㅋ
				</td>
				<td width=45%>
					<textarea class="json2xml" id="json2xml" 
						style="resize:none;width:98.3%;height:100%"></textarea>
				</td>
			</tr>
			<tr>
				<td><input type=button id="run_xml2json" value="XML &gt; JSON"></td>
				<td></td>
				<td><input type=button id="run_json2xml" value="XML &lt; JSON"></td>
			</tr>
		</table>
	</div>
</body>
</html>