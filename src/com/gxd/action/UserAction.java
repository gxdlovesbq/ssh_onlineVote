package com.gxd.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.gxd.biz.UserBize;
import com.gxd.entity.AllParameter;
import com.gxd.entity.VoteItem;
import com.gxd.entity.VoteOption;
import com.gxd.entity.VoteSubject;
import com.gxd.entity.VoteUser;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	//给jsp页面传消息
	private String msg;
	private UserBize ubiz;
	private VoteUser user;
	private List list;
	private VoteItem voteItem;
	private VoteSubject voteSubject;
	private VoteOption voteOption;
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	//用于接受index页面传递过来的参数
	private AllParameter allParameter;
	
	public VoteOption getVoteOption() {
		return voteOption;
	}

	public void setVoteOption(VoteOption voteOption) {
		this.voteOption = voteOption;
	}

	public VoteSubject getVoteSubject() {
		return voteSubject;
	}

	public void setVoteSubject(VoteSubject voteSubject) {
		this.voteSubject = voteSubject;
	}

	public VoteItem getVoteItem() {
		return voteItem;
	}

	public void setVoteItem(VoteItem voteItem) {
		this.voteItem = voteItem;
	}

	public AllParameter getAllParameter() {
		return allParameter;
	}

	public void setAllParameter(AllParameter allParameter) {
		this.allParameter = allParameter;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public VoteUser getUser() {
		return user;
	}

	public void setUser(VoteUser user) {
		this.user = user;
	}

	public void setUbiz(UserBize ubiz) {
		this.ubiz = ubiz;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public String login() throws Exception {
		// 把用户名等信息存入session中
		List<VoteUser>ulist=ubiz.login(user);
		String uname="";
		int uid=0;
		for (VoteUser voteUser : ulist) {
			uname=voteUser.getVuName();
			uid=voteUser.getVuId();
		}
		session.setAttribute("uname", uname);
		session.setAttribute("uid", uid);
		
		if(ubiz.login(user).size()>0){
			list=ubiz.selectTitles();
			return SUCCESS;
		}else{
			msg="用户名或密码错误！";
			return "false";
		}
	}
	public String option() throws Exception {
		// TODO Auto-generated method stub
		list=ubiz.selectOption(allParameter.getSid());
		return "vote";
	}
	public String add() throws Exception {
		// TODO Auto-generated method stub
		list=ubiz.findUser(voteItem.getVoteSubject().getVsId(), voteItem.getVoteUser().getVuId());
		if(list.size()>0){
			msg="对不起，您已经参与过该投票！";
			return "message";
		}else{
			ubiz.add(voteItem);
			msg="恭喜您，投票成功！";
			return "message";
		}
	}
	//返回index页面
	public String tobackIndex() throws Exception {
		// TODO Auto-generated method stub
		list=ubiz.selectTitles();
		return SUCCESS;
	}
	public String addVote() throws Exception {
		// TODO Auto-generated method stub
		ubiz.addVoteSubject(voteSubject);
		int sid=ubiz.selectMaxVoteSubject();
		session.setAttribute("sid", sid);
		return "editor2";
	}
	public String addOption() throws Exception {
		// TODO Auto-generated method stub
		ubiz.addVoteOption(voteOption);
		msg="恭喜您，添加成功！！";
		return "message";
	}
	public String doUser() throws Exception {
		// TODO Auto-generated method stub
		ubiz.addUser(user);
		msg="恭喜您，注册成功！！,请登录";
		return "false";
	}
	public String removeSession() throws Exception {
		// TODO Auto-generated method stub
		session.removeAttribute("uname");
		msg="请重新登录！";
		return "false";
	}
	public String toview() throws Exception {
		// TODO Auto-generated method stub
		list=ubiz.selectview(allParameter.getSid());
		return "view";
	}
	public String tomanage() throws Exception {
		// TODO Auto-generated method stub
		list=ubiz.selectTitles();
		return "manage";
	}
	public String deleteSubject() throws Exception {
		// TODO Auto-generated method stub
		ubiz.deleteOption(allParameter.getSid());
		ubiz.deleteSubject(allParameter.getSid());
		return tomanage();
	}
}
