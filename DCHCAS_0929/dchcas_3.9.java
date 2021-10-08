import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class DCHCAS_39 implements Serializable {

	private static int db = 0;

	public static void main(String[] args) {

		beir();
		try {
			atlag();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			piros();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			legdragabb();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

	}

	private static final long serialVersionUID = 1L;
	String rendszam;
	String tipus;
	int ar;

	public DCHCAS_39(String r, String t, int a) {
		this.rendszam = r;
		this.tipus = t;
		this.ar = a;
	}

	public static void beir() {
		DCHCAS_39[] autok = { new DCHCAS_36("VUF-234", "Opel", 600000), new DCHCAS_36("UNF-346", "Volvo", 5000000),
				new DCHCAS_36("FAD-476", "Toyota", 4000000) };

		db = autok.length;

		try {
			ObjectOutputStream kifile = new ObjectOutputStream(new FileOutputStream("Autok.dat"));
			for (DCHCAS_39 auto : autok) {
				kifile.writeObject(auto);
			}
			kifile.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl megnyitása során!\n");
		}

	}

	public static void atlag() throws FileNotFoundException {

		int szum = 0;
		DCHCAS_39 ma;
		try {
			File fn = new File("Autok.dat");
			if (fn.exists()) {
				ObjectInputStream kifile = new ObjectInputStream(new FileInputStream("Autok.dat"));
				try {
					while (true) {
						ma = (DCHCAS_39) kifile.readObject();
						szum = szum + ma.ar;
					}
				} catch (EOFException ee) {
					ma = null;
				}
				kifile.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl megnyitása során!\n");
		}

		System.out.println("Az autók átlagára: " + szum / db);

	}

	public static void piros() throws FileNotFoundException {

		int pirosak = 0;
		DCHCAS_39 ma;
		try {
			File fn = new File("Autok.dat");
			if (fn.exists()) {
				ObjectInputStream kifile = new ObjectInputStream(new FileInputStream("Autok.dat"));
				try {
					while (true) {
						ma = (DCHCAS_39) kifile.readObject();
						if (ma.tipus.equalsIgnoreCase("piros")) {
							pirosak++;
						}
					}
				} catch (EOFException ee) {
					ma = null;
				}
				kifile.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl megnyitása során!\n");
		}

		System.out.println("Piros autók száma: " + pirosak);

	}

	public static void legdragabb() throws FileNotFoundException {

		DCHCAS_39 ma;
		try {
			File fn = new File("Autok.dat");
			if (fn.exists()) {
				DCHCAS_39 max;
				ObjectInputStream kifile = new ObjectInputStream(new FileInputStream("Autok.dat"));
				max = (DCHCAS_39) kifile.readObject();
				try {
					while (true) {
						ma = (DCHCAS_39) kifile.readObject();
						if (ma.ar > max.ar) {
							max = ma;
						}
					}
				} catch (EOFException ee) {
					ma = null;
				}
				kifile.close();
				System.out.println("A legdrágább autó rendszáma: " + max.rendszam + " ára: " + max.ar);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl megnyitása során!\n");
		}

	}

}