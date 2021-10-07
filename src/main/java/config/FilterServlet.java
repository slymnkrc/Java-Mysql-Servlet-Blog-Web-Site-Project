package config;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Enumeration;

@WebFilter("/*") //webfilteri tüm url erde calitir
public class FilterServlet implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("doFilter Call");

        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;

        String ip = req.getRemoteAddr();
        if(ip.equalsIgnoreCase("0:0:0:0:0:0:0:0:1")){
            InetAddress inetAddress = InetAddress.getLocalHost();
            String ipAddress = inetAddress.getHostAddress() ;
            ip = ipAddress;

        }

        req.setAttribute("ip" , ip);
        Enumeration<String> enumeration = req.getHeaderNames();
        while ( enumeration.hasMoreElements() ) {
            String stenum =enumeration.nextElement();
            String item = req.getHeader(stenum);
            System.out.println(stenum + " : " + item);
        }

        req.setCharacterEncoding("utf-8");
        res.setCharacterEncoding("utf-8");

        filterChain.doFilter( req, res );
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
