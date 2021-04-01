Позволяет запускать docker-службы на одном хосте, без проброса внешнего порта.
Автоматически генерирует и обновляет ssl сертификаты, что позволяет

Пример службы в docker-compose.yml:
```$xslt
    nginx:
        image: nginx:1.17-alpine
        restart: always
        environment:
            LETSENCRYPT_HOST: your.domain-name.com
            VIRTUAL_HOST: your.domain-name.com
            VIRTUAL_NETWORK: nginx-proxy
        networks:
          - your-network
          - nginx-proxy

networks:
    nginx-proxy:
        external: true
    your-network:

```

To be continued...