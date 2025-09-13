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
import java.util.List;

@Entity
@Table(name = "locataire")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Locataire{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // id propre à Locataire

    @Column(name = "profession")
    private String profession;

    @Column(name = "adresse")
    private String adresse;

    @OneToOne
    @JoinColumn(name = "id_utilisateur", referencedColumnName = "id", nullable = false)
    private Utilisateur utilisateur;

    @OneToMany(mappedBy = "locataire")
    private List<ContratLocation> contrats;
}
