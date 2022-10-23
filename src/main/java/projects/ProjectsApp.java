package projects;

import projects.dao.DbConnection;

public class ProjectsApp {

	public ProjectsApp() {
		
	}

	public static void main(String[] args) {
		DbConnection.getConnection();

	}

}
