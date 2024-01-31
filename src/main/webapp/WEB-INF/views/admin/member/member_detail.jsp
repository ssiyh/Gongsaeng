<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <!--  -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/resources/admin_assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/admin_assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   공생|관리자페이지 회원
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath }/resources/admin_assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath }/resources/admin_assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath }/resources/admin_assets/demo/demo.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath }/resources/admin_assets/css/admin.css" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
</head>

<body class="">
  <div class="wrapper ">
    <jsp:include page="../inc/admin_sidebar.jsp"/>
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand title" href="#pablo">회원관리</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <%-- search,홈페이지이동,채팅 --%>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="now-ui-icons ui-1_zoom-bold"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="now-ui-icons ui-1_calendar-60"></i>
                  <p>
                    <span class="d-lg-none d-md-block">달력</span>
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#pablo">
                  <i class="now-ui-icons ui-2_chat-round"></i>
                  <p>
                    <span class="d-lg-none d-md-block">채팅</span>
                  </p>
                </a>
              </li>
              <%-- 공생 메인 홈페이지로 이동 --%>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/">
                  <i class="now-ui-icons shopping_shop"></i>
                  <p>
                    <span class="d-lg-none d-md-block">공식 홈</span>
                  </p>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <form>
	      <div class="content">
	        <div class="row">
	          <div class="col-md-12">
	            <div class="card">
	              <div class="card-header">
	                <h5 class="title">XXX님(반장) 상세 정보</h5>
	              </div>
	              <div class="card-body">
	           		 <div class="text_center">
		           		<img src="https://bootdey.com/img/Content/avatar/avatar7.png" class="img-circle img-thumbnail" alt="avatar">
						<input type="file" class="form-control profileImg" accept="image/*">
						<div class="profileImg" >
	    	       		 	<button type="button" class="btn">파일선택</button>
		           		 	<span>파일명</span>
						</div>
	           		 </div>
	              	 <br>
		             <table class="table table-bordered">
		             	<colgroup>
		             		<col width="25%" />
		             		<col width="25%" />
		             		<col width="25%" />
		             		<col width="25%" />
		             	</colgroup>
		             	<tr>
		             		<th>가입일자</th>
		             		<td>가입일자</td>
	<!-- 	             	---------탈퇴이면 탈퇴일자---------- -->
	<!-- 	             		<th>탈퇴일자</th> -->
	<!-- 	             		<td>탈퇴일자</td> -->
		             		<th>회원상태</th>
		             		<td>
		             			 <select name="class_state">
					              	<option value="0">회원상태</option>
					              	<option value="1">정상</option>
					              	<option value="2">휴먼</option>
					              	<option value="2">탈퇴</option>
			              		</select>
		             		</td>
		             	</tr>
		             	<tr>
		             	
		             	</tr>
	<!-- 	             	<tr> -->
	<!-- 	             		<th>이미지</th> -->
	<!-- 	             		<td> -->
	<!-- 	             		 여기 이미지옴<br> -->
	<!-- <!-- 	             		 	<input type="file"> -->
	<!-- 	             		 	<button type="button" class="btn">파일선택</button> -->
	<!-- 	             		 	<span>파일명</span> -->
	<!-- 	             		</td> -->
	<!-- 	             	</tr> -->
		             	<tr>
		             		<th>이름</th>
		             		<td>이름</td>
		             		<th>닉네임</th>
		             		<td>닉네임</td>
		             	</tr>
		             	<tr>
		             		<th>아이디</th>
		             		<td>아이디</td>
		             		<th>회원분류</th>
		             		<td>
								<select>
									<option>일반</option>
									<option>사업자(반장)</option>
								</select>
							</td>
		             	</tr>
		             	<!-- 반장회원일 경우 -->
		             	<!-- ----------- -->
		             	<tr>
		             		<th>생년월일</th>
		             		<td>생년월일</td>
		             		<th>전화번호</th>
		             		<td>
								<input type="text"><!--  - <input type="text"> - <input type="text">  -->
								<div class="gaid">(-제외하고 입력)</div>
							</td>
		             	</tr>
		             	<tr>
		             		<th>계좌번호</th>
		             		<td>
		             			<span>은행</span>
		             			<span>계좌번호</span>
	<!-- 	             			<span> -->
	<!-- 								<select> -->
	<!-- 									<option>비인증</option> -->
	<!-- 									<option>인증</option> -->
	<!-- 								</select> -->
	<!-- 							</span> -->
		             		</td>
		             		<th>알림수신상태</th>
		             		<td>알림수신상태</td>
		             	</tr>
		             	<tr>
		             		<th>이메일</th>
		             		<td colspan="3">
		             			<input type="text"> @ 
		             			<input type="text">
								<select>
									<option>선택하세요</option>
									<option>gmail.com</option>
									<option>naver.com</option>
									<option>yahoo.com</option>
									<option>daum.net</option>
									<option>직접입력</option>
								</select>
		             			<span>[비인증]</span>
		             		</td>
		             	</tr>
		             	
		             	<tr>
		             		<th rowspan="2">
		             			클래스 예약 내역<br>
		             			<a class="more_info" href="${pageContext.request.contextPath }/admin/member/reservation/class">더보기</a>
		             		</th>
							<th class="detail_table">총</th>
							<th class="detail_table">원데이</th>
							<th class="detail_table">정기</th>
						</tr>             	
		             	<tr>
		             		<td>
		             			이달 0 건 / 누적 0 건
		             		</td>
		             		<td>
		             			이달 0 건 / 누적 0 건
		             		</td>
		             		<td>
		             			이달 0 건 / 누적 0 건
		             		</td>
						</tr>    
						    
						<tr>
		             		<th rowspan="2">
		             			남긴 리뷰 수<br>
		             			<!-- 리뷰리스트랑 같이씀 member_id들고가기 -->
		             			<a class="more_info" href="${pageContext.request.contextPath }/admin/review">더보기</a>
		             		</th>
							<th class="detail_table">이달</th>
							<th class="detail_table">누적</th>
							<th class="detail_table">피신고건 수</th>
						</tr>             	
		             	<tr>
		             		<td>
		             			0 건
		             		</td>
		             		<td>
		             			0 건
		             		</td>
		             		<td>
		             			0 건
		             		</td>
						</tr>    
						
						
		             </table>	 
		             <%-- 반장회원이면 --%>
		             <br>
		             <h5>반장 정보</h5>
		             <table class="table table-bordered">	 
		             	<colgroup>
		             		<col width="25%" />
		             		<col width="75%" />
		             	</colgroup>	
		             	<tr>
		             		<th>
		             			반장 소개
		             		</th>
		             		<td>소개내용</td>
		             	</tr>
		             	<tr>
		             		<th>
		             			사업체
		             			<!-- 사업체 상세보기로 -->
		             			<a class="more_info" href="${pageContext.request.contextPath }/admin/company/detail">더보기</a>
		             		</th>
		             		<td>사업체명</td>
		             	</tr>
		             	<tr>
		             		<th>
		             			등록클래스
		             			<!-- 특정 사업체의 등록 클래스 목록 -->
		             			<a class="more_info" href="${pageContext.request.contextPath }/admin/company/class">더보기</a>
		             		</th>
		             		<td>총 0 건</td>
		             	</tr>
		             </table>	 	
	              </div>
	            </div>
	          </div>
	        </div>
	        <div class="row">
	        	<div class="col-md-12 btn_bottom">
		        	<button type="button" class="btn btn_default" onclick="location.replace('${pageContext.request.contextPath }/admin/member')">목록</button>&nbsp;&nbsp;
		        	<button type="submit" class="btn btn_default">변경저장</button>
	        	</div>
	        </div>
	      </div>
      </form>
      <footer class="footer">
       <jsp:include page="../inc/admin_bottom.jsp"/>
     </footer>
    </div>
  </div>
  
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath }/resources/admin_assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin_assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin_assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin_assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="${pageContext.request.contextPath }/resources/admin_assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath }/resources/admin_assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath }/resources/admin_assets/js/now-ui-dashboard.min.js?v=1.5.0" type="text/javascript"></script><!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="${pageContext.request.contextPath }/resources/admin_assets/demo/demo.js"></script>
	<script>
        $(document).ready(function() {
            // 필터 기능 구현
            $('#leaderFilter, #withdrawalFilter').change(function() {
                var leaderFilter = $('#leaderFilter').val();
                var withdrawalFilter = $('#withdrawalFilter').val();
                
                // 로직에 따라 회원 데이터 필터링 및 표시
            });
        });
    </script>

</body>

</html>