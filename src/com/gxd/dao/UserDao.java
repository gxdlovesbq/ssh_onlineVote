package com.gxd.dao;

import java.util.List;
import com.gxd.entity.VoteItem;
import com.gxd.entity.VoteOption;
import com.gxd.entity.VoteSubject;
import com.gxd.entity.VoteUser;

public interface UserDao {
	public List login(VoteUser user);
	public List selectTitles();
	public List selectOption(int sid);
	//投票，给VoteItem表添加数据
	public int add(VoteItem voteItem);
	//查看用户是否重复投票
	public List findUser(int sid,int uid);
	//新增投票，给VoteSubject表添加数据
	public int addVoteSubject(VoteSubject voteSubject);
	//查出VoteSubject中最大的id
	public int selectMaxVoteSubject();
	public int addVoteOption(VoteOption voteOption);
	public int addUser(VoteUser voteUser);
	public List selectview(int sid);
	public int deleteOption(int sid);
	public int deleteSubject(int sid);
}
