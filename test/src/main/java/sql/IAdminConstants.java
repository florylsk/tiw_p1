package sql;
//interfaz para usar en el DAO del login
public interface IAdminConstants {
	public static String TABLE_ADMINS = "admins";
	
	public static String COLUMN_USERNAME = "username";
	public static String COLUMN_PASSWORD = "password";
	public static String COLUMN_FIRSTNAME = "firstname";
	public static String COLUMN_LASTNAME = "lastname";
	public static String COLUMN_MAIL = "mail";
}