package com.simplilearn.controller;



import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.simplilearn.dao.EProductDao;
import com.simplilearn.entity.EProductEntity;

@Controller
public class MainController {
	
 
	
	@Autowired
	EProductDao dao;

	
	@GetMapping("/listproduct")
	public String getAllProducts(ModelMap map) {
		
		
		List<EProductEntity> list= dao.getAllProducts();
		map.addAttribute("list", list);
		System.out.println(list);
		return "products";
		
	}
	
	@GetMapping("/details")
	public String getProduct(HttpServletRequest request,ModelMap map) {
		String id=(request.getParameter("Id"));
		System.out.println(id);
		int Id=Integer.parseInt(id);
		EProductEntity entity=dao.getProductById(Id);
		map.addAttribute("obj",entity);
		return "details";
	}
	
	@GetMapping("/Update")
	public String UpdateProduct(HttpServletRequest request,ModelMap map) throws ParseException {
		System.out.println(request.getParameter("id"));
		int id=Integer.parseInt(request.getParameter("id"));
		String  Name=(request.getParameter("name"));
		int Price=Integer.parseInt(request.getParameter("price"));
		String Date=request.getParameter("date");
		
		
		EProductEntity entity=dao.updateProduct(id,Name,Price,Date);
		
		map.addAttribute("obj",entity);
		return "index";
	}
}
