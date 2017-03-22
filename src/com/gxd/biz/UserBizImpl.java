package com.gxd.biz;

import java.util.List;

import com.gxd.dao.UserDao;
import com.gxd.entity.AllParameter;
import com.gxd.entity.VoteItem;
import com.gxd.entity.VoteOption;
import com.gxd.entity.VoteSubject;
import com.gxd.entity.VoteUser;

public class UserBizImpl implements UserBize {
	private UserDao udao;
	
	public void setUdao(UserDao udao) {
		this.udao = udao;
	}

	public List login(VoteUser user) {
		// TODO Auto-generated method stub
		return udao.login(user);
	}

	public List selectTitles() {
		// TODO Auto-generated method stub
		return udao.selectTitles();
	}

	public List selectOption(int sid) {
		// TODO Auto-generated method stub
		return udao.selectOption(sid);
	}

	public int add(VoteItem voteItem) {
		// TODO Auto-generated method stub
		return udao.add(voteItem);
	}

	public List findUser(int sid, int uid) {
		// TODO Auto-generated method stub
		return udao.findUser(sid, uid);
	}

	public int addVoteSubject(VoteSubject voteSubject) {
		// TODO Auto-generated method stub
		return udao.addVoteSubject(voteSubject);
	}

	public int selectMaxVoteSubject() {
		// TODO Auto-generated method stub
		return udao.selectMaxVoteSubject();
	}

	public int addVoteOption(VoteOption voteOption) {
		// TODO Auto-generated method stub
		return udao.addVoteOption(voteOption);
	}

	public int addUser(VoteUser voteUser) {
		// TODO Auto-generated method stub
		return udao.addUser(voteUser);
	}

	public List selectview(int sid) {
		// TODO Auto-generated method stub
		return udao.selectview(sid);
	}

	public int deleteSubject(int sid) {
		// TODO Auto-generated method stub
		return udao.deleteSubject(sid);
	}
	public int deleteOption(int sid){
		return udao.deleteOption(sid);
	}

}
