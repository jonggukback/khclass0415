<%@ page import="com.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO mVO = (MemberVO) session.getAttribute("mVO");
	String s_id = null;
	String s_name = null;
	
	if (mVO != null){
		s_id = mVO.getId();
		s_name = mVO.getName();
	}
%>

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
		$("#d_listPage").hide();
		$("#d_insertPage").hide();
		$("#d_deletePage").hide();
	});
	</script>
	<script type="text/javascript">
		/* 로그인 */
		function login(){
			const tb_id = $("#mem_id").val();
			const tb_pw = $("#mem_pw").val();
			location.href="./login.pj?mem_id="+tb_id+"&mem_pw="+tb_pw;
		}
		function logout(){
			location.href="./logout.jsp";
		}
		
		/* 회원 페이지 */
		function listPage(){
			alert("회원목록 페이지");
			$("#d_listPage").show();
			$("#d_insertPage").hide();
			$("#d_deletePage").hide();
		}		
		function insertPage(){
			alert("회원등록 페이지");
			$("#d_listPage").hide();
			$("#d_insertPage").show();
			$("#d_deletePage").hide();
		}
		function deletePage(){
			alert("회원삭제 페이지");
			$("#d_listPage").hide();
			$("#d_insertPage").hide();
			$("#d_deletePage").show();
		}
		
		
		/* 회원 페이지 CRUD */
		let memo = null;
		function memberList(){
			const value = $("#mem_value").val();
			const type = $("#mem_type").val();
			let requestURL = null;
			
			if (value != null && value.length > 0) {
				requestURL = "/member/memberList.pj?mem_value="+value+"&mem_type="+type;
			}else {
				requestURL = "/member/memberList.pj?";
			}
			

			$("#dg_member").datagrid({
				url: requestURL,
				onClickRow: function(index,row){
					console.log("index: "+index);
					console.log(row);
					memo = row.ID;
					alert(memo);
				}
			});
		}
		function memberInsert(){
			alert("회원 입력 호출 성공");
		}
		function memberUpdate(){
			alert("회원 수정 호출 성공");
		}
		function memberDelete(){
			alert("회원 삭제 호출 성공");
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
		<!-- ####################### SIDE 영역 시작 ####################### -->
        <div data-options="region:'west',split:true" title="KH정보교육원" style="width:200px;">
<%
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

			<!-- ####################### 메뉴 영역 시작 ####################### -->
		    <div style="margin:20px 0;"></div>
		        <ul id="tre_gym" class="easyui-tree" style="margin:0 6px;">
		            <li data-options="state:'closed'">
		                <span>회원 관리</span>
		                <ul>
		                    <li>
		                        <a href="javascript:listPage()">회원 목록</a>
		                    </li>
		                    <li>
		                    	<a href="javascript:insertPage()">회원 등록</a>
		                    </li>
		                    <li>
		                    	<a href="javascript:deletePage()">회원 삭제</a>
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
				<!-- ####################### 메뉴 영역 끝 ####################### -->
<%
	}
%>
		</div>
		<!-- ####################### SIDE 영역 끝 ####################### -->

		<!-- ####################### MAIN 영역 시작 ####################### -->
        <div data-options="region:'center',title:'TerrGYM System',iconCls:'icon-ok'">

        	<!-- 회원 목록 시작-->
        	<div id="d_listPage">
	        	<div style="margin: 5px 0;"></div>
	        	Home > 회원관리 > 회원목록
	        	<hr>
	        	<div style="margin: 20px 0;" ></div>

	        	<div style="margin: 5px 0;" >
	        		<!-- 조건 검색 화면 시작 -->
		        	<select id="mem_type" name="mem_type">
		        		<option>이름</option>
		        		<option>아이디</option>
		        	</select>
	 	        	<input id="mem_value" name="mem_value" class="easyui-textbox" style="width:200px">
		        	<!-- 조건 검색 화면 끝 -->
	        	
	        		<!-- 조회|입력|수정|삭제 버튼 시작 -->
	        		<a id="btn" href="javascript:memberList()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">조회</a>
	        		<a id="btn" href="javascript:$('#dlg').dialog('open')" class="easyui-linkbutton" data-options="iconCls:'icon-add'">입력</a>
	        		<a id="btn" href="javascript:memberUpdate()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">수정</a>
	        		<a id="btn" href="javascript:memberDelete()" class="easyui-linkbutton" data-options="iconCls:'icon-cut'">삭제</a>
	        		<!-- 조회|입력|수정|삭제 버튼 끝 -->
	        	</div>

	        	<!-- 회원 목록 출력 시작 -->
	        	<table id="dg_member" class="easyui-datagrid" style="width:90%;height:250px"
        				data-options="fitColumns:true,singleSelect:true">
				    <thead>
				        <tr>
				            <th data-options="field:'ID',width:50,align:'center'">아이디</th>
				            <th data-options="field:'NAME',width:50,align:'center'">이름</th>
				            <th data-options="field:'ZIPCODE',width:100,align:'center'">주소</th>
				            <th data-options="field:'BUTTON',width:50,align:'center'">버튼</th>
				        </tr>
				    </thead>
				</table>
	        	<!-- 회원 목록 출력 끝 -->
        	</div>
        	<!-- 회원 목록 끝 -->
        
        	<!-- 회원 등록 시작-->
        	<div id="d_insertPage">
	        	<div style="margin: 5px 0;"></div>
	        	Home > 회원관리 > 회원등록
	        	<hr>
	        	<div style="margin: 20px 0;"></div>
	        	<div>회원 등록 화면</div>
        	</div>
        	<!-- 회원 등록 끝-->
        	
        	<!-- 회원 삭제 시작-->
        	<div id="d_deletePage">
	        	<div style="margin: 5px 0;"></div>
	        	Home > 회원관리 > 회원삭제
	        	<hr>
	        	<div style="margin: 20px 0;"></div>
	        	<div>회원 삭제 화면</div>
        	</div>
        	<!-- 회원 삭제 끝-->
        	
        
	        <!-- 쪽지 관리(받은 쪽지함,보낸 쪽지함)-->	
		    <div id="dlg" class="easyui-dialog" title="쪽지 보내기" style="width:400px;height:200px;padding:10px"
		    	data-options="
		            	modal:true,
		            	closed:true,
		                iconCls: 'icon-save',
		                buttons: [{
		                    text:'입력',
		                    iconCls:'icon-ok',
		                    handler:function(){
		                        memberInsert();
		                    }
		                },{
		                    text:'취소',
		                    handler:function(){
		                        $('#dlg').dialog('close')
		                    }
		                }]">
		        쪽지 보내기
		    </div>

        </div>
		<!-- ####################### MAIN 영역 끝 ####################### -->
	</div>
</body>
</html>