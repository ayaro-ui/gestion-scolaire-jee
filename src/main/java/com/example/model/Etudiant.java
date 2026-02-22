package com.example.model;

public class Etudiant {
    private int id;
    private String nom;
    private String prenom;
    private String cne;
    private String email;

    public Etudiant() {}

    public Etudiant(String nom, String prenom, String cne, String email) {
        this.nom = nom;
        this.prenom = prenom;
        this.cne = cne;
        this.email = email;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }

    public String getCne() { return cne; }
    public void setCne(String cne) { this.cne = cne; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
