package modelPack;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class FillIn {
	public void execute(HttpServletRequest request) throws Exception {

		DaoTest daoTest = null;

		try {
			daoTest = new DaoTest();
			int thread_id = Integer
					.parseInt(request.getParameter("thread_id2"));
			String speaker = request.getParameter("speaker");
			String content = request.getParameter("content");
			String remoteAddr = request.getRemoteAddr();

			daoTest.fillIn(thread_id, speaker, content, request);
			// TimeUnit.SECONDS.sleep(60);
		} catch (NumberFormatException e) {
			request.setAttribute("message", "”’l‚ğ“ü—Í‚µ‚Ä‰º‚³‚¢");
		} catch (SQLException e) {
			request.setAttribute("message", "JDBC‚ÌƒGƒ‰[‚Å‚·");
		} finally {
			if (daoTest != null) {
				daoTest.close();
			}
		}
	}
}
