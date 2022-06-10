package model.main;

public class MainNoticeDTO {
	
	int MainNoticeNo, noticeNo;
	String subject;
	
	public int getMainNoticeNo() {
		return MainNoticeNo;
	}
	public void setMainNoticeNo(int mainNoticeNo) {
		MainNoticeNo = mainNoticeNo;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	@Override
	public String toString() {
		return "MainNoticeDTO [MainNoticeNo=" + MainNoticeNo + ", noticeNo=" + noticeNo + ", subject=" + subject + "]";
	}
	
}
