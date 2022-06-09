package model.notice;

import java.util.Date;

public class NoticeDTO {
	int noticeNo, hits;
	String subject, content, upfile, pname;
	Date reg_date;

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getUpfile() {
		if (upfile == null || upfile.trim().equals("") || upfile.trim().equals("null")) {
			return null;
		}
		return upfile;
	}

	public void setUpfile(String upfile) {
		this.upfile = upfile;
	}

	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", hits=" + hits + ", subject=" + subject + ", content=" + content
				+ ", upfile=" + upfile + ", pname=" + pname + ", reg_date=" + reg_date + "]";
	}

}
