package com.sexteam.action;

import com.sexteam.service.UserService;
import com.sexteam.service.imp.UserServeiceImp;
import com.sexteam.util.RegionValue;
import com.sexteam.vo.User;
import com.sun.deploy.net.HttpRequest;
import com.sun.deploy.net.HttpResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import sun.nio.cs.US_ASCII;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "RegisterServlet", urlPatterns = "/registerservlet")
public class RegisterServlet extends HttpServlet {
    private User user = new User();
    private FileItem item1=null;
    private String savePath = RegionValue.USERIMG_REALPATH;
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //请求页面的编码
        request.setCharacterEncoding("utf-8");
        String pnum = getParametersImag(request, response);
        //判断验证码
        System.out.println(pnum);
        String reg = (String) request.getSession().getAttribute("reg");
        if (!pnum.equalsIgnoreCase(reg)) {
            request.setAttribute("msg", "验证码错误");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
//        Map<String, String[]> parameterMap = request.getParameterMap();
//        Set<String> strings = parameterMap.keySet();
//        for (String s : strings) {
//            System.out.println(s+":"+parameterMap.get(s));
//        }
//        User user = new User();
        if (user.getU_imag().equals("")||user.getU_imag().equals("null")) {
            user.setU_imag(RegionValue.IMG1_REALPATH+"\\1.jpg");
        }
        try {
//            BeanUtils.populate(user, parameterMap);
            UserService us = new UserServeiceImp();
            boolean b = us.userRegister(user);
            if (b) {
                writeFile(savePath, user.getU_name()+".jpg",item1);
                request.setAttribute("imgpath", user.getU_imag());
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("msg", "注册失败");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            request.setAttribute("msg", "注册失败2");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

    }

    private String  getParametersImag(HttpServletRequest request, HttpServletResponse response) {
        // String savePath = "G:\\upload";
        File file = new File(savePath);

        //判断上传文件的保存目录是否存在
        if (!file.exists() && !file.isDirectory()) {
            System.out.println(savePath + "目录不存在，需要创建");
            //创建目录
            file.mkdir();
        }
        //消息提示
        String pnum="";
        String filename="";
        ;
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
            if (!ServletFileUpload.isMultipartContent(request)) {
                return null;
            }
            List<FileItem> list = upload.parseRequest(request);
            for (FileItem item : list) {
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString("UTF-8");
                    if(name.equals("pnum")){
                        pnum=value;
                    }
//                    System.out.println(name + "=" + value);
                    user.setUb(name, value);
                } else {
                    filename= item.getName();
                    System.out.println(filename);
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }
                    System.out.println("进入到这里");
                    item1= item;

                }
            }
            if(item1!=null){
                System.out.println("item1有值");
            }
            user.setUb("u_imag", savePath + "\\" + user.getU_name()+".jpg");
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(user);
        return pnum;
    }

    private void writeFile(String savePath, String filename,FileItem item) throws IOException {
        if(!filename.equals("")&&user.getU_name()!=null){
            filename = filename.substring(filename.lastIndexOf("\\") + 1);
            InputStream in=null;
            if(item!=null){
                in= item.getInputStream();
            }else {
                System.out.println("RegionValue.IMG1_REALPATH+1.jpg:"+RegionValue.IMG1_REALPATH + "\\1.jpg");
                in=new FileInputStream(new File(RegionValue.IMG1_REALPATH+"\\1.jpg"));
            }
            System.out.println("savePath + filename:"+savePath + "\\" + filename);
            FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
//                    System.out.println(savePath + "\\" + filename);
            byte buffer[] = new byte[1024];
            int len = 0;
            while ((len = in.read(buffer)) > 0) {
                System.out.println("正在写入");
                out.write(buffer, 0, len);
            }
        }
    }
}
