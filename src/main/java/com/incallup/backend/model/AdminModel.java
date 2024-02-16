package com.incallup.backend.model;

import jakarta.persistence.*;
import lombok.*;



@Entity(name = "tbl_admin")
@Getter
@Setter
@ToString
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class AdminModel {

    @Id
    @Column(name = "id_admin")
    private Integer idAdmin;



    @Column(name = "admin_username",unique = true)
    private String username;

    @Column(name = "admin_password")
    private String password;

    @Column(name = "admin_type")
    private String type;



}