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
public class favorites {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "custom-generator")
	@GenericGenerator(name = "custom-generator", strategy = "customGenerator.favoritesGenerator")
	private String favoritesId;
	
	private Date likeDate;
	
	@ManyToOne
	@JoinColumn(name = "emailUser")
	private user user;
	
	@ManyToOne
	@JoinColumn(name = "videoID")
	private video video;

	public favorites(String id, Date likeDate, user user, video video) {
		this.favoritesId = id;
		this.likeDate = likeDate;
		this.user = user;
		this.video = video;
	}

	public favorites() {

	}

	public String getId() {
		return favoritesId;
	}

	public void setId(String id) {
		this.favoritesId = id;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	public user getUser() {
		return user;
	}

	public void setUser(user user) {
		this.user = user;
	}

	public video getVideo() {
		return video;
	}

	public void setVideo(video video) {
		this.video = video;
	}
}
