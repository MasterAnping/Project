package test;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.zap.dao.PermissionMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring-*.xml" })
//@WebAppConfiguration
//@Transactional
//@Rollback(false)
public class MainTest { 
	
	@Autowired
	private PermissionMapper permissionMapper;
	
	
	

	@Test
	public void test1() {
		System.out.println(permissionMapper.selectAll());
	}
	
	
	
	@Test
	public void exportWord( HttpServletRequest request, HttpServletResponse response) throws Exception {     
        try {    
                //word内容
                String content="<html><body></body></html>";   
                byte b[] = content.getBytes("utf-8");  //这里是必须要设置编码的，不然导出中文就会乱码。
                ByteArrayInputStream bais = new ByteArrayInputStream(b);//将字节数组包装到流中  
                /*
                * 关键地方
                * 生成word格式 */
                POIFSFileSystem poifs = new POIFSFileSystem();  
                DirectoryEntry directory = poifs.getRoot();  
                DocumentEntry documentEntry = directory.createDocument("文档名称", bais); 
                //输出文件
                request.setCharacterEncoding("utf-8");  
                response.setContentType("application/msword");//导出word格式
                response.addHeader("Content-Disposition", "p_w_upload;filename=" +                            
                new String( (documentEntry.getName() + ".doc").getBytes(),  "iso-8859-1"));
                OutputStream ostream = response.getOutputStream(); 
                poifs.writeFilesystem(ostream);  
                bais.close();  
                ostream.close(); 
            }catch(Exception e){
                //异常处理
            }  
    }
	
	
	
	
}
