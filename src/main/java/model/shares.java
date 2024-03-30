package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class shares {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "custom-generator")
	@GenericGenerator(name = "custom-generator", strategy = "customGenerator.sharesGenerator")
	private String sharessId;
	
	private String reciiveEmail;
	private Date date;
	
	@ManyToOne
	@JoinColumn(name = "email")
	private user userId;
	
	@ManyToOne
	@JoinColumn(name = "video")
	private video videoId;

	public shares() {

	}

	public shares(String sharessId, String reciiveEmail, Date date, user userId, video videoId) {
		this.sharessId = sharessId;
		this.reciiveEmail = reciiveEmail;
		this.date = date;
		this.userId = userId;
		this.videoId = videoId;
	}

	public String getSharessId() {
		return sharessId;
	}

	public void setSharessId(String sharessId) {
		this.sharessId = sharessId;
	}

	public String getReciiveEmail() {
		return reciiveEmail;
	}

	public void setReciiveEmail(String reciiveEmail) {
		this.reciiveEmail = reciiveEmail;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public user getUserId() {
		return userId;
	}

	public void setUserId(user userId) {
		this.userId = userId;
	}

	public video getVideoId() {
		return videoId;
	}

	public void setVideoId(video videoId) {
		this.videoId = videoId;
	}
}
