package kots.invoiceprogram.model;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "businessDetails")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Business {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String fullName;
    private String address;
    private String postalCode;
    private String city;
    private String country;
    private Integer taxId;
    private String emailAddress;

    @OneToMany(
            mappedBy = "business",
            cascade = CascadeType.REMOVE
    )
    private List<Customer> customerList;

    @OneToMany(
            mappedBy = "business",
            cascade = CascadeType.REMOVE
    )
    private List<Invoice> invoiceList;
}