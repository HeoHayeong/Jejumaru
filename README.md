## 소개

- 팀프로젝트
- **기획**부터 **개발**까지 
- 제주 명소를 소개해주는 사이트
- 비짓제주 오픈API를 사용


## 맡은 부분 
- CSS 수정
- 제주플레이스( 카테고리 별로 명소를 보여줌)
- 상세페이지 ( 명소 상세페이지 + 리뷰페이지)
  - 리뷰의 등록, 읽기, 수정, 삭제를 구현
-  MVC모델2 방식으로 개발
- jstl를 사용하여 편리하게 불러온 데이터를 사용 
 

## 사용 기술
- JavaScript로
- Oracle
- 

> ### DB에서 리뷰 데이터 가져오기 

```java
WriteDAO.java

	public WriteDTO [] createMyArray(ResultSet rs) throws SQLException {
		WriteDTO [] arr = null;  // DTO 배열로 리턴
		
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()) {
			String ptitle = rs.getString("ptitle");
			int rno = rs.getInt("rno");
			int rmno = rs.getInt("rmno");
			String rcontent = rs.getString("rcontent");
			if(rcontent == null) rcontent = "";
			Date d = rs.getDate("rdate");
			String rdate = "";
			if(d != null) { 
				rdate = new SimpleDateFormat("yyyy-MM-dd").format(d) ;
			}
			int rplace =rs.getInt("rplace");
			double rstar = rs.getDouble("rstar");
			String img = rs.getString("rimg");
			String[] rimg = null;
			if(img != null) {
				rimg = img.split(";");
			}
			WriteDTO dto = new WriteDTO(ptitle, rno, rmno, rcontent, rdate, rplace, rstar, rimg);
			dto.setRdate(rdate);
			list.add(dto);
		} // end while
		
		arr = new WriteDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		list.toArray(arr);  // 리스트 -> 배열
		
		return arr;
	} // end createArray()
```
