public class FileClass {
    private String name;
    private int linesOfCode;
    private int local;
    private int global;
    private int interfaces;
    private String parent;

    public FileClass(String name, int linesOfCode, int local, int global, int interfaces, String parent) {
        this.name = name;
        this.linesOfCode = linesOfCode;
        this.local = local;
        this.global = global;
        this.interfaces = interfaces;
        this.parent = parent;
    }

    public FileClass(String name, int linesOfCode, int local, int global, int interfaces ) {
        this.name = name;
        this.linesOfCode = linesOfCode;
        this.local = local;
        this.global = global;
        this.interfaces = interfaces;
    }

    public String getName() { return name;}

    public int getLinesOfCode() { return linesOfCode;}

    public int getLocal() {return local;}

    public int getGlobal() {return global;}

    public int getInterfaces() {return interfaces;}

    public String getParent() {return parent;}

    public void setName(String name) {this.name = name;}

    public void setLinesOfCode(int linesOfCode) {
        this.linesOfCode = linesOfCode;
    }

    public void setLocal(int local) {
        this.local = local;
    }

    public void setGlobal(int global) {
        this.global = global;
    }

    public void setInterfaces(int interfaces) {
        this.interfaces = interfaces;
    }

//    public void setParent(String parent) {
//        this.parent = parent;
//    }
}
