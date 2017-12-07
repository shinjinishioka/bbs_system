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
				// �ް���������Τ���̎|��ү���ނ�message�Ƃ������O��t���ēo�^
				request.setAttribute("message", "�Y���͂���܂���");
			}

		} catch (NumberFormatException e) {
			request.setAttribute("message", "���l����͂��ĉ�����");
		} catch (SQLException e) {
			request.setAttribute("message", "JDBC�̃G���[�ł�");
		} finally {
			if (daoTest != null) {
				daoTest.close();
			}
		}
	}
}
