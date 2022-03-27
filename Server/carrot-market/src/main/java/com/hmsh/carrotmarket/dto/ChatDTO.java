package com.hmsh.carrotmarket.dto;

import com.hmsh.carrotmarket.enumeration.Address;
import lombok.Builder;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@Builder
public class ChatDTO {

    private String sellerNumber;

    private String buyerNumber;

    private String message;

    private String name;

    private Date date;
}
