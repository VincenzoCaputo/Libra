package it.unisa.libra.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MapsId;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the studente database table.
 */
@Entity
@NamedQueries({@NamedQuery(name = "Studente.findAll", query = "SELECT s FROM Studente s"),
    @NamedQuery(name = "Studente.findAllSurnameOrdered",
        query = "SELECT s FROM Studente s ORDER BY s.cognome ASC"),
    @NamedQuery(name = "Studente.count", query = "SELECT COUNT(s) FROM Studente s")})

public class Studente implements Serializable {
  private static final long serialVersionUID = 1L;

  @Id
  private String utenteEmail;

  private String cognome;

  @Temporal(TemporalType.TIMESTAMP)
  private Date dataDiNascita;

  private String matricola;

  private String nome;

  // bi-directional many-to-many association to Azienda
  @ManyToMany
  @JoinTable(name = "preferenza", joinColumns = {@JoinColumn(name = "studenteEmail")},
      inverseJoinColumns = {@JoinColumn(name = "aziendaEmail")})
  private List<Azienda> aziende;

  // bi-directional many-to-one association to ProgettoFormativo
  @OneToMany(mappedBy = "studente")
  private List<ProgettoFormativo> progettiFormativi;

  // bi-directional one-to-one association to Utente
  @OneToOne(fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
  @MapsId
  @JoinColumn(name = "utenteEmail")
  private Utente utente;

  public Studente() {}

  /** Costruttore.
   * 
   * @param matricola la matricola dello studente
   * @param nome il nome dello studente
   * @param cognome il cognome dello studente
   * @param email l'email dello studente
   * @param imgProfilo l'immagine del profilo dello studente
   */
  public Studente(String matricola, String nome, String cognome, String email, String imgProfilo) {
    this.matricola = matricola;
    this.nome = nome;
    this.cognome = cognome;
    this.utenteEmail = email;
    utente = new Utente();
    utente.setImgProfilo(imgProfilo);
    utente.setEmail(email);
  }

  /** Costruttore.
   * 
   * @param nome il nome dello studente
   * @param cognome il cognome dello studente
   * @param email l'email dello studente
   * @param imgProfilo l'immagine del profilo dello studente
   * @param dataInvio la data di invio del progetto formativo
   * @param stato lo stato del progetto formativo
   */
  public Studente(String nome, String cognome, String email, String imgProfilo, Date dataInvio,
      int stato) {
    this.nome = nome;
    this.cognome = cognome;
    this.utenteEmail = email;
    utente = new Utente();
    utente.setImgProfilo(imgProfilo);
    utente.setEmail(email);
    ProgettoFormativo progForm = new ProgettoFormativo();
    progForm.setDataInvio(dataInvio);
    progForm.setStato(stato);
    progettiFormativi = new ArrayList<ProgettoFormativo>();
    progettiFormativi.add(progForm);
  }

  public String getUtenteEmail() {
    return this.utenteEmail;
  }

  public void setUtenteEmail(String utenteEmail) {
    this.utenteEmail = utenteEmail;
  }

  public String getCognome() {
    return this.cognome;
  }

  public void setCognome(String cognome) {
    this.cognome = cognome;
  }

  public Date getDataDiNascita() {
    return this.dataDiNascita;
  }

  public void setDataDiNascita(Date dataDiNascita) {
    this.dataDiNascita = dataDiNascita;
  }

  public String getMatricola() {
    return this.matricola;
  }

  public void setMatricola(String matricola) {
    this.matricola = matricola;
  }

  public String getNome() {
    return this.nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public List<Azienda> getAziende() {
    return this.aziende;
  }

  public void setAziende(List<Azienda> aziende) {
    this.aziende = aziende;
  }

  public List<ProgettoFormativo> getProgettiFormativi() {
    return this.progettiFormativi;
  }

  public void setProgettiFormativi(List<ProgettoFormativo> progettiFormativi) {
    this.progettiFormativi = progettiFormativi;
  }

  /** Aggiunge un progetto formativo.
   * 
   * @param progettiFormativi il progetto da aggiungere
   * @return il progetto aggiunto
   */
  public ProgettoFormativo addProgettiFormativi(ProgettoFormativo progettiFormativi) {
    getProgettiFormativi().add(progettiFormativi);
    progettiFormativi.setStudente(this);

    return progettiFormativi;
  }

  /** Rimuove un progetto formativo.
   * 
   * @param progettiFormativi il progetto da rimuovere
   * @return il progetto rimosso
   */
  public ProgettoFormativo removeProgettiFormativi(ProgettoFormativo progettiFormativi) {
    getProgettiFormativi().remove(progettiFormativi);
    progettiFormativi.setStudente(null);

    return progettiFormativi;
  }

  public Utente getUtente() {
    return this.utente;
  }

  public void setUtente(Utente utente) {
    this.utente = utente;
  }

}
