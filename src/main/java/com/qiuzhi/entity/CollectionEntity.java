package com.qiuzhi.entity;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class CollectionEntity {
	private Integer id;
	//	求职者 id
	private Integer applicantId;
	//	公司	id
	private Integer companyId;
	//	工作 id
	private Integer jobId;
	//	公司名称
	private String companyName;
	//	工作名称
	private String jobName;
	//	收藏时间
	private Date collectionTime;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getApplicantId() {
		return applicantId;
	}
	public void setApplicantId(Integer applicantId) {
		this.applicantId = applicantId;
	}
	public Integer getJobId() {
		return jobId;
	}
	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public Date getCollectionTime() {
		return collectionTime;
	}
	public void setCollectionTime(Date collectionTime) {
		this.collectionTime = collectionTime;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	
	
}