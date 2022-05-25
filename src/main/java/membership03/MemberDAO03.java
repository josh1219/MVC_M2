package membership03;

import common.DBConnPool;

public class MemberDAO03 extends DBConnPool {
	
	public MemberDAO03() {	// DB Connection ���� �Ϸ�
		super();					// �θ��� �⺻ ������ ȣ��� con ��ü ����
	}
	
	// Ŭ���̾�Ʈ�� ID�� Password���� �޾ƿͼ� ȸ�� ���̺��� ������ ��ġ�ϴ� ȸ�������� DTO�� ��Ƽ� ��ȯ
	
	public MemberDTO03 getMemberDTO(String uid , String upass) {
		MemberDTO03 dto = new MemberDTO03();
		String query = "SELECT * FROM member03 WHERE id = ? AND pass = ?" ;
			// 1���� ���ڵ尡 ��µǸ� : id�� pass�� �����ϴ� ���
			// 0���� ���ڵ尡 ��µǸ� : id�� pass�� �ϳ��� DB�� �������� �ʴ� ���
		
		 try {
	         psmt = con.prepareStatement(query);
	         
	         psmt.setString(1, uid);
	         psmt.setString(2, upass);
	         rs = psmt.executeQuery();
	   
	         //rs�� ���� DTO�� ����
	         
	         if (rs.next()) {    // ���ڵ��� ���� �����ϸ� rs.next()
	            dto.setId(rs.getString("id"));
	            dto.setPass(rs.getString("pass"));
	            dto.setName(rs.getString(3));
	            dto.setRegidate(rs.getString(4));
	            dto.setGrade(rs.getString(5));
	            
	            System.out.println("���� ���� ");
	            
	         } else {
	            
	            System.out.println("���� ���� ");
	         }
	         
	         
	      }catch (Exception e) {
			e.printStackTrace();
			System.out.println("ID , Pass Ȯ�ν� ���� �߻� ");
		}
		
		
		return dto;		// Client ���� uid , upass ���� �޾ƿͼ� DB ���� �˻� �� �˻��� ���� DTO�� ��Ƽ� ���� ��ȯ ���ش�.
		
	}

}
