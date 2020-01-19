<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	footer{
		width: 1200px;
		margin: 0 auto;
		padding: 50px 0;
		border-top: 5px solid #FBCB00; 
	}
	footer a#logo{
		margin-left: 50px;
	}
	footer img{
		width: 200px;
	}
	footer p{
		margin-left: 55px;
		line-height: 30px;
	}
	footer div{
		
	}
	footer div p{
		font-size: 14px;
	}
	footer div p a:hover{
		text-decoration: underline;
	}
</style>

	<footer>
		<a href="${pageContext.request.contextPath}" id="logo">
			<img src="${pageContext.request.contextPath}/resources/images/logo2.png">
		</a>
		<div>
			<p>
				<a href="${pageContext.request.contextPath}">Home</a>
				 | <a href="">광고문의</a>
				 | <a href="">고객센터</a> 
				 | <a href="">전체서비스</a>
			</p>
			<p>
				<a href="">회사소개</a>
				 | <a href="">이용약관</a>
				 | <a href="">운영정책</a>
				 | <a href="">개인정보취급방침</a>
			</p>
		</div>	
		<p>Copyright © <b>Liz Gwon</b>. All rights reserved.</p>
	</footer>
</body>
</html>