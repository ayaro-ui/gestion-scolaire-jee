package com.example.dao;

import com.example.model.Etudiant;
import com.example.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EtudiantDAO {

    public void addEtudiant(Etudiant e) throws Exception {
        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO etudiant(nom, prenom, cne, email) VALUES(?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, e.getNom());
        ps.setString(2, e.getPrenom());
        ps.setString(3, e.getCne());
        ps.setString(4, e.getEmail());
        ps.executeUpdate();
        con.close();
    }

    public List<Etudiant> getAllEtudiants() throws Exception {
        List<Etudiant> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM etudiant");

        while (rs.next()) {
            Etudiant e = new Etudiant();
            e.setId(rs.getInt("id"));
            e.setNom(rs.getString("nom"));
            e.setPrenom(rs.getString("prenom"));
            e.setCne(rs.getString("cne"));
            e.setEmail(rs.getString("email"));
            list.add(e);
        }
        con.close();
        return list;
    }

    public void deleteEtudiant(int id) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps =
            con.prepareStatement("DELETE FROM etudiant WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        con.close();
    }

    public Etudiant getEtudiantById(int id) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps =
            con.prepareStatement("SELECT * FROM etudiant WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        Etudiant e = null;
        if (rs.next()) {
            e = new Etudiant();
            e.setId(rs.getInt("id"));
            e.setNom(rs.getString("nom"));
            e.setPrenom(rs.getString("prenom"));
            e.setCne(rs.getString("cne"));
            e.setEmail(rs.getString("email"));
        }
        con.close();
        return e;
    }

    public void updateEtudiant(Etudiant e) throws Exception {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE etudiant SET nom=?, prenom=?, cne=?, email=? WHERE id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, e.getNom());
        ps.setString(2, e.getPrenom());
        ps.setString(3, e.getCne());
        ps.setString(4, e.getEmail());
        ps.setInt(5, e.getId());
        ps.executeUpdate();
        con.close();
    }
    public List<Etudiant> searchEtudiants(String keyword) throws Exception {
        List<Etudiant> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM etudiant WHERE nom LIKE ? OR cne LIKE ?";
        PreparedStatement ps = con.prepareStatement(sql);
        String k = "%" + keyword + "%";
        ps.setString(1, k);
        ps.setString(2, k);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Etudiant e = new Etudiant();
            e.setId(rs.getInt("id"));
            e.setNom(rs.getString("nom"));
            e.setPrenom(rs.getString("prenom"));
            e.setCne(rs.getString("cne"));
            e.setEmail(rs.getString("email"));
            list.add(e);
        }
        con.close();
        return list;
    }
    

}
