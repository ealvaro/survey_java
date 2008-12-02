// JavaBean to store data for a survey
package beans;

import java.util.Date;

public class SurveyBean {
	private String firstName, lastName, email;

	private int q01, q02, q03, q04, q05, q06, q07, q08, q09, q10;

	private Date tstmp;

	public Date getTstmp() {
		return tstmp;
	}

	public void setTstmp(Date tstmp) {
		this.tstmp = tstmp;
	}

	// set the guest's first name
	public void setFirstName(String name) {
		firstName = name;
	}

	// get the guest's first name
	public String getFirstName() {
		return firstName;
	}

	// set the guest's last name
	public void setLastName(String name) {
		lastName = name;
	}

	// get the guest's last name
	public String getLastName() {
		return lastName;
	}

	// set the guest's email address
	public void setEmail(String address) {
		email = address;
	}

	// get the guest's email address
	public String getEmail() {
		return email;
	}

	public int getQ01() {
		return q01;
	}

	public void setQ01(int q01) {
		this.q01 = q01;
	}

	public int getQ02() {
		return q02;
	}

	public void setQ02(int q02) {
		this.q02 = q02;
	}

	public int getQ03() {
		return q03;
	}

	public void setQ03(int q03) {
		this.q03 = q03;
	}

	public int getQ04() {
		return q04;
	}

	public void setQ04(int q04) {
		this.q04 = q04;
	}

	public int getQ05() {
		return q05;
	}

	public void setQ05(int q05) {
		this.q05 = q05;
	}

	public int getQ06() {
		return q06;
	}

	public void setQ06(int q06) {
		this.q06 = q06;
	}

	public int getQ07() {
		return q07;
	}

	public void setQ07(int q07) {
		this.q07 = q07;
	}

	public int getQ08() {
		return q08;
	}

	public void setQ08(int q08) {
		this.q08 = q08;
	}

	public int getQ09() {
		return q09;
	}

	public void setQ09(int q09) {
		this.q09 = q09;
	}

	public int getQ10() {
		return q10;
	}

	public void setQ10(int q10) {
		this.q10 = q10;
	}

}
