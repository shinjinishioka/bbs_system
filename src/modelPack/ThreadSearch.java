package modelPack;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class ThreadSearch {
	public void execute(HttpServletRequest request) throws Exception {

		DaoTest daoTest = null;

		try {
			daoTest = new DaoTest();
			ArrayList<BbsEntity> list = daoTest.getThread();

			if (list != null) {
				// �ް����Ԃ��Ă��Ă���Τsweets�Ƃ������O��t����ظ��ĕϐ��ɓo�^
				request.setAttribute("thread", list);
				int value = Integer.parseInt(request.getParameter("value"));
				request.setAttribute("value", value);

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
