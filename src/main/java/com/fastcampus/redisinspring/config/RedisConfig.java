package com.fastcampus.redisinspring.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;

@Configuration
public class RedisConfig {
    @Value("${spring.data.redis.host}")
    private String host;

    @Value("${spring.data.redis.port}")
    private int port;

    @Bean
    public LettuceConnectionFactory redisConnectionFactory() {
        // Lettuce 라는 라이브러리를 활용해 redis 연결을 관리하는 객체를 생성
        // redis 서버에 대한 정보를 설정( host, port)
        return new LettuceConnectionFactory(new RedisStandaloneConfiguration(host, port));
    }

}