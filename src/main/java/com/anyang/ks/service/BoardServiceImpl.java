package com.anyang.ks.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.anyang.ks.domain.BoardVO;
import com.anyang.ks.domain.Criteria;
import com.anyang.ks.domain.SearchCriteria;
import com.anyang.ks.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public void regist(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.create(board);

	}
	
	//@Override
	//public BoardVO read(Integer bno) throws Exception {
	//	// TODO Auto-generated method stub
	//	return dao.read(bno);

	//}
	
	@Override
	public void modify(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.update(board);

	}
	
	@Override
	public void remove(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);

	}
	
	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();

	}
	
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);

	}
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);

	}
	
	@Override
	  public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

	    return dao.listSearch(cri);
	  }

	@Override
	  public int listSearchCount(SearchCriteria cri) throws Exception {

	    return dao.listSearchCount(cri);
	  }
	
	  @Transactional(isolation=Isolation.READ_COMMITTED)
	  @Override
	  public BoardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		 dao.updateViewCnt(bno);
		 return dao.read(bno);

	}

	

}
