package com.hmsh.carrotmarket.converter;

import com.hmsh.carrotmarket.dto.BoardReplyDTO;
import com.hmsh.carrotmarket.dto.BoardReplyListDTO;
import com.hmsh.carrotmarket.entity.Board;
import com.hmsh.carrotmarket.entity.Member;
import com.hmsh.carrotmarket.entity.BoardReply;

import java.util.List;

public class BoardReplyConverter {

    public static BoardReply replyDTOToReply(BoardReplyDTO dto) {
        return BoardReply.builder()
                .board(Board.builder().id(dto.getBoardId()).build())
                .member(Member.builder().phoneNumber(dto.getPhoneNumber()).build())
                .likes(0)
                .content(dto.getContent())
                .build();
    }

    public static BoardReplyDTO replyToReplyDTO(BoardReply boardReply, List<String> imagePathList) {
        return BoardReplyDTO.builder()
                .id(boardReply.getId())
                .content(boardReply.getContent())
                .boardId(boardReply.getBoard().getId())
                .imagePathList(imagePathList)
                .phoneNumber(boardReply.getMember().getPhoneNumber())
                .build();
    }

    public static BoardReplyListDTO replyToReplyListDTO(BoardReply boardReply, List<String> imagePathList) {
        return BoardReplyListDTO.builder()
                .member(MemberConverter.memberToMemberDTO(boardReply.getMember()))
                .content(boardReply.getContent())
                .imagePathList(imagePathList)
                .modDate(boardReply.getModDate())
                .build();
    }
}