package com.homeland.navigation.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    private Long id;
    private String username;
    private String email;
    private String password;
    private String fullName;
    private boolean admin;
    private String profileImage;
    private String bio;
    private String location;
    private java.sql.Timestamp createdAt;
    private java.sql.Timestamp updatedAt;
    private boolean active;
    private String resetToken;
    private java.sql.Timestamp resetTokenExpiry;
}
