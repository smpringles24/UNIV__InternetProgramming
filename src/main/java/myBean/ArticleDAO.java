package myBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import myBean.DB.DbCon;

public class ArticleDAO {
	public ArticleDAO() {
	}

	public int insertArticle(Article article) {
		int result = 0;
		String sql = "INSERT INTO article (title, content, is_important, is_secret, articleboard_id, bg_color) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setBoolean(3, article.isImportant());
			pstmt.setBoolean(4, article.isSecret());
			pstmt.setInt(5, article.getArticleboardId());
			pstmt.setString(6, article.getBgColor());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int deleteArticle(int articleId) {
		int result = 0;
		String sql = "DELETE FROM article WHERE id = ?";

		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, articleId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Article[] readAllArticles() {
		List<Article> articleList = new ArrayList<>();
		String sql = "SELECT * FROM article";

		try (Connection conn = DbCon.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {

			while (rs.next()) {
				Article article = new Article();
				article.setId(rs.getInt("id"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setImportant(rs.getBoolean("is_important"));
				article.setSecret(rs.getBoolean("is_secret"));
				article.setArticleboardId(rs.getInt("articleboard_id"));
				article.setBgColor(rs.getString("bg_color"));
				article.setCreatedAt(rs.getTimestamp("created_at"));
				article.setUpdatedAt(rs.getTimestamp("updated_at"));
				article.setViewCount(rs.getInt("view_count"));

				articleList.add(article);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articleList.toArray(new Article[0]);
	}

	public Article readArticleById(int id) {
		Article article = null;
		String sql = "SELECT * FROM article WHERE id = ?";

		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					article = new Article();
					article.setId(rs.getInt("id"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					article.setImportant(rs.getBoolean("is_important"));
					article.setSecret(rs.getBoolean("is_secret"));
					article.setArticleboardId(rs.getInt("articleboard_id"));
					article.setBgColor(rs.getString("bg_color"));
					article.setCreatedAt(rs.getTimestamp("created_at"));
					article.setUpdatedAt(rs.getTimestamp("updated_at"));
					article.setViewCount(rs.getInt("view_count"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return article;
	}

	public int viewCountUp(int articleId) throws SQLException {
		int result = -1;
		String sql = "UPDATE article SET view_count = view_count + 1 Where id = ?";

		try (Connection conn = DbCon.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, articleId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
}