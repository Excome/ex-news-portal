package com.excome.exnewsportal.domain;

import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String topic;
    private String text;
    private String tag;
    @ManyToOne
    private User author;
    @CreatedDate
    private Date createdDate;
}
