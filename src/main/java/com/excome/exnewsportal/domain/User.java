package com.excome.exnewsportal.domain;

import com.sun.istack.NotNull;
import org.springframework.boot.convert.DataSizeUnit;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "usr")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @NotNull
    @Size
    private String email;
    private String username;
    private String password;
    private String surname;
    private String name;
    private String patronymic;
    private Date birthday;

}
