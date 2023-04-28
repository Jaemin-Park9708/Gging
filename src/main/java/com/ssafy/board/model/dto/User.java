package com.ssafy.board.model.dto;

import org.springframework.stereotype.Component;

@Component
public class User {
	private String id;
	private String password;
	private String name;
	private String email;
	private int age;
	private String img;
	private String orgImg;
	private String registDate;
	private String gender;

	public User() {
	}

	public User(String id, String password, String name, String email, int age, String img, String orgImg,
			String registDate, String gender) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.age = age;
		this.img = img;
		this.orgImg = orgImg;
		this.registDate = registDate;
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getOrgImg() {
		return orgImg;
	}

	public void setOrgImg(String orgImg) {
		this.orgImg = orgImg;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", age=" + age
				+ ", img=" + img + ", orgImg=" + orgImg + ", registDate=" + registDate + ", gender=" + gender + "]";
	}


}
