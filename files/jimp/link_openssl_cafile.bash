#!/usr/bin/env bash
[[ -f /etc/ssl/certs/openssl.pem ]] || sudo ln -s /usr/local/etc/openssl/cert.pem /etc/ssl/certs/openssl.pem
