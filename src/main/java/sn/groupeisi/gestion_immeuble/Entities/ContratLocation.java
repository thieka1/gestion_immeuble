package sn.groupeisi.gestion_immeuble.Entities;

<<<<<<< HEAD
import jakarta.persistence.*;
=======

>>>>>>> 0249102 (design de l'application)
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

<<<<<<< HEAD
=======
import javax.persistence.*;
>>>>>>> 0249102 (design de l'application)
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "contrat_location")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class ContratLocation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "date_debut", nullable = false)
    private LocalDate dateDebut;

    @Column(name = "date_fin", nullable = false)
    private LocalDate dateFin;

    // Relation avec le locataire
    @ManyToOne
    @JoinColumn(name = "locataire_id")
    private Locataire locataire;

    // Relation avec l'unité de location (appartement)
    @ManyToOne
    @JoinColumn(name = "unite_id")
    private UniteLocation unite;

    @Column(name = "statut")
    @Enumerated(EnumType.STRING)
    private StatutContrat statut;

    // Paiements associés à cette location
    @OneToMany(mappedBy = "contratLocation", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Paiement> paiements;
}
