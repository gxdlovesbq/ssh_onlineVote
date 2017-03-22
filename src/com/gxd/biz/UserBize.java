package com.gxd.biz;

import java.util.List;
import com.gxd.entity.VoteItem;
import com.gxd.entity.VoteOption;
import com.gxd.entity.VoteSubject;
import com.gxd.entity.VoteUser;

public interface UserBize {
	public List login(VoteUser user);
	public List selectTitles();
	public List selectOption(int sid);
	public int add(VoteItem voteItem);
	public List findUser(int sid,int uid);
	public int addVoteSubject(VoteSubject voteSubject);
	public int selectMaxVoteSubject();
	public int addVoteOption(VoteOption voteOption);
	public int addUser(VoteUser voteUser);
	public List selectview(int sid);
	public int deleteOption(int sid);
	public int deleteSubject(int sid);
}
