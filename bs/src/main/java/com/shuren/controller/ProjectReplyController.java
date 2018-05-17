package com.shuren.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.shuren.pojo.ProjectReply;
import com.shuren.pojo.User;
import com.shuren.service.ProjectReplyService;

import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;



@Controller
@RequestMapping("/apply")
public class ProjectReplyController {

	@Resource
	private ProjectReplyService service;

	@RequestMapping(value = "/saveApply", method = RequestMethod.POST)
	public String saveApply(ProjectReply projectreply, MultipartFile file,HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		int resultTotal = 0;
		ProjectReply p=service.selectByprojectreplyid(projectreply.getProjectreplyid());
		if(p==null) {
			Date date = new Date();// ���ϵͳʱ��.
			SimpleDateFormat sdf = new SimpleDateFormat(" yyyy-MM-dd HH:mm:ss ");
			String nowTime = sdf.format(date);
			Date time = sdf.parse(nowTime);
			projectreply.setState(0);
			projectreply.setSubmitdate(time);
			resultTotal = service.saveProjectReply(projectreply);
			//�ϴ��ļ�
			String path = "E:/pdf";
			String fileName = file.getOriginalFilename();
			File dir = new File(path, fileName);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			// MultipartFile�Դ��Ľ�������
			file.transferTo(dir);
			
		}
		
		
		if (resultTotal > 0) {
			result.put("result", true);
		}else {
			result.put("result", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping(value = "applyList")
	@ResponseBody
	public String UserList(ProjectReply projectreply, HttpServletRequest request, HttpServletResponse response) {
		List<ProjectReply> list = service.selectByIf(projectreply);
		JSONObject result = new JSONObject();
		JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd";
		String jsonString = JSON.toJSONString(list, SerializerFeature.WriteDateUseDateFormat);
		result.put("rows", jsonString);
		result.put("total", list.size());
		return result.toString();
	}

	@RequestMapping("/approveOk")
	public String approveOk(@RequestParam(value = "ids") String ids, HttpServletResponse response, HttpSession session)
			throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			User user = (User) session.getAttribute("currentUser");
			ProjectReply projectreply = new ProjectReply();
			projectreply.setProjectreplyid(String.valueOf(idsStr[i]));
			if (user.getPower() == 2) {
				projectreply.setState(1);
				projectreply.setApprover1(user.getName());
			} else if (user.getPower() == 3) {
				projectreply.setState(3);
				projectreply.setApprover2(user.getName());
			}
			service.updateByIf(projectreply);
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/approveFail")
	public String approveFail(@RequestParam(value = "ids") String ids, HttpServletResponse response,
			HttpSession session) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			User user = (User) session.getAttribute("currentUser");
			ProjectReply projectreply = new ProjectReply();
			projectreply.setProjectreplyid(String.valueOf(idsStr[i]));
			if (user.getPower() == 2) {
				projectreply.setState(2);
				projectreply.setApprover1(user.getName());
			} else if (user.getPower() == 3) {
				projectreply.setState(4);
				projectreply.setApprover2(user.getName());
			}
			service.updateByIf(projectreply);
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

//	@RequestMapping(value = "/saveApply", method = RequestMethod.POST)
//	@ResponseBody
//	public String upload(MultipartFile file, HttpServletRequest request) throws IOException {
//		// String path = request.getSession().getServletContext().getRealPath("upload");
//		String path = "E:/pdf";
//		String fileName = file.getOriginalFilename();
//		File dir = new File(path, fileName);
//		if (!dir.exists()) {
//			dir.mkdirs();
//		}
//		// MultipartFile�Դ��Ľ�������
//		file.transferTo(dir);
//		return "ok!";
//	}
//
//	/**
//	 * �ļ����ع���
//	 * 
//	 * @param request
//	 * @param response
//	 * @throws Exception
//	 */
//	@RequestMapping("/down")
//	public void down(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		// ģ���ļ���myfile.txtΪ��Ҫ���ص��ļ�
//		String fileName = request.getSession().getServletContext().getRealPath("upload") + "/myfile.txt";
//		// ��ȡ������
//		InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
//		// ���������������صĻ�
//		String filename = "�����ļ�.txt";
//		// ת�룬����ļ�����������
//		filename = URLEncoder.encode(filename, "UTF-8");
//		// �����ļ�����ͷ
//		response.addHeader("Content-Disposition", "attachment;filename=" + filename);
//		// 1.�����ļ�ContentType���ͣ��������ã����Զ��ж������ļ�����
//		response.setContentType("multipart/form-data");
//		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
//		int len = 0;
//		while ((len = bis.read()) != -1) {
//			out.write(len);
//			out.flush();
//		}
//		out.close();
//	}

}
