<%@ page contentType="text/html; charset=Windows-31J"%>
<%@ page import="modelPack.BbsEntity"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>

<html>
<head>
<META charset="Windows-31J">
<meta name="viewport" content="width=device-width, initial-scale=1">
<LINK REL="SHORTCUT ICON" HREF="https://www.google.co.jp/imgres?imgurl=https%3A%2F%2Fsouthernafrican.news%2Fwp-content%2Fuploads%2F2016%2F09%2Fbitcoin-logo-3d.jpg&imgrefurl=https%3A%2F%2Fsouthernafrican.news%2F2016%2F09%2F02%2Fhow-can-africa-benefit-from-bitcoin%2F&docid=vQ1EyZVIk5b-GM&tbnid=3wOLFoZk5eQ2lM%3A&vet=10ahUKEwjK79b-jMXXAhUJKZQKHWDeB9MQMwg3KBEwEQ..i&w=1232&h=1232&bih=1020&biw=1422&q=bitcoin&ved=0ahUKEwjK79b-jMXXAhUJKZQKHWDeB9MQMwg3KBEwEQ&iact=mrc&uact=8">
<LINK REL="stylesheet" TYPE="text/css" HREF="./style.css">
<title>BBS_system</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<!--[if lt IE 9]>

			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->



</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

	<%
  		if (request.getAttribute("thread") == null) {

			response.sendRedirect("/bbs_system/control");
			return;
		}
	%>





	<div class="jumbotron">


		<a  href="/bbs_system/control" class="title"><h2>BBS_system</h2></a>

	</div>
	<% if (request.getParameter("value") == null) {

%>
	<!-- �V�K�X���b�h�������ݗ� -->
	<div class="container">
		<form action="control" method="post">
			<label>�V�K�X���b�h�쐬</label>
			<div class="form-group">
				<label>���e�Җ�</label> <input type="text" name="speaker" value="����������"
					class=�hform-group�h />
			</div>
			<div class="form-group">
				<label>���X���e </label>
				<textarea name="content" rows="1" cols="100">�R�����g</textarea>
			</div>
			<input type="hidden" name="thread_id2" value="0"> <input
				type="hidden" name="newThread"> <input type="submit"
				class="btn btn-default" value="���M" />
		</form>
	</div>

	<!-- �X�V�{�^�� -->
	<form action="control" method="post">
		<div class="form-group">
			�����X���b�h��I������<input type="submit" class="btn btn-default" value="�X�V" />
		</div>
	</form>
	<div class="pagetop">
	<div class="left">
	<span><a href ="/bbs_system/control?thread_id3=0">�ŐV��20���\��</a></span>
	</div>
	<%
	}


	%>
	<form action="control" method="post">



		<%
			if (request.getAttribute("message") == null
					&& request.getAttribute("value") == null) {

		%>
		<%
			@SuppressWarnings("unchecked")

				ArrayList<BbsEntity> list = (ArrayList<BbsEntity>) request
						.getAttribute("thread");
		%>
				<%

			//�y�[�W�l�[�V�����̍ő�l�̐ݒ�
				int sizeA = list.size();
				int sizeB;
				if (sizeA % 20 == 0) {
					sizeB = sizeA / 20;
				} else {
					sizeB = sizeA / 20 + 1;
				}
				int j = 20;

				int thread_id3 = 0;
				if(request.getParameter("thread_id3") != null){
				thread_id3 = Integer.parseInt(request.getParameter("thread_id3"));
				}
				//�i�ރ{�^���߂�{�^���̍ő�l
				int next = 0;
				if ((thread_id3 + 20) < list.size()) {
					next = thread_id3 + 20;
				} else {
					next = thread_id3;
				}
				int back = 0;
				if ((thread_id3 - 20) >= 0) {
					back = thread_id3 - 20;
				} else {
					back = thread_id3;
				}
		%>
		<div class="page">
				<nav>

			<ul class="pagination">
				<%if(thread_id3 ==0){ %>
				<li><a> <span aria-hidden="true">��</span>
				</a></li>
				<%}else{ %>				<li><a
					href="/bbs_system/control?thread_id3=<%=back%>"
					aria-label="�O�̃y�[�W��"> <span aria-hidden="true">��</span>
				</a></li>
				<%} %>
				<%
					//�y�[�W�l�[�V�����̎���
						for (int i = 0; i < sizeB; i++) {
							if ( thread_id3 == i * j) {
				%>
				<!-- �I������Ă���y�[�W���g�p�ł��Ȃ��悤�ɂ��� -->
				<li class="active"><a>
						<%=i + 1%></a></li>
				<%
					} else {
				%>
				<li><a
					href="/bbs_system/control?thread_id3=<%=i * j%>">
						<%=i + 1%></a></li>

				<%
					}
						}
				%>
				<%if(thread_id3>=(sizeB-1)*20 ){ %>
				<li><a> <span aria-hidden="true">��</span>
				</a></li>
				<%}else{ %>
									<li><a
					href="/bbs_system/control?thread_id3=<%=next%>"
					aria-label="���̃y�[�W��"> <span aria-hidden="true">��</span>
				</a></li>
				<%} %>
			</ul>
		</nav>

	</div>
	</div>
		<!-- ������� �X���b�h�ꗗ -->
		<table border="1" class="table table-striped">
			<tr>
				<th>No</th>
				<th>�X���b�h�ꗗ</th>
				<th>���X��</th>
			</tr>
			<%
			try {
					for (int i = thread_id3; i < thread_id3 + 20; i++) {
		%>

		<%
			BbsEntity be = list.get(i);
		%>
			<tr>
				<td><%=be.getThread_id()%></td>
				<td class="pageslide"><a href="/bbs_system/control?value=0&thread_id=<%=be.getThread_id()%>"><%=be.getContent().replaceAll("<", "&lt;")%></a></td>
				<td><%=be.getResNumber()%></td>
			</tr>
			<%
					}
					}catch (IndexOutOfBoundsException e) {

					}
			%>

		</table>
	</form>

	<form>
		<p>
			<input type="hidden" name="value" value="0"> <input
				type="hidden" name="all_thread" value="0"> <input
				type="submit" value="�S���\��" class="btn btn-Successactive">
		</p>
	</form>
	<%
		}
	%>




	<!-- ���������ʂ̕ҏW -->


	<%
		if (request.getAttribute("thread") != null
				&& request.getAttribute("value") != null) {
			int value = 0;

	%>

	<%-- ��SuppressWarnings��ð��݂�t����������ΏۊO�Ƃ��� --%>
	<%
		@SuppressWarnings("unchecked")
			ArrayList<BbsEntity> list2 = (ArrayList<BbsEntity>) request
					.getAttribute("thread");

			BbsEntity b = list2.get(list2.size()-1
					);


			value = (Integer) request.getAttribute("value");

			/* �y�[�W�߂�A�i�ރ{�^���̍ő�l�̒�` */
			int next = 0;
			if ((value + 20) < list2.size()) {
				next = value + 20;
			} else {
				next = value;
			}
			int back = 0;
			if ((value - 20) >= 0) {
				back = value - 20;
			} else {
				back = value;
			}
	%>
	<%if (request.getParameter("all_thread")==null){%>
	<div>
		<h2><%=b.getContent()%></h2>
		<span>���e�Җ�:<%=b.getContent()%></span><span>���e����:<%=b.getYmdhms()%></span>
	</div>



	<div class="container">
		<form action="control" method="post">
			<label>���̃X���b�h�ɓ��e����</label>
			<div class="form-group">
				<label>���e�Җ�</label> <input type="text" name="speaker" value="����������"
					class=�hform-group�h />
			</div>

			<div class="form-group">
				<label>���X���e </label>
				<textarea name="content" rows="1" cols="100"></textarea>
			</div>
			<input type="hidden" name="thread_id2" value="<%=b.getThread_id()%>">
			<input type="submit" class="btn btn-default" value="���M" />

		</form>
	</div>

	<form action="control" method="post">
		<input type="hidden" name="thread_id" value="<%=b.getThread_id()%>">
		<input type="hidden" name="value" value="0"> ���e�ꗗ<input
			type="submit" class="btn btn-default" value="�X�V" />
	</form>
	<%} %>

	<div>

		<%
			//�y�[�W�l�[�V�����̍ő�l�̐ݒ�
				int size = list2.size();
				int size1;
				if (size % 20 == 0) {
					size1 = size / 20;
				} else {
					size1 = size / 20 + 1;
				}
				int j = 20;
		%>

		<%
			String thread;
				int thread_id = 0;
				//�S���\���Ɣԍ��w��̕\���̕���
				if (request.getAttribute("thread_id") != null) {
					thread_id = (Integer) request.getAttribute("thread_id");
					//�X���b�h�ԍ����I������Ă���ꍇ
					thread = "thread_id";
				} else { //�S���̏ꍇ
					thread = "all_thread";
				}
		%>
		<a href ="/bbs_system/control?value=0&<%=thread%>=<%=thread_id%>">�ŐV��20���\��</a>
		<span>�y�[�W�w��\��</span>
		<nav>

			<ul class="pagination">

				<li><a
					href="/bbs_system/control?value=<%=back%>&<%=thread%>=<%=thread_id%>"
					aria-label="�O�̃y�[�W��"> <span aria-hidden="true">��</span>
				</a></li>
				<%
					//�y�[�W�l�[�V�����̎���
						for (int i = 0; i < size1; i++) {
							if (value == i * j) {
				%>
				<!-- �I������Ă���y�[�W���g�p�ł��Ȃ��悤�ɂ��� -->
				<li class="active"><a
					href="/bbs_system/control?value=<%=i * j%>
		&<%=thread%>=<%=thread_id%>">
						<%=i + 1%></a></li>
				<%
					} else {
				%>
				<li><a
					href="/bbs_system/control?value=<%=i * j%>
		&<%=thread%>=<%=thread_id%>">
						<%=i + 1%></a></li>

				<%
					}
						}
				%>
				<li><a
					href="/bbs_system/control?value=<%=next%>&<%=thread%>=<%=thread_id%>"
					aria-label="���̃y�[�W��"> <span aria-hidden="true">��</span>
				</a></li>
			</ul>
		</nav>
	</div>

	<!-- �ꗗ�\�� -->
	<table border="1" class="table table-striped">
		<tr>
			<th>Speaker</th>
			<th>Content</th>
			<th>ymdhms</th>
		</tr>
		<%
			try {
					for (int i = value; i < value + 20; i++) {
		%>

		<%
			BbsEntity a = list2.get(i);
		%>

		<tr>
			<td><%=a.getSpeaker().replaceAll("<", "&lt;")%></td>
			<td><%=a.getContent().replaceAll("<", "&lt;")%></td>
			<td><%=a.getYmdhms()%></td>
		</tr>
		<%
			}
				} catch (IndexOutOfBoundsException e) {

				}
		%>

	</table>





	<a href="/bbs_system/search.jsp"> <input type="submit" value="�߂�"
		class="btn btn-Success

       active"></a>



	<%
		}
	%>
		<!-- ���װү���ޓ��̕ҏW -->
		<%
		if (request.getAttribute("message") != null) {
	%>
	<p class="error"><%=(String) request.getAttribute("message")%></p>
	<%
		}
	%>
		<div class="btn-group" role="group">
		<a href="#" class="btn btn-default" role="button">�y�[�W�㕔</a>
	</div>



</body>
</html>




