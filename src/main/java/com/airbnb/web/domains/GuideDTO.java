package com.airbnb.web.domains;

import java.io.Serializable;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Component @Lazy @Data
public class GuideDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	@Getter @Setter private String place,major_category,minor_category,lat,lng,host_comment,email,guide_seq;
}
