package Controller.admin;

import Utils.UploadFileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;

@Controller
@RequestMapping("/uploadfile")
public class UploadFileController {
    @GetMapping
    public String Default(){
        return "admin/uploadfile";
    }
    @PostMapping
    public String upload(MultipartHttpServletRequest request){
        try {
            UploadFileUtil.upload(request, "/resources/fileupload/img/");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "admin/uploadfile";
    }
}
