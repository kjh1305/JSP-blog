package repository;

import domain.Member;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAOImpl extends DAOImplOracle implements MemberDAO {
   Connection conn = null;
   Statement stmt = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   public MemberDAOImpl() {
      conn = getConnection();
   }
   @Override
   public int create(Member m) { // 회원 가입, insert문
      int ret = 0;
      String sql = "insert into m201712015 values(seq_m201712015.nextval, '" +
              m.getEmail() + "', '" +
              m.getPw() + "', '" +
              m.getName() + "', '" +
              m.getPhone() + "', '" +
              m.getAddress() + "')";
      // System.out.println(sql);
      try {
         stmt = conn.createStatement();
         ret = stmt.executeUpdate(sql);
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         this.closeResources(conn, stmt, pstmt, rs);
      }
      return ret;
   }

   @Override
   public Member read(Member m) { // 회원 로그인, 상세 정보, select문
      rs = null;
      Member retMember = null;
      String sql = "select * from m201712015 where email = '" + m.getEmail() + "'";
      try {
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);

         if(rs.next()) {
            retMember = setRsMember(rs);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         this.closeResources(conn, stmt, pstmt, rs);
      }
      return retMember;
   }

   private Member setRsMember(ResultSet rs) throws SQLException {
      // rs : record 집합, re.getString(1) : 현재 레코드의 첫번째 필드 값
      Member retMember = new Member();
      retMember.setId(rs.getLong(1));
      retMember.setEmail(rs.getString(2));
      retMember.setPw(rs.getString(3));
      retMember.setName(rs.getString(4));
      retMember.setPhone(rs.getString(5));
      retMember.setAddress(rs.getString(6));
      return retMember;
   }

   @Override
   public ArrayList<Member> readList() { // 회원 목록 정보, select문, 1개 이상의 레코드들을 반환
      rs = null;
      ArrayList<Member> memberList = null;
      Member retMember = null;

      String sql = "select * from m201712015";
            
      try {
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         memberList = new ArrayList<Member>();
         while(rs.next()) {
            retMember = setRsMember(rs);

            memberList.add(retMember);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         this.closeResources(conn, stmt, pstmt, rs);
      }
      return memberList;
   }

   @Override
   public int update(Member m) { // 회원 정보 수정, update문
      int ret = 0;
      String sql = "update m201712015 set name=?, phone=?, address=? where email=? and pw=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, m.getName());
         pstmt.setString(2, m.getPhone());
         pstmt.setString(3, m.getAddress());
         pstmt.setString(4, m.getEmail());
         pstmt.setString(5, m.getPw());
         ret = pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         this.closeResources(conn, stmt, pstmt, rs);
      }
      return ret;
   }

   @Override
   public int delete(Member m) { // 회원 탈퇴(정보 삭제), delete문
      int ret = 0;
      String sql = "delete from m201712015 where email=? and pw=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, m.getEmail());
         pstmt.setString(2, m.getPw());
         ret = pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         this.closeResources(conn, stmt, pstmt, rs);
      }
      return ret;
   }

}