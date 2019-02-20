package com.sexteam.action.util;


import com.sexteam.vo.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet(name = "UploadHandleServlet",urlPatterns = "/UploadHandleServlet")
public class UploadHandleServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
////        String savePath = "F:\\Program Files\\IdeaIU Web文件\\ArenaOfValorStore\\web\\userimg";
//        String savePath = "G:\\upload";
//        File file = new File(savePath);
//        User ub = new User();
//        //判断上传文件的保存目录是否存在
//        if (!file.exists() && !file.isDirectory()) {
//            System.out.println(savePath + "目录不存在，需要创建");
//            //创建目录
//            file.mkdir();
//        }
//        //消息提示
//        String imgpath="";
//        String message = "";
//        try {
//            DiskFileItemFactory factory = new DiskFileItemFactory();
//            ServletFileUpload upload = new ServletFileUpload(factory);
//            upload.setHeaderEncoding("UTF-8");
//            if (!ServletFileUpload.isMultipartContent(request)) {
//                System.out.println("1");
//                return;
//            }
//            List<FileItem> list = upload.parseRequest(request);
//            for (FileItem item : list) {
//                if (item.isFormField()) {
//                    System.out.println("dsad");
//                } else {
//                    String filename= item.getName();
//                    System.out.println(filename);
//                    if (filename == null || filename.trim().equals("")) {
//                        continue;
//                    }
//                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
//                    InputStream in = item.getInputStream();
//                    FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
//                    System.out.println(savePath + "\\" + filename);
//                    imgpath=savePath + "\\" + filename;
//                    byte buffer[] = new byte[1024];
//                    int len = 0;
//                    while ((len = in.read(buffer)) > 0) {
//                        out.write(buffer, 0, len);
//                    }
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("dasdas");
//        request.setAttribute("imgpath",imgpath);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

}
