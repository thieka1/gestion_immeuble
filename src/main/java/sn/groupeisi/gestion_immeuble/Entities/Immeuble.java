package sn.groupeisi.gestion_immeuble.Entities;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "immeuble")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Immeuble {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "adresse")
    private String adresse;

    @Column(name = "nombreEtages")
    private Integer nombreEtages;

    @Column(name = "description")
    private String description;

    @ElementCollection
    @CollectionTable(name = "immeuble_equipements", joinColumns = @JoinColumn(name = "immeuble_id"))
    @Column(name = "equipement")
    private List<String> equipements = new ArrayList<>();

    @Column(name = "image")
    private String image;

    // Relation avec Propriétaire (Utilisateur avec rôle PROPRIETAIRE)
    @ManyToOne
    @JoinColumn(name = "proprietaire_id")
    private Utilisateur proprietaire;

    // Un immeuble contient plusieurs unités de location
    @OneToMany(mappedBy = "immeuble", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<UniteLocation> uniteLocations = new ArrayList<>();

}
