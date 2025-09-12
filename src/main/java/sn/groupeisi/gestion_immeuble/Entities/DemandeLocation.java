package sn.groupeisi.gestion_immeuble.Entities;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "demande_location")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DemandeLocation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    // Locataire qui fait la demande
    @ManyToOne
    @JoinColumn(name = "locataire_id")
    private Locataire locataire;

    // Unité pour laquelle la demande est faite
    @ManyToOne
    @JoinColumn(name = "unite_id")
    private UniteLocation unite;

    @Column(name = "date_demande")
    private LocalDate dateDemande;

    @Column(name = "statut")
    @Enumerated(EnumType.STRING)
    private StatutDemande statut;
}
