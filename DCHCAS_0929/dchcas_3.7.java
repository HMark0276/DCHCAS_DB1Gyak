import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class DCHCAS_37 implements Serializable {

	public static void main(String[] args) {

		hf4();
		hf5();
		
	}
	
	private static final long serialVersionUID = 1L;
	String rendszam;
	String tipus;
	int ar;

	public DCHCAS_37(String r, String t, int a) {
		this.rendszam = r;
		this.tipus = t;
		this.ar = a;
	}

	public static void hf4() {
		DCHCAS_37[] autok = { new DCHCAS_36("VUF-234", "Opel", 600000), new DCHCAS_36("UNF-346", "Volvo", 5000000),
				new DCHCAS_36("FAD-476", "Toyota", 4000000) };
		try {
			ObjectOutputStream kifile = new ObjectOutputStream(new FileOutputStream("Autok.dat"));
			for (DCHCAS_37 auto : autok) {
				kifile.writeObject(auto);
			}
			kifile.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba1");
		}
		
	}

	public static void hf5() {
		DCHCAS_37 ma;
		try {
			File fn = new File("Autok.dat");
			if (fn.exists()) {
				ObjectInputStream kifile = new ObjectInputStream(new FileInputStream("Autok.dat"));
				try {
					while (true) {
						ma = (DCHCAS_37) kifile.readObject();
						if (ma.ar > 300) {
							System.out.println("rendszam=" + ma.rendszam);
						}
					}
				} catch (EOFException ee) {
					ma = null;
				}
				kifile.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba2");
		}
		
	}

}