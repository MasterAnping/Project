package com.zap.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zap.service.UserService;

@Controller
@RequestMapping("home")
public class HomeController extends BaseController{
	
	private static final String token = "jesse";

	@Autowired
	private UserService userService;

	/**
	 * 网站主页
	 * @param currentPage
	 * @return
	 */
	@RequestMapping()
	public String homePage() {	
		return "home";
	}

	/*@RequestMapping("code")
	public void code(HttpServletRequest request,HttpServletResponse response){
		BufferedImage bufferedImage = new BufferedImage(100, 50, BufferedImage.TYPE_INT_RGB);
		Graphics graphics = bufferedImage.getGraphics();
		Random random = new Random();
		graphics.setColor(Color.WHITE);
		graphics.setFont(new Font("Fixedsys", Font.BOLD, 23));
		graphics.fillRect(0, 0, 100, 50);
		graphics.setColor(Color.BLACK);
		graphics.drawRect(0, 0, 100 - 1, 50 - 1);
		for(int i=0;i<4;i++){
			String singleCode=String.valueOf(random.nextInt(10));
			int red = random.nextInt(255);
		    int green = random.nextInt(255);
		    int blue = random.nextInt(255);
		    graphics.setColor(new Color(red, green, blue));
		    graphics.drawString(singleCode, 25*i, 25);
		}
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		response.setContentType("image/jpeg");
	    try {
	    	ServletOutputStream sos = response.getOutputStream();
			ImageIO.write(bufferedImage, "jpeg", sos);
			sos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}*/
	

	
	@RequestMapping("noPerms")
	public String noPerms() {
		return "noPerms";
	}


}
