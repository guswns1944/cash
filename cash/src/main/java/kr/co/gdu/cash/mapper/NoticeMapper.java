package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

@Mapper
public interface NoticeMapper {
	// indexȭ���� �ֱ� 5�������� �����ִ� �޼���
	List<Notice> selectLatestNoiceList(); 
}