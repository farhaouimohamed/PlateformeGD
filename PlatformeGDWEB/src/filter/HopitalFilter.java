//package filter;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest; 
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import metier.entities.Utilisateur;
//
//@WebFilter(urlPatterns = {"/ajoutBesoin","/besoin", "/besoins", "/editBesoin", "/dons"})
//public class HopitalFilter implements Filter {
//
//
//    
//	@Override
//	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
//			throws IOException, ServletException {
//        HttpServletRequest request = (HttpServletRequest) req;
//        HttpServletResponse response = (HttpServletResponse) res;
//        HttpSession session = request.getSession(false);
//        String loginURI = request.getContextPath() + "/";
//
//        
//        
//        boolean loggedIn = session != null && session.getAttribute("user") != null;
//
//        Utilisateur user;
//        if (loggedIn)
//        {
//        	user = (Utilisateur) session.getAttribute("user");
//			System.out.println("**************************** before responsable ******************************************");
//			System.out.println(user.getRole());
//			System.out.println(user.getRole().equals("responsable"));
//        	if(user.getRole().equals("responsable") && user.getAccepted().equals(true) 
//        			&& user.getEtablissement().getHospital()) 
//        	{
//    			System.out.println("**************************** responsable hopital ******************************************");
//    			System.out.println(session.getAttribute("user"));
//        		chain.doFilter(request, response);
//        	}
//        }
//
//        
//        	else 
//	        {
//    			System.out.println("**************************** No user ******************************************");
//	            response.sendRedirect(loginURI);
//	        }
//        
//		
//	}
//}