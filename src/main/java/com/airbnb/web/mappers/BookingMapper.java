package com.airbnb.web.mappers;

import java.util.List;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.airbnb.web.domains.BookingDTO;
import com.airbnb.web.domains.Command;
import com.airbnb.web.domains.HouseDTO;
import com.airbnb.web.domains.MemberDTO;
import com.airbnb.web.domains.SearchVal;

@Repository
@Lazy
public interface BookingMapper {
/*	public boolean login(BookingMapper param);*/

	public List<HouseDTO> find(SearchVal sVal);
	public List<String> findLoc(SearchVal sVal);
	public SearchVal listCount(SearchVal sVal);
	/*public Integer listCount(SearchVal sVal);*/
	
// sangho
	public HouseDTO findOne(Command command);
	public Integer payInsert(BookingDTO param);
	public List<BookingDTO> resvList(Command command);
	public Command resvCount(Command command);
	public List<String> getBlockList(Command command);
	public MemberDTO getHost(Command command);
	public Integer payment(BookingDTO bDto);
	public Integer resvCancel(Command command);
	public BookingDTO findResv(Command command);
}