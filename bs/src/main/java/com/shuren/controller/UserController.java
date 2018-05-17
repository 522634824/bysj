package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuren.pojo.Project;
import com.shuren.pojo.User;
import com.shuren.service.ProjectService;
import com.shuren.service.UserService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;
	@Resource
	private ProjectService projectService;

	@RequestMapping(value = "login")
	public String Login(String username, String password, HttpServletRequest request) {
		User user = new User();
		user = userService.selectByUsername(username);
		if (user == null) {
			request.setAttribute("errorMsg", "用户不存在");
			return "login";
		} else if (user.getPower() == -1) {
			request.setAttribute("errorMsg", "用户未激活");
			return "login";
		} else {
			String pwd = user.getPassword();
			if (password.equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", user);
				if (user.getPower() == 0 || user.getPower().equals(0)) {
					return "redirect:/views/index.jsp";
				} else if (user.getPower() == 1 || user.getPower().equals(1)) {
					Project p = new Project();
					p.setState(0);
					p.setUserid(user.getUserid());
					p.setPerformer(user.getName());
					session.setAttribute("activeProject", projectService.selectSingleByIf(p));
					return "redirect:/views/index_user.jsp";
				} else if (user.getPower() == 2 || user.getPower().equals(2) || user.getPower() == 3
						|| user.getPower().equals(3)) {
					return "redirect:/views/index_approve.jsp";
				}
			}
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "账号或密码错误！");
			return "login";
		}
	}
	
	@RequestMapping("/register")
	public String register(User user,String password,String password2, HttpServletRequest request, HttpSession session) throws Exception {
		User u = userService.selectByUsername(user.getUsername());
		if(!password.equals(password2)) {
			request.setAttribute("errorMsg", "两次密码输入不同！");
			return "register";
		}
		if(u!=null) {
			request.setAttribute("errorMsg", "用户名已存在！");
			return "register";
		}//判断注册信息是否符合相关要求并返回错误信息
		user.setPower(-1);
		userService.insertUser(user);
		return "redirect:/views/registerOk.jsp";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();

		return "redirect:/views/login.jsp";
	}

	@RequestMapping("/saveUser")
	public String saveUser(User user, HttpServletResponse response) throws Exception {
		int resultTotal = 0;
		if (user.getUserid() == null) {
			resultTotal = userService.insertUser(user);
		} else {
			resultTotal = userService.updateUserById(user);
		}
		JSONObject result = new JSONObject();
		if (resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping(value = "userlist")
	@ResponseBody
	public String UserList(User user, HttpServletRequest request, HttpServletResponse response) {
		String username=user.getUsername();
		if ("".equals(username) || username == null) {
			List<User> u = userService.selectByIf(user);
			JSONObject result = new JSONObject();
			result.put("rows", u);
			result.put("total", u.size());
			return result.toString();
		} else {
			List<User> u = userService.selectLikeUsername(username);
			JSONObject result = new JSONObject();
			result.put("rows", u);
			result.put("total", u.size());
			return result.toString();
		}
	}

	@RequestMapping("/deleteUser")
	public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			userService.deleteUserById(Integer.parseInt(idsStr[i]));
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping(value = "updateUser")
	public String updateUser(User user, HttpServletRequest request, HttpSession session) throws Exception {
		userService.updateUserById(user);
		session.setAttribute("currentUser", user);
		return "activeUser";

	}

	@RequestMapping(value = "updatePwd")
	public String updatePwd(String oldpwd, User user, HttpServletResponse response) throws Exception {
		JSONObject result = new JSONObject();
		int userid = user.getUserid();
		String pwd = userService.selectById(userid).getPassword();
		if (oldpwd.equals(pwd) || oldpwd == pwd) {
			userService.updateUserById(user);
			result.put("flag", true);
			ResponseUtil.write(response, result);
			return null;
		} else {
			result.put("flag", false);
			ResponseUtil.write(response, result);
			return null;

		}
	}
}
