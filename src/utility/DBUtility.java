package utility;



import java.sql.Connection;
import java.sql.PreparedStatement;

public class DBUtility {
	public static void close(Connection conn)
	{
		try
		{
			if(!conn.isClosed())
			{
				conn.close();
				
			}
			
		}
		catch(Exception e)
		{
			
		}
	}
	public static void close(PreparedStatement ps)
	{
		try
		{
			ps.close();
		}
		catch(Exception e)
		{
			
		}
	}

}
