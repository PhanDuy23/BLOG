package control;

import java.io.IOException;

import dao.DAO;
import entity.Category;
import entity.Comment;
import entity.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import java.util.List;


@WebServlet(name = "PostControl", urlPatterns = {"/post/*"})
public class PostControl extends HttpServlet{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
 
        if(action == null){
            String slug = request.getPathInfo();
            if(slug != null && slug.length()>1){
                String postId = slug.substring(slug.lastIndexOf("-")+1);
                DAO dao = new DAO();
                dao.click(postId);
                Post post = dao.getPostByID(postId);
                

                if(post != null){
                    // chuyen "\n" thanh <br> de hien thi tren html
                    post.setPcontent(post.getPcontent().replace("\n", "<br>"));
                    request.setAttribute("p", post);
                    
                    List<Comment> comments = dao.getCommentsByPostID(postId);
                    request.setAttribute("comments", comments);
                    
                    List<Post> relate = dao.getRelatedPosts(postId, dao.getCategoryIDByName(post.getCategoryName()));
                    request.setAttribute("relatedPosts",relate);
                    
                    List<Category> categories = dao.getAllCategories();
                    request.setAttribute("listC", categories);
                    
                    request.getRequestDispatcher("/post.jsp").forward(request,response);
                }
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request,response);
    }
    
}
