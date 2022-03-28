package com.hmsh.carrotchat;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class ChatService {

    private final ChatRepository chatRepository;


    public Flux<Chat> getMessage(Long productId, String user1, String user2) {
        return chatRepository.getChatsBySenderAndReceiver(productId, user1, user2)
                .subscribeOn(Schedulers.boundedElastic());
    }

    public Mono<Chat> saveMessage(Chat chat) {
        chat.setCreatedAt(LocalDateTime.now());
        return chatRepository.save(chat);
    }

    public Flux<Chat> getUserChats(String user) {
        return chatRepository.getChatsByUser(user)
                .subscribeOn(Schedulers.boundedElastic());
    }
}
