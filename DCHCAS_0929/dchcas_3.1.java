import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class SIGFileOlvas {

	public static void main(String[] args) throws FileNotFoundException {
		Scanner scanner = new Scanner(new File("hengsperger.txt"));
		int osszeg = 0;

		while (scanner.hasNextInt()) {
			osszeg += scanner.nextInt();
		}
		System.out.println("Összeg: " + osszeg);

	}

}
