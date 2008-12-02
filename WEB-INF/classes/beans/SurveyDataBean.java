// Class SurveyDataBean makes a database connection and supports
// inserting and retrieving data from the database.
package beans;

// Java core packages
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SurveyDataBean {
	private Connection connection;

	private PreparedStatement addRecord, getRecords;

	// construct TitlesBean object
	public SurveyDataBean() throws Exception {
		// load the mySQL driver
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		// load the Cloudscape driver
		//Class.forName("COM.cloudscape.core.RmiJdbcDriver");

		// connect to the database
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey?user=root&password=");
		//connection = DriverManager.getConnection("jdbc:rmi:jdbc:cloudscape:survey");

		getRecords = connection.prepareStatement("SELECT * FROM surveyresults");

		addRecord = connection.prepareStatement("INSERT INTO surveyresults ( "
				+ "firstName, lastName, email, q01, q02, q03, q04, q05, q06, q07, q08, q09, q10, tstmp ) "
				+ "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )");
	}

	// return an ArrayList of SurveyBeans
	public List getSrvyList() throws SQLException {
		List<SurveyBean> srvyList = new ArrayList<SurveyBean>();

		// obtain list of titles
		ResultSet results = getRecords.executeQuery();

		// get row data
		while (results.next()) {
			SurveyBean srvy = new SurveyBean();

			srvy.setFirstName(results.getString(1));
			srvy.setLastName(results.getString(2));
			srvy.setEmail(results.getString(3));
			srvy.setQ01(results.getInt(4));
			srvy.setQ02(results.getInt(5));
			srvy.setQ03(results.getInt(6));
			srvy.setQ04(results.getInt(7));
			srvy.setQ05(results.getInt(8));
			srvy.setQ06(results.getInt(9));
			srvy.setQ07(results.getInt(10));
			srvy.setQ08(results.getInt(11));
			srvy.setQ09(results.getInt(12));
			srvy.setQ10(results.getInt(13));
			Date temp = new Date();
			temp.setTime(results.getLong(14));
			srvy.setTstmp(temp);			

			srvyList.add(srvy);
		}

		return srvyList;
	}

	// insert a srvy in srvybook database
	public void addSurvey(SurveyBean srvy) throws SQLException {
		addRecord.setString(1, srvy.getFirstName());
		addRecord.setString(2, srvy.getLastName());
		addRecord.setString(3, srvy.getEmail());
		addRecord.setInt(4, srvy.getQ01());
		addRecord.setInt(5, srvy.getQ02());
		addRecord.setInt(6, srvy.getQ03());
		addRecord.setInt(7, srvy.getQ04());
		addRecord.setInt(8, srvy.getQ05());
		addRecord.setInt(9, srvy.getQ06());
		addRecord.setInt(10, srvy.getQ07());
		addRecord.setInt(11, srvy.getQ08());
		addRecord.setInt(12, srvy.getQ09());
		addRecord.setInt(13, srvy.getQ10());
		addRecord.setLong(14, System.currentTimeMillis());

		addRecord.executeUpdate();
	}

	// close statements and terminate database connection
	protected void finalize() {
		// attempt to close database connection
		try {
			getRecords.close();
			addRecord.close();
			connection.close();
		}

		// process SQLException on close operation
		catch (SQLException sqlException) {
			sqlException.printStackTrace();
		}
	}
}
