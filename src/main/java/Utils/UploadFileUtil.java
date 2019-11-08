package Utils;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class UploadFileUtil {
    public static List<String> upload(MultipartHttpServletRequest request, String realPath) throws IOException {
        List<String> listFileName = new ArrayList<String>();

        String pathFileSave = request.getServletContext().getRealPath(realPath);

        List<MultipartFile> listMultipartFile = request.getMultiFileMap().get("file");

        for (MultipartFile item : listMultipartFile){
            String fileName = item.getOriginalFilename();

            listFileName.add(fileName);

            File fileSave = new File(pathFileSave + fileName);

            item.transferTo(fileSave);
        }

        return listFileName;
    }
}
