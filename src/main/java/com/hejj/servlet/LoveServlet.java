package com.hejj.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class LoveServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        if(url.endsWith("start.do")){
            response.sendRedirect(request.getContextPath()+"/love/index.html");
        }else if(url.endsWith("reminiscence.do")){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/videos.jsp");
            List<String> paths = getStringPath();
            request.setAttribute("list",paths);
            requestDispatcher.forward(request, response);
        }
    }


    private List<String> getStringPath(){
        List<String> paths = new ArrayList<String>();
        File files = new File(this.getServletContext().getRealPath("/video"));
        if(files.exists() && files.isDirectory()){
            for(File file :  files.listFiles()){
                paths.add("/video/"+file.getName());
            }
        }
        return paths;
    }
}
