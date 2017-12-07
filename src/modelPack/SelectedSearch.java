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
				// �ް����Ԃ��Ă��Ă���Τsweets�Ƃ������O��t����ظ��ĕϐ��ɓo�^
				request.setAttribute("thread", list);
				int value = Integer.parseInt(request.getParameter("value"));

				request.setAttribute("value", value);
				request.setAttribute("thread_id", thread_id);

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
