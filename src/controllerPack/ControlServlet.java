package controllerPack;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelPack.FillIn;
import modelPack.FirstPage;
import modelPack.SelectedSearch;
import modelPack.ThreadSearch;

public class ControlServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 遷移先URL
		String forward = "/search.jsp";

		req.setCharacterEncoding("Windows-31J");
		try {
			if (req.getParameter("thread_id") != null) {
				SelectedSearch ss = new SelectedSearch();
				ss.execute(req);

			} else if (req.getParameter("all_thread") != null) {
				ThreadSearch thread = new ThreadSearch();
				thread.execute(req);
			} else if (req.getParameter("thread_id2") != null) {
				FillIn fi = new FillIn();
				fi.execute(req);

				if (!(req.getParameter("thread_id2").equals("0"))) {
					forward = "/control?value=0&thread_id="
							+ (req.getParameter("thread_id2"));
				}
			} else if (req.getParameter("thread_id3") != null) {
				FirstPage fp = new FirstPage();
				fp.execute(req);
			} else {
				FirstPage fp = new FirstPage();
				fp.execute(req);
			}

		} catch (Exception e) {
			req.setAttribute("message", "検索条件を入力して下さい");
		}

		// ■出力(jspに処理を渡す)
		ServletContext context = getServletContext();
		// ｻｰﾌﾞﾚｯﾄの環境をｵﾌﾞｼﾞｪｸﾄとして取得して…
		RequestDispatcher rd = context.getRequestDispatcher(forward);
		// 処理の遷移先を決めて…
		rd.forward(req, resp);
		// 遷移先にﾘｸｴｽﾄｵﾌﾞｼﾞｪｸﾄと､ﾚｽﾎﾟﾝｽｵﾌﾞｼﾞｪｸﾄを渡して｢進む｣｡
	}
}