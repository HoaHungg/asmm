package model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class video {
	@Id
	private String videoId;
	
	@OneToMany(mappedBy = "video", cascade = CascadeType.ALL)
	private List<favorites> listF;
	
	@OneToMany(mappedBy = "videoId", cascade = CascadeType.ALL)
	private List<shares> listS;

	public video() {

	}
	
	public video(String videoId) {
		this.videoId = videoId;
	}
	
	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public List<favorites> getListF() {
		return listF;
	}

	public void setListF(List<favorites> listF) {
		this.listF = listF;
	}

	public List<shares> getListS() {
		return listS;
	}

	public void setListS(List<shares> listS) {
		this.listS = listS;
	}
}
