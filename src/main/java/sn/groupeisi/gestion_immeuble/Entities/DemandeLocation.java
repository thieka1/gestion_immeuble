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
