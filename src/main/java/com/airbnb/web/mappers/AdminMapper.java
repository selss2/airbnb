package com.airbnb.web.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.airbnb.web.domains.AdminDTO;
import com.airbnb.web.domains.BookingDTO;
import com.airbnb.web.domains.HchartDTO;
import com.airbnb.web.domains.HostingDTO;
import com.airbnb.web.domains.MchartDTO;
import com.airbnb.web.domains.RchartDTO;
import com.airbnb.web.domains.Retval;
import com.airbnb.web.domains.Command;
import com.airbnb.web.domains.GoogleChartDTO;


@Repository
public interface AdminMapper {
	public Retval count();
	public Retval mcount();
	public Retval hcount();
	public Retval rcount();
	public List<AdminDTO> list();
	public List<HostingDTO> hlist();
	public List<BookingDTO> rlist();
	public List<AdminDTO> find(Command command);
	public List<MchartDTO> mchart();
	public List<HchartDTO> hchart();
	public List<RchartDTO> rchart();
	public List<GoogleChartDTO> chart();
	
	public Retval regist(AdminDTO param);
	public Retval update(AdminDTO param);
	public Retval delete(AdminDTO param);
}

