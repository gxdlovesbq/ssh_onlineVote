package com.gxd.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * VoteUser entity. @author MyEclipse Persistence Tools
 */

public class VoteUser implements java.io.Serializable {

	// Fields

	private Integer vuId;
	private String vuName;
	private String vuPassworld;
	private Integer flag;
	private Set voteItems = new HashSet(0);

	// Constructors

	/** default constructor */
	public VoteUser() {
	}

	/** minimal constructor */
	public VoteUser(String vuName, String vuPassworld, Integer flag) {
		this.vuName = vuName;
		this.vuPassworld = vuPassworld;
		this.flag = flag;
	}

	/** full constructor */
	public VoteUser(String vuName, String vuPassworld, Integer flag,
			Set voteItems) {
		this.vuName = vuName;
		this.vuPassworld = vuPassworld;
		this.flag = flag;
		this.voteItems = voteItems;
	}

	// Property accessors

	public Integer getVuId() {
		return this.vuId;
	}

	public void setVuId(Integer vuId) {
		this.vuId = vuId;
	}

	public String getVuName() {
		return this.vuName;
	}

	public void setVuName(String vuName) {
		this.vuName = vuName;
	}

	public String getVuPassworld() {
		return this.vuPassworld;
	}

	public void setVuPassworld(String vuPassworld) {
		this.vuPassworld = vuPassworld;
	}

	public Integer getFlag() {
		return this.flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Set getVoteItems() {
		return this.voteItems;
	}

	public void setVoteItems(Set voteItems) {
		this.voteItems = voteItems;
	}

}