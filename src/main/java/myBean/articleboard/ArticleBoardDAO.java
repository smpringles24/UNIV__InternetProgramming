package myBean.articleboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import myBean.DB.DbCon;

public class ArticleBoardDAO {
	public ArticleBoardDAO() {
	}

	public int insertArticleBoard(ArticleBoard articleBoard) {
		int result = 0;
		String sql = "INSERT INTO article_board (name) VALUES (?)";

		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, articleBoard.getName());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArticleBoard[] readAllArticleBoards() {
		List<ArticleBoard> boardList = new ArrayList<>();
		String sql = "SELECT * FROM article_board";

		try (Connection conn = DbCon.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				ArticleBoard board = new ArticleBoard();
				board.setId(rs.getInt("id"));
				board.setName(rs.getString("name"));
				board.setCreatedAt(rs.getTimestamp("created_at"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList.toArray(new ArticleBoard[0]);
	}

	public ArticleBoard readArticleBoardById(int id) {
		ArticleBoard board = null;
		String sql = "SELECT * FROM article_board WHERE id = ?";

		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					board = new ArticleBoard();
					board.setId(rs.getInt("id"));
					board.setName(rs.getString("name"));
					board.setCreatedAt(rs.getTimestamp("created_at"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return board;
	}

	public int updateArticleBoardName(int id, String newName) {
		int result = 0;
		String sql = "UPDATE article_board SET name = ? WHERE id = ?";

		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, newName);
			pstmt.setInt(2, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int deleteArticleBoard(int id) {
		int result = 0;
		String sql = "DELETE FROM article_board WHERE id = ?";

		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

}