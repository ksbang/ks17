package com.anyang.ks.scrap;

import java.util.List;

public interface AbroadScrapDAO {

	public void addAbroadScrap(AbroadScrap vo) throws Exception;

	public List<AbroadPopular> popularNews() throws Exception;

	public String abrScrapCheck(AbroadScrap vo) throws Exception;

	public void removeAbroadScrap(AbroadScrap vo) throws Exception;

	public List<GETAbroadScrap> abrScrapList(String email) throws Exception;

}
