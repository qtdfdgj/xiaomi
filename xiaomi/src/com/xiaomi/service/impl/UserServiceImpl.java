package com.xiaomi.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.buf.UDecoder;

import com.xiaomi.dao.mapper.UserMapper;
import com.xiaomi.dao.vo.User;
import com.xiaomi.service.UserService;
import com.xiaomi.util.DBUtil;

public class UserServiceImpl implements UserService {  
	  private final static String HEX_NUMS_STR = "0123456789ABCDEF";  
	  private final static Integer SALT_LENGTH = 12; 
	  public static byte[] hexStringToByte(String hex) {  
	        /* lenΪʲô��hex.length() / 2 ? 
	         * ���ȣ�hex��һ���ַ������������������16����������char���� 
	         * ��2��16�������ֿ��Ա�ʾ1��byte������Ҫ�����Щchar[]����ת����ʲô����byte[]�����ȿ���ȷ���ľ��ǳ���Ϊ���char[]��һ�� 
	         */  
	        int len = (hex.length() / 2);  
	        byte[] result = new byte[len];  
	        char[] hexChars = hex.toCharArray();  
	        for (int i = 0; i < len; i++) {  
	            int pos = i * 2;  
	            result[i] = (byte) (HEX_NUMS_STR.indexOf(hexChars[pos]) << 4 | HEX_NUMS_STR  
	                    .indexOf(hexChars[pos + 1]));  
	        }  
	        return result;  
	    }  
	      
	    /** 
	     * ������ת����16�����ַ��� 
	     *  
	     * @return String 
	     * @author jacob 
	     * 
	     * */  
	  public static String byteToHexString(byte[] salt){  
	        StringBuffer hexString = new StringBuffer();  
	        for (int i = 0; i < salt.length; i++) {  
	            String hex = Integer.toHexString(salt[i] & 0xFF);  
	            if(hex.length() == 1){  
	                hex = '0' + hex;  
	            }  
	            hexString.append(hex.toUpperCase());  
	        }  
	        return hexString.toString();  
	    }  
	//����id,
	private String createId() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	//������
	private String createSalt() { 
		SecureRandom sc= new SecureRandom();  
        byte[] bsalt = new byte[SALT_LENGTH];   
        sc.nextBytes(bsalt); 
        String salt=byteToHexString(bsalt);  
		return salt;
	}

	////���� �������ĺ���ֵ�������մ洢���� md5
	private String encryption(String password, String salt) throws NoSuchAlgorithmException, UnsupportedEncodingException  
	{
		 //�õ�һ��������飬��Ϊ��  
        byte[] pwd = null;  
        byte[] bsalt= hexStringToByte(salt);
         
     
        //����ժҪ���󣬲�����  
        MessageDigest md = MessageDigest.getInstance("MD5"); 
        //����MD5����
        md.update(bsalt); //����ժҪ
        //passwd.getBytes("UTF-8")������������byte���飬����ĳ����װ����һ��16������
        md.update(password.getBytes("UTF-8"));  
        //��������ֽ�����,�������128λ�˼�16��Ԫ��
        byte[] digest = md.digest();    //��ϣ��������ժҪ
        pwd = new byte[bsalt.length + digest.length];  
        System.arraycopy(bsalt, 0, pwd, 0, SALT_LENGTH);  
        System.arraycopy(digest, 0, pwd, SALT_LENGTH, digest.length);  
        return byteToHexString(pwd);  
	}
 
	//��֤��¼
	private boolean check(String name, String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {  
		String dbsalt,dbpwd;
		SqlSession session=DBUtil.getSession();
		UserMapper sm=session.getMapper(UserMapper.class);
	    User user=sm.selectByName(name);  
	    session.commit(); 
		if(user==null) 
				return false; 
		dbpwd=user.getPassword(); 
		 dbsalt=user.getSalt(); 
		 String pwd=encryption(password,dbsalt);
		if(pwd.equals(dbpwd)) 
		{
			if(session!=null) {
				session.close();
			}
		return true; 
		} 
		if(session!=null) {
			session.close();
		}
		return false;
	}
	//ע�ᣬע��:�ɹ����ض��󣬷��򷵻�null���û�����Ωһ�ģ�������ݿ��У���ʧ��.�Ȳ�ѯ��û����ע��
	@Override
	public boolean register(User user) { 
		String pwd=user.getPassword(); 
		String salt=createSalt(); 
		SqlSession session = null;
		try {
			String password=encryption(pwd,salt); 
			session=DBUtil.getSession();
			UserMapper sm=session.getMapper(UserMapper.class); 
			String name=user.getUsername(); 
			User user1=sm.selectByName(name); 
			if(user1==null) 
			{     
				user.setPassword(password); 
				user.setSalt(salt); 
				user.setUid(createId());
				int i=sm.insertUser(user); 
				session.commit();
				if(session!=null) {
					session.close();
				}
				if(i > 0) {
					return true;
				}
				return false;
			} else {
				if(session!=null) {
					session.close();
				}
				return false;
			}
		
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}

	//��¼
	@Override
	public User login(String name, String password) { 
		
		 try {
			if(!check(name,password))
			 {  
				 return null;
			 }
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				SqlSession session=DBUtil.getSession();
				UserMapper sm=session.getMapper(UserMapper.class);  
				User user=sm.selectByName(name);  
				  session.commit();
				  if(session!=null) {
						session.close();
					}
				return user;  
		}
		 
	@Override
	public boolean changeMessage(User user) { 
		SqlSession session=DBUtil.getSession();
		UserMapper sm=session.getMapper(UserMapper.class);  
		int i=sm.updateUser(user);  
		  session.commit();
		  if(session!=null) {
				session.close();
			}
		return i==1;
	}

	@Override
	public boolean changePassword(String name,String password) {
		int n = 0;
		SqlSession session=DBUtil.getSession();
		UserMapper sm=session.getMapper(UserMapper.class); 
		try {
			String salt=createSalt(); 
			String pass=encryption(password,salt);
			User user = sm.selectByName(name);
			user.setPassword(pass);
			user.setSalt(salt);
			n = sm.updatePsd(user);
			session.commit();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(session!=null) {
				session.close();
			}
		}	
		return n==1;
	}

	@Override
	public User findUser(String name) {
		SqlSession session=DBUtil.getSession();
		UserMapper sm=session.getMapper(UserMapper.class); 
		User user = sm.selectByName(name);
		if(session!=null) {
			session.close();
		}
		return user;
	}

}
