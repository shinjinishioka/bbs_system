package modelPack;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class SelectedSearch {
	public void execute(HttpServletRequest request) throws Exception {

		DaoTest daoTest = null;

		try {
			daoTest = new DaoTest();
			int thread_id = Integer.parseInt(request.getParameter("thread_id"));

			ArrayList<BbsEntity> list = daoTest.getSelectedThread(thread_id);

			if (list != null) {
				// ﾃﾞｰﾀが返ってきていれば､sweetsという名前を付けてﾘｸｴｽﾄ変数に登録
				request.setAttribute("thread", list);
				int value = Integer.parseInt(request.getParameter("value"));

				request.setAttribute("value", value);
				request.setAttribute("thread_id", thread_id);

			} else {
				// ﾃﾞｰﾀが無ければ､その旨のﾒｯｾｰｼﾞをmessageという名前を付けて登録
				request.setAttribute("message", "該当はありません");
			}

		} catch (NumberFormatException e) {
			request.setAttribute("message", "数値を入力して下さい");
		} catch (SQLException e) {
			request.setAttribute("message", "JDBCのエラーです");
		} finally {
			if (daoTest != null) {
				daoTest.close();
			}
		}
	}
}
