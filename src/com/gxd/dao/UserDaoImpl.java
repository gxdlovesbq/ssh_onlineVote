package com.gxd.dao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gxd.entity.AllEntitys;
import com.gxd.entity.AllView;
import com.gxd.entity.VoteItem;
import com.gxd.entity.VoteOption;
import com.gxd.entity.VoteSubject;
import com.gxd.entity.VoteUser;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	public List login(VoteUser user) {
		// TODO Auto-generated method stub
		return super.getHibernateTemplate().find("from VoteUser v where v.vuName='"+user.getVuName()+"'and v.vuPassworld='"+user.getVuPassworld()+"'");
	}

	public List selectTitles(){
		//本地sql查询标题
		return super.getHibernateTemplate().executeFind(new HibernateCallback<List>() {

			public List doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				String sql="SELECT s.titles,s.sid,s.ocount,COUNT(DISTINCT vi.vu_id)AS pcount FROM (SELECT vs.vs_id AS sid,vs.vs_titles AS titles,COUNT(vo.vo_option)AS ocount FROM vote_subject vs,vote_option vo WHERE vs.vs_id=vo.vs_id GROUP BY vs.vs_id) AS s LEFT JOIN vote_item vi ON s.sid=vi.vs_id GROUP BY s.sid";
				SQLQuery query=session.createSQLQuery(sql);
				List<Object[]> list=query.list();
				List qlist=new ArrayList();
				for (int i = 0; i < list.size(); i++) {
					Object[]obj=list.get(i);
					//将查询结果封装在实体类
					AllEntitys all=new AllEntitys(obj[0].toString(), Integer.parseInt(obj[1].toString()), Integer.parseInt(obj[2].toString()), Integer.parseInt(obj[3].toString()));
					qlist.add(all);
				}
				return qlist;
			}
		});
	}

	public List selectOption(int sid) {
		// TODO Auto-generated method stub
		return super.getHibernateTemplate().find("from VoteOption v where v.voteSubject.vsId="+sid+"");
	}

	public int add(VoteItem voteItem) {
		// TODO Auto-generated method stub
		return (Integer)super.getHibernateTemplate().save(voteItem);
	}

	public List findUser(int sid, int uid) {
		// TODO Auto-generated method stub
		return super.getHibernateTemplate().find("from VoteItem vi where vi.voteSubject.vsId="+sid+" and vi.voteUser.vuId="+uid+"");
	}

	public int addVoteSubject(VoteSubject voteSubject) {
		// TODO Auto-generated method stub
		return (Integer)super.getHibernateTemplate().save(voteSubject);
	}

	public int selectMaxVoteSubject() {
		return super.getHibernateTemplate().execute(new HibernateCallback<Integer>() {
			public Integer doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				String hql="select max(vsId) from VoteSubject vs";
				Query query=session.createQuery(hql);
				return (Integer)query.uniqueResult();
			}
		});
	}

	public int addVoteOption(VoteOption voteOption) {
		// TODO Auto-generated method stub
		return (Integer)super.getHibernateTemplate().save(voteOption);
	}

	public int addUser(VoteUser voteUser) {
		// TODO Auto-generated method stub
		return (Integer)super.getHibernateTemplate().save(voteUser);
	}
	
	public List selectview(final int sid){
		//本地sql查询标题
		return super.getHibernateTemplate().executeFind(new HibernateCallback<List>() {

			public List doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				String sql="SELECT vo.vo_option as voOption,vo.vo_id as oid,COUNT(vi.vo_id)AS vcount FROM vote_item vi RIGHT JOIN vote_option vo ON vi.vo_id=vo.vo_id WHERE vo.vs_id=\""+sid+"\" GROUP BY vo.vo_id";
				SQLQuery query=session.createSQLQuery(sql);
				List<Object[]> list=query.list();
				List qlist=new ArrayList();
				for (int i = 0; i < list.size(); i++) {
					Object[]obj=list.get(i);
					//将查询结果封装在实体类
					AllView all=new AllView(obj[0].toString(), Integer.parseInt(obj[1].toString()), Integer.parseInt(obj[2].toString()));
					qlist.add(all);
				}
				return qlist;
			}
		});
	}

	public int deleteOption(final int sid) {
		// TODO Auto-generated method stub
		return super.getHibernateTemplate().execute(new HibernateCallback<Integer>() {
			public Integer doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				String sql="delete from vote_option where vs_id="+sid+"";
				SQLQuery query=session.createSQLQuery(sql);
				return query.executeUpdate();
			}
		});
	}
	public int deleteSubject(final int sid) {
		// TODO Auto-generated method stub
		return super.getHibernateTemplate().execute(new HibernateCallback<Integer>() {
			public Integer doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				String sql="delete  from vote_subject where vs_id="+sid+"";
				SQLQuery query=session.createSQLQuery(sql);
				return query.executeUpdate();
			}
		});
	}
}
