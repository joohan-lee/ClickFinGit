
<%@ page language ="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>



<% session.invalidate(); %>                         // 세션 정보 제거



<script>

alert("로그아웃 되었습니다.");
location.href="login.html";                                    // 로그아웃 페이지로 이동

</script>
