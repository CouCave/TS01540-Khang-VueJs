package com.poly.oe.entity;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Users")
public class User {
    @Id
    @Column(name = "Id")
    private String id;

    @Column(name = "Password")
    private String password;

    @Column(name = "Fullname", columnDefinition = "nvarchar(50)")
    private String fullname;

    @Column(name = "Email")
    private String email;

    @Column(name = "Admin")
    private Boolean admin = false;

    @OneToMany(mappedBy = "user")
    private List<Favorite> favorites;
    
    @OneToMany(mappedBy = "user")
    private List<Share> shares;
}