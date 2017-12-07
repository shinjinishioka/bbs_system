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
	<!-- 新規スレッド書き込み欄 -->
	<div class="container">
		<form action="control" method="post">
			<label>新規スレッド作成</label>
			<div class="form-group">
				<label>投稿者名</label> <input type="text" name="speaker" value="名無しさん"
					class=”form-group” />
			</div>
			<div class="form-group">
				<label>レス内容 </label>
				<textarea name="content" rows="1" cols="100">コメント</textarea>
			</div>
			<input type="hidden" name="thread_id2" value="0"> <input
				type="hidden" name="newThread"> <input type="submit"
				class="btn btn-default" value="送信" />
		</form>
	</div>

	<!-- 更新ボタン -->
	<form action="control" method="post">
		<div class="form-group">
			既存スレッドを選択する<input type="submit" class="btn btn-default" value="更新" />
		</div>
	</form>
	<div class="pagetop">
	<div class="left">
	<span><a href ="/bbs_system/control?thread_id3=0">最新の20件表示</a></span>
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

			//ページネーションの最大値の設定
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
				//進むボタン戻るボタンの最大値
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
				<li><a> <span aria-hidden="true">≪</span>
				</a></li>
				<%}else{ %>				<li><a
					href="/bbs_system/control?thread_id3=<%=back%>"
					aria-label="前のページへ"> <span aria-hidden="true">≪</span>
				</a></li>
				<%} %>
				<%
					//ページネーションの実装
						for (int i = 0; i < sizeB; i++) {
							if ( thread_id3 == i * j) {
				%>
				<!-- 選択されているページを使用できないようにする -->
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
				<li><a> <span aria-hidden="true">≫</span>
				</a></li>
				<%}else{ %>
									<li><a
					href="/bbs_system/control?thread_id3=<%=next%>"
					aria-label="次のページへ"> <span aria-hidden="true">≫</span>
				</a></li>
				<%} %>
			</ul>
		</nav>

	</div>
	</div>
		<!-- 初期画面 スレッド一覧 -->
		<table border="1" class="table table-striped">
			<tr>
				<th>No</th>
				<th>スレッド一覧</th>
				<th>レス数</th>
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
				type="submit" value="全件表示" class="btn btn-Successactive">
		</p>
	</form>
	<%
		}
	%>




	<!-- ■検索結果の編集 -->


	<%
		if (request.getAttribute("thread") != null
				&& request.getAttribute("value") != null) {
			int value = 0;

	%>

	<%-- ↓SuppressWarningsｱﾉﾃｰｼｮﾝを付加し､ﾁｪｯｸ対象外とする --%>
	<%
		@SuppressWarnings("unchecked")
			ArrayList<BbsEntity> list2 = (ArrayList<BbsEntity>) request
					.getAttribute("thread");

			BbsEntity b = list2.get(list2.size()-1
					);


			value = (Integer) request.getAttribute("value");

			/* ページ戻る、進むボタンの最大値の定義 */
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
		<span>投稿者名:<%=b.getContent()%></span><span>投稿日時:<%=b.getYmdhms()%></span>
	</div>



	<div class="container">
		<form action="control" method="post">
			<label>このスレッドに投稿する</label>
			<div class="form-group">
				<label>投稿者名</label> <input type="text" name="speaker" value="名無しさん"
					class=”form-group” />
			</div>

			<div class="form-group">
				<label>レス内容 </label>
				<textarea name="content" rows="1" cols="100"></textarea>
			</div>
			<input type="hidden" name="thread_id2" value="<%=b.getThread_id()%>">
			<input type="submit" class="btn btn-default" value="送信" />

		</form>
	</div>

	<form action="control" method="post">
		<input type="hidden" name="thread_id" value="<%=b.getThread_id()%>">
		<input type="hidden" name="value" value="0"> 投稿一覧<input
			type="submit" class="btn btn-default" value="更新" />
	</form>
	<%} %>

	<div>

		<%
			//ページネーションの最大値の設定
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
				//全件表示と番号指定の表示の分岐
				if (request.getAttribute("thread_id") != null) {
					thread_id = (Integer) request.getAttribute("thread_id");
					//スレッド番号が選択されている場合
					thread = "thread_id";
				} else { //全件の場合
					thread = "all_thread";
				}
		%>
		<a href ="/bbs_system/control?value=0&<%=thread%>=<%=thread_id%>">最新の20件表示</a>
		<span>ページ指定表示</span>
		<nav>

			<ul class="pagination">

				<li><a
					href="/bbs_system/control?value=<%=back%>&<%=thread%>=<%=thread_id%>"
					aria-label="前のページへ"> <span aria-hidden="true">≪</span>
				</a></li>
				<%
					//ページネーションの実装
						for (int i = 0; i < size1; i++) {
							if (value == i * j) {
				%>
				<!-- 選択されているページを使用できないようにする -->
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
					aria-label="次のページへ"> <span aria-hidden="true">≫</span>
				</a></li>
			</ul>
		</nav>
	</div>

	<!-- 一覧表示 -->
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





	<a href="/bbs_system/search.jsp"> <input type="submit" value="戻る"
		class="btn btn-Success

       active"></a>



	<%
		}
	%>
		<!-- ■ｴﾗｰﾒｯｾｰｼﾞ等の編集 -->
		<%
		if (request.getAttribute("message") != null) {
	%>
	<p class="error"><%=(String) request.getAttribute("message")%></p>
	<%
		}
	%>
		<div class="btn-group" role="group">
		<a href="#" class="btn btn-default" role="button">ページ上部</a>
	</div>



</body>
</html>




