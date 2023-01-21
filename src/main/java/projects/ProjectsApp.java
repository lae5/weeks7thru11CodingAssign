package projects;

import java.util.Objects;

public class ProjectsApp {

	public static void main(String[] args) {
		
		// @formatter:off
		private List<String> operations = List.of("1) Add a project");
		// @formatter:on
		
		private Scanner scanner = new Scanner(System.in);
		
		new ProjectsApp().processUserSelections();
	} //end main method

	private void processUserSelections() {
		boolean done = false;
		
		while(!done) {
		  try {
			  int selection = getUserSelection();
		  }
		  catch(Exception e) {
			  System.out.println("\nError: " + e + " Try again.");
		  }
		}
	
	}

	private int getUserSelection() {
		printOperations();
		
		Integer input = getIntInput("Enter a menu selection");
		return Objects.isNull(input) ? -1 : input;
	}

	private void printOperations() {
		System.out.println("\nThese are the available selections.  Press the enter key to quit:");
		  operations.forEach(line ->)
		
	}

}//end class
