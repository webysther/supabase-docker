# Exemplo: Variáveis no Docker Compose com Entrypoint Customizado

## Antes (Problema)

Você teria que fazer interpolação no docker-compose:

```yaml
services:
  postgres:
    image: custom-postgres
    environment:
      POSTGRES_PORT: 5432
      POSTGRES_PASSWORD: secret
      # Repetição de variáveis para cada ambiente
      PGPORT: "${POSTGRES_PORT:-5432}"
      PGPASSWORD: "${POSTGRES_PASSWORD:-secret}"
      PGDATABASE: "${POSTGRES_DB:-postgres}"
      # ... mais variáveis
```

## Depois (Solução)

No docker-compose, você só define as variáveis base:

```yaml
services:
  postgres:
    image: custom-postgres
    environment:
      POSTGRES_PORT: 5432
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: postgres
      JWT_EXPIRY: 3600
      # As variáveis derivadas (PGPORT, PGPASSWORD, PGDATABASE, JWT_EXP)
      # são automaticamente calculadas no entrypoint.sh
```

## Como funciona

### Dockerfile
- Define ENV defaults para variáveis base
- Define ENV defaults para variáveis derivadas (usando referência a variáveis base)
- Usa apenas ENTRYPOINT, sem CMD

### entrypoint.sh
```bash
#!/usr/bin/env bash
set -Eeo pipefail

# Exporta com fallback
export PGPORT="${PGPORT:-$POSTGRES_PORT}"           # Usa valor de POSTGRES_PORT se PGPORT não definido
export PGPASSWORD="${PGPASSWORD:-$POSTGRES_PASSWORD}" # Usa valor de POSTGRES_PASSWORD se PGPASSWORD não definido
export PGDATABASE="${PGDATABASE:-$POSTGRES_DB}"     # Usa valor de POSTGRES_DB se PGDATABASE não definido
export JWT_EXP="${JWT_EXP:-$JWT_EXPIRY}"            # Usa valor de JWT_EXPIRY se JWT_EXP não definido

# Executa postgres com as variáveis exportadas
exec docker-entrypoint.sh postgres \
    -c "config_file=/etc/postgresql/postgresql.conf" \
    -c "log_min_messages=fatal"
```

### Benefícios

1. **Sem interpolação no docker-compose**: Não precisa de `${VAR:-default}`
2. **Menos repetição**: Define cada variável uma vez apenas
3. **Flexibilidade**: Pode sobrescrever variáveis derivadas se necessário (ex: PGPORT diferente de POSTGRES_PORT)
4. **Manutenibilidade**: Lógica centralizada no entrypoint
5. **Compatível**: Funciona com todas as ferramentas do Docker (docker run, docker-compose, kubernetes)

## Casos de uso

### Caso 1: Padrão (usando defaults)
```yaml
environment:
  POSTGRES_PASSWORD: secret  # Apenas uma variável
# Resultado: PGPASSWORD=secret (automático)
```

### Caso 2: Sobrescrever específico
```yaml
environment:
  POSTGRES_PASSWORD: secret
  POSTGRES_DB: mydb
  PGPASSWORD: different_secret  # Sobrescreve a derivada
# Resultado: PGPASSWORD=different_secret, PGDATABASE=mydb (automático)
```

### Caso 3: Variável derivada diferente
```yaml
environment:
  POSTGRES_PORT: 5432
  PGPORT: 6432  # Porta diferente para ferramentas postgres
# Resultado: POSTGRES_PORT=5432 (interna), PGPORT=6432 (para ferramentas)
```