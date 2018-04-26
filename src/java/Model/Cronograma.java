package Model;


public class Cronograma{

    private String dataIni;
    private String dataFim;

    public Cronograma(String dataIni, String dataFim) {
        this.dataIni = dataIni;
        this.dataFim = dataFim;
    }

    public String getDataIni() {
        String[] pedaços = this.dataIni.split("-");
        return pedaços[2]+ "-" + pedaços[1] + "-" + pedaços[0];
    }

    public void setDataIni(String dataIni) {
        this.dataIni = dataIni;
    }

    public String getDataFim() {
        String[] pedaços = this.dataFim.split("-");
        return pedaços[2]+ "-" + pedaços[1] + "-" + pedaços[0];    
    }

    public void setDataFim(String dataFim) {
        this.dataFim = dataFim;
    }
}
