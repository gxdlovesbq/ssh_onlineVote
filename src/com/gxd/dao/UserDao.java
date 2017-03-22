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
	//ͶƱ����VoteItem���������
	public int add(VoteItem voteItem);
	//�鿴�û��Ƿ��ظ�ͶƱ
	public List findUser(int sid,int uid);
	//����ͶƱ����VoteSubject���������
	public int addVoteSubject(VoteSubject voteSubject);
	//���VoteSubject������id
	public int selectMaxVoteSubject();
	public int addVoteOption(VoteOption voteOption);
	public int addUser(VoteUser voteUser);
	public List selectview(int sid);
	public int deleteOption(int sid);
	public int deleteSubject(int sid);
}
