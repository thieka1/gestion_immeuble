package sn.groupeisi.gestion_immeuble.Entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "paiement")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Paiement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "date_paiement")
    private LocalDate datePaiement;

    @Column(name = "montant")
    private double montant;

    @Column(name = "statut")
    @Enumerated(EnumType.STRING)
    private StatutPaiement statut;

    // Relation avec Location
    @ManyToOne
    @JoinColumn(name = "contrat_id")
    private ContratLocation contratLocation;


}
