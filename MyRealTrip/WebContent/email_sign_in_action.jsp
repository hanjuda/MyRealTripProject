<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int mem_num = 0;
    	try{
    		mem_num = (Integer)(request.getAttribute("mem_num"));
    		//mem_num = mem_num
    		System.out.println(mem_num+" try문 후!!");
    	}catch(Exception e){
    		e.printStackTrace();
    		mem_num=0;
    	}
    	session.setAttribute("mem_num", mem_num);
 
    %>
    
    <script>
    	location.href = 'index.jsp';
    </script>
