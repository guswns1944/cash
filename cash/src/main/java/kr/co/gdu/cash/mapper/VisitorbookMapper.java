package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Visitorbook;

@Mapper
public interface VisitorbookMapper {
	// 방명록 리스트
	List<Visitorbook> selectVisitorbookListByPage(Map<String, Integer> map);
	// 페이징 위한 카운트
	int selectVisitorbookListCount();
	// 방명록 추가
	int insertVisitorbook(Visitorbook visitorbook);
	// 방명록 삭제
	int deleteVisitorbook(int visitorbookId);
}
