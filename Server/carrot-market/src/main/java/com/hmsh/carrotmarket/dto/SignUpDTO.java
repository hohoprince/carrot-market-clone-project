package com.hmsh.carrotmarket.dto;


import lombok.*;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
@Setter
@ToString
@NoArgsConstructor
public class SignUpDTO {
    private String phoneNumber;

    private String address;

    private String name;
}
