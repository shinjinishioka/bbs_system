package modelPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class DaoTest {

	private Connection connection;

	public DaoTest() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/bbs_db"
						+ "?user=Mulder&password=TrustNo2"
						+ "&useUnicode=true&characterEncoding=MS932");
	}

	public void close() {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BbsEntity> getThread() throws SQLException {

		ArrayList<BbsEntity> list = null;
		BbsEntity be = null;

		PreparedStatement pstatement = null;
		ResultSet rs = null;
		try {
			pstatement = connection
					.prepareStatement(("SELECT * FROM bbs_tbl  ORDER BY thread_id ASC,ymdhms "));

			rs = pstatement.executeQuery();
			list = new ArrayList<BbsEntity>();

			while (rs.next()) {
				be = new BbsEntity();
				be.setThread_id(rs.getInt("thread_id"));
				be.setSpeaker(rs.getString("speaker"));
				be.setContent(rs.getString("content"));
				be.setYmdhms(rs.getString("ymdhms"));
				list.add(be);
			}
			rs.close();
		} finally {
			pstatement.close();
		}
		return list;
	}

	public ArrayList<BbsEntity> getFirstPage() throws SQLException {

		ArrayList<BbsEntity> list = null;
		BbsEntity be = null;

		PreparedStatement pstatement = null;
		ResultSet rs = null;
		try {
			pstatement = connection
					.prepareStatement(("SELECT thread_id,content,first,(SELECT MAX(ymdhms) FROM bbs_tbl WHERE thread_id = tmp.thread_id) AS new FROM (SELECT thread_id,content,ymdhms AS first FROM bbs_tbl WHERE (thread_id,ymdhms) IN (SELECT thread_id,MIN(ymdhms) FROM bbs_tbl GROUP BY thread_id )) AS tmp order by new desc;"));

			rs = pstatement.executeQuery();
			list = new ArrayList<BbsEntity>();

			while (rs.next()) {
				be = new BbsEntity();
				be.setThread_id(rs.getInt("thread_id"));
				be.setContent(rs.getString("content"));
				be.setResNumber(getRes(rs.getInt("thread_id")));

				list.add(be);
			}
			rs.close();
		} finally {
			pstatement.close();
		}
		return list;
	}

	public int getRes(int thread_id) throws SQLException {

		int resNumber = 0;

		PreparedStatement pstatement = null;
		ResultSet rs = null;

		try {

			pstatement = connection
					.prepareStatement(("SELECT * FROM bbs_tbl where thread_id=?"));

			pstatement.setInt(1, thread_id);
			rs = pstatement.executeQuery();

			rs.last();
			resNumber = rs.getRow();

			rs.close();
		} finally {
			pstatement.close();
		}
		return resNumber;

	}

	public ArrayList<BbsEntity> getSelectedThread(int thread_id)
			throws SQLException {

		ArrayList<BbsEntity> list = null;
		BbsEntity be = null;

		PreparedStatement pstatement = null;
		ResultSet rs = null;

		try {

			pstatement = connection
					.prepareStatement(("SELECT * FROM bbs_tbl where thread_id=? ORDER BY ymdhms DESC"));

			pstatement.setInt(1, thread_id);
			rs = pstatement.executeQuery();
			list = new ArrayList<BbsEntity>();

			while (rs.next()) {
				be = new BbsEntity();
				be.setThread_id(rs.getInt("thread_id"));
				be.setSpeaker(rs.getString("speaker"));
				be.setContent(rs.getString("content"));
				be.setYmdhms(rs.getString("ymdhms"));
				list.add(be);
			}
			rs.close();
		} finally {
			pstatement.close();
		}
		return list;

	}

	public void fillIn(int thread_id, String speaker, String content,
			HttpServletRequest request) throws SQLException {

		PreparedStatement pstatement = null;

		if (request.getParameter("newThread") != null) {
			try {
				connection.setAutoCommit(false);
				pstatement = connection
						.prepareStatement("LOCK TABLES bbs_tbl write,bbs_tbl as max READ");
				pstatement.executeUpdate();

				pstatement = connection
						.prepareStatement(("insert into bbs_tbl (thread_id,speaker,content,ymdhms) value ((select max(thread_id)+1 from bbs_tbl as max),?,?,now());"));

				/*
				 * pstatement = connection .prepareStatement((
				 * "INSERT INTO bbs_tbl SELECT MAX(thread_id)+1 ,?, ?, now() from bbs_tbl for update;"
				 * ));
				 */

				pstatement.setString(1, speaker);
				pstatement.setString(2, content);

				pstatement.executeUpdate();

				pstatement.close();

				pstatement = connection.prepareStatement(("UNLOCK TABLES;"));
				pstatement.execute();

			} finally {

				pstatement.close();
			}

		} else {
			try {

				pstatement = connection
						.prepareStatement(("INSERT INTO bbs_tbl (thread_id,speaker,content,ymdhms)VALUES (?,?,?,now())"));

				pstatement.setInt(1, thread_id);
				pstatement.setString(2, speaker);
				pstatement.setString(3, content);

				pstatement.executeUpdate();

			} finally {
				pstatement.close();
			}

		}
	}
}
