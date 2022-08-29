<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>인증처리 - 쿠키와 세션</title>
	<%@ include file="../common/easyui_common.jsp" %>
	<style type="text/css">
		a {
			text-decoration: none;
		}
	</style>
	<script>
	//DOM트리가 다 그려 진거니? - yes
 	$(document).ready(function(){
		$("#d_member").hide();
		$("#d_memberInsert").hide();
	});
	</script>
	<script type="text/javascript">
		function login(){
			const tb_id = $("#mem_id").val();
			const tb_pw = $("#mem_pw").val();
			alert("./login.pj?mem_id="+tb_id+"&mem_pw="+tb_pw);
			location.href="./login.pj?mem_id="+tb_id+"&mem_pw="+tb_pw;
		}
		function logout(){
			location.href="./logout.jsp";
		}
		function memberList(){
			alert("회원목록 호출 성공");
			
			$("#d_member").show();
			$("#dg_member").datagrid({
				columns:[[
					{field: 'ID', title:'아이디', width: 100}
				   ,{field: 'NAME', title:'이름', width: 120}
				   ,{field: 'ZIPCODE', title:'주소', width: 200}
				]]
				,url:"/member/memberList.pj"
			});

			$("#d_memberInsert").hide();
		}
		function memberInsert(){
			alert("회원등록 호출 성공");
			$("#d_member").hide();
			$("#d_memberInsert").show();
		}
		function memberDelete(){
			alert("회원삭제 호출 성공");
		}
	</script>
</head>
<body>
<script>
	//DOM트리가 다 그려 진거니? - yes
	$(document).ready(function(){
		$('#tb_id').textbox({
		    iconCls:'icon-man',
		    iconAlign:'right'
		})		
		$('#tb_pw').textbox({
		    iconCls:'icon-lock',
		    iconAlign:'right'
		})		
	});
</script>
    <div style="margin:20px 0;"></div>
    <div class="easyui-layout" style="width:1000px;height:500px;">
        <div data-options="region:'south',split:true" style="height:50px;"></div>
        <div data-options="region:'west',split:true" title="KH정보교육원" style="width:200px;">
<%
	String s_name = (String)session.getAttribute("s_name");
	
	if(s_name == null){
%>
<!-- ####################### 로그인 영역 시작 ####################### -->
			<div style="margin: 10px 0;"></div>
			<div id="d_login" align="center">
				<div style="margin: 3x 0;"></div>
				<input id="mem_id" name="mem_id" class="easyui-textbox" />
				<script type="text/javascript">
					$('#mem_id').textbox({
						iconCls:'icon-man',
						iconAlign: 'right',
						prompt: '아이디',
					});
				</script>
				<div style="margin: 3x 0;"></div>
				<input id="mem_pw" name="mem_pw" class="easyui-passwordbox" />
				<script type="text/javascript">
					$('#mem_pw').passwordbox({
						iconAlign: 'right',
						prompt: '비밀번호',
					});
				</script>
				<div style="margin: 3x 0;"></div>
				<a id="btn_login" href="javascript:login()" class="easyui-linkbutton" data-options="iconCls:'icon-man'">
					로그인
				</a>
				<a id="btn_member" href="javascript:memberShip()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">
					회원가입
				</a>
			</div>
<!-- ####################### 로그인 영역 끝 ####################### -->
<%
	} else {
%>
<!-- ####################### 로그아웃 영역 시작 ####################### -->
			<div id="d_logout" align="center" >
				<div id="d_ok"><%= s_name%>님 환영합니다.</div>
				<div style="margin: 10x 0;"></div>
				<a id="btn_logout" href="javascript:logout()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">
					로그아웃
				</a>
				<a id="btn_member" href="javascript:memberUpdate()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">
					정보수정
				</a>
			</div>
<!-- ####################### 로그아웃 영역 끝 ####################### -->
<%
	}
%>
<!-- ####################### 메뉴 영역 시작 ####################### -->
		    <div style="margin:20px 0;"></div>
		        <ul id="tre_gym" class="easyui-tree" style="margin:0 6px;">
		            <li data-options="state:'closed'">
		                <span>회원 관리</span>
		                <ul>
		                    <li>
		                        <a href="javascript:memberList()">회원 목록</a>
		                    </li>
		                    <li>
		                    	<a href="javascript:memberInsert()">회원 등록</a>
		                    </li>
		                    <li>
		                    	<a href="javascript:memberDelete()">회원 삭제</a>
		                    </li>
		                </ul>
		            </li>
		            
		            <li data-options="state:'closed'">
		            	<span>쪽지 관리</span>
		            	<ul>
		            		<li>
		            			<span>받은 쪽지함</span>
		            		</li>
		            		<li>
		            			<span>보낸 쪽지함</span>
		            		</li>
		            	</ul>
		            </li>
		            
		            <li data-options="state:'closed'">
		            	<span>게시판</span>
		            	<ul>
		            		<li>
		            			<span>1:1 게시판</span>
		            		</li>
		            		<li>
		            			<span>공지 게시판</span>
		            		</li>
		            		<li>
		            			<span>Q&A</span>
		            		</li>
		            	</ul>
		            </li>
		        </ul>
        </div>
<!-- ####################### 메뉴 영역 끝 ####################### -->
        <div data-options="region:'center',title:'TerrGYM System',iconCls:'icon-ok'">
        	
        <!-- 회원 관리 -->
        	<!-- 회원 목록 시작-->
        	<div id="d_member">
	        	<div style="margin: 5px 0;"></div>
	        	Home > 회원관리 > 회원목록
	        	<hr>
	        	<div style="margin: 20px 0;"></div>
	        	<div id="dg_member"></div>
        	</div>
        	<!-- 회원 목록 끝 -->
        
        	<!-- 회원 등록 시작-->
        	<div id="d_memberInsert">
	        	<div style="margin: 5px 0;"></div>
	        	Home > 회원관리 > 회원등록
	        	<hr>
	        	<div style="margin: 20px 0;"></div>
	        	<div>회원 등록화면</div>
        	</div>
        	<!-- 회원 등록 끝-->
        	
        
        <!-- 쪽지 관리(받은 쪽지함,보낸 쪽지함)-->	
        
        
        </div>
    </div>
</body>
</html>