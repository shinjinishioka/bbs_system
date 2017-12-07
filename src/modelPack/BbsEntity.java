package modelPack;

public class BbsEntity {

	private int thread_id;
	private String speaker;

	private String content;

	private String ymdhms;
	private int resNumber;

	public int getThread_id() {
		return thread_id;
	}

	public void setThread_id(int thread_id) {
		this.thread_id = thread_id;
	}

	public String getSpeaker() {
		return speaker;
	}

	public void setSpeaker(String speaker) {
		this.speaker = speaker;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getYmdhms() {
		return ymdhms;
	}

	public void setYmdhms(String ymdhms) {
		this.ymdhms = ymdhms;
	}

	public int getResNumber() {
		return resNumber;
	}

	public void setResNumber(int resNumber) {
		this.resNumber = resNumber;
	}

}