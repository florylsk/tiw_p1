package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.*;
import javax.servlet.*;

@WebFilter(description = "Filtro que permite el acceso a un área "
		+ "restringida solo a usuarios autorizados.", 
		urlPatterns = { "/crud.jsp","/index.jsp","/master.jsp" },
		servletNames = {"AdminLoginServlet","AdminLogoutServlet","CreateStudentServlet","DeleteStudentServlet","SearchStudentServlet","UpdateStudentServlet"}
		)
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {    
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        boolean loggedIn = session != null && session.getAttribute("username") != null;

        if (loggedIn) {
            chain.doFilter(request, response);
        } else {
			req.getRequestDispatcher("notAllowed.jsp").forward(req, res);

        }
    }

}