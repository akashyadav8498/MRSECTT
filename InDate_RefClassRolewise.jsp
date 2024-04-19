
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%><html>
<%@page import="in.org.cris.mrsectt.Beans.MstLogin"%>
<%@page import="in.org.cris.mrsectt.dao.CommonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.org.cris.mrsectt.Beans.CommonBean"%>
<%@page import="in.org.cris.mrsectt.util.StringFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<head>
<script type="text/javascript" src="script/scripts.js"></script>
<script type="text/javascript" src="script/validateinput.js"></script>
<script type="text/javascript" src="theme/jquery/jquery-1.3.2.js"></script>
<LINK href="theme/jquery/jquery.autocomplete.css" rel="stylesheet" type="text/css">
<SCRIPT type="text/javascript" src="theme/jquery/jquery.autocomplete.min.js"></SCRIPT>
<% String theme = session.getAttribute("theme")!=null? session.getAttribute("theme").toString(): "";%> <!-- <%= "-->" %> <link href="${pageContext.request.contextPath}/theme/Master<%=theme%>.css" type="text/css" rel="stylesheet"/> <%= "<!--" %>-->   <%= "<!--" %> <link href="${pageContext.request.contextPath}/theme/Master.css" type="text/css" rel="stylesheet"/>  <%= "-->" %>  <!-- <link type="text/css" href="${pageContext.request.contextPath}/theme/Master.css" rel="stylesheet" />  -->
<%
	CommonBean bean;
    MstLogin sessionBean = (MstLogin)session.getAttribute("MstLogin");
   	ArrayList<ArrayList<String>> arrCB = request.getAttribute("arrCB") != null ? (ArrayList<ArrayList<String>>) request.getAttribute("arrCB"): null;
   	String FDATE = StringFormat.nullString((String)request.getAttribute("datefrom"));
   	String TDATE = StringFormat.nullString((String)request.getAttribute("dateto"));
   	String CLASS = StringFormat.nullString((String)request.getAttribute("refclass"));
   	String serverDate = CommonDAO.getSysDate("dd/MM/yyyy");
	String serverTime = CommonDAO.getSysDate("HH:mm:ss");
%>
</head>
<body >
<form name="frm" id="frm" action="" method="post">
<table width="100%" border="0" cellspacing="0" align="center">
	<tbody>
		<tr><td align="center"><b><font size="3"><b><%= sessionBean.getTENUREOFFICENAME()%></b></font>
			<br><font size="1"><%= sessionBean.getTENUREOFFICEADDRESS()%></font></td>
		</tr>
		<tr>
		<td align="right"><font size="2">
		</font></td>
		</tr>
		<tr>
			<td align="center"><img width="20" height="20" src="images/printer.png" onclick="window.print()" title="Print"></img></td>
		</tr>
	</tbody>
</table>
			<TABLE cellspacing='0' cellpadding='2' height="100%" align="center">
				<TR>
				  <TD valign="top" height="520" width="650" align="center">
					<TABLE width="100%" border="0">
						<TR>
							<TD align="center" valign="middle" width="96%">
							
							<div id="d2">
							<table width="100%" id="data">
								<tbody>
									<tr>
									<th align="center" height="18" colspan="4">
									<input type="hidden" name="reportNumber" size="15"><FONT size="3">Statistical-Forward To (Incoming Dt.)</font></th>
									</tr>
						<tr>
							<th align="left" height="18" colspan="2" style="font-size: 11px;" width="510">Position of Ref.(s) received during  <%=FDATE %>-  <%=TDATE %><br>Ref. Class : <%=CLASS %>
							</th>
							<th align="right" height="18" colspan="2" style="font-size: 11px;" width="126"><%=serverDate %><br><%=serverTime %></th>
						</tr>
					</tbody>
							</table>
							</div>
							</TD>
						</TR>
						<tr>
							<td align="center">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" >
								<TR><TD align="center">
								<table width="100%" cellspacing="0" cellpadding="0">
							<thead style="display: table-header-group;">
								<TR>
								<TD align="center" valign="top" style="border-bottom: dotted; border-top: dotted; border-width: 1px; border-color: gray; font-size: 11"><b>S.No</b>.</TD>
								<td align="center" valign="top" style="border-bottom: dotted; border-top: dotted; border-width: 1px; border-color: gray; font-size: 11"><b>Forward To</b></td>
								<TD align="center" valign="top" style="border-bottom: dotted; border-top: dotted; border-width: 1px; border-color: gray; font-size: 11"><b>Total<br>Case(s)</b></TD>
								<TD align="center" valign="top" style="border-bottom: dotted; border-top: dotted; border-width: 1px; border-color: gray; font-size: 11"><b>Cleared<br>
								</b></TD>
								<TD align="center" valign="top" style="border-bottom: dotted; border-top: dotted; border-width: 1px; border-color: gray; font-size: 11"><b>Under Process<br>
								in Min. Sectt.</b></TD>
								<TD align="center" valign="top" style="border-bottom: dotted; border-top: dotted; border-width: 1px; border-color: gray; font-size: 11"><b>Additional Info.<br>
								Required</b></TD>
								<TD align="center" valign="top" style="border-bottom: dotted; border-top: dotted; border-width: 1px; border-color: gray; font-size: 11"><b>Pending with<br>
								Dte.</b></TD>
							</TR>
							</thead>
<%
				for(int i=0;i<arrCB.get(0).size();i++){
				int clearCase = Integer.parseInt(arrCB.get(5).get(i))-(Integer.parseInt(arrCB.get(2).get(i)) + Integer.parseInt(arrCB.get(4).get(i)) + Integer.parseInt(arrCB.get(3).get(i)));
%>
								<tr style="border-style: dotted; border-width: 4px">
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray; font-size: 11"><%= i+1 %></TD>								
								<TD align="left" style="border-bottom: dotted; border-width: 1px; border-color: gray; font-size: 11"><%= arrCB.get(1).get(i) %></TD>
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray; font-size: 11"><%= (arrCB.get(5).get(i).equalsIgnoreCase("0")? "-":arrCB.get(5).get(i)) %></TD>
								<td align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray; font-size: 11"><%= (clearCase != 0? clearCase:"-") %></TD>
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray; font-size: 11"><%= (arrCB.get(3).get(i).equalsIgnoreCase("0")? "-":arrCB.get(3).get(i)) %></TD>
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray; font-size: 11"><%= (arrCB.get(4).get(i).equalsIgnoreCase("0")? "-":arrCB.get(4).get(i)) %></TD>
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray; font-size: 11"><%= (arrCB.get(2).get(i).equalsIgnoreCase("0")? "-":arrCB.get(2).get(i)) %></TD>
								</tr>
<%}%>																
<%
				int pendingTotal = 0;
				int addInfoTotal = 0;
				int underProTotal = 0;
				int totalTotal = 0;
				int clrdCaseTotal = 0;
				for(int i=0;i<arrCB.get(0).size();i++){
				pendingTotal = pendingTotal + Integer.parseInt(arrCB.get(2).get(i)) ;
				addInfoTotal = addInfoTotal + Integer.parseInt(arrCB.get(4).get(i)) ;
				underProTotal = underProTotal + Integer.parseInt(arrCB.get(3).get(i)) ;
				totalTotal = totalTotal + Integer.parseInt(arrCB.get(5).get(i)) ;
				clrdCaseTotal = clrdCaseTotal + (Integer.parseInt(arrCB.get(5).get(i))-(Integer.parseInt(arrCB.get(2).get(i)) + Integer.parseInt(arrCB.get(4).get(i)) + Integer.parseInt(arrCB.get(3).get(i))));
				}
%>
								<tr style="border-style: dotted; border-width: 4px">
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray;">&nbsp;</TD>								
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray;">Total</TD>
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray;"><%= totalTotal %></TD>
								<td align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray;"><%= clrdCaseTotal %></TD>
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray;"><%= underProTotal %></TD>
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray;"><%= addInfoTotal %></TD>
								<TD align="center" style="border-bottom: dotted; border-width: 1px; border-color: gray;"><%= pendingTotal %></TD>
								</tr>
						</TABLE>
								</TD></TR>
				</TABLE>
					</TABLE>
					</TD>
				</TR>
			</TABLE>
</form>
</body>
</html>