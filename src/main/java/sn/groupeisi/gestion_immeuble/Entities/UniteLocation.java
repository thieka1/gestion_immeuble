package sn.groupeisi.gestion_immeuble.Entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "unite_location")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UniteLocation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "numero")
    private String numero;

    @Column(name = "nombre_pieces")
    private int nombrePieces;

    @Column(name = "superficie")
    private double superficie;

    @Column(name = "loyer_mensuel")
    private double loyerMensuel;

    @Column(name = "image")
    private String image;

    @Column(name = "statut")
    @Enumerated(EnumType.STRING)
    private StatutUnite statut;

    // Relation avec l'immeuble
    @ManyToOne
    @JoinColumn(name = "immeuble_id")
    private Immeuble immeuble;
}
