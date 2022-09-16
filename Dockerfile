#Original Image
FROM jlesage/nginx-proxy-manager
VOLUME [ "/data", "/etc/letsencrypt" ]
ENTRYPOINT [ "/init" ]
