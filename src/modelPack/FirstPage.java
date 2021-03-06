package modelPack;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class FirstPage {
	public void execute(HttpServletRequest request) throws Exception {

		DaoTest daoTest = null;

		try {
			daoTest = new DaoTest();

			ArrayList<BbsEntity> list = daoTest.getFirstPage();
			if (list != null) {

				request.setAttribute("thread", list);

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
