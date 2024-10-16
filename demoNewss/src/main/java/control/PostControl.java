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
                String id = slug.substring(slug.lastIndexOf("-")+1);
                DAO dao = new DAO();
                dao.click(id);
                Post post = dao.getPostByID(id);
                List<Category> categories = dao.getAllCategories();

                if(post != null){
                    post.setPcontent(post.getPcontent().replace("\n", "<br>"));
                    List<Comment> comments = dao.getCommentsByPostID(id);
                    request.setAttribute("comments", comments);
                    request.setAttribute("listC", categories);
                    request.setAttribute("p", post);
                    request.getRequestDispatcher("/post.jsp").forward(request,response);
                }
            }
        }
//        }else if(action.equals("userPosts")){
//            User user = (User) reqeust
//        }
        
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
