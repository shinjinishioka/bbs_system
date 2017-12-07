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
				// ÃŞ°À‚ª–³‚¯‚ê‚Î¤‚»‚Ì|‚ÌÒ¯¾°¼Ş‚ğmessage‚Æ‚¢‚¤–¼‘O‚ğ•t‚¯‚Ä“o˜^
				request.setAttribute("message", "ŠY“–‚Í‚ ‚è‚Ü‚¹‚ñ");
			}

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
