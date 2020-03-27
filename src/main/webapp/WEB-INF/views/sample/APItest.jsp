<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>재연이 hci</title>
  <script type="text/javascript" src="yoo.js"></script>
</head>
<body>
  <textarea id="area" style="width:800px;height:500px;"></textarea>
</body>
</html>
<script type="text/javascript">
 var xhr = new XMLHttpRequest();
 var url = 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json';
 var ServiceKey = '53527059be82bbb2d884e8748cc78bca';
 var queryParams = '&' + encodeURIComponent('Id') + '=' + encodeURIComponent('13');

 xhr.open('GET',"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=53527059be82bbb2d884e8748cc78bca&movieCd=20124079", false);

 console.log(typeof(xhr.responseText));
 
 xhr.onreadystatechange = function(){
    if(this.readyState == 4){
       document.getElementById('area').value=xhr.responseText;
    }
 }
 xhr.send(null);
</script>
