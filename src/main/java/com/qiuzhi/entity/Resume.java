package com.qiuzhi.entity;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class Resume {
    private Integer id;

    private Integer applicantid;

    private String name;

    private String sex;

    private Integer age;

    private String education;

    private String jobexperience;

    private String projectexperience;

    private String desc;

    private String expectjob;

    private String jobtype;

    private Integer expectsalary;

    private Date lastupdatetime;
    
    private String phone;
    
    private String email;
    
    private String address;

	private String category;

    public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Resume(){
    	
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApplicantid() {
        return applicantid;
    }

    public void setApplicantid(Integer applicantid) {
        this.applicantid = applicantid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public String getJobexperience() {
        return jobexperience;
    }

    public void setJobexperience(String jobexperience) {
        this.jobexperience = jobexperience == null ? null : jobexperience.trim();
    }

    public String getProjectexperience() {
        return projectexperience;
    }

    public void setProjectexperience(String projectexperience) {
        this.projectexperience = projectexperience == null ? null : projectexperience.trim();
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc == null ? null : desc.trim();
    }

    public String getExpectjob() {
        return expectjob;
    }

    public void setExpectjob(String expectjob) {
        this.expectjob = expectjob == null ? null : expectjob.trim();
    }

    public String getJobtype() {
        return jobtype;
    }

    public void setJobtype(String jobtype) {
        this.jobtype = jobtype == null ? null : jobtype.trim();
    }

    public Integer getExpectsalary() {
        return expectsalary;
    }

    public void setExpectsalary(Integer expectsalary) {
        this.expectsalary = expectsalary;
    }

    public Date getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(Date lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }

	public String getCategory(){
		return category;
	}

	public void setCategory(String category){
		this.category = category;
	}

	@Override
	public String toString() {
		return "Resume [id=" + id + ", applicantid=" + applicantid + ", name=" + name + ", sex=" + sex + ", age=" + age
				+ ", education=" + education + ", jobexperience=" + jobexperience + ", projectexperience="
				+ projectexperience + ", desc=" + desc + ", expectjob=" + expectjob + ", jobtype=" + jobtype
				+ ", expectsalary=" + expectsalary + ", lastupdatetime=" + lastupdatetime + ", phone=" + phone
				+ ", email=" + email + ", address=" + address + ", category=" + category + "]";
	}
	
	
}
